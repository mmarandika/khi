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
    if( isset($_POST['addDomain']) ) {

        if(empty($_POST['domain'])) {
            $alertDanger[] = 'Domain tidak boleh kosong';
        }
        if($_POST['domain'] == $nsgroup) {
            $alertDanger[] = 'Anda tidak boleh menambahkan domain ini.';
        }
        if (!isset($alertDanger)) {
            $domains = explode("\n", $_POST['domain']);
            $special = Typo::cleanX($_POST['special']);
            foreach($domains as $k => $v) {
                if (!Pdns::isExist($v)) {
                    Pdns::addDomain( trim($v), $ipv4, $ipv6, $username, $special );
                } else {
                    $data['alertDanger'][] = 'Domain '.$v.' Sudah ada';
                }
            }
            
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

    if (isset($_POST['deleteSelected'])) {
        if (isset($_POST['doms'])) {
            for ( $i = 0; $i < count( $_POST['doms'] ); $i ++ ) {
                Db::connect(DB_MASTER_HOST, DB_MASTER_USER, DB_MASTER_PASS, DB_MASTER_NAME);
                $sql = "DELETE FROM `domains` WHERE `id` = '{$_POST['doms'][$i]}'";
                Pdns::del( $_POST['doms'][$i] );
                new Db();
            }
        }
    }
    echo "
    
    <div class='row'>
    
    <div class='col-md-8'>
    ";
    echo System::alert($data);
    echo "
    <form action='' method='post' name='addDomainForm'>
        <div class='form-group'>
            <textarea rows='5' class='form-control' name='domain' id='domain' autocomplete='off' placeholder='1 baris 1 domain, bisa masukkan banyak domain'></textarea>
        </div>
        <div class='form-group'>
            <select name='special' class='form-control'>
                <option value='0'>Domain Biasa</option>
                <option value='1'>Domain Spesial</option>
            </select>
        </div>
        <div class='form-group'>
            <button class='btn btn-success btn-sm' name='addDomain' id='addDomainSubmit'  type='submit' ><i class='fa fa-plus'></i> Tambah</button>
        </div>
    </form>
    </div>
    <div class=\"col-md-4\">
        <div class='alert alert-info'>
            <strong>CNAME : 
            <ul>
                <li>khix.kubi.one</li>
                <li>khiy.kubi.one</li>
            </ul>
            </strong>
            <div>
            Pilih salah satu. Kita sediakan beberapa server, pilih yang sekiranya enak.
            </div>
        </div>
    </div>
    </div>";

    $where = array(
        'max' => 15,
        'account' => $username
    );
    $domains = Pdns::listDomain($where);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "<form name='myForm' id=\"myForm\"  action='' method='post'>
        <div class='row'>
            <div class='col-12'>
                <div class='row'>
                    <div class='col-md-6'>
                        <div class=\"label label-success\" id=\"selectAll\" style=\"cursor: pointer\" >Select All</div>
                        <!--<a href=\"#\" class=\"label label-danger\" data-toggle=\"modal\" data-target=\"#dellAll\">Delete All </a>-->
                    
                    </div>
                    <div class='col-md-6'>
                        <button name=\"deleteSelected\" type=\"submit\" class=\"btn btn-danger btn-sm float-right\"><i class=\"fa fa-trash\"></i> Delete Selected</button>
                    </div>
                </div>
            </div>
        </div>";
        echo "<div class='row'>";
        foreach( $domains as $k => $v) {
            if( $v->account == $username ) {
                $special = ($v->special == 1 ) ? "&#9733;": "&nbsp;";
                echo "<div class='col-md-3'>
                <div class='form-group'>
                    <div class='input-group input-group-sm'>
                        <div class='input-group-prepend'>
                            <span class='input-group-text'>
                                <input type='checkbox' id='doms' name='doms[]' value='".$v->id."' class='checkbox'>
                            </span>
                            <input  value='".$v->name."' class='form-control form-control-sm' readonly>
                            <div>{$special}</div>
                        </div>
                    </div>
                </div>
                </div>";
            }
            
        }
        echo "</div>";
        echo "</form>";
    } else {
        echo $domains['error'];
    }

    echo "</div>";
    
}


include('footer.php');