<?php

namespace App\Database\Seeders;

use App\Lib\Utils;
use App\Model\BaseModel;

class CountrySeeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        //
        // https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
        // https://www.iban.com/country-codes
        echo ("\ncountry!\n");
        $file = PATH_DATABASE_SEEDER . DS . 'country-codes.csv';
        $fileIso = PATH_DATABASE_SEEDER . DS . 'country_ISO_3166-1_alpha-2.csv';

        $countries = [];
        if (file_exists($file)) {
            $list = file_get_contents($file);
            $list = explode("\"\n", $list);
            foreach ($list as $item) {
                $item = trim($item);
                if ($item == '') {
                    continue;
                }
                $item = explode("\",", $item);
                $name = trim(str_replace("\"", '', trim($item[0])));
                $iso2 = trim(str_replace("\"", '', trim($item[1])));
                $iso3 = trim(str_replace("\"", '', trim($item[2])));

                $countries[] = [$name, $iso2, $iso3];
            }
        } else {
            echo ("\ncountry-codes.csv not exist\n");
        }

        if (file_exists($fileIso)) {
            $list = file_get_contents($fileIso);
            $list = explode("\"\n", $list);

            foreach ($list as $item) {
                try {
                    $item = trim($item);
                    if ($item == '') {
                        continue;
                    }
                    $item = explode("\",", $item);
                    $code = trim(str_replace("\"", '', trim($item[0])));
                    $name = trim(str_replace("\"", '', trim($item[1])));
                    $year = trim(str_replace("\"", '', trim($item[2])));
                    $domain = trim(str_replace("\"", '', trim($item[3])));
                    $notes = trim(str_replace("\"", '', trim(isset($item[4]) ? $item[4] : '')));
                    $iso2_code = '';
                    $iso3_code = '';
                    foreach ($countries as $itemCountry) {
                        if (strtolower($code) == strtolower($itemCountry[1])) {
                            $iso2_code = $itemCountry[1];
                            $iso3_code = $itemCountry[2];
                            $name = $itemCountry[0];
                            break;
                        }
                    }
                    // CW SS SX
                    if ($iso2_code == '') {
                        // continue;
                    }
                    $obj = new BaseModel(plural('country'));
                    $dataSave = [
                        'code' => $code,
                        'name' => $name,
                        'year' => $year,
                        'domain' => $domain,
                        'notes' => $notes,
                        'iso2_code' => $iso2_code,
                        'iso3_code' => $iso3_code,
                        'is_active' => false,
                    ];
                    $obj->insert(['data' => $dataSave]);
                } catch (\Exception $exce) {
                    print_r([$item]);
                    echo  $exce->getMessage();
                    continue;
                }
            }
        } else {
            echo ("\ncountry.csv not exist\n");
        }
    }
}
