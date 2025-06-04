<?php
include('config.php');
date_default_timezone_set('UTC');

define('GX_PATH', realpath(__DIR__.'/'));
define('GX_LIB', GX_PATH.'/lib/');

require 'autoload.php';

echo Gen::theShortener("https://moviezonline.org/watch-series/tt0350448/season18/real-time-with-bill-maher-season-18.html");