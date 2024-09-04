<?php

namespace App\Database\Seeders;

use App\Controllers\Cmd\CmdController;

class DatabaseSeeder extends CmdController
{
    /**
     * Run class seeder.
     */
    private function call($className)
    {
        include_once(PATH_DATABASE_SEEDER . DS . $className . '.php');
        $kClass = 'App\Database\Seeders\\' . $className;
        $kClass = new $kClass();
        $kClass->run();
    }

    /**
     * Seed the application's database.
     */

    public function run()
    {
        //
        ini_set('memory_limit', -1);
        ini_set('max_execution_time', 180000);

        try {
            $this->call('A00000Seeder');

            $this->call('DataCountryVnSeeder');
            $this->call('CountrySeeder');
            $this->call('UserSeeder');
            // $this->call('Gs1CountrySeeder');
            // $this->call('NewsSeeder');

            // $this->call(IndustrySeeder::class);
            // $this->call(EnterpriseTypeSeeder::class);
            // $this->call(FieldOfActivitySeeder::class);
            // $this->call(EnterpriseSeeder::class);
            // $this->call(LocationSeeder::class);
            // $this->call(StaffSeeder::class);
            // $this->call(DepartmentSeeder::class);

            $this->call('ZzzzzzSeeder');

            echo "\nRunning here\n";
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
        }
    }
}
