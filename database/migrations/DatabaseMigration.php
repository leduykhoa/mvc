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
            $tableStructureCustom = PATH_DATABASE_MIGRATION . DS . 'render_table_file_custom.sql';
            if (file_exists($tableStructure)) {
                $db = DB::getInstance();
                $db->query('SET FOREIGN_KEY_CHECKS = 0;');
                $tables = $db->prepare('SHOW TABLES');
                $tables->execute();
                foreach ($tables->fetchAll(\PDO::FETCH_COLUMN) as $table) {
                    $db->query('TRUNCATE TABLE `' . $table . '`')->execute();
                }
                $db->query('SET FOREIGN_KEY_CHECKS = 1;');

                $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

                $db->exec(file_get_contents($tableStructure));
                $db->exec(file_get_contents($tableStructureCustom));
            } else {
                echo ('render_table_file not exist');
            }
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
        }
    }
}
