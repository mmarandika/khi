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
$data = [];
User::secure();
if( false === User::access() ) {

} else {

    $username = Session::val('username');
    $where = array(
        'max' => 200,
        'username' => $username
    );
    $domains = Stats::getHits($where);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "
        <h2>My Stats (200 terakhir)</h2>
        <hr />
        <canvas  id='myChart'  width='450' height='150'></canvas>";
    } else {
        echo $domains['error'];
    }

    echo "</div>";
    
}


include('footer.php');