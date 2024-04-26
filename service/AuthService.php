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
 *  Time: 09:54:42
 */

namespace App\Service;

use App\Lib\Register;

class AuthService extends AbstractService
{
    private static $instance;

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                $obj = self::class;
                self::$instance = new $obj();
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public function check($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        if (self::getSession($guard . '_auth')) {
            return true;
        }
        return false;
    }

    public function auth($user, $guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        return self::setSession($guard . '_auth', $user);
    }

    public function user($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        $result = self::getSession($guard . '_auth');
        if (is_null($result)) {
            return false;
        }
        return $result;
    }
}
