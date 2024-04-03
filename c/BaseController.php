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
 *  Date: 2024/02/29
 *  Time: 10:37:32
 */

class BaseController
{
    protected $validateList;
    public function __construct()
    {
        $this->validateList = require_once(PATH_CONFIG . DS . 'validation.php');
    }

    public function render($file, $data = [], $type = HTML)
    {
        if ($type == HTML) {
            $viewFile = PATH_VIEW . DS  . PageViewer::get('theme') . DS . $file;
            $layout = PATH_VIEW . DS  . PageViewer::get('theme') . DS . PageViewer::get('layout');

            $content = PageViewer::render($viewFile, $data);
            // header('Content-Type: text/html; charset=utf-8');
            echo PageViewer::render($layout, ['content' => $content]);
        } elseif ($type == JSON) {
            // header('Content-Type: application/json; charset=utf-8');
            print_r($data);
        } elseif ($type == XML) {
            // header('Content-Type: application/xml; charset=utf-8');
            die('Update after!');
        }
    }

    public function validate($rules, $all = true)
    {
        $results = [];
        foreach ($rules as $key => $rule) {
            $value = request($key, NULL);
            $rule = explode('|', $rule);
            foreach ($rule as $ruleItem) {
                if (strpos(':', $ruleItem) !== false) {
                    $ruleItemParams = explode(':', $ruleItem);
                    $keyCurrent = $ruleItemParams[0];
                    array_shift($ruleItemParams);
                    $result = $this->validateItem($value, $keyCurrent, $ruleItemParams);
                } elseif (gettype($ruleItem) === 'string') {
                    $result = $this->validateItem($value, $ruleItem);
                }
                if ($result !== true && $all === true) {
                    $results[] = array_merge([$key], $result);
                } elseif ($result !== true && $all !== true) {
                    return array_merge([$key], $result);
                }
            }
        }
        if (count($results)) {
            $return = [];
            foreach ($results as $item) {
                $text = isset($this->validateList[$item[2]]) ? $this->validateList[$item[2]] : '';
                if (gettype($text) == 'string' && $text != '') {
                    $text = str_replace(':attribute', $item[0], $text);
                    $item[] = $text;
                    $return[] = $item;
                }
            }
            return $return;
        }
        return true;
    }

    public function validateItem($value, $rule, $params = [])
    {
        switch ($rule) {
            case 'required':
                if (!preg_match('/' . DEFAULT_PATTERN_EMPTY . '/', $value)) {
                    return [
                        $value, $rule, $params
                    ];
                }
                break;
            case 'email':
                if (!preg_match('/' . DEFAULT_PATTERN_EMAIL . '/', $value)) {
                    return [
                        $value, $rule, $params
                    ];
                }
                break;
            case 'email':
                if (!preg_match('/' . DEFAULT_PATTERN_EMAIL . '/', $value)) {
                    return [
                        $value, $rule, $params
                    ];
                }
                break;
        }
        return true;
    }
}
