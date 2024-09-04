<?php

namespace App\Database\Seeders;

use App\Lib\Utils;
use App\Model\BaseModel;
use App\Service\AuthService;

class UserSeeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        //
        echo ("\nUserSeeder!\n");
        try {
            AuthService::getInstance();
            $obj = new BaseModel(plural('user'));
            $dataSave = [
                'username' => 'admin',
                'email' => 'admin@gmail.com',
                'password' => AuthService::passwordHash('1234567')
            ];
            $obj->insert(['data' => $dataSave]);
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
        }
    }
}
