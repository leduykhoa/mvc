<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ' /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_,'(_.)......|
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
 *  Date: 2024/04/26
 *  Time: 08:58:18
 */

namespace App\Service;

use App\Lib\Register;
use App\Lib\Session;

abstract class AbstractService
{
    const PREFIX_KEY = 'service';

    // ===================================================================================================================================
    public function set($key, $value)
    {
        return Register::set(self::PREFIX_KEY . '_' . $key, $value);
    }

    public function get($key)
    {
        return Register::get(self::PREFIX_KEY . '_' . $key);
    }

    public function destroy($key)
    {
        return Register::destroy(self::PREFIX_KEY . '_' . $key);
    }

    // ===================================================================================================================================
    public function setSession($key, $value)
    {
        return Session::set(self::PREFIX_KEY . '_' . $key, $value);
    }

    public function getSession($key)
    {
        return Session::get(self::PREFIX_KEY . '_' . $key);
    }

    public function destroySession($key)
    {
        return Session::destroy(self::PREFIX_KEY . '_' . $key);
    }
}
