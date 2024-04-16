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

namespace App\Lib;

class Route
{
    private static $instance;
    private static $_typeGet = [];
    private static $_typePost = [];
    private static $_typePut = [];
    private static $_typePatch = [];
    private static $_typeDelete = [];
    private static $_typeOptions = [];

    public function __construct()
    {
        self::getInstance();
    }

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

    public static function post($key, $param)
    {
        return self::set($key, $param, REQUEST_METHOD_POST);
    }

    public static function put($key, $param)
    {
        return self::set($key, $param, REQUEST_METHOD_PUT);
    }

    public static function patch($key, $param)
    {
        return self::set($key, $param, REQUEST_METHOD_PATCH);
    }

    // May be delete
    public static function options($key, $param)
    {
        return self::set($key, $param, REQUEST_METHOD_OPTIONS);
    }

    public static function dispatch()
    {
        $type = $_SERVER['REQUEST_METHOD'];
        $table = self::$_typeGet;
        switch ($type) {
            case REQUEST_METHOD_POST:
                $table = self::$_typePost;
                break;
            case REQUEST_METHOD_PUT:
                $table = self::$_typePut;
                break;
            case REQUEST_METHOD_PATCH:
                $table = self::$_typePatch;
                break;
            case REQUEST_METHOD_DELETE:
                $table = self::$_typeDelete;
                break;
            case REQUEST_METHOD_OPTIONS:
                $table = self::$_typeOptions;
                break;
            default:
                $table = self::$_typeGet;
                break;
        }

        try {
            // code...
            $uri = $_SERVER['REQUEST_URI'];
            if (strpos('?', $uri) > 0) {
                $uri = explode('?', $uri);
                $uri = $uri[0];
            }
            foreach ($table as $key => $item) {
                if ($key == '' && ($uri == '' || $uri == '/')) {
                    self::exeController();
                } else {
                    self::processUrl($key, $item);
                }
            }
        } catch (\Exception $exc) {
            echo $exc->getMessage();
        }

        header('HTTP/1.0 404 Not Found');
        self::exeController('Frontend\Page@error', ['404']);
    }

    public static function processUrl($key, $item)
    {
        $keyOrigin = $key;
        $key = str_replace("/", "\/", $key);
        // $pattern = '/(\{([a-zA-Z0-9])+\})/';
        // $pattern = '/(\{([a-zA-Z0-9])+\?{1}\})/';
        $pattern = '/(\{([a-zA-Z0-9])+\?*\})/';
        preg_match_all($pattern, $key, $urlParams);
        $replacement = '([-_a-zA-Z0-9]+)';
        $keyParam = preg_replace($pattern, $replacement, $key);

        preg_match('/^\/' . $keyParam . '$/', $_SERVER['REQUEST_URI'], $matches);

        if ($key != '' && is_array($matches) && count($matches) > 0) {
            unset($matches[0]);
            self::exeController($item[0], $matches);
        }
    }

    public static function exeController($controllerKey = 'Frontend\Page@home', $params = [])
    {
        $routerObj = explode('@', $controllerKey);
        $controller = $routerObj[0];
        $action = $routerObj[1];

        // Include controller and run
        include_once(PATH_CONTROLLER . DS . ucwords(str_replace("\\", DS, $controller)) . 'Controller.php');
        $klass = 'App\Controllers\\' . ucwords($controller) . 'Controller';
        $controller = new $klass;
        call_user_func_array([$controller, $action], $params);
        exit();
    }
}
