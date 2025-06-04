<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();
include('countrycodes.php');

new Db();
// User::secure();

// $username = Session::val('username');

if ( isset($_POST['type']) ) {
    $forward_url = isset($_POST['forward_url']) ? Typo::cleanX($_POST['forward_url']): "";
    $forward_web = isset($_POST['forward_web']) ? Typo::cleanX($_POST['forward_web']): "";
    $forward_wap = isset($_POST['forward_wap']) ? Typo::cleanX($_POST['forward_wap']): "";
    $fake_url = isset($_POST['fake_url']) ? Typo::cleanX($_POST['fake_url']): NULL ;
    $type = isset($_POST['type']) ? Typo::cleanX($_POST['type']): 'basic' ;
    $custom_title = isset($_POST['custom_title']) ? Typo::cleanX($_POST['custom_title']): null ;
    $custom_description = isset($_POST['custom_description']) ? Typo::cleanX($_POST['custom_description']): null ;
    $custom_keywords = isset($_POST['custom_keywords']) ? Typo::cleanX($_POST['custom_keywords']): null ;
    $custom_image = isset($_POST['custom_image']) ? Typo::cleanX($_POST['custom_image']): null ;
    $country = isset($_POST['country']) ? Typo::cleanX($_POST['country']): null ;
    $country_block = isset($_POST['country_block']) ? Typo::cleanX($_POST['country_block']): null ;
    $app_id = isset($_POST['app_id']) ? Typo::cleanX($_POST['app_id']): null ;
    $use_landing = Typo::cleanX($_POST['use_landing']);
    $username = Typo::cleanX($_POST['username']);
    $team = Typo::cleanX($_POST['team']);

    $domain = $_POST['domain'];
    $date = date("Y-m-d");
    
    if( isset($_POST['amount']) ) {
        $amount = Typo::int($_POST['amount']);
    } else {
        $amount = 1;
    }
    
    $camount = ($amount > 10) ? 10: $amount;
    // echo $domain;
    for($i=0; $i<$camount;$i++) {
        if ($domain == 'random') {
            $where = array(
                'max' => 15,
                'account' => "admin",
                'random' => true,
                'special' => 0
            );
            $domains = Pdns::listDomain($where);
            $domain = $domains[0]->name;
        } elseif ($domain == 'myrandom') {
            $where = array(
                'max' => 15,
                'account' => $username,
                'random' => true,
                'special' => 0
            );
            $domains = Pdns::listDomain($where);
            $domain = $domains[0]->name;
        } elseif ($domain == 'randomSpecial') {
            $where = array(
                'max' => 15,
                'account' => "admin",
                'random' => true,
                'special' => 1
            );
            $domains = Pdns::listDomain($where);
            // print_r($domains);
            $domain = $domains[0]->name;
        } elseif ($domain == 'myrandomSpecial') {
            $where = array(
                'max' => 15,
                'account' => $username,
                'random' => true,
                'special' => 1
            );
            $domains = Pdns::listDomain($where);
            $domain = $domains[0]->name;
        }

        $num = mt_rand(6,10);
        $num2 = mt_rand(6,20);
        $h = sha1(microtime(date('Y-m-d H:i:s')));

        $hash = substr($h, $num, $num);
        $hash2 = substr($h, $num2, $num2);
        if(true === Gen::isExist(array('username' => $username, 'full_domain' => $hash . "." . $domain, 'hash' => $hash2 ))) {
            $num = mt_rand(6,10);
            $num2 = mt_rand(6,20);
            $h = sha1(microtime(date('Y-m-d H:i:s')));

            $hash = substr($h, $num, $num);
            $hash2 = $h;
        }

        $sql = array(
            'table' => 'gen_link',
            'key' => array(
                'date' => $date,
                'type' => $type,
                'sub' => $hash,
                'domain' => $domain,
                'hash' => $hash2,
                'full_domain' => $hash . "." . $domain,
                'forward_url' => $forward_url,
                'fake_url' => $fake_url,
                'custom_title' => $custom_title,
                'custom_description' => $custom_description,
                'custom_keywords' => $custom_keywords,
                'custom_image' => $custom_image,
                'country' => $country,
                'country_block' => $country_block,
                'app_id' => $app_id,
                'username' => $username,
                'use_landing' => $use_landing,
                'forward_web' => $forward_web,
                'forward_wap' => $forward_wap,
                'team' => $team
            )
        );
        Db::insert($sql);
        // new Db();
        
        $genurl[$i] = 'https://'.$hash.'.'.$domain.'/'.$hash2;

        // echo($m[1]);
        if(isset($_POST['branch_key']) && $_POST['branch_key'] != "" ) {
            $brc = Gen::branchIo(array(
                'branch_key' => $_POST['branch_key'],
                'url' => $genurl[$i],
                'title' => $custom_title,
                'desc' => $custom_description,
                'image' => $custom_image
            ));
            $branch = json_decode($brc, true);
            if($_POST['branch_domain'] == "bnc.lt") {
                $branchio[$i] = preg_replace('/\/\/(.+)\//Uis', "//".$_POST['branch_domain']."/", $branch['url']);
            } else {
                $branchio[$i] = $branch['url'];
            }
            
        } else {
            $branchio[$i] = $genurl[$i];
        }

        if(isset($_POST['bitly_key']) && $_POST['bitly_key'] != "" ) {
            $alter = "bitly";
            $bitly_key = "&bitly_key=".$_POST['bitly_key']."&bitly_domain=".$_POST['bitly_domain'];
        } else {
            $alter = $_POST['alter'];
            $bitly_key = "";
        }



        
        $genApi = array(
            "http://localhost/cloacker-shortener/",

        );
        $rndApi = array_rand($genApi, 1);

        $clickru[$i] = file_get_contents($genApi[$rndApi]."?type=".$alter."&api_key=M4JUT4KG3NT4R&url=".$branchio[$i].$bitly_key);


        $fbl[$i] = "https://l.facebook.com/l.php?u={$clickru[$i]}&h=".Typo::getToken(16)."&s=1";
        $fbr[$i] = "https://web.facebook.com/flx/warn/?u=".urlencode($clickru[$i]);

        $hash = Typo::getToken(128);
        $linkig[$i] = "https://l.instagram.com/?u=".urlencode($clickru[$i])."&e=ATMl5SkyR34AAu2rZcEg3PAOqWxlzpdzgsiAbMrkA3GNX3dDJD20MMkFPyPBqIHA4NJzOdcd3TmH0EwVP4du5HM&s=1";
        

    }

    // $capsJson = json_encode($caps);
    $branchJson = json_encode($branchio);
    $clickruJson = json_encode($clickru);
    $genurlJson = json_encode($genurl);
    $fbrJson = json_encode($fbr);
    $fblJson = json_encode($fbl);
    $linkigJson = json_encode($linkig);

    

    
    

    
    $res = array(
        'genurl' => $genurlJson,
        'wowinth' => $clickruJson,
        'branchio' => $branchJson,
        'fbl' => $fblJson,
        'fbr' => $fbrJson,
        'linkig' => $linkigJson,
        // 'caption' => $capsJson
    );
    header("Content-type: application/json");
    echo json_encode($res);
}
