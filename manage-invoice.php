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
    echo "Akses Dibatasi";
} else {

    if( isset($_POST['addOrder']) ) {
        $start = $_POST['start'];
        if($_POST['term'] == "monthly") {
            $exp = 30;
        }
        if($_POST['term'] == "yearly") {
            $exp = 365;
        }
        if($_POST['term'] == "lifetime") {
            $exp = 999999;
        }
        $dexp = strtotime("+{$exp} days", strtotime($start));
        $end = date("Y-m-d H:i:s", $dexp);
        $invnum = "LINKGEN-".rand();
        $username = Typo::cleanX($_POST['userid']);
        $vars = array(
            'userid' => $username,
            'invnum' => $invnum,
            'item_name' => 'Link Generator 1 bulan - '.$username,
            'item_price' => $_POST['price'],
            'item_qty' => '1',
            'item_term' => Typo::cleanX($_POST['term']),
            'status' => Typo::cleanX($_POST['status']),
            'start' => $start,
            'end' => $end
        );
        echo Order::add($vars);
    }
    $username = Session::val('username');
    $orders = Invoice::list(100);
    print_r($orders);
    echo "<h2>Invoice (100 terakhir)
    <button type='button' class='btn btn-primary btn-sm float-right' data-toggle='modal' data-target='#exampleModal'>
    <i class='fa fa-plus'></i> Add Orders
    </button>
    
    </h2>
    <!-- Modal -->
    <div class='modal fade' id='exampleModal' tabindex='-1' aria-labelledby='exampleModalLabel' aria-hidden='true'>
        <div class='modal-dialog'>
        <form action='' method='post'>
            <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title' id='exampleModalLabel'>Add Order</h5>
                <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                <span aria-hidden='true'>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <div class='form-group'>
                    <label>Username</label>
                    <input type='text' name='userid' class='form-control'>
                </div>
                <!--<div class='form-group'>
                    <label>Date</label>
                    <input type='text' name='date' class='form-control'>
                </div>-->
                <div class='form-group'>
                    <label>Price</label>
                    <input type='text' name='price' class='form-control'>
                </div>
                <div class='form-group'>
                    <label>Status</label>
                    <select name='status' class='form-control'>
                        <option value='paid'>Paid</option>
                        <option value='unpaid'>Unpaid</option>
                    </select>
                </div>
                <div class='form-group'>
                    <label>Start</label>
                    <input type='text' name='start' class='form-control'>
                </div>
                <div class='form-group'>
                    <label>Term</label>
                    <select name='term' class='form-control'>
                        <option value='monthly'>Monthly</option>
                        <option value='yearly'>Yearly</option>
                        <option value='lifetime'>Lifetime</option>
                    </select>
                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
                <button type='submit' name='addOrder' class='btn btn-primary'>Add Order</button>
            </div>
            </div>
        </form>
        </div>
    </div>
    <hr />";
    if(!isset($orders['error'])) {
        echo "
        
        <div class='table-responsive'>
        <table id='myLinks' class='table'>
        <thead>
            <th>Id</th>
            <th>Date</th>
            <th>User</th>
            <th>Inv. Num</th>
            <th>Status</th>
            <th>Start</th>
            <th>End</th>
            <th>Amount</th>
        </thead>
            ";
        foreach( $orders as $k => $v) {
            echo "
                <tr>
                    <td>{$v->id}</td>
                    <td>{$v->date}</td>
                    <td>{$v->userid}</td>
                    <td>{$v->invnum}</td>
                    <td>{$v->status}</td>
                    <td>{$v->start}</td>
                    <td>{$v->end}</td>
                    <td>{$v->item_price}</td>
                </tr>
                ";
            
        }
        echo "</tbody></table></div>";
    } else {
        echo $orders['error'];
    }

    echo "</div>";
    
}


include('footer.php');