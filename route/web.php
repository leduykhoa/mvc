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
 *  Date: 2024/03/12
 *  Time: 10:59:15
 */

// return [
//     '' => ['Pages@home', 'home'],
//     'posts' => ['Posts@index'],
// ];
use App\Lib\Route;

Route::get('', ['Frontend\Pages@home', 'home']);
Route::get('contact', ['Frontend\Contact@index', 'contact.index']);
Route::post('contact', ['Frontend\Contact@index', 'contact.store']);
Route::get('about', ['Frontend\About@index', 'about.index']);

Route::get('register', ['Frontend\User@register', 'user.register']);
Route::post('register-post', ['Frontend\User@registerPost', 'user.register.post']);
Route::get('login', ['Frontend\User@login', 'user.login']);
Route::post('login-post', ['Frontend\User@loginPost', 'user.login.post']);

Route::get('posts', ['Frontend\Posts@index', 'post.index']);
Route::get('posts/detail/{id?}', ['Frontend\Posts@detail', 'post.detail']);
// Route::get('posts/detail/{id?}/{abc?}', ['Posts@detail', 'post.detail']);
