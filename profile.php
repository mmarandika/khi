<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();
include('countrycodes.php');
include('header.php');


new Db();
User::secure();
if( false === User::access(6) ) {
    echo "<div class='alert alert-danger'><i class='fa fa-warning'></i> Anda tidak punya akses</div>";
} else {
$data = [];

$userid = Session::val('username');
$id = User::id($userid);
$email = User::email($userid);
$user_fwd_url = json_decode(User::forward_url($userid), true);
$user_fwd_web = json_decode(User::forward_web($userid), true);
$user_fwd_wap = json_decode(User::forward_wap($userid), true);
$group = Session::val($userid);
$hitstat = User::hitstat($userid);
$countryOpt = countryOption();
$logo = User::getAvatar($userid);

// print_r(User::forward_url($userid));

if(isset($_POST['editUser'])) {
    //echo Token::validate($_POST['token']);
    // $forward_url = Typo::cleanX($_POST['forward_url']);
    $hitstat = Typo::cleanX($_POST['hitstat']);

    if (!isset($alertDanger)) {

        if( $_POST['password'] != "" ) {
            $vars = array(
                'id' => $id,
                'user' => array(
                            'pass' => User::randpass($_POST['password']),
                        ),

            );
        User::update($vars);
        }
        
        // print_r($_POST);
        if( $_FILES['avatar']['error'] == 0 ) {
            $target_dir = "images/avatars/";
            $target_file = $target_dir . basename($_FILES["avatar"]["name"]);
            $file_tmp = $_FILES['avatar']['tmp_name'];
            $file_ext = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            // Check if image file is a actual image or fake image
            $extensions= array("jpeg","jpg","png");
            if(in_array($file_ext,$extensions) === true){
                move_uploaded_file($file_tmp, $target_file);
                $avatar = $target_file;
                $logo = $target_file;
            } else {
                $avatar = $logo;
            }
        } else {
            $avatar = $logo;
        }
        // echo $avatar;
        $fwd_url = [];
        foreach($_POST['forward_url_country'] as $k => $v) {
            $fwd_url[$v][] = $_POST['forward_url'][$k];
        }
        // print_r($fwd_url);
        $forward_url = json_encode($fwd_url);
        $fwd_web = [];
        foreach($_POST['forward_web_country'] as $k => $v) {
            $fwd_web[$v][] = $_POST['forward_web'][$k];
        }
        // print_r($fwd_web);
        $forward_web = json_encode($fwd_web);
        $fwd_wap = [];
        foreach($_POST['forward_wap_country'] as $k => $v) {
            $fwd_wap[$v][] = $_POST['forward_wap'][$k];
        }
        // print_r($fwd_wap);
        $forward_wap = json_encode($fwd_wap);
        
        
        $vars = array(
            'id' => $id,
            'user' => array(
                        'forward_url' => $forward_url,
                        'forward_web' => $forward_web,
                        'forward_wap' => $forward_wap,
                        'hitstat' => $hitstat,
                        'avatar' => $avatar,
                    ),

            );
        User::update($vars);
        
    
        $data['alertSuccess'][] = " {$userid}, Updated";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}
echo "<div class='col-md-12 text-left'>
<h1>Profile : {$userid}</h1>
<hr />
</div>

<div class='col-md-12 clearfix'>
";
echo System::alert($data);
echo "
</div>
<form  action='' method='post' enctype='multipart/form-data'>
<div class='col-12'>
<div class=\"form-group\">
<label>Username</label>
<input type=\"text\" class=\"form-control\" value=\"{$userid}\" readonly>
</div>
<div class=\"form-group\">
<label>Password</label>
<input type=\"password\" name=\"password\" class=\"form-control\">
</div>

<div class=\"form-group\">
<label>Logo/Avatar</label>";
if($logo != "") {
    echo "<img src='{$logo}' class='img-fluid'>";
}


echo "<input type=\"file\" class=\"form-control\" name='avatar'>
</div>
<ul class='nav nav-tabs mb-3' id='pills-tab' role='tablist'>
    <li class='nav-item' role='presentation'>
        <a class='nav-link active' id='pills-home-tab' data-toggle='pill' href='#pills-home' role='tab' aria-controls='pills-home' aria-selected='true'>Redirect To</a>
    </li>
    <li class='nav-item' role='presentation'>
        <a class='nav-link' id='pills-web-tab' data-toggle='pill' href='#pills-web' role='tab' aria-controls='pills-web' aria-selected='false'><i class='fa fa-laptop'></i></a>
    </li>
    <li class='nav-item' role='presentation'>
        <a class='nav-link' id='pills-wap-tab' data-toggle='pill' href='#pills-wap' role='tab' aria-controls='pills-wap' aria-selected='false'><i class='fa fa-mobile-alt'></i></a>
    </li>
</ul>
<div class='alert alert-info'>
Ganti variabel dengan {team}, {click_id}, {s1}, {s2}, {s3}, {s4}, {s5}. contoh : https://link.to/offer?click_id={click_id}&s1={s1}&s2={s2}&s3={s3}&s4={s4}&s5={s5}
</div>
<div class='tab-content' id='pills-tabContent'>
    <div class='tab-pane fade show active' id='pills-home' role='tabpanel' aria-labelledby='pills-home-tab'>
        ";
        if( $user_fwd_url == "" ) {
            echo "<div id='forwardUrlLink_0' class='forward_url_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_url_country[]' id='forward_url_country_0' class='form-control-sm forward_url_country'>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_url[]' id='forward_url_0'  class='form-control form-control-sm forward_url' value=''>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm' type='button' id='cloneForwardUrl'><i class='fa fa-plus'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
        } else {
            $n = 0;
            foreach($user_fwd_url as $k => $v) {
                foreach($v as $l => $x){
                    // echo $x;
                    $switch = ($n == 0) ? 'cloneForwardUrl': 'removeForwardUrl_'.$n;
                    $removeClass = ($n == 0) ? "" : "removeForwardUrl"; 
                    $plus = ($n == 0) ? 'plus': 'minus';
                    echo "<div id='forwardUrlLink_{$n}' class='forward_url_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_url_country[]' id='forward_url_country_{$n}' class='form-control-sm forward_url_country'>
                                    <option value='{$k}'>{$k}</option>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_url[]' id='forward_url_{$n}'  class='form-control form-control-sm forward_url' value='{$x}'>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm {$removeClass}' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
                $n++;
                }

            }
        }
        
        echo "
    </div>
    <div class='tab-pane fade' id='pills-web' role='tabpanel' aria-labelledby='pills-web-tab'>
        
        ";
        if( $user_fwd_web == "" ) {
            echo "<div id='forwardWebLink_0' class='forward_web_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_web_country[]' id='forward_web_country_0' class='form-control-sm forward_web_country'>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_web[]' id='forward_web_0'  class='form-control form-control-sm forward_web' value=''>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm' type='button' id='cloneForwardUrl'><i class='fa fa-plus'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
        } else {
            $n = 0;
            foreach($user_fwd_web as $k => $v) {
                foreach($v as $l => $x){
                    // echo $x;
                    $switch = ($n == 0) ? 'cloneForwardWeb': 'removeForwardWeb_'.$n;
                    $removeClass = ($n == 0) ? "" : "removeForwardWeb"; 
                    $plus = ($n == 0) ? 'plus': 'minus';
                    echo "<div id='forwardWebLink_{$n}' class='forward_web_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_web_country[]' id='forward_web_country_{$n}' class='form-control-sm forward_web_country'>
                                    <option value='{$k}'>{$k}</option>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_web[]' id='forward_web_{$n}'  class='form-control form-control-sm forward_web' value='{$x}'>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm {$removeClass}' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
                $n++;
                }

            }
        }
        
        echo "
    </div>
    <div class='tab-pane fade' id='pills-wap' role='tabpanel' aria-labelledby='pills-wap-tab'>
        
        ";
        if( $user_fwd_wap == "" ) {
            echo "<div id='forwardWapLink_0' class='forward_wap_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_wap_country[]' id='forward_wap_country_0' class='form-control-sm forward_wap_country'>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_wap[]' id='forward_wap_0'  class='form-control form-control-sm forward_wap' value=''>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm' type='button' id='cloneForwardUrl'><i class='fa fa-plus'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
        } else {
            $n = 0;
            foreach($user_fwd_wap as $k => $v) {
                foreach($v as $l => $x){
                    // echo $x;
                    $switch = ($n == 0) ? 'cloneForwardWap': 'removeForwardWap_'.$n;
                    $removeClass = ($n == 0) ? "" : "removeForwardWap"; 
                    $plus = ($n == 0) ? 'plus': 'minus';
                    echo "<div id='forwardWapLink_{$n}' class='forward_wap_link'>
                    <div class='form-group' style=''>
                        <div class='input-group'>
                            <div class=\"input-group-prepend\">
                                <select name='forward_wap_country[]' id='forward_wap_country_{$n}' class='form-control-sm forward_wap_country'>
                                    <option value='{$k}'>{$k}</option>
                                    <option value='ALL'>All</option>
                                    ".$countryOpt."
                                </select>
                            </div>
                            <input type='text' name='forward_wap[]' id='forward_wap_{$n}'  class='form-control form-control-sm forward_wap' value='{$x}'>
                            <div class='input-group-append'>
                                <button class='btn btn-outline-secondary btn-sm {$removeClass}' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                            </div>
                        </div>
                    </div>
                </div>";
                $n++;
                }

            }
        }
        
        echo "
    </div>
</div>
<div class=\"form-group\">
    <label>Traffic Postback</label>
    <div class='alert alert-info'>Contoh : https://lead.report.com/hits.php?ip={ip}&country={country}&device={device}</div>
    <input type=\"text\" name=\"hitstat\" class=\"form-control\" value=\"{$hitstat}\">
    <span>country : {country} - ip : {ip} - device : {device}</span>
</div>
<div class=\"form-group\">
<button class='btn btn-success btn-sm' type='submit' name='editUser'><i class='fa fa-check'></i> Update</button>
</div>
</div>
</form>";
}
include('footer.php');