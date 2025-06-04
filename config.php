<?php

error_reporting(E_ALL);
$arr = array(0, 1);
$rnd = array_rand($arr, 1);
if ( $arr[$rnd] == 0 ) {
    define('DB_HOST', 'localhost');
} else {
    define('DB_HOST', 'localhost');
}
define('DB_NAME', 'cloacker');
define('DB_PASS', '');
define('DB_USER', 'root');
define('DB_DRIVER', 'mysqli');

define('DB_MASTER_HOST', 'localhost');
define('DB_MASTER_NAME', 'cloacker');
define('DB_MASTER_PASS', '');
define('DB_MASTER_USER', 'root');
define('DB_MASTER_DRIVER', 'mysqli');

define('DB_STAT_HOST', 'localhost');
define('DB_STAT_NAME', 'cloackstats');
define('DB_STAT_PASS', '');
define('DB_STAT_USER', 'root');
define('DB_STAT_DRIVER', 'mysqli');

define('USE_MEMCACHED', false);

define('SITE_ID', 'KHI8394qhfi');

$siteurl = "http://localhost/khi-cloak/";

$teamName = "KHI";

$apiKey = "RAJAKAYARAMASUKSURGA";



define('SECURITY_KEY', '#RADRdj%d1jrF3r51#_adastqR#at-T_32');