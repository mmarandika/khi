<?php

include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

new Db();



if( isset($_GET['id']) && $_GET['id'] != "" ) {
    $id = Typo::int($_GET['id']);
    $cachefile = "caches/".$id.".json";
    if( file_exists($cachefile)) {
        $fh = fopen($cachefile, "r");
        $json = fread($fh, filesize($cachefile) );
        $q = json_decode($json);
        // print_r($q);
        fclose($fh);
        $n = 1;
    } else {
        $q = Db::result("SELECT * FROM `gen_link` WHERE `id` = '{$id}' ");
        $n = Db::$num_rows;
        
        $json = json_encode($q);
        $fh = fopen($cachefile, "w");
        fwrite($fh, $json );
        fclose($fh);

    }
    
    if($n > 0) {
        $ua = Typo::cleanX($_GET['ua']);
        $ip = Typo::cleanX($_GET['ip']);
        $ipinfo = Gen::ipInfo($ip);
        $info = json_decode($ipinfo, true);
        $linkowner = $q[0]->username;
        $device = Gen::getOs($ua);
        $isMobile = Gen::isMobile($ua);
        $fwd = User::forward_url($q[0]->username);
        $fwd_web = User::forward_web($q[0]->username);
        $fwd_wap = User::forward_wap($q[0]->username);
        if($fwd != "" && true === strpos($fwd, 'http')) {
            $isUrl = Gen::isUrl($fwd);
            if($isUrl == true) {
                $fwd = Team::formatLink($q[0]->team, $fwd);
                header("Location: ".$fwd);
                exit;
            } else {
                $json = Typo::Xclean($fwd);
                $url = json_decode($json, true);
                // print_r($url);
                if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                    if( count($url[$info['countryCode']]) > 1 ) {
                        $rnd = array_rand($url[$info['countryCode']], 1);
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                        // echo $rdr;
                        echo $rdr;
                        exit;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                        // echo $rdr;
                        echo $rdr;
                        exit;
                    }
                    exit;
                } else {
                    if( count($url['ALL']) > 1 ) {
                        $rnd = array_rand($url["ALL"], 1);
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                        // echo $rdr;
                        echo $rdr;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                        echo $rdr;
                    }
                    exit;
                }
            }
            exit;
        } elseif ($fwd_web != "" && true === strpos($fwd_web, 'http') && false == $isMobile ) {
            $isUrl = Gen::isUrl($fwd_web);
            if($isUrl == true) {
                $rdr = Team::formatLink($q[0]->team, $fwd_web);
                echo $rdr;
                exit;
            } else {
                $json = Typo::Xclean($fwd_web);
                $url = json_decode($json, true);
                // print_r($url);
                if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                    if( count($url[$info['countryCode']]) > 1 ) {
                        $rnd = array_rand($url[$info['countryCode']], 1);
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                        echo $rdr;
                        exit;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                        echo $rdr;
                        exit;
                    }
                    exit;
                } else {
                    if( count($url['ALL']) > 1 ) {
                        $rnd = array_rand($url["ALL"], 1);
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                        // echo $rdr;
                        echo $rdr;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                        echo $rdr;
                    }
                    exit;
                }
            }
            exit;
        } elseif ($fwd_wap != "" && true === strpos($fwd_wap, 'http') && true == $isMobile ) {
            $isUrl = Gen::isUrl($fwd_wap);
            if($isUrl == true) {
                $rdr = Team::formatLink($q[0]->team, $fwd_wap);
                echo $rdr;
                exit;
            } else {
                $json = Typo::Xclean($fwd_wap);
                $url = json_decode($json, true);
                // print_r($url);
                if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                    if( count($url[$info['countryCode']]) > 1 ) {
                        $rnd = array_rand($url[$info['countryCode']], 1);
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                        echo $rdr;
                        exit;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                        echo $rdr;
                        exit;
                    }
                    exit;
                } else {
                    if( count($url['ALL']) > 1 ) {
                        $rnd = array_rand($url["ALL"], 1);
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                        // echo $rdr;
                        echo $rdr;
                    } else {
                        $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                        echo $rdr;
                    }
                    exit;
                }
            }
            exit;
        } else {
            
            if ($q[0]->forward_web != "" && strpos($q[0]->forward_web, 'http') && false == $isMobile ) {
                $isUrl = Gen::isUrl($q[0]->forward_web);
                if($isUrl == true) {
                    $rdr = Team::formatLink($q[0]->team, $q[0]->forward_web);
                    echo $rdr;
                    exit;
                } else {
                    $json = Typo::Xclean($q[0]->forward_web);
                    $url = json_decode($json, true);
                    // print_r($url);
                    if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                        if( count($url[$info['countryCode']]) > 1 ) {
                            $rnd = array_rand($url[$info['countryCode']], 1);
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                            echo $rdr;
                            exit;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                            echo $rdr;
                            exit;
                        }
                        
                        exit;
                    } else {
                        if( count($url['ALL']) > 1 ) {
                            $rnd = array_rand($url["ALL"], 1);
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                            // echo $rdr;
                            echo $rdr;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                            echo $rdr;
                        }
                        exit;
                    }
                }
                
            } elseif ($q[0]->forward_wap != "" && strpos($q[0]->forward_wap, 'http')  && true == $isMobile ) {
                $isUrl = Gen::isUrl($q[0]->forward_wap);
                if($isUrl == true) {
                    $rdr = Team::formatLink($q[0]->team, $q[0]->forward_wap);
                    echo $rdr;
                    exit;
                } else {
                    $json = Typo::Xclean($q[0]->forward_wap);
                    $url = json_decode($json, true);
                    if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                        if( count($url[$info['countryCode']]) > 1 ) {
                            $rnd = array_rand($url[$info['countryCode']], 1);
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                            echo $rdr;
                            exit;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                            echo $rdr;
                            exit;
                        }
                        exit;
                    } else {
                        if( count($url['ALL']) > 1 ) {
                            $rnd = array_rand($url["ALL"], 1);
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                            // echo $rdr;
                            echo $rdr;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                            echo $rdr;
                        }
                        exit;
                    }
                }
            } else {
                $isUrl = Gen::isUrl($q[0]->forward_url);
                if($isUrl == true) {
                    $rdr = Team::formatLink($q[0]->team, $q[0]->forward_url);
                    echo $rdr;
                    exit;
                } else {
                    $json = Typo::Xclean($q[0]->forward_url);
                    $url = json_decode($json, true);
                    // print_r($url);
                    if( isset($info['countryCode']) && array_key_exists($info['countryCode'], $url) ) {
                        if( count($url[$info['countryCode']]) > 1 ) {
                            $rnd = array_rand($url[$info['countryCode']], 1);
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][$rnd]);
                            // echo $rdr;
                            echo $rdr;
                            exit;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url[$info['countryCode']][0]);
                            // echo $rdr;
                            echo $rdr;
                            exit;
                        }
                        exit;
                    } else {
                        if( count($url['ALL']) > 1 ) {
                            $rnd = array_rand($url["ALL"], 1);
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][$rnd]);
                            // echo $rdr;
                            echo $rdr;
                        } else {
                            $rdr = Team::formatLink($q[0]->team, $url["ALL"][0]);
                            echo $rdr;
                        }
                        
                        exit;
                    }
                }
            }
            // $target = Typo::Xclean($q[0]->forward_url);
        }
    }
}
