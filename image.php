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
$username = Session::val('username');  
$usergroup = Session::val('group');
if( false === User::access() ) {

} else {
    if(Order::userHasOrder($username) || $usergroup == 0) {
        if(false === Order::isExpired($username) || $usergroup == 0) {
?>
<div class="row">
    <div class="col-md-3">
        <input id="inp" type='file' class="form-control form-control-sm">
    </div>
    <div class="col-md-2">
        <button id="btn" value="Play Button" class="btn btn-primary btn-sm"><i class="fa fa-play"></i> Play Button</button>
    </div>
    <div class="col-md-7">
    <div class="alert alert-info">Upload Gambar, Klik Tombol Play Button. Jika ingin tombol play kelihatan tajam, klik berkali-kali. Setelah selesai, Klik Kanan Gambar, Save As.</div>
    </div>
    <div class="col-md-12">
        <img id="button" src="images/button.png" style="display: none;">
        <canvas id="myCanvas" width="640" height="400" style="padding: 0px; max-width: 100%">
        </canvas>
    
    </div>
</div>



<p id="b64"></p>

<script>
function readFile() {
    if (this.files && this.files[0]) {
        var canvas = document.getElementById("myCanvas");
        var ctx = canvas.getContext("2d");
        var FR= new FileReader();

        FR.addEventListener("load", function(e) {
            // document.getElementById("img").src       = e.target.result;
            // document.getElementById("b64").innerHTML = e.target.result;
            
            var image = new Image();
            image.onload = function() {
                ctx.drawImage(image, 0, 0, 640, 400);
            };
            image.src = e.target.result;

            // var button = new Image();
            // button.onload = function() {
            //     ctx.drawImage(button, 295, 150, 70, 70);
            // };
            // button.src = "button.png"; 
            
            // var img = document.getElementById("img");
            // var button = document.getElementById("button");
            // ctx.drawImage(img, 0, 0, 640, 400);
            // ctx.drawImage(button, 295, 150, 70, 70);
        }); 

        FR.readAsDataURL( this.files[0] );
        
    }
    
}
function drawPlay() {
    var canvas = document.getElementById("myCanvas");
    var ctx = canvas.getContext("2d");
    // var img = document.getElementById("img");
    var button = document.getElementById("button");
    // ctx.drawImage(img, 0, 0, 640, 400);
    ctx.drawImage(button, 285, 155, 70, 70);
}
document.getElementById("inp").addEventListener("change", readFile);
document.getElementById("btn").addEventListener("click", drawPlay);

</script>


<?php
        } else {
            echo "Akun Anda sudah expired.";
        }
    } else {
        echo "<div class='col-12 text-center'><h3>Anda belum berlangganan atau sudah expired. <br /><a href='order.php'>Klik disini</a> Untuk berlangganan.</div>";
    }
}


include('footer.php');