<?php
include('config.php');

date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

// new Db();

Db::connect(DB_STAT_HOST, DB_STAT_USER, DB_STAT_PASS, DB_STAT_NAME);

$date = date("Y-m-d");
$gmdate = gmdate("Y-m-d");
echo $date;

$q = Db::result("SELECT DISTINCT `owner` FROM `hitstat` ");
print_r($q);
if( Db::$num_rows > 0 ) {
    foreach( $q as $k => $v ) {

        $q2 = Db::result("SELECT count(`id`) AS `total`
            FROM `hitstat`
            WHERE `date` LIKE '%{$date}%'
            AND `owner` = '{$v->owner}' AND `position` = 'REDIRECT' ");

        if (Db::$num_rows > 0) {
            if( true === Stats::dailyExist($date, $v->owner)) {
                Db::update(array(
                    'table' => 'dailystats',
                    'where' => array(
                        'owner' => $v->owner,
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
                        'owner' => $v->owner,
                        'total_hit' => $q2[0]->total
                    )
                ));
            }

        }
        sleep(20);
    }
    
}

