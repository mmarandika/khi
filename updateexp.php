<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

new Db();
Db::connect(DB_MASTER_HOST, DB_MASTER_USER, DB_MASTER_PASS, DB_MASTER_NAME);
$q = Db::result("SELECT * FROM `orders` WHERE `item_term` = 'monthly' ");
foreach($q as $k => $v) {
    $dexp = strtotime("+30 days", strtotime($v->start));
    $end = date("Y-m-d H:i:s", $dexp);
    Db::update(array(
        'table' => 'orders',
        'id' => $v->id,
        'key' => array(
            'end' => $end
        )
    ));
}
new Db();