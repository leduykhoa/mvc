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
 *  Time: 01:39:47
 */

namespace App\Lib;

class Register
{
    private static $instance;
    private static $_register;

    public function __construct()
    {
        try {
            self::getInstance();
        } catch (\Exception $ex) {
            die($ex->getMessage());
        }
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                self::$instance = true;
                self::$_register = [];
                $data = [];
                foreach ($_POST as $key => $value) {
                    $data[$key] = $value;
                }
                foreach ($_GET as $key => $value) {
                    $data[$key] = $value;
                }
                self::set('data_request', $data);
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function set($key, $value)
    {
        self::$_register[$key] = $value;
        return true;
    }

    public static function get($key)
    {
        if (isset(self::$_register[$key])) {
            return self::$_register[$key];
        }
        return NULL;
    }

    public static function destroy($key)
    {
        if (isset(self::$_register[$key])) {
            unset(self::$_register[$key]);
        }
        return NULL;
    }
}
