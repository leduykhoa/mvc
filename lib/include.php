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
 *  Date: 2024/03/05
 *  Time: 08:20:18
 */

use App\Lib\DB;
use App\Lib\Env;
use App\Lib\Language;
use App\Lib\PageViewer;
use App\Lib\Pluralize;
use App\Lib\Register;
use App\Lib\Route;
use App\Lib\Session;
use App\Lib\Utils;

/**
 * Custom functions missing on some old versions
 */
if (!function_exists('str_starts_with')) {
    function str_starts_with($haystack, $needle)
    {
        return (string)$needle !== '' && strncmp($haystack, $needle, strlen($needle)) === 0;
    }
}
if (!function_exists('str_ends_with')) {
    function str_ends_with($haystack, $needle)
    {
        return $needle !== '' ? substr($haystack, -strlen($needle)) === $needle : true;
    }
}
// ===================================================================================================================================
/**
 * Include some functions and class
 */
require_once('Env.php');
require_once('DB.php');
require_once('Utils.php');
require_once('Session.php');
require_once('Register.php');
require_once('PageViewer.php');
require_once('Pluralize.php');
require_once('Language.php');
require_once('Route.php');
// ===================================================================================================================================
/**
 * Define constants
 */
define('DS', DIRECTORY_SEPARATOR);
define('PS', PATH_SEPARATOR);
define('BP', dirname(dirname(__FILE__)));
define('DIR_CONTROLLER', 'c');
define('DIR_MODEL', 'm');
define('DIR_VIEW', 'v');
define('DIR_CONFIG', 'config');
define('DIR_LIBRARY', 'lib');
define('DIR_PUBLIC', 'public');
define('DIR_ROUTE', 'route');
define('DIR_SERVICE', 'service');

define('PATH_CONTROLLER', BP . DS . DIR_CONTROLLER);
define('PATH_MODEL', BP . DS . DIR_MODEL);
define('PATH_VIEW', BP . DS . DIR_VIEW);
define('PATH_CONFIG', BP . DS . DIR_CONFIG);
define('PATH_LIBRARY', BP . DS . DIR_LIBRARY);
define('PATH_PUBLIC', BP . DS . DIR_PUBLIC);
define('PATH_ROUTE', BP . DS . DIR_ROUTE);
define('PATH_SERVICE', BP . DS . DIR_SERVICE);
// ===================================================================================================================================
/**
 * Set include path
 */
$paths = array();
$paths[] = PATH_CONTROLLER;
$paths[] = PATH_MODEL;
$paths[] = PATH_VIEW;
$paths[] = PATH_CONFIG;
$paths[] = PATH_LIBRARY;
$paths[] = PATH_PUBLIC;
$paths[] = PATH_ROUTE;
$paths[] = PATH_SERVICE;

$paths = getIncludeLoop($paths);
$appPath = implode(PS, $paths);
set_include_path($appPath . PS . get_include_path());
Session::getInstance();
Env::getInstance();
Register::getInstance();
Pluralize::getInstance();
Utils::getInstance();
// ===================================================================================================================================
require_once('app.php');
require_once('BaseController.php');
require_once('FrontendController.php');
require_once('AdminController.php');
require_once('ApiController.php');
require_once('BaseModel.php');
require_once('web.php');
require_once('admin.php');
require_once('api.php');
Language::getInstance();
// ===================================================================================================================================
// ===================================================================================================================================
function getIncludeLoop($paths, $list = [])
{
    if (is_array($paths)) {
        foreach ($paths as $dir) {
            if (is_dir($dir) && !in_array($dir, $list)) {
                $list[] = $dir;
            }
            // Check and scan sub folder
            if (is_dir($dir)) {
                $dirs = scandir($dir);
                foreach ($dirs as $dirScan) {
                    // Check is back folder
                    if ($dirScan == '.' || $dirScan == '..') {
                        continue;
                    }
                    $dirPath = $dir . DS . $dirScan;
                    if (is_dir($dirPath)) {
                        // Scan sub folder
                        $list = getIncludeLoop([$dirPath], $list);
                    }
                }
            }
        }
    }
    return $list;
}
// ===================================================================================================================================
function executionToUse()
{
    $unit = ['pico', 'nano', 'micro', 'milli', 'second', 'minute'];
    $startTime = $_SERVER['REQUEST_TIME_FLOAT'];
    $endTime = microtime(true);
    $execution = ($endTime - $startTime);

    $execution = $execution * 1000 * 1000;
    $execution =  @round($execution / pow(1000, ($i = floor(log($execution, 1000)))), 3) . ' ' . $unit[$i];
    return $execution;
}
// ===================================================================================================================================
function memoryToUse()
{
    $unit = ['B', 'Kb', 'MB', 'GB', 'TB', 'PB'];
    $memory = memory_get_usage(true);
    $i = floor(log($memory, 1024));
    $memory =  sprintf('%.0f' . $unit[$i], @round($memory / pow(1024, $i), 2));
    return $memory;
}
// ===================================================================================================================================
function __env($key, $default = NULL)
{
    try {
        $value = Env::__env($key);
        if (isset($value) && $value !== false && $value != '') {
            return Env::__env($key);
        }
        return $default;
    } catch (\Exception $exc) {
        die($exc->getMessage());
    }
}
// ===================================================================================================================================
function __more($file, $params = [])
{
    $file = str_replace('.', DS, $file);
    if (str_ends_with($file, '.php') === false) {
        $file .= '.php';
    }
    $file = PATH_VIEW . DS . PageViewer::get('theme') . DS .  $file;
    extract($params);
    include($file);
}
// ===================================================================================================================================
function plural($key)
{
    return Pluralize::plural($key);
}
// ===================================================================================================================================
function dataRequest($key)
{
    $dataRequest = Register::get('data_request');
    if (isset($dataRequest) && isset($dataRequest[$key])) {
        return $dataRequest[$key];
    }
    return NULL;
}
// ===================================================================================================================================
function view($template, $data)
{
    return PageViewer::render($template, $data);
}
// ===================================================================================================================================
function getMethod()
{
    return $_SERVER['REQUEST_METHOD'];
}
// ===================================================================================================================================
function isGet()
{
    return (getMethod() == REQUEST_METHOD_GET);
}
// ===================================================================================================================================
function isPost()
{
    return (getMethod() == REQUEST_METHOD_POST);
}
// ===================================================================================================================================
function isPut()
{
    return (getMethod() == REQUEST_METHOD_PUT);
}
// ===================================================================================================================================
function isPatch()
{
    return (getMethod() == REQUEST_METHOD_PATCH);
}
// ===================================================================================================================================
function request($key, $default = NULL)
{
    if (isPost()) {
        return (isset($_POST)) ? $_POST[$key] : $default;
    }
    return (isset($_GET)) ? $_GET[$key] : $default;
}
// ===================================================================================================================================
function setCountryCode($key)
{
    $countries = Language::getCountry();
    if ($key != '' && isset($countries[strtoupper($key)])) {
        Register::set('country.code', strtoupper($key));
    } else {
        throw new \ErrorException('Country code \'' . $key . '\' not exist.');
    }
}
// ===================================================================================================================================
function countryCode()
{
    return Register::get('country.code');
}
// ===================================================================================================================================
function setLanguageCode($key)
{
    $languages = Language::getLanguage();
    if ($key != '' && isset($languages[strtolower($key)])) {
        Register::set('language.code', strtolower($key));
    } else {
        throw new \ErrorException('Language code \'' . $key . '\' not exist.');
    }
}
// ===================================================================================================================================
function languageCode()
{
    return Register::get('language.code');
}
// ===================================================================================================================================
function __($key, $languageCode = NULL)
{
    if (is_null($languageCode)) {
        $languageCode = languageCode();
    }
    return Language::translate($key, $languageCode);
}
// ===================================================================================================================================
function __e($key, $languageCode = NULL)
{
    if (is_null($languageCode)) {
        $languageCode = languageCode();
    }
    echo __($key, $languageCode);
}
