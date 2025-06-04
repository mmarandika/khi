<?php
// namespace Midtrans;

include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();

new Db();

Midtrans\Config::$isProduction = $liveapp;
Midtrans\Config::$serverKey = $midtrans_server_key;
$notif = new Notification();

$transaction = $notif->transaction_status;
$type = $notif->payment_type;
$order_id = $notif->order_id;
$fraud = $notif->fraud_status;

if ($transaction == 'capture') {
    if ($type == 'credit_card') {
        if ($fraud == 'challenge') {
            $res = false;
        } else {
            $res = true;
        }
    }
} else if ($transaction == 'settlement') {
    $res = true;
} else if ($transaction == 'pending') {
    $res = false;
} else if ($transaction == 'deny') {
    $res = false;
} else if ($transaction == 'expire') {
    $res = false;
} else if ($transaction == 'cancel') {
    $res = false;
}


if( $res == true) {
    if( false === Order::isExist($order_id) ) {
        if($o['gross_amount'] == "800000.00") {
            $qty = 6;
        } else if($o['gross_amount'] == "1500000.00") {
            $qty = 12;
        } else if($o['gross_amount'] == "150000.00") {
            $qty = 1;
        }
        $enddate = $qty*30;
        $start = $o['transaction_time'];
        $end = date("Y-m-d H:i:s", strtotime("+".$enddate." days"));
        
        $vars = array(
            'userid' => $username,
            'invnum' => $_GET['invnum'],
            'item_name' => 'Link Generator '.$qty.' bulan - '.$username,
            'item_price' => $o['gross_amount'],
            'item_qty' => $qty,
            'item_term' => "monthly",
            'status' => "paid",
            'start' => $start,
            'end' => $end
        );
        Order::add($vars);

    }
    
} else {
    echo "Order Gagal";
}