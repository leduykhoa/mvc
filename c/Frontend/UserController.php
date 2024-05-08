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
use App\Lib\Session;
use App\Lib\Utils;
use App\Model\BaseModel;
use App\Service\AuthService;

class UserController extends FrontendController
{
    public function __construct()
    {
        parent::__construct();
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
                if ($result === true) {
                    Session::flash(Session::SUCCESS, 'Register successfully');
                    header('Location: /');
                    return true;
                }
            } else {
                $warning = [];
                foreach ($data['validate'] as $item) {
                    $warning[] = $item[4];
                }
                Session::flash(Session::WARNING, $warning);
            }
            header('Location: /register');
        }
    }

    public function login()
    {
        PageViewer::set('layout', 'frontend' . DS . 'layout' . DS . 'simple');
        $data = [];
        $this->render('frontend/user/login', $data);
    }

    public function loginPost()
    {
        if (isPost()) {
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
            if (isset($user)) {
                $user->password = NULL;
                $this->authService->auth($user);
                Session::flash(Session::SUCCESS, __('Login successfully'));
                header('Location: /');
                return true;
            }
            Session::flash(Session::ERROR, __('Login failed'));
            header('Location: /login');
            return true;
        }
        header('HTTP/1.0 404 Not Found');
    }

    public function logout()
    {
        if (isPost()) {
            $this->authService->logout();
            Session::flash(Session::SUCCESS, __('Logout successfully'));
            header('Location: /');
            return true;
        }
        header('HTTP/1.0 404 Not Found');
    }

    public function account()
    {
        $user = $this->authService->user();
        if (!$user) {
            header('Location: /login');
            return true;
        }
        $this->render('frontend/user/account', ['user' => $user]);
    }
}
