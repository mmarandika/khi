<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();
// include('countrycodes.php');

new Db();

$date = date("Y-m-d");

$total = Gen::totalLink($_POST['username'], $date);

if ($total < 5000) {
    echo true;
} else {
    echo false;
}

// Session::destroy();
// header('Location: index.php');