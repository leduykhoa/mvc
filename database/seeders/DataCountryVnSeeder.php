<?php

namespace App\Database\Seeders;

use App\Lib\DB;

class DataCountryVnSeeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        //
        try {
            echo ("\nDataCountryVnFile!\n");
            $dataCountryVnFile = PATH_DATABASE_SEEDER . DS . 'DataCountryVn.sql';
            if (file_exists($dataCountryVnFile)) {
                $db = DB::getInstance();
                $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
                $db->exec(file_get_contents($dataCountryVnFile));
                // DB::unprepared(file_get_contents($dataCountryVnFile));

                // foreach (District::all() as $item) {
                //     $province = Province::where('code', $item->province_code)->first();
                //     $item->province_id = $province->id;
                //     $item->save();
                // }

                // foreach (Ward::all() as $item) {
                //     $district = District::where('code', $item->district_code)->first();
                //     $item->district_id = $district->id;
                //     $item->save();
                // }
            } else {
                echo ("\nDataCountryVnFile not exist\n");
            }
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
        }
    }
}
