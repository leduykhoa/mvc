<?php

namespace App\Database\Seeders;

use App\Lib\Utils;
use App\Model\BaseModel;

class NewsSeeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        //
        echo ("\nNewsSeeder!\n");
        $file = PATH_DATABASE_SEEDER . DS . 'news.json';


        if (file_exists($file)) {
            $list = json_decode(file_get_contents($file));
            foreach ($list as $item) {
                try {
                    $obj = new BaseModel(plural('blog_post'));
                    $dataSave = [
                        'name' => $item->title,
                        'description' => $item->description,
                        'image' => isset($item->image) ? $item->image : null,
                        'notes' => $item->url
                    ];
                    $obj->insert(['data' => $dataSave]);
                } catch (\Exception $exce) {
                    echo  $exce->getMessage();
                    continue;
                }
            }
        } else {
            echo ("\nnews.json not exist\n");
        }
    }
}
