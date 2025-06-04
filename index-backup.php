<?php

$parse = parse_url($_SERVER['SERVER_NAME']);
if($_SERVER['SERVER_NAME'] == "khi.ptg.pw") {
    header("Location: https://genx.click");
    exit;
}
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';
Session::start();
include('countrycodes.php');
include('header.php');

new Db();

User::secure();
if( false === User::access() ) {
    echo "<div class='alert alert-danger'><i class='fa fa-warning'></i> Anda tidak punya akses</div>";
} else {  
    $username = Session::val('username');  
    $usergroup = Session::val('group');
    echo "
    <div class='row  justify-content-center' id='genform'>
    ";
    if( isset($_GET['date'])) {
        if( $_GET['date'] == 'today') {
            $date = date('Y-m-d');
        } elseif( $_GET['date'] == 'yesterday' ) {
            $date = date('Y-m-d', strtotime("yesterday"));
        }
    } else {
        $date = date('Y-m-d');
    }
    if(Order::userHasOrder($username) || $usergroup == 0 ) {
        if(false === Order::isExpired($username) || $usergroup == 0) {
            $where = array(
                'account' => $username
            );
            $domains = Pdns::listDomain($where);
            $fwd_url = User::forward_url($username);
            $user_fwd_url = json_decode($fwd_url, true);
            $fwd_web = User::forward_web($username);
            $user_fwd_web = json_decode($fwd_web, true);
            $fwd_wap = User::forward_wap($username);
            $user_fwd_wap = json_decode($fwd_wap, true);
            $redirectUrlBlock = ($user_fwd_url != "" && strpos($fwd_url, 'http')) ? "": "";
            $countryOpt = countryOption();
            // print_r($domains);
            if(!isset($domains['error'])) {
                echo "
                
                <div class='col col-md-6 align-self-center'>
                <div class='alert alert-warning'>
                Akun anda akan berakhir pada : ".Order::expired($username)."<br>
                Semua Link yang sudah tidak berlangganan otomatis akan mati. Hal ini demi kenyamanan pengguna yang masih berlangganan. Agar server tetap terjaga kestabilan dan kecepatannya. 
                </div>
                <div class='alert alert-info'>
                Jika dimasukkan API Key Branch.io maka alurnya menjadi : <strong>Shortener</strong> -> <strong>Branch.io</strong> -> <strong>Domain Generator</strong> -> <strong>Link Offer/Redirect</strong>
                </div>
                <div class='card card-default'>
                    <div class='card-body'>
                    <input type='hidden' value='{$username}' id='username'>
                    <input type='hidden' value='' id='team'>
                        <div class='form-group'>
                            <label>Domain</label>
                            <select name='domain' id='domain' class='form-control form-control-sm'>
                            <option value='random'>Random</option>";
                    foreach( $domains as $k => $v) {
                        echo "<option  value='".$v->name."' >".$v->name."</option>";
                    }
                    echo "</select>
                        </div>
                        <div style='{$redirectUrlBlock}'>
                            <ul class='nav nav-tabs mb-3' id='pills-tab' role='tablist'>
                                <li class='nav-item' role='presentation'>
                                    <a class='nav-link active' id='pills-home-tab' data-toggle='pill' href='#pills-home' role='tab' aria-controls='pills-home' aria-selected='true'>Redirect To</a>
                                </li>
                                <li class='nav-item' role='presentation'>
                                    <a class='nav-link' id='pills-web-tab' data-toggle='pill' href='#pills-web' role='tab' aria-controls='pills-web' aria-selected='false'><i class='fa fa-laptop'></i></a>
                                </li>
                                <li class='nav-item' role='presentation'>
                                    <a class='nav-link' id='pills-wap-tab' data-toggle='pill' href='#pills-wap' role='tab' aria-controls='pills-wap' aria-selected='false'><i class='fa fa-mobile-alt'></i></a>
                                </li>
                            </ul>
                            <div class='tab-content' id='pills-tabContent'>
                                <div class='tab-pane fade show active' id='pills-home' role='tabpanel' aria-labelledby='pills-home-tab'>
                                    <div id='forwardUrlLink_0' class='forward_url_link'>";
                                    $n = 0;
                                    foreach($user_fwd_url as $k => $v) {
                                        foreach($v as $l => $x){
                                            // echo $x;
                                            $switch = ($n == 0) ? 'cloneForwardUrl': 'removeForwardUrl';
                                            $plus = ($n == 0) ? 'plus': 'minus';
                                            echo "
                                        <div class='form-group' style=''>
                                            <div class='input-group'>
                                                <div class=\"input-group-prepend\">
                                                    <select name='forward_url_country[]' id='forward_url_country_{$n}' class='form-control-sm forward_url_country'>
                                                        <option value='{$k}'>{$k}</option>
                                                        <option value='ALL'>All</option>
                                                        ".$countryOpt."
                                                    </select>
                                                </div>
                                                <input type='text' name='forward_url[]' id='forward_url_{$n}'  class='form-control form-control-sm forward_url' value='{$x}'>
                                                <div class='input-group-append'>
                                                    <button class='btn btn-outline-secondary btn-sm' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                                                </div>
                                            </div>
                                        </div>";
                                        $n++;
                                        }
                            
                                    }
                                    
                                    echo "
                                    </div>
                                </div>
                                <div class='tab-pane fade' id='pills-web' role='tabpanel' aria-labelledby='pills-web-tab'>
                                    <div id='forwardWebLink_0' class='forward_web_link'>
                                    ";
                                    $n = 0;
                                    foreach($user_fwd_web as $k => $v) {
                                        foreach($v as $l => $x){
                                            // echo $x;
                                            $switch = ($n == 0) ? 'cloneForwardWeb': 'removeForwardWeb';
                                            $plus = ($n == 0) ? 'plus': 'minus';
                                            echo "
                                        <div class='form-group' style=''>
                                            <div class='input-group'>
                                                <div class=\"input-group-prepend\">
                                                    <select name='forward_web_country[]' id='forward_web_country_{$n}' class='form-control-sm forward_web_country'>
                                                        <option value='{$k}'>{$k}</option>
                                                        <option value='ALL'>All</option>
                                                        ".$countryOpt."
                                                    </select>
                                                </div>
                                                <input type='text' name='forward_web[]' id='forward_web_{$n}'  class='form-control form-control-sm forward_web' value='{$x}'>
                                                <div class='input-group-append'>
                                                    <button class='btn btn-outline-secondary btn-sm' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                                                </div>
                                            </div>
                                        </div>";
                                        $n++;
                                        }
                            
                                    }
                                    
                                    echo "
                                    </div>
                                </div>
                                <div class='tab-pane fade' id='pills-wap' role='tabpanel' aria-labelledby='pills-wap-tab'>
                                    <div id='forwardWapLink_0' class='forward_wap_link'>
                                    ";
                                    $n = 0;
                                    foreach($user_fwd_wap as $k => $v) {
                                        foreach($v as $l => $x){
                                            // echo $x;
                                            $switch = ($n == 0) ? 'cloneForwardWap': 'removeForwardWap';
                                            $plus = ($n == 0) ? 'plus': 'minus';
                                            echo "
                                        <div class='form-group' style=''>
                                            <div class='input-group'>
                                                <div class=\"input-group-prepend\">
                                                    <select name='forward_wap_country[]' id='forward_wap_country_{$n}' class='form-control-sm forward_wap_country'>
                                                        <option value='{$k}'>{$k}</option>
                                                        <option value='ALL'>All</option>
                                                        ".$countryOpt."
                                                    </select>
                                                </div>
                                                <input type='text' name='forward_wap[]' id='forward_wap_{$n}'  class='form-control form-control-sm forward_wap' value='{$x}'>
                                                <div class='input-group-append'>
                                                    <button class='btn btn-outline-secondary btn-sm' type='button' id='{$switch}'><i class='fa fa-{$plus}'></i></button>
                                                </div>
                                            </div>
                                        </div>";
                                        $n++;
                                        }
                            
                                    }
                                    
                                    echo "
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class='form-group'>
                            <input type='checkbox' name='use_landing' id='use_landing'> <label>Pakai Landing Page</label>
                        </div>
                        <div class='row'>
                            <div class='col-12 col-md-6'>
                                <div class='form-group'>
                                    <label>Allowed Country</label>
                                    <input type='text' name='country' id='country' class='form-control form-control-sm' placeholder='ID, TH, US'>
                                </div>
                            </div>
                            <div class='col-12 col-md-6'>
                                <div class='form-group'>
                                    <label>Blocked Country</label>
                                    <input type='text' name='country_block' id='country_block' class='form-control form-control-sm' placeholder='ID, TH, US'>
                                </div>
                            </div>
                        </div>
                        <div class='form-group'>
                            <label>Branch.IO Key</label>
                            <div class=\"input-group\">
                                <input type='text' name='branch_key' id='branch_key' class='form-control form-control-sm'>
                                <div class=\"input-group-btn\">
                                    <select name='branch_domain' id='branch_domain' class='form-control form-control-sm' style='width: 120px'>
                                        <option value='app.link' selected>app.link</option>
                                        <option value='bnc.lt'>bnc.lt</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>

                        <div class='form-group'>
                            <label>Bit.ly Key</label>
                            <div class=\"input-group\">
                                <div class=\"input-group-prepend\">
                                    <span class='input-group-text'><i class='fa fa-key'></i></span>
                                </div>
                                <input type='text' name='bitly_key' id='bitly_key' class='form-control form-control-sm'>
                                <div class=\"input-group-append\">
                                    <select id='bitly_domain'>
                                        <option value='bit.ly'>bit.ly</option>
                                        <option value='j.mp'>j.mp</option>
                                        <option value='go.shr.lc'>go.shr.lc</option>
                                        <option value='tinyurl.com'>tinyurl.com</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>

                        <div class='form-group'>
                            <input type='radio' name='alter' id='alter' value='ths'> The Shortener
                            <input type='radio' name='alter' id='alter' value='vht' checked> v.ht
                            <input type='radio' name='alter' id='alter' value='bitlyws'> Bitly.WS
                            <input type='radio' name='alter' id='alter' value='vnurl'> VNURL
                            <!--<input type='radio' name='alter' id='alter' value='rutgon'> RUTGON
                            <input type='radio' name='alter' id='alter' value='ssur'> SSUR-->
                            <input type='radio' name='alter' id='alter' value='sinh'> SINH
                            <input type='radio' name='alter' id='alter' value='shorturlvn'> Shorturl.VN
                            <input type='radio' name='alter' id='alter' value='gggg'> GG.GG
                            <input type='radio' name='alter' id='alter' value='lmyde'> lmy.de
                            <input type='radio' name='alter' id='alter' value='aplc'> ap.lc
                            <input type='radio' name='alter' id='alter' value='exxus'> exx.us
                            <input type='radio' name='alter' id='alter' value='o2pm'> 02.pm
                            <input type='radio' name='alter' id='alter' value='miipm'> mii.pm
                            <input type='radio' name='alter' id='alter' value='na5nl'> na5.nl
                            <input type='radio' name='alter' id='alter' value='tcppw'> tcp.pw
                            <input type='radio' name='alter' id='alter' value='unopm'> uno.pm
                            <!--<input type='radio' name='alter' id='alter' value='bomto'> Bom.To-->
                        </div>
                        
                        <div class='form-group'>
                            <label>Total Link</label>
                            <input type=\"number\" id=\"amount\" class=\"form-control\" min=\"1\" max=\"100\" value=\"1\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">
                        </div>
                        <!-- Nav tabs -->
                        <ul class='nav nav-tabs' role='tablist'>
                            <li class='nav-item' role='presentation' class='active'><a href='#home'  class='nav-link active' aria-controls='home' role='tab' data-toggle='tab'>Basic</a></li>
                            <li class='nav-item' role='presentation'><a href='#fakeurl' class='nav-link' aria-controls='fakeurl' role='tab' data-toggle='tab'>Fake Url</a></li>
                            <li class='nav-item' role='presentation'><a href='#content' class='nav-link' aria-controls='content' role='tab' data-toggle='tab'>Content</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class='tab-content'>
                            <div role='tabpanel' class='tab-pane active' id='home'>
                            <br />
                                <!--<div class='form-group'>
                                    <label>Translate</label>
                                    <select name='lang' id='lang' class='form-control form-control-sm'>
                                    <option></option>
                                    <option value=\"nl\">Belanda</option>
                                    <option value=\"fr\">Perancis</option>
                                    <option value=\"de\">Jerman</option>
                                    <option value=\"es\">Spanyol</option>
                                    <option value=\"it\">Italia</option>
                                    </select>
                                </div>-->
                                
                                <div class='form-group'>
                                    <button class=\"btn btn-primary btn-sm\" type=\"button\" id=\"createGen1\"><i class='fa fa-cogs'></i> Generate Link</button>
                                </div>
                                <div id='result1'>
                                </div>
                            </div>
                            <div role='tabpanel' class='tab-pane' id='fakeurl'>
                            <br />
                                <div class='alert alert-info'>
                                    <i class='fa fa-warning'></i> Facebook, Twitter and Google will read this link.
                                </div>
                                <div class='form-group'>
                                    <label>Fake Url (Other Website Link)</label>
                                    <input type='text' name='fake_url' id='fake_url' class='form-control form-control-sm'>
                                </div>
                                <div class='form-group'>
                                    <button id='createGen2' class='btn btn-primary btn-sm'><i class='fa fa-cogs'></i> Generate Link</button>
                                </div>
                                <div id='result2'>
                                </div>
                            </div>
                            <div role='tabpanel' class='tab-pane' id='content'>
                            <br />
                                <div class='alert alert-info'>
                                    <i class='fa fa-warning'></i> Facebook, Twitter and Google will read this content.
                                </div>
                                <div class='form-group'>
                                <label>As App</label>
                                    <select id='app_id' class='form-control form-control-sm'>
                                        <option value='87741124305'>Youtube</option>
                                        <option value='19884028963'>Vimeo</option>
                                        <option value='274266067164'>Pinterest</option>
                                    </select>
                                </div>
                                <div class='form-group'>
                                <label>Title</label>
                                    <input type='text' name='title' id='custom_title' class='form-control form-control-sm'>
                                </div>
                                <div class='form-group'>
                                <label>Description</label>
                                    <textarea name='description' id='custom_description' class='form-control form-control-sm'></textarea>
                                </div>
                                <div class='form-group'>
                                <label>Keywords</label>
                                    <input type='text' name='keywords' id='custom_keywords' class='form-control form-control-sm'>
                                </div>
                                <div class='row'>
                                    <div class='col-md-12'>
                                    <img src='https://via.placeholder.com/468x280' id='thumbnail' class='img-thumbnail' style='width: 100%; height: 280px'>
                                    </div>
                                    <div class='col-md-12'>
                                        <div class='form-group'>
                                        <label>Image</label>
                                            <input type='hidden' name='image' id='custom_image' class='form-control form-control-sm' value=''>
                                            <input type='file' id='custom_image_file' class='form-control form-control-sm'>
                                        </div>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <button id='createGen3' class='btn btn-primary btn-sm'><i class='fa fa-cogs'></i> Generate Link</button>
                                </div>
                                <div id='result3'>
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
                
                </div>
        
                
                ";
            } else {
                echo $domains['error'];
            }
        } else {
            echo "Akun Anda sudah expired.";
        }
    } else {
        echo "<div class='col-12 text-center'><h3>{$username}, Anda belum berlangganan atau sudah expired. <br /><a href='order.php'>Klik disini</a> Untuk berlangganan.</div>";
    }
    

    // echo "
    //     <div class='alert alert-info'>
    //     This service is provided for free, we guarantee of nothing. We are not responsible for any kinds of url that are used
    //     with our service. We can <strong>shutdown</strong> this service anytime without prior notice. 
    //     </div>
        
    // ";
    echo "</div> <!-- END ROW -->";

}
include('footer.php');