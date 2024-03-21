<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ‘ /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_¸´(_.)......|
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
 *  Website: http://web-fast.com
 *  Telegram: https://t.me/leduykhoa
 *  GitHub: https://github.com/leduykhoa
 *  Date: 2024/03/13
 *  Time: 03:11:11
 */

// get
// post
// put
// patch
// delete
// options
// any

class Route
{
    private static $instance;
    private static $_typeGet = [];
    private static $_typePost = [];
    private static $_typePut = [];
    private static $_typePatch = [];
    private static $_typeDelete = [];
    private static $_typeOptions = [];

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                self::$instance = true;
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function set($key, $value, $type = REQUEST_METHOD_GET)
    {

        switch ($type) {
            case REQUEST_METHOD_POST:
                self::$_typePost[$key] = $value;
                return true;
            case REQUEST_METHOD_PUT:
                self::$_typePut[$key] = $value;
                return true;
            case REQUEST_METHOD_PATCH:
                self::$_typePatch[$key] = $value;
                return true;
            case REQUEST_METHOD_DELETE:
                self::$_typeDelete[$key] = $value;
                return true;
            case REQUEST_METHOD_OPTIONS:
                self::$_typeOptions[$key] = $value;
                return true;
            case REQUEST_METHOD_ANY:
                self::$_typeGet[$key] = $value;
                // self::$_typePost[$key] = $value;
                // self::$_typePut[$key] = $value;
                // self::$_typePatch[$key] = $value;
                // self::$_typeDelete[$key] = $value;
                // self::$_typeOptions[$key] = $value;
                return true;
            default:
                self::$_typeGet[$key] = $value;
                return true;
        }

        return false;
    }

    // public static function get($key, $type = REQUEST_METHOD_GET)
    // {
    //     switch ($type) {
    //         case REQUEST_METHOD_POST:
    //             if (isset(self::$_typePost[$key])) {
    //                 return self::$_typePost[$key];
    //             }
    //             break;
    //         case REQUEST_METHOD_PUT:
    //             if (isset(self::$_typePut[$key])) {
    //                 return self::$_typePut[$key];
    //             }
    //             break;
    //         case REQUEST_METHOD_PATCH:
    //             if (isset(self::$_typePatch[$key])) {
    //                 return self::$_typePatch[$key];
    //             }
    //             break;
    //         case REQUEST_METHOD_DELETE:
    //             if (isset(self::$_typeDelete[$key])) {
    //                 return self::$_typeDelete[$key];
    //             }
    //             break;
    //         case REQUEST_METHOD_OPTIONS:
    //             if (isset(self::$_typeOptions[$key])) {
    //                 return self::$_typeOptions[$key];
    //             }
    //             break;
    //         default:
    //             if (isset(self::$_typeGet[$key])) {
    //                 return self::$_typeGet[$key];
    //             }
    //             break;
    //     }
    //     return NULL;
    // }

    public static function get($key, $param)
    {
        return self::set($key, $param, REQUEST_METHOD_GET);
    }

    public static function dispatch()
    {
        $type = $_SERVER['REQUEST_METHOD'];
        $collection = self::$_typeGet;
        switch ($type) {
            case REQUEST_METHOD_POST:
                $collection = self::$_typePost;
                break;
            case REQUEST_METHOD_PUT:
                $collection = self::$_typePut;
                break;
            case REQUEST_METHOD_PATCH:
                $collection = self::$_typePatch;
                break;
            case REQUEST_METHOD_DELETE:
                $collection = self::$_typeDelete;
                break;
            case REQUEST_METHOD_OPTIONS:
                $collection = self::$_typeOptions;
                break;
            default:
                $collection = self::$_typeGet;
                break;
        }
        try {
            // code...
            foreach ($collection as $key => $item) {
                if ($key == '' && ($_SERVER['REQUEST_URI'] == '' || $_SERVER['REQUEST_URI'] == '/')) {
                    $controller = 'Pages';
                    $action = 'home';

                    include_once(ucwords($controller) . 'Controller.php');
                    $klass = ucwords($controller) . 'Controller';
                    $controller = new $klass;
                    $controller->$action();
                    return;
                } else {
                    // $pattern = '/(\{([a-zA-Z0-9])+\})/';
                    // $replacement = '([-_a-zA-Z0-9]+)';
                    preg_match('/^\/' . $key . '$/', $_SERVER['REQUEST_URI'], $matches);
                    if ($key != '' && is_array($matches) && count($matches)) {
                        $routerObj = explode('@', $item[0]);
                        $controller = $routerObj[0];
                        $action = $routerObj[1];

                        include_once(ucwords($controller) . 'Controller.php');
                        $klass = ucwords($controller) . 'Controller';
                        $controller = new $klass;
                        $controller->$action();
                        return;
                    }
                }
            }
        } catch (\Exception $exc) {
            echo $exc->getMessage();
        }
        header('HTTP/1.0 404 Not Found');
        include_once('PagesController.php');
        $klass = 'PagesController';
        $controller = new $klass;
        $controller->error(404);
        exit();
    }
}
