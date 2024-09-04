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
 *  Date: 2024/04/06
 *  Time: 15:42:28
 */

use App\Lib\Route;
use App\Lib\Utils;

$backendPrefix = Utils::backendPrefix();

Route::get($backendPrefix . '/dashboard', ['Backend\Dashboard@index', 'backend.dashboard']);

Route::get($backendPrefix . '/user', ['Backend\User@user', 'backend.user.user']);
Route::get($backendPrefix . '/login', ['Backend\User@login', 'backend.user.login']);
Route::post($backendPrefix . '/login-post', ['Backend\User@loginPost', 'backend.user.login-post']);
Route::post($backendPrefix . '/user/logout', ['Backend\User@logout', 'backend.user.logout']);

Route::get($backendPrefix . '/setting', ['Backend\Setting@index', 'backend.setting.index']);
Route::get($backendPrefix . '/setting/create', ['Backend\Setting@create', 'backend.setting.create']);
Route::post($backendPrefix . '/setting/store', ['Backend\Setting@store', 'backend.setting.store']);
Route::get($backendPrefix . '/setting/edit/{id?}', ['Backend\Setting@edit', 'backend.setting.edit']);
Route::get($backendPrefix . '/setting/update/{id?}', ['Backend\Setting@update', 'backend.setting.update']);
