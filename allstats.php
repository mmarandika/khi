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
if( false === User::access(0) ) {

} else {

    $username = Session::val('username');
    $where = array(
        'max' => 200,
    );
    $domains = Stats::getHits($where);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "
        <h2>All Stats (200 terakhir)</h2>
        <hr />
        <div class='table-responsive'>
        <table id='myLinks' class='table'>
        <thead>
            <th>Date</th>
            <th>Owner</th>
            <th>Links</th>
            <th>Referer</th>
            <th>IP</th>
            <th>Country</th>
            <th>ISP</th>
            <th>Pos</th>
        </thead>
            ";
        foreach( $domains as $k => $v) {
            $date = date("d M, Y H:i:s", strtotime($v->date));
            echo "
                <tr>
                    <td>{$date}</td>
                    <td>{$v->owner}</td>
                    <td>{$v->full_url}</td>
                    <td>{$v->referer}</td>
                    <td>{$v->ip}</td>
                    <td>{$v->country}</td>
                    <td>{$v->isp}</td>
                    <td>{$v->position}</td>
                </tr>
                ";
            
        }
        echo "</tbody></table></div>";
    } else {
        echo $domains['error'];
    }

    echo "</div>";
    
}


include('footer.php');