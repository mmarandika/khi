<?php
include('config.php');
include('countrycodes.php');
include('header.php');


date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

if( isset($_POST['loginpass']) && $_POST['password'] != "" ) {
    if($_POST['password'] == $passWd) {
        $_SESSION['loggedIn'] = true;
    } else {
        echo "<div class='container'><div class='alert alert-danger'>Password Salah!!</div></div>";
    }
    
} 
if( !isset($_SESSION['loggedIn']) ) {
    echo "
    <div class='container'>
        <form action='' method='post'>
        <div class='form-group'>
            <div class='input-group'>
                <input type='password' name='password' class='form-control' placeholder='masukkan password untuk melihat report' >
                <div class='input-group-btn'>
                <button type='submit' name='loginpass' class='btn btn-success'>
                    Login
                </button>
                </div>
            </div>
        </div>
        </form>
    </div>
    ";
} else {
new Db();

if( isset($_GET['date'])) {
    if( $_GET['date'] == 'today') {
        $date = date('Y-m-d');
    } elseif( $_GET['date'] == 'yesterday' ) {
        $date = date('Y-m-d', strtotime("yesterday"));
    }
} else {
    $date = date('Y-m-d');
}

$r = Db::result("SELECT * FROM `lead_report` WHERE `date` LIKE '%{$date}%' ");

echo "<div class=\"container\"><div class=\"panel panel-default searchbox\">
<div class=\"panel-heading\">
    <div class=\"row\">
        <div class=\"col-md-6\">
            <input class=\"form-control input-sm\" type=\"text\" id=\"search\" placeholder=\"Search...\">
        </div>
        <div class=\"col-md-6\">
            <select class=\"form-control input-sm\" name=\"select_date\" id=\"select_date\">
            <option selected=\"selected\" disabled value=\"0\">Select date</option>
            <option value=\"today\">Today</option>
            <option value=\"yesterday\">Yesterday</option>
            </select>
        </div>
        
    </div>
</div>
<div class='panel-body'>
<div class='table-responsive'>
<table id='myTable'><thead>
<tr>
    <th>Date</th>
    <th>ID</th>
    <th>Traffic</th>
    <th>Country</th>
    <th>Amount</th>
</tr>
</thead>
<tbody>
";
if( Db::$num_rows > 0) {
    $total = 0;
    foreach($r as $k => $v) {
        // $total = $v->payout+$total;
        $country = array_search($v->country, $countrycodes);
        echo "<tr>
            <td>{$v->date}</td>
            <td><a href='statsID.php?id={$v->click_id}'>{$v->click_id}</a></td>
            <td>{$v->traffic_type}</td>
            <td>{$country}</td>
            <td>{$v->currency_symbol}{$v->payout}</td>
            </tr>
        ";
    }
}


echo "
<tfoot>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</tfoot>
</tbody>
</table>
</div>
</div>
</div>
</div>
";
}

include('footer.php');