<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

if ( $_FILES['file']['error'] > 0 ){
    echo 'Error: ' . $_FILES['file']['error'] . '<br>';
}
else {
    $allowed = array('png', 'jpg', 'jpeg');

    $image = microtime()."-".$_FILES['file']['name'];
    $extension = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
    if (!in_array(strtolower($extension), $allowed)) {
        echo 'Error: jenis file tidak diperbolehkan';
        exit;
    }
    if(move_uploaded_file($_FILES['file']['tmp_name'], '/var/www/html/images/' . $image))
    {
        if($extension == "png") {
            $im = imagecreatefrompng('/var/www/html/images/' . $image);
        } else {
            $im = imagecreatefromjpeg('/var/www/html/images/' . $image);
        }
        $overlay = array(
            // 'images/overlay-rainbow.png',
            'images/overlay-rainbow_1.png',
            'images/overlay-rainbow_2.png',
            'images/overlay-rainbow_3.png',
            // 'images/overlay-rust.png',
            'images/overlay-rust_1.png',
            'images/overlay-rust_2.png',
            'images/overlay-mozaik_1.png',
            'images/overlay-mozaik_2.png',
            'images/overlay-colored_1.png',
            'images/overlay-colored_2.png',
            'images/overlay-colored_3.png',
            'images/overlay-colored_4.png',
        );
        $rn = array_rand($overlay, 1);

        $im2 = imagecreatefrompng($overlay[$rn]);
        imagealphablending($im2, false);
        imagesavealpha($im2, true);
        
        $img = new Imagick(realpath('/var/www/html/images/' . $image));
        $profiles = $img->getImageProfiles("icc", true);

        $img->stripImage();

        if(!empty($profiles))
            $img->profileImage("icc", $profiles['icc']);
            
        if($im && 
            imagecopyresampled($im, $im2, 0, 0, 0, 0, imagesx($im), imagesy($im), imagesx($im2), imagesy($im2)) &&
            // imagefilter($im, IMG_FILTER_COLORIZE, 10, 10, 10) &&
            imagefilter($im, IMG_FILTER_SMOOTH, 30) &&
            // imagefilter($im, IMG_FILTER_BRIGHTNESS, 10) &&
            imagefilter($im, IMG_FILTER_CONTRAST, -20)
            
            // imagecopymerge($im, $im2, 0, 0, 0, 0, imagesx($im2), imagesy($im2), 55)
            
        )
        {
            // echo 'Image converted to grayscale.';

            imagepng($im, '/var/www/html/images/' . $image);
        }
        else
        {
            echo 'Conversion to grayscale failed.';
        }

        imagedestroy($im);
        imagedestroy($im2);

        $bunnyCDNStorage = new BunnyCDNStorage("khix", "eb1e2122-d08a-4d16-98e7738554aa-8f81-4bed", "de");
        $bunnyCDNStorage->uploadFile("/var/www/html/images/".$image, "/khix/images/".$image);
        @unlink("/var/www/html/images/".$image);

        echo "https://srx.khicdn.one/images/".$image;
    }
}