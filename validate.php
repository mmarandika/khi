<?php

include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();
include('countrycodes.php');
// include('header.php');

new Db();
$apiKey = "RAJAKAYARAMASUKSURGA";

if( isset($_REQUEST['api']) && $_REQUEST['api'] == $apiKey && isset($_REQUEST['domain'])) {
    $q = Db::result("SELECT `id` FROM `gen_link` WHERE `full_domain` = '{$_REQUEST['domain']}' ");
    if(Db::$num_rows > 0) {
        echo "true";
    } else {
        echo "false";
    }
} else {
    echo "false";
}