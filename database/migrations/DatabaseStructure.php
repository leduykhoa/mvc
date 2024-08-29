<?php

namespace App\Database\Migrations;

use App\Lib\DB;

class DatabaseStructure
{

    /**
     * Run the database structure.
     */
    public function run()
    {
        //
        try {
            echo ("\Make database structure - start!\n");
            $tableStructure = PATH_DATABASE_MIGRATION . DS . 'database_structure.sql';
            $tableStructureTrigger = PATH_DATABASE_MIGRATION . DS . 'database_structure_trigger.sql';
            $tableStructureCustom = PATH_DATABASE_MIGRATION . DS . 'database_structure_custom.sql';
            if (file_exists($tableStructure)) {
                $db = DB::getInstance();

                $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
                $db->query('SET FOREIGN_KEY_CHECKS = 0;');
                $tables = $db->prepare('SHOW TABLES');
                $tables->execute();
                echo ("\nMake database structure - TRUNCATE!\n");
                foreach ($tables->fetchAll(\PDO::FETCH_COLUMN) as $table) {
                    $db->query('TRUNCATE TABLE `' . $table . '`')->execute();
                }
                echo ("\nMake database structure - TRUNCATE - finish!\n");
                $db->exec(file_get_contents($tableStructure));
                $db->exec(file_get_contents($tableStructureTrigger));
                $db->exec(file_get_contents($tableStructureCustom));

                $db->query('SET FOREIGN_KEY_CHECKS = 1;');
                echo ("\nMake database structure - finish!\n");
            } else {
                echo ("\ndatabase_structure not exist\n");
            }
        } catch (\Exception $exce) {
            echo  $exce->getMessage();
            die('\nMake database structure - Error!\n');
        }
    }
}
