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

class UserController extends BaseController
{
    public function __construct()
    {
    }

    public function index()
    {
    }

    public function register()
    {
        $data = [];
        // echo plural('translate');
        // echo '<pre>';
        // print_r(Language::getLanguage());
        // setLanguageCode('vi');
        // Register::set('language.code', strtolower('en'));
        if (isPost() == true) {
            $this->validate([
                'name' => 'required',
                'email' => 'required|email',
                'content' => 'required',
            ]);
            $obj = new BaseModel(Pluralize::plural('user'));
            $data = [
                'id' => Utils::genUuid(),
                'name' => request('name'),
                'email' => request('email'),
                'content' => request('content'),
            ];
            $result = $obj->insert(['data' => $data]);
        }
        $this->render('user/register', $data);
    }

    public function login()
    {
        $data = [];
        $this->render('user/login', $data);
    }
}
