<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ‘ /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_¸´(_.)......|
 *  ...(((./...........................)__
 *  ..((((.\......),,...........(...../__'\
 *  ..))))..\ . .//...¯¯¯¯¯¯¯' \.../... / /
 *  .(((...../ .// .............. | ./...../
 *  .))).....| ||.................| |...........♥♥♥
 *  ((........) \.................) \...........\|/
 *  .^^^^.""'"'.^^^^^^^..""".^^^^.""""
 *  ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°)
 *  ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦
 *  
 *  Copyright © 2009-2024 Lê Duy Khoa. All rights reserved.
 *  Mail: leduykhoa060690@gmail.com
 *  Skype: leduykhoa060690
 *  Mobile: +84973421508
 *  Website: http://web-fast.com
 *  Telegram: https://t.me/leduykhoa
 *  GitHub: https://github.com/leduykhoa
 *  Date: 2024/02/29
 *  Time: 08:45:46
 */

require_once('./../lib/include.php');

$path = $_SERVER['REQUEST_URI'];
if ($path == '/') {
    $path = '';
// }elseif ($path == '/public') {
//     $path = '';
} elseif (str_ends_with($path, '/index')) {
    $pathArray = explode('/', $path);
    array_shift($pathArray);
    array_pop($pathArray);
    $path = implode('/', $pathArray);
} else {
    $path =  substr($path, 1);
}

$controllers = include_once('web.php');

$controller = 'Pages';
$action = 'error';

if (array_key_exists($path, $controllers)) {
    $router = $controllers[$path];
    $routerObj = explode('@', $router[0]);
    $controller = $routerObj[0];
    $action = $routerObj[1];
}

// print_r([$controller, $action]);

include_once(ucwords($controller) . 'Controller.php');
$klass = ucwords($controller) . 'Controller';
$controller = new $klass;
$controller->$action();
