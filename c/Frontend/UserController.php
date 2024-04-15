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
 *  Date: 2024/03/25
 *  Time: 10:25:39
 */

namespace App\Controllers\Frontend;

use App\Lib\PageViewer;
use App\Lib\Pluralize;
use App\Lib\Utils;
use App\Model\BaseModel;

class UserController extends FrontendController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = [];
        $this->render('frontend/user/index', $data);
    }

    public function register()
    {
        PageViewer::set('layout', 'frontend' . DS . 'layout' . DS . 'simple');
        $data = [];
        $this->render('frontend/user/register', $data);
    }

    public function registerPost()
    {
        $data = [];
        if (isPost() == true) {
            $data['validate'] = $this->validate([
                'full_name' => 'required',
                'email' => 'required|email',
                'password' => 'required|min:6',
                'repassword' => 'required|same:password',
            ]);
            if ($data['validate'] === true) {
                $obj = new BaseModel(Pluralize::plural('user'));
                $dataSave = [
                    'id' => Utils::genUuid(),
                    'full_name' => request('full_name'),
                    'email' => request('email'),
                    'password' => md5(request('password')),
                ];
                $result = $obj->insert(['data' => $dataSave]);
            }
        }
        $this->render('frontend/user/register', $data);
    }

    public function login()
    {
        PageViewer::set('layout', 'frontend' . DS . 'layout' . DS . 'simple');
        $data = [];
        $this->render('frontend/user/login', $data);
    }

    public function loginPost()
    {
        $data = [];
        if (isPost() == true) {
            $this->validate([
                'email' => 'required|email',
                'password' => 'required|min:6'
            ]);
            $obj = new BaseModel(Pluralize::plural('user'));
            $user = $obj->findOne([
                'conditions' => [
                    'email' => request('email'),
                    'password' => md5(request('password')),
                ]
            ]);
            print_r($user);
        }
        $this->render('frontend/user/login', $data);
    }
}
