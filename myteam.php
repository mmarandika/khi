<?php
include('config.php');

date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
// Session::start();

include('countrycodes.php');


new Db();
$data = [];
User::secure();
$username = Session::val('username');

if( isset($_POST['addTeam']) ) {
    $team = Typo::cleanX($_POST['team']);
    if(false !== Team::isExist($team)) {
        $alertDanger[] = "Nama team sudah digunakan, silahkan gunakan nama team lain.";
    }
    if(!isset($alertDanger)) {
        $click_id = Typo::cleanX($_POST['click_id']);
        $s1 = Typo::cleanX($_POST['s1']);
        $s2 = Typo::cleanX($_POST['s2']);
        $s3 = Typo::cleanX($_POST['s3']);
        $s4 = Typo::cleanX($_POST['s4']);
        $s5 = Typo::cleanX($_POST['s5']);
        $link_offer = Typo::cleanX($_POST['link_offer']);
        $arr = array(
            'owner' => $username,
            'team' => $team,
            'click_id' => $click_id,
            's1' => $s1,
            's2' => $s2,
            's3' => $s3,
            's4' => $s4,
            's5' => $s5,
            'link_offer' => $link_offer
        );
        Team::add($arr);
        header("Location: myteam.php");
        exit;
    } else {
        $data['alertDanger'] = $alertDanger; 
    }
    
}

if( isset($_GET['del']) && $_GET['del'] != "" ) {
    Db::delete(array(
        'table' => 'teams',
        'where' => array(
            'id' => Typo::int($_GET['del'])
        )
    ));
    header("Location: myteam.php");
    exit;
}

if( isset($_POST['updateTeam']) ) {
    $id = Typo::int($_POST['id']);
    $team = Typo::cleanX($_POST['team']);
    $click_id = Typo::cleanX($_POST['click_id']);
    $s1 = Typo::cleanX($_POST['s1']);
    $s2 = Typo::cleanX($_POST['s2']);
    $s3 = Typo::cleanX($_POST['s3']);
    $s4 = Typo::cleanX($_POST['s4']);
    $s5 = Typo::cleanX($_POST['s5']);
    $link_offer = Typo::cleanX($_POST['link_offer']);
    Db::update(array(
        'table' => 'teams',
        'where' => array(
            'id' => $id
        ), 
        'key' => array(
            'team' => $team,
            'click_id' => $click_id,
            's1' => $s1,
            's2' => $s2,
            's3' => $s3,
            's4' => $s4,
            's5' => $s5,
            'link_offer' => $link_offer,
        )
    ));
}
include('header.php');

if( false === User::access() ) {

} else {

    echo System::alert($data);
    
    echo "<div class='row'><div class='col-12'><h2>My Teams
    <button type=\"button\" class=\"btn btn-primary float-right\" data-toggle=\"modal\" data-target=\"#exampleModal\">
    Add Team
    </button>
    </h2>
    <hr />
    </div></div>
    <!-- Modal -->
    <form action='' method='post'>
    <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
    <div class=\"modal-dialog\">
        <div class=\"modal-content\">
        <div class=\"modal-header\">
            <h5 class=\"modal-title\" id=\"exampleModalLabel\">Add Team</h5>
            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
            <span aria-hidden=\"true\">&times;</span>
            </button>
        </div>
        <div class=\"modal-body\">
            <div class='form-group'>
                <div class='input-group'>
                    <div class='input-group-prepend'>
                        <span class='input-group-text'><i class='fa fa-user'></i></span>
                    </div>
                <input type='type' name='team' class='form-control' value=''>
                </div>
            </div>
            <div class='form-group'>
                <div class='input-group'>
                    <div class='input-group-prepend'>
                        <span class='input-group-text'>click_id</span>
                    </div>
                <input type='type' name='click_id' class='form-control' value=''>
                </div>
            </div>
            <div class='row'>
                <div class='col-12 col-md-6'>
                    <div class='form-group'>
                        <div class='input-group'>
                            <div class='input-group-prepend'>
                                <span class='input-group-text'>s1</span>
                            </div>
                        <input type='type' name='s1' class='form-control' value=''>
                        </div>
                    </div>
                </div>
                <div class='col-12 col-md-6'>
                    <div class='form-group'>
                        <div class='input-group'>
                            <div class='input-group-prepend'>
                                <span class='input-group-text'>s2</span>
                            </div>
                        <input type='type' name='s2' class='form-control' value=''>
                        </div>
                    </div>
                </div>
                <div class='col-12 col-md-6'>
                    <div class='form-group'>
                        <div class='input-group'>
                            <div class='input-group-prepend'>
                                <span class='input-group-text'>s3</span>
                            </div>
                        <input type='type' name='s3' class='form-control' value=''>
                        </div>
                    </div>
                </div>
                <div class='col-12 col-md-6'>
                    <div class='form-group'>
                        <div class='input-group'>
                            <div class='input-group-prepend'>
                                <span class='input-group-text'>s4</span>
                            </div>
                        <input type='type' name='s4' class='form-control' value=''>
                        </div>
                    </div>
                </div>
                <div class='col-12 col-md-6'>
                    <div class='form-group'>
                        <div class='input-group'>
                            <div class='input-group-prepend'>
                                <span class='input-group-text'>s5</span>
                            </div>
                        <input type='type' name='s5' class='form-control' value=''>
                        </div>
                    </div>
                </div>
            </div>
            <div class='form-group'>
                <div class='input-group'>
                    <div class='input-group-prepend'>
                        <span class='input-group-text'><i class='fa fa-link'></i></span>
                    </div>
                <input type='text' name='link_offer' class='form-control' value=''>
                </div>
            </div>
        </div>
        <div class=\"modal-footer\">
            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>
            <button type=\"submit\" class=\"btn btn-primary\" name='addTeam'>Add Team</button>
        </div>
        </div>
    </div>
    </div>
    </form>
    ";
    if ( (! empty($_SERVER['REQUEST_SCHEME']) && $_SERVER['REQUEST_SCHEME'] == 'https') ||
     (! empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ||
     (! empty($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443') ) {
        $protocol = 'https';
    } else {
        $protocol = 'http';
    }
    
    $domains = Team::list($username);
    // print_r($domains);
    if(!isset($domains['error'])) {
        echo "
        
        <div class='table-responsive'>
        <table id='myLinks' class='table'>
        <thead>
            <th>Name</th>
            <th>Click ID</th>
            <th>S1</th>
            <th>S2</th>
            <th>S3</th>
            <th>S4</th>
            <th>S5</th>
            <th>Link Offer</th>
            <th>Link Gen</th>
            <th>Action</th>
        </thead>
            ";
        foreach( $domains as $k => $v) {
            echo "
                <tr>
                    <td>{$v->team}</td>
                    <td>{$v->click_id}</td>
                    <td>{$v->s1}</td>
                    <td>{$v->s2}</td>
                    <td>{$v->s3}</td>
                    <td>{$v->s4}</td>
                    <td>{$v->s5}</td>
                    <td>{$v->link_offer}</td>
                    <td><a href='{$siteurl}t/{$v->team}' target='_blank'>{$siteurl}t/{$v->team}</a></td>
                    <td>
                        <button type='button' class='btn btn-primary btn-sm'  data-toggle='modal' data-target='#edit{$v->team}'>Edit</button>
                        <a href='?del={$v->id}'>remove</a>

                        <!-- Modal -->
                        <form action='' method='post'>
                        <div class='modal fade' id='edit{$v->team}' tabindex='-1' aria-labelledby='edit{$v->team}Label' aria-hidden='true'>
                            <div class='modal-dialog'>
                                <div class='modal-content'>
                                <div class='modal-header'>
                                    <h5 class='modal-title' id='edit{$v->team}Label'>Edit Team Member</h5>
                                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                    <span aria-hidden='true'>&times;</span>
                                    </button>
                                </div>
                                <div class='modal-body'>
                                    <div class='form-group'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <span class='input-group-text'><i class='fa fa-user'></i></span>
                                            </div>
                                        <input type='type' name='team' class='form-control' value='{$v->team}'>
                                        </div>
                                    </div>
                                    <div class='form-group'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <span class='input-group-text'>click_id</span>
                                            </div>
                                        <input type='type' name='click_id' class='form-control' value='{$v->click_id}'>
                                        </div>
                                    </div>
                                    <div class='row'>
                                        <div class='col-12 col-md-6'>
                                            <div class='form-group'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <span class='input-group-text'>s1</span>
                                                    </div>
                                                <input type='type' name='s1' class='form-control' value='{$v->s1}'>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-12 col-md-6'>
                                            <div class='form-group'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <span class='input-group-text'>s2</span>
                                                    </div>
                                                <input type='type' name='s2' class='form-control' value='{$v->s2}'>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-12 col-md-6'>
                                            <div class='form-group'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <span class='input-group-text'>s3</span>
                                                    </div>
                                                <input type='type' name='s3' class='form-control' value='{$v->s3}'>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-12 col-md-6'>
                                            <div class='form-group'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <span class='input-group-text'>s4</span>
                                                    </div>
                                                <input type='type' name='s4' class='form-control' value='{$v->s4}'>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-12 col-md-6'>
                                            <div class='form-group'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <span class='input-group-text'>s5</span>
                                                    </div>
                                                <input type='type' name='s5' class='form-control' value='{$v->s5}'>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class='form-group'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <span class='input-group-text'><i class='fa fa-link'></i></span>
                                            </div>
                                        <input type='text' name='link_offer' class='form-control' value='{$v->link_offer}'>
                                        </div>
                                    </div>
                                </div>
                                <div class='modal-footer'>
                                    <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
                                    <button type='submit' name='updateTeam' class='btn btn-primary'>Save changes</button>
                                </div>
                                </div>
                            </div>
                        </div>
                        <input type='hidden' name='id' value='{$v->id}'>
                        </form>
                    </td>
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