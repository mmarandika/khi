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
        'max' => 100,
        'username' => $username
    );
    $domains = Gen::getLinks($where);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "
        <h2>My Links (100 terakhir)</h2>
        <hr />
        <div class='table-responsive'>
        <table id='myLinks' class='table'>
        <thead>
            <th>Id</th>
            <th>Type</th>
            <th>Link</th>
            <th>Target</th>
        </thead>
            ";
        foreach( $domains as $k => $v) {
            echo "
                <tr>
                    <td>{$v->id}</td>
                    <td>{$v->type}</td>
                    <td>http://{$v->full_domain}/{$v->hash}</td>
                    <td>{$v->forward_url}</td>
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