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
 *  Date: 2024/04/03
 *  Time: 11:26:45
 */

namespace App\Lib;

class Session
{
    const FLASH = 'FLASH';
    // Message types and shortcuts
    const INFO    = 'info';
    const SUCCESS = 'success';
    const WARNING = 'warning';
    const ERROR   = 'error';

    private static $instance;

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
                if (!is_dir(PATH_STORAGE_SESSION)) {
                    mkdir(PATH_STORAGE_SESSION, 0777);
                }
                // ===================================================================================================================================
                ini_set('session.gc_maxlifetime', __env('SESSION_MAX_LIFE_TIME', 3600 * 24));
                ini_set('session.save_path', PATH_STORAGE_SESSION);
                session_start();
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function set($key, $value)
    {
        $_SESSION[$key] = $value;
        return true;
    }

    public static function get($key)
    {
        if (isset($_SESSION[$key])) {
            return $_SESSION[$key];
        }
        return NULL;
    }

    public static function destroy($key)
    {
        if (isset($_SESSION[$key])) {
            unset($_SESSION[$key]);
        }
        return true;
    }

    public static function flash($key, $value = null)
    {
        $flash = self::get(self::FLASH);
        // For get flash value 
        if (is_null($value)) {
            if ($flash && isset($flash[$key]) && is_array($flash[$key]) && count($flash[$key])) {
                $result = $flash[$key];
                unset($flash[$key]);
                self::set(self::FLASH, $flash);
                return $result;
            }
            return [];
        }
        // For set flash value 
        if ($flash && isset($flash[$key]) && is_array($flash[$key])) {
            $flashCurrent = $flash[$key];
            if (is_array($value)) {
                $flashCurrent = array_merge($flashCurrent, $value);
            } else {
                $flashCurrent[] = $value;
            }
            $flash[$key] = $flashCurrent;
        } else {
            if (is_array($value)) {
                $flash[$key] = $value;
            } else {
                $flash[$key] = [$value];
            }
        }
        // 
        self::set(self::FLASH, $flash);
        return true;
    }
}
