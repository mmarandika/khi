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
$page = "stats";
User::secure();
if( false === User::access() ) {

} else {
    $username = Session::val('username');
    $date = date("Y-m-d");
$gmdate = gmdate("Y-m-d");
    Db::connect(DB_STAT_HOST, DB_STAT_USER, DB_STAT_PASS, DB_STAT_NAME);
    $q2 = Db::result("SELECT count(`id`) AS `total`
            FROM `hitstat`
            WHERE `date` LIKE '%{$date}%'
            AND `owner` = '{$username}' AND `position` = 'REDIRECT' ");
    
    if ($q2[0]->total > 0) {
        if( true === Stats::dailyExist($date, $username)) {
            Db::update(array(
                'table' => 'dailystats',
                'where' => array(
                    'owner' => $username,
                    'date' => $date
                ),
                'key' => array(
                    'total_hit' => $q2[0]->total
                )
            ));

        } else {
            Db::insert(array(
                'table' => 'dailystats',
                'key' => array(
                    'date' => $date,
                    'date_utc' => $gmdate,
                    'owner' => $username,
                    'total_hit' => $q2[0]->total
                )
            ));
        }

    }
    new Db();
    
    $where = array(
        'max' => 200,
        'username' => $username
    );
    $domains = Stats::getHits($where);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "
        <h2>Hits Chart (7 hari terakhir)</h2>
        <hr />
        <canvas  id='myChart'  width='450' height='150'></canvas>
        <div class='alert alert-info'>Data <stgrong>HIT</stgrong> adalah traffic yang </strong>REDIRECT</strong></div>
        <h2>My Stats (200 terakhir)</h2>
        <hr />
        <div class='table-responsive'>
        <table id='myLinks' class='table'>
        <thead>
            <th>Date</th>
            <th>Links</th>
            <th>Target</th>
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
                    <td>{$v->full_url}</td>
                    <td>{$v->target_url}</td>
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