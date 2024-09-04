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
use App\Lib\Jwt;

class AuthService extends AbstractService
{
    private static $instance;
    private static $passwordAlgos;
    private static $passwordOptions;
    private static $apiTimeExpired;
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
                $guards = require(PATH_CONFIG . DS . 'auth.php');
                self::$passwordAlgos = $guards['password_algos'];
                self::$passwordOptions = $guards['password_options'];
                self::$apiTimeExpired = $guards['api_time_expired'];
                self::$instance = new $obj();
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function passwordHash($password, $algo = null, $options = [])
    {
        if (is_null($algo) || $algo == '') {
            $algo = self::$passwordAlgos;
        }
        if (is_null($options) || $options == '') {
            $options = self::$passwordOptions;
        }
        return password_hash($password, $algo, $options);
    }

    public static function passwordVerify($password, $hash)
    {
        return password_verify($password, $hash);
    }

    public static function jwtRender($payload)
    {
        $currentTime = \time();
        $payload = array_merge([
            'iat' => $currentTime,
            'exp' => $currentTime + self::$apiTimeExpired,
        ], $payload);

        return Jwt::encode($payload);
    }

    public function check($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.frontend');
        }
        if ($this->getSession($guard . '_auth')) {
            return true;
        }
        return false;
    }

    public function auth($user, $guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.frontend');
        }
        return $this->setSession($guard . '_auth', $user);
    }

    public function user($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.frontend');
        }
        $result = $this->getSession($guard . '_auth');
        return is_null($result) ? false : $result;
    }

    public function getGuard($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.frontend');
        }
        if (isset($this->guards[$guard])) {
            return $this->guards[$guard];
        }
        return false;
    }

    public function logout($guard = '')
    {
        if ($guard == '') {
            $guard = Register::get('guard.frontend');
        }
        return $this->destroySession($guard . '_auth');
    }
}
