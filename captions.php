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
    if( isset($_POST['addCaption']) ) {

        if(empty($_POST['caption'])) {
            $alertDanger[] = 'Caption tidak boleh kosong';
        }
        if (!isset($alertDanger)) {
            $caption = Typo::cleanX($_POST['caption']);
            Captions::add(trim($caption));
        } else {
            $data['alertDanger'] = $alertDanger;
        }

        // echo $data['alertDanger'];
    }

    if( isset($_POST['updateCaption']) ) {

        if(empty($_POST['caption'])) {
            $alertDanger[] = 'Caption tidak boleh kosong';
        }
        if (!isset($alertDanger)) {
            $caption = Typo::cleanX($_POST['caption']);
            $id = Typo::int($_POST['id']);

            Db::update(array(
                'table' => 'captions',
                'id' => $id,
                'key' => array(
                    'caption' => $caption
                )
            ));
            $data['alertSuccess'][] = "Update Success";
        } else {
            $data['alertDanger'] = $alertDanger;
        }

        // echo $data['alertDanger'];
    }

    // if (isset($_POST['dellAllDomain'])) {
    //     $sql = "SELECT * FROM `domains_list`";
    //     $q = Db::result($sql);
    //     foreach ( $q as $k => $v) {
    //         Queue::add($v->domain, 'delete');
    //     }
    //     $sql = "DELETE FROM `domains_list` WHERE `owner` = '{$data['owner']}'";
    //     Db::query($sql);
    // }

    if (isset($_GET['del']) && $_GET['del'] != '') {
        $id = Typo::int($_GET['del']);
        Captions::del($id);
        if( !isset($_POST['updateCaption'])) {
            $data['alertSuccess'][] = "Caption Deleted";
        }
        
    }
    echo "
    
    <div class='row'>
        <div class=\"col-md-4\">
        <div class='well'>Contoh : Text {{link}} text</div>
        </div>
        <div class='col-md-8'>
        ";
        echo System::alert($data);
        echo "
        <form action='' method='post' name='addCaptionForm'>
            <div class='form-group'>
                <textarea type='text' id='caption' class='form-control' name='caption'></textarea> 
            </div>
            <button class='btn btn-success' name='addCaption' id='addCaption' type='submit' >Tambah</button>
        </form>
        </div>
        <div class='clearfix'>&nbsp;</div>
    </div>";
    echo "<div class='row'>";
    $domains = Captions::list();
    

    echo "</div>";
    
}


include('footer.php');