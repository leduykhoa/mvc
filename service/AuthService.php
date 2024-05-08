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
    private $guards;

    public function __construct()
    {
        $guards = require(PATH_CONFIG . DS . 'auth.php');
        $this->guards = $guards['guard'];
    }

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
        if ($this->getSession($guard . '_auth')) {
            return true;
        }
        return false;
    }

    public function auth($user, $guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        return $this->setSession($guard . '_auth', $user);
    }

    public function user($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        $result = $this->getSession($guard . '_auth');
        return is_null($result) ? false : $result;
    }

    public function getGuard($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        if (isset($this->guards[$guard])) {
            return $this->guards[$guard];
        }
        return false;
    }

    public function logout($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.default');
        }
        return $this->destroySession($guard . '_auth');
    }
}
