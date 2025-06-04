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
User::secure();
if( false === User::access(1) ) {
    echo "<div class='alert alert-danger'><i class='fa fa-warning'></i> Anda tidak punya akses</div>";
} else {
$data = [];
if( isset($_GET['act']) && $_GET['act'] == 'edit' ) {
    $id = Typo::int($_GET['id']);
    if (!isset($id) || $id == '') {
        // VALIDATE ALL
        $alertDanger[] = "No ID Detected";
    }

    if (!isset($alertDanger)) {
        $userid = User::userid($id);
        $email = User::email($id);
        $forward_url = User::forward_url($id);
        $group = User::group($id);
        $hitstat = User::hitstat($userid);
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}

if(isset($_POST['editUser'])) {
    //echo Token::validate($_POST['token']);
    $olduserid = Typo::cleanX($_POST['olduserid']);
    $userid = Typo::cleanX($_POST['userid']);
    $email = Typo::cleanX($_POST['email']);
    $forward_url = Typo::cleanX($_POST['forward_url']);
    $password = Typo::strip($_POST['password']);
    $hitstat = Typo::cleanX($_POST['hitstat']);

    if (!isset($alertDanger)) {
        if( $_POST['password'] != "" ) {
            $vars = array(
                'id' => $id,
                'user' => array(
                            'pass' => User::randpass($_POST['password']),
                        ),

            );
        User::update($vars);
        }
        $vars = array(
            'id' => $id,
            'user' => array(
                        'userid' => $userid,
                        'email' => $email,
                        'forward_url' => $forward_url,
                        'hitstat' => $hitstat
                    ),

            );
        User::update($vars);
        if( $olduserid != $_POST['userid']) {
            Db::update(
                array(
                    'table' => 'gen_link',
                    'where' => array(
                        'username' => $olduserid
                    ),
                    'key' => array(
                        'username' => $userid
                    )
                )
            );

            Db::update(
                array(
                    'table' => 'hitstat',
                    'where' => array(
                        'owner' => $olduserid
                    ),
                    'key' => array(
                        'owner' => $userid
                    )
                )
            );

            Db::update(
                array(
                    'table' => 'domains',
                    'where' => array(
                        'account' => $olduserid
                    ),
                    'key' => array(
                        'account' => $userid
                    )
                )
            );
        }
        
    
        $data['alertSuccess'][] = " {$userid}, Updated";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}
echo "<div class='col-md-12 text-right'>

<hr />
</div>

    <div class='col-md-12 clearfix'>
";
echo System::alert($data);
echo "
</div>
<form  action='' method='post'>
<div class='table-responsie'>
<div class=\"form-group\">
<label>Username</label>
<input type=\"hidden\" name='olduserid' class=\"form-control\" value=\"{$userid}\">
<input type=\"text\" name='userid' class=\"form-control\" value=\"{$userid}\">
</div>
<div class=\"form-group\">
<label>Password</label>
<input type=\"password\" name=\"password\" class=\"form-control\">
</div>
<div class=\"form-group\">
<label>eMail</label>
<input type=\"email\" name=\"email\" class=\"form-control\" value=\"{$email}\">
</div>
<div class=\"form-group\">
    <label>Forward Url</label>
    <input type=\"text\" name=\"forward_url\" class=\"form-control\" value=\"{$forward_url}\">
</div>
<div class=\"form-group\">
    <label>Traffic Postback</label>
    <div class='alert alert-info'>Contoh : https://lead.report.com/hits.php?ip={ip}&country={country}&device={device}</div>
    <input type=\"text\" name=\"hitstat\" class=\"form-control\" value=\"{$hitstat}\">
    <span>country : {country} - ip : {ip} - device : {device}</span>
</div>
<div class=\"form-group\">
<button class='btn btn-success btn-sm' type='submit' name='editUser'><i class='fa fa-check'></i> Update</button>
</div>
</div>
</form>";
}
include('footer.php');