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
if( isset($_GET['act']) && $_GET['act'] == 'del' ) {
    $id = Typo::int($_GET['id']);
    if (!isset($id) || $id == '') {
        // VALIDATE ALL
        $alertDanger[] = "No ID Detected";
    }

    if (!isset($alertDanger)) {
        User::delete($id);
    
        $data['alertSuccess'][] = "User Deleted!";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}

if( isset($_GET['act']) && $_GET['act'] == 'active' ) {
    $id = Typo::int($_GET['id']);
    if (!isset($id) || $id == '') {
        // VALIDATE ALL
        $alertDanger[] = "No ID Detected";
    }

    if (!isset($alertDanger)) {
        User::activate($id);
    
        $data['alertSuccess'][] = "User activated!";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}

if( isset($_GET['act']) && $_GET['act'] == 'inactive' ) {
    $id = Typo::int($_GET['id']);
    if (!isset($id) || $id == '') {
        // VALIDATE ALL
        $alertDanger[] = "No ID Detected";
    }

    if (!isset($alertDanger)) {
        User::deactivate($id);
    
        $data['alertSuccess'][] = "User Deactivated!";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}
if(isset($_POST['addUser'])) {
    //echo Token::validate($_POST['token']);
    $userid = Typo::cleanX($_POST['userid']);
    $email = Typo::cleanX($_POST['email']);
    $forward_url = Typo::cleanX($_POST['forward_url']);
    $group = Typo::int($_POST['group']);
    $pass1 = Typo::strip($_POST['pass1']);
    $pass2 = Typo::strip($_POST['pass2']);

    if (!isset($userid) || $userid == '') {
        // VALIDATE ALL
        $alertDanger[] = "USERID_CANNOT_EMPTY";
    }
    if (!isset($_POST['pass1']) || $_POST['pass1'] == '') {
        // VALIDATE ALL
        $alertDanger[] = "PASS1_CANNOT_EMPTY";
    }
    if (!isset($_POST['pass2']) || $_POST['pass2'] == '') {
        // VALIDATE ALL
        $alertDanger[] = "PASS2_CANNOT_EMPTY";
    }

    if (User::validate($userid)) {
        $alertDanger[] = "MSG_USER_EXIST";
    }
    if (!User::isSame($_POST['pass1'], $_POST['pass2'])) {
        $alertDanger[] = "MSG_USER_PWD_MISMATCH";
    }
    if (!User::isEmail($_POST['email'])) {
        $alertDanger[] = "MSG_USER_EMAIL_EXIST";
    }

    if (!isset($alertDanger)) {
        // Db::connect(DB_MASTER_HOST, DB_MASTER_USER, DB_MASTER_PASS, DB_MASTER_NAME);
        $vars = array(
                        'user' => array(
                                        'userid' => $userid,
                                        'pass' => User::randpass($_POST['pass1']),
                                        'email' => $email,
                                        'group' => $group,
                                        'status' => '1',
                                        'join_date' => date('Y-m-d H:i:s'),
                                        'forward_url' => $forward_url,
                                        'referrer' => '',
                                        'forward_web' => '',
                                        'forward_wap' => ''
                                    ),

                    );
        User::create($vars);
        // new Db();
    
        $data['alertSuccess'][] = " {$userid}, Added";
    } else {
        $data['alertDanger'] = $alertDanger;
    }

}
echo "<div class='col-md-12 text-right'>
<button class=\"btn btn-success btn-sm float-right\" data-toggle=\"modal\" data-target=\"#adduser\">
    <span class=\"fa fa-plus\"></span> 
    <span class=\"hidden-xs hidden-sm\">Add User</span>
</button>
<hr />
</div>
<!-- Modal -->
    <div class=\"modal fade\" id=\"adduser\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">
      <div class=\"modal-dialog\">
        <div class=\"modal-content modal-sm\">
            <form action=\"\" method=\"post\">
          <div class=\"modal-header\">
            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>
            <h4 class=\"modal-title\" id=\"myModalLabel\">Add User</h4>
          </div>
          <div class=\"modal-body\">

                <div class=\"form-group\">
                    <label>Username</label>
                    <input type=\"text\" name='userid' class=\"form-control\">
                </div>
                <div class=\"form-group\">
                    <label>Password</label>
                    <input type=\"password\" name=\"pass1\" class=\"form-control\">
                </div>
                <div class=\"form-group\">
                    <label>Password Again</label>
                    <input type=\"password\" name=\"pass2\" class=\"form-control\">
                </div>
                <div class=\"form-group\">
                    <label>eMail</label>
                    <input type=\"email\" name=\"email\" class=\"form-control\">
                </div>
                <div class=\"form-group\">
                    <label>Forward Url</label>
                    <input type=\"text\" name=\"forward_url\" class=\"form-control\">
                </div>
                <div class=\"form-group\">
                    <label>Group</label>
                    ";
                    $var = array('name' => 'group', 'selected' => '6', 'update' => true);
                    echo User::dropdown($var);
echo "
                </div>

          </div>
          <div class=\"modal-footer\">
            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>
            <button type=\"submit\" class=\"btn btn-success\" name=\"addUser\">Submit</button>
          </div>
          
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div class='col-md-12 clearfix'>
";
echo System::alert($data);
echo "
</div>
<div class='table-responsie'>
    <table class=\"table table-hover\">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Status</th>
                <th>Group</th>
                <th>Join Date</th>
                
                <th>Action</th>
                
            </tr>
        </thead>
        <tbody>
    ";
$usr = Db::result("SELECT * FROM `user` ORDER BY `userid` ASC  ");
if( !isset($usr['error']) ) {
    // print_r($usr);
    foreach($usr as $k => $p) {
        if ($p->group == 0) {
            $grp = "ADMINISTRATOR";
        } elseif ($p->group == 1) {
            $grp = "SUPERVISOR";
        } elseif ($p->group == 2) {
            $grp = "EDITOR";
        } elseif ($p->group == 3) {
            $grp = "AUTHOR";
        } elseif ($p->group == 4) {
            $grp = "CONTRIBUTOR";
        } elseif ($p->group == 5) {
            $grp = "VIP_MEMBER";
        } elseif ($p->group == 6) {
            $grp = "GENERAL_MEMBER";
        }
        if ($p->status == 0) {
            $status = "<a href=\"user.php?act=active&id={$p->id}\" class=\"label label-danger\">Inactive</a>";
        } elseif ($p->status == 1) {
            $status = "<a href=\"user.php?act=inactive&id={$p->id}\" class=\"label label-primary\">Active</a>";
        }

        echo "
        <tr>
            <td>{$p->id}</td>
            <td>{$p->userid}</td>
            <td>{$p->email}</td>
            <td>{$status}</td>
            <td>{$grp}</td>
            <td>".date("d M Y", strtotime($p->join_date))."</td>
            
            <td>
                <a href=\"useredit.php?act=edit&id={$p->id}\" class=\"label label-success\"><i class=\"fa fa-edit\"></i></a>
                <a href=\"user.php?act=del&id=".$p->id."\" class=\"label label-danger\"
                onclick=\"return confirm('Are You sure Want to Delete ?');\"><i class=\"fa fa-trash\"></i></a>
            </td>

        </tr>
        ";
    }

} else {
    echo "<tr><td>No User</td></tr>";
}
echo "
</tbody>
</table>
</div>";
}
include('footer.php');