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

namespace App\Controllers\Backend;

use App\Lib\PageViewer;
use App\Lib\Pluralize;
use App\Lib\Session;
use App\Lib\Utils;
use App\Model\BaseModel;
use App\Service\AuthService;

class UserController extends BackendController
{
    private $fieldName = 'email';

    public function __construct()
    {
        parent::__construct();
    }

    public function login()
    {
        PageViewer::set('layout', 'backend' . DS . 'layout' . DS . 'simple');
        $data = [];
        $this->render('backend/user/login', $data);
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
                    $this->fieldName => request($this->fieldName)
                ]
            ]);
            if (isset($user) && $user !== false && AuthService::passwordVerify(request('password'), $user->password)) {
                $user->password = NULL;
                $this->authService->auth($user);
                Session::flash(Session::SUCCESS, __('Login successfully'));
                header('Location: /' . $this->backendPrefix . '/dashboard');
                return true;
            }
            Session::flash(Session::ERROR, __('Login failed'));
            header('Location: /' . $this->backendPrefix . '/login');
            return true;
        }
        header('HTTP/1.0 404 Not Found');
    }

    public function logout()
    {
        if (isPost()) {
            $this->authService->logout();
            Session::flash(Session::SUCCESS, __('Logout successfully'));
            header('Location: /' . $this->backendPrefix . '/login');
            return true;
        }
        header('HTTP/1.0 404 Not Found');
    }

    public function user()
    {
        $user = $this->authService->user();
        if (!$user) {
            header('Location: /' . $this->backendPrefix . '/user');
            return true;
        }
        $this->render('backend/user/user', ['user' => $user]);
    }
}
