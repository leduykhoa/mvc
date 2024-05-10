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
use App\Lib\Pluralize;
use App\Lib\Utils;
use App\Service\AuthService;

class UserController extends ApiController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function register()
    {
        try {
            $data = [
                'success' => 1,
                'message' => 'login_success',
            ];
            $data['validate'] = $this->validate([
                'full_name' => 'required',
                'email' => 'required|email',
                'password' => 'required|min:6',
            ]);

            if ($data['validate'] === true) {
                $obj = new BaseModel(Pluralize::plural('user'));
                $userCheck = $obj->findOne([
                    'conditions' => [
                        'email' => request('email')
                    ],
                    'columns' => ['id', 'email']
                ]);
                if (isset($userCheck) && $userCheck !== false && isset($userCheck->id)) {
                    $data = [
                        'success' => 0,
                        'message' => 'register_failed',
                        'code' => 1,
                    ];
                    $this->render($data);
                    return;
                }
                $dataSave = [
                    'id' => Utils::genUuid(),
                    'full_name' => request('full_name'),
                    'first_name' => request('first_name'),
                    'last_name' => request('last_name'),
                    'email' => request('email'),
                    'password' => AuthService::passwordHash(request('password')),
                ];
                $result = $obj->insert(['data' => $dataSave]);
                if ($result === true) {
                    $data = [
                        'success' => 1,
                        'message' => 'register_success',
                        'id' => $dataSave['id'],
                    ];
                }
            } else {
                $warning = [];
                foreach ($data['validate'] as $item) {
                    $warning[] = $item[4];
                }
                $data = [
                    'success' => 0,
                    'message' => 'register_failed',
                    'data' => $warning,
                ];
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

    public function login()
    {
        try {
            $data = [
                'success' => 1,
                'message' => 'login_success',
            ];
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
            $this->render($data);
        } catch (\Exception $exc) {
            $data = [
                'success' => 0,
                'message' => $exc->getMessage(),
            ];
            $this->render($data);
        }
    }

    public function profile($id)
    {
    }
}
