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
 *  Time: 11:29:59
 */

namespace App\Lib;

class Env
{
    private static $instance;

    public function __construct()
    {
        self::getInstance();
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                self::$instance = [];
                self::readEnv();
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function readEnv()
    {
        $env = file_get_contents(BP . DS . '.env');
        $lines = explode("\n", $env);
        foreach ($lines as $line) {
            $line = trim($line);
            if ((str_starts_with($line, '#') === false)) {
                preg_match("/([^#]+)\=(.*)/", $line, $matches);
                if (isset($matches[2]) && trim($matches[2]) != '') {
                    $key = trim($matches[1]);
                    $value = trim($matches[2]);
                    if ($value == 'true') {
                        $value = true;
                    } elseif ($value == 'false') {
                        $value = false;
                    }
                    self::$instance[$key] = $value;
                }
            }
        }
    }

    public static function __env($key)
    {
        if (isset(self::$instance[$key])) {
            return self::$instance[$key];
        }
        return NULL;
    }
}
