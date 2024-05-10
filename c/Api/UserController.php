<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ' /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_,'(_.)......|
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
 *  Date: 2024/05/10
 *  Time: 11:12:00
 */

namespace App\Controllers\Api;

use App\Model\BaseModel;
use App\Lib\Jwt;
use App\Lib\Pluralize;
use App\Service\AuthService;

class UserController extends ApiController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $obj = new BaseModel(plural('blog_post'));
        $post = $obj->find();
        $data = ['list' => $post];
        $this->render($data);
    }

    public function login()
    {
        try {
            $data = [
                'success' => 1,
                'message' => 'login_success',
            ];
            if (isPost()) {
                $this->validate([
                    'email' => 'required|email',
                    'password' => 'required|min:6'
                ]);
                $obj = new BaseModel(Pluralize::plural('user'));
                $user = $obj->findOne([
                    'conditions' => [
                        'email' => request('email')
                    ]
                ]);
                if (isset($user) && $user !== false && AuthService::passwordVerify(request('password'), $user->password)) {
                    $user->password = NULL;
                    $payload = [
                        'id' => $user->id,
                        'full_name' => $user->full_name,
                        'first_name' => $user->first_name,
                        'last_name' => $user->last_name,
                        'email' => $user->email,
                    ];
                    $token = AuthService::jwtRender($payload);
                    $data = [
                        'success' => 1,
                        'message' => 'login_success',
                        'token' => $token,
                    ];
                } else {
                    $data = [
                        'success' => 1,
                        'message' => 'login_failed'
                    ];
                }
            }
            $this->render($data);
        } catch (\Exception $exc) {
            $data = [
                'success' => 0,
                'message' => $exc->getMessage(),
            ];
            $this->render($data);
        }
    }

    public function detail($id)
    {
        $obj = new BaseModel(plural('blog_post'));
        $post = $obj->findOne([
            'conditions' => [
                'id' => $id
            ]
        ]);
        $data = ['post' => $post];
        $this->render($data);
    }
}
