<?php

namespace App\Database\Migrations;

use App\Lib\DB;

class DatabaseMigration
{

    /**
     * Run the database migration.
     */
    public function run()
    {
        //
        try {
            echo ("\nrender_table_file!\n");
            $tableStructure = PATH_DATABASE_MIGRATION . DS . 'render_table_file.sql';
            $tableStructureTrigger = PATH_DATABASE_MIGRATION . DS . 'render_table_file_trigger.sql';
            $tableStructureCustom = PATH_DATABASE_MIGRATION . DS . 'render_table_file_custom.sql';
            if (file_exists($tableStructure)) {
                $db = DB::getInstance();

                $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
                $db->query('SET FOREIGN_KEY_CHECKS = 0;');
                $tables = $db->prepare('SHOW TABLES');
                $tables->execute();
                foreach ($tables->fetchAll(\PDO::FETCH_COLUMN) as $table) {
                    $db->query('TRUNCATE TABLE `' . $table . '`')->execute();
                }

                $db->exec(file_get_contents($tableStructure));
                $db->exec(file_get_contents($tableStructureTrigger));
                $db->exec(file_get_contents($tableStructureCustom));

                $db->query('SET FOREIGN_KEY_CHECKS = 1;');
            } else {
                echo ("\nrender_table_file not exist\n");
            }
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
            die('running error!');
        }
    }
}
