<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ' /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_.'(_.)......|
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
 *  Website: https://web-fast.com
 *  Telegram: https://t.me/leduykhoa
 *  GitHub: https://github.com/leduykhoa
 *  Date: 2024/03/05
 *  Time: 08:08:08
 */

//  ===================================================================================================================================
if (__env('APP_DEBUG', true) === true) {
    error_reporting(E_ALL);
    ini_set('display_errors', 'On');
}
// ===================================================================================================================================
Register::set('app.url.base',  __env('APP_URL_BASE', 'https://web-fast.com'));
Register::set('app.name',  __env('APP_NAME', 'PHP MVC Skeleton'));
Register::set('app.env',  __env('APP_ENV', 'local'));
Register::set('app.debug',  __env('APP_DEBUG', true));
Register::set('app.url',  __env('APP_URL', 'https://web-fast.com'));
Register::set('app.asset',  __env('APP_ASSET', 'https://web-fast.com'));
Register::set('language.code', 'vi');
// ===================================================================================================================================
PageViewer::set('theme', _DEFAULT);
PageViewer::set('layout', 'layouts' . DS . 'default');
PageViewer::set('page.title', __env('APP_NAME', 'PHP MVC Skeleton'));
PageViewer::set('page.title.separate', ' | ');
PageViewer::set('page.title.suffix', __env('APP_NAME', 'PHP MVC Skeleton'));
// ===================================================================================================================================

// Register::set('language.code', 'vi');

// // Env::getInstance();
// // DB::getInstance();
// Register::getInstance();
// // Utils::getInstance();
// // Route::getInstance();
// PageViewer::getInstance();