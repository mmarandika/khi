<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();
include('countrycodes.php');
include('header-login.php');


new Db();

$data = [];
if(isset($_POST['login'])) {
    // print_r($_POST);
    if (!isset($_POST['username'])) {
        // VALIDATE ALL
        $alertDanger[] = "Username Empty!";
    }
    if (!isset($_POST['password'])) {
        // VALIDATE ALL
        $alertDanger[] = "Password Empty!";
    }

    if (!isset($alertDanger)) {
        /*check if username is exist or not */
        $username = Typo::cleanX(Typo::strip(trim($_POST['username'])));
        $sql = sprintf("SELECT `userid`,`status`,`activation` FROM `user` WHERE `userid` = '%s'", $username);
        $usr = Db::result($sql);
        $c = Db::$num_rows;
        //echo $c;
        //print_r($usr);
        if ($c == '1') {
            //$alertSuccess = "";
            // check if user is active
            if ($usr[0]->status == '1') {
                /* get user password */
                $pass = User::randpass($_POST['password']);
                $sql = "SELECT `pass`,`group` FROM `user` WHERE `userid` = '{$username}'";

                $l = Db::result($sql);
                $c = Db::$num_rows;

                foreach ($l as $v) {
                    //print_r($v);
                    $p = $v->pass;
                    $g = $v->group;
                }
                //echo $p;
                if (isset($p)) {
                    if ($p == $pass) {
                        // session_regenerate_id();
                        $vars = array(
                                    'username' => $username,
                                    'loggedin' => true,
                                    'group' => $g,
                                );
                        Session::set_session($vars);

                        $data['alertSuccess'][] = "Login Success";
                        header("Location: index.php");
                    } elseif ($p != $pass) {
                        $data['alertDanger'][] = "Password didn't match";
                    }
                }
            } else {
                if ($usr[0]->activation != '') {
                    $data['alertDanger'][] = "Account Inactive";
                } else {
                    $data['alertDanger'][] = "Account Inactive or Maybe Blcoked";
                }
            }
        } elseif ($c == '0') {
            $data['alertDanger'][] = "User Not Exist";
        }
    } else {
        $data['alertDanger'] = $alertDanger;
    //    print_r($data['alertDanger']);
    }
}

echo System::alert($data);
if ( false === User::isLoggedin() ) {

?>

<form  method="post" action="">
  
  <!-- Form-->
<div class="form">
  <div class="form-panel one">
  <img class="mb-4" src="images/logo-ptg.png" alt=""  height="35">
    <div class="form-header">
      <h1>Account Login</h1>
    </div>
    <div class="form-content">
        <div class="form-group">
          <label for="username">Username</label>
          <input id="username" type="text" name="username" required="required"/>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input id="password" type="password" name="password" required="required"/>
        </div>
        <div class="form-group">
          <button type="submit" name="login" id="go">Log In</button>
          <div style="text-align: center;">atau</div>
          <a href="register.php" class="btn btn-warning btn-sm btn-block"><i class="fa fa-signup"></i> Daftar Akun</a>
        </div>
    </div>
  </div>
  
</div>
</form>

<?php
} else {
echo "Anda sudah Login : <strong>" . Session::val('username') . "</strong>";
}
include('footer-login.php');