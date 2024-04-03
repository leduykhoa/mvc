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
 *  Date: 2024/02/29
 *  Time: 11:04:34
 */

class BaseModel
{
    public $table;

    function __construct($table)
    {
        $this->table = $table;
    }

    public function all($params = [])
    {
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = PDO::FETCH_OBJ;
        if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
            $fetchType = $params['fetch_type'];
        }
        // ===================================================================================================================================
        $db = DB::getInstance();
        $query = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table;
        $req = $db->query($query);
        return $req->fetchAll($fetchType);
    }

    public function findOne($params = [])
    {
        $dataFilter = [];
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = PDO::FETCH_OBJ;
        if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
            $fetchType = $params['fetch_type'];
        }
        // ===================================================================================================================================    
        $counter = 0;
        $where = [];
        $conditions = [];
        if (isset($params['conditions']) && is_array($params['conditions'])) {
            $conditions = $params['conditions'];

            foreach ($conditions as $key => $value) {
                $str = '';
                if ($counter++ > 0) {
                    $str .= ((is_array($value) && isset($value[2]) && $value[2] != '' && $value[2] != 0) ? strtoupper($value[2]) : ' AND ');
                }
                $valueP = NULL;
                if (is_array($value)) {
                    $valueP = (string) $value[0];
                    if (gettype($value[0]) == 'integer' || gettype($value[0]) == 'double' || gettype($value[0]) == 'float' || gettype($value[0]) == 'boolean') {
                        $valueP = $value[0];
                    }
                } else {
                    $valueP =  (string) $value;
                    if (gettype($value) == 'integer' || gettype($value) == 'double' || gettype($value) == 'float' || gettype($value) == 'boolean') {
                        die('ddd');
                        $valueP = $value;
                    }
                }
                $dataFilter[$key] = $valueP;
                $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . ':' . $key;
            }
        }
        // ===================================================================================================================================
        if (count($where)) {
            $where = ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }
        // ===================================================================================================================================
        $db = DB::getInstance();
        $sql = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . $where;
        $stmt = $db->prepare($sql);
        $stmt->execute($dataFilter);
        return $stmt->fetch($fetchType);
    }

    // public function findOne($params = [])
    // {
    //     $dataFilter = [];
    //     // ===================================================================================================================================
    //     $columns = ['*'];
    //     if (isset($params['columns']) && is_array($params['columns'])) {
    //         $columns = $params['columns'];
    //     }
    //     $fetchType = PDO::FETCH_OBJ;
    //     if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
    //         $fetchType = $params['fetch_type'];
    //     }
    //     // ===================================================================================================================================    
    //     $counter = 0;
    //     $where = [];
    //     $conditions = [];
    //     if (isset($params['conditions']) && is_array($params['conditions'])) {
    //         $conditions = $params['conditions'];

    //         foreach ($conditions as $key => $value) {
    //             $str = '';
    //             if ($counter++ > 0) {
    //                 $str .= (isset($value[2]) ? strtoupper($value[2]) : ' AND ');
    //             }
    //             $valueP = '';
    //             if (is_array($value)) {
    //                 $valueP = $value[0];
    //                 if (gettype($value[0]) == 'integer' || gettype($value[0]) == 'double' || gettype($value[0]) == 'float' || gettype($value[0]) == 'boolean') {
    //                     $valueP = $value[0];
    //                 }
    //             } else {
    //                 $valueP =  (string) $value ;
    //                 if (gettype($value) == 'integer' || gettype($value) == 'double' || gettype($value) == 'float' || gettype($value) == 'boolean') {
    //                     $valueP = $value;
    //                 }
    //             }
    //             // $dataFilter[$key] = '\'' . $valueP . '\'';
    //             $dataFilter[$key] = $valueP;
    //             $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . '?';
    //         }
    //         echo '<pre>';
    //         // print_r($conditions);
    //         print_r($dataFilter);
    //         print_r($where);
    //     }
    //     // ===================================================================================================================================
    //     if (count($where)) {
    //         $where = implode(' ', $where);
    //     } else {
    //         $where = '';
    //     }
    //     // ===================================================================================================================================
    //     $db = DB::getInstance();
    //     $sql = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . ' ' . $where;
    //     // die($sql);
    //     $stmt = $db->prepare("$sql");
    //     // foreach ($dataFilter as $key => $value) {
    //     //     switch (gettype($value)) {
    //     //         case 'NULL':
    //     //             $stmt->bindValue(':' . $key, NULL, PDO::PARAM_NULL);
    //     //             break;
    //     //         case 'integer':
    //     //             $stmt->bindValue(':' . $key, (int)$value, PDO::PARAM_INT);
    //     //             break;
    //     //         case 'double':
    //     //             $stmt->bindValue(':' . $key, (float)$value, PDO::PARAM_INT);
    //     //             break;
    //     //         case 'float':
    //     //             $stmt->bindValue(':' . $key, (float)$value, PDO::PARAM_INT);
    //     //             break;
    //     //         case 'boolean':
    //     //             $stmt->bindValue(':' . $key, (bool)$value, PDO::PARAM_BOOL);
    //     //             break;
    //     //         case 'string':
    //     //             $stmt->bindValue(':' . $key, (string)$value);
    //     //             break;
    //     //     }
    //     // }
    //     $stmt->execute(array_values($dataFilter));
    //     return $stmt->fetch($fetchType);
    // }

    public function insert($params = [])
    {
        // ===================================================================================================================================
        $data = [];
        if (isset($params['data']) && is_array($params['data'])) {
            $data = $params['data'];
        }
        // ===================================================================================================================================
        $listFields = [];
        $listFieldReplaces = [];
        $listValues = [];
        foreach ($data as $field => $value) {
            $listFields[] = $field;
            $listFieldReplaces[] = ':' . $field;
            $listValues[] = $value;
        }
        // ===================================================================================================================================
        $db = DB::getInstance();
        $sql = 'INSERT INTO ' . $this->table . ' (' . implode(', ', $listFields) . ') VALUES  (' . implode(', ', $listFieldReplaces) . ')';
        return $db->prepare($sql)->execute($data);
    }

    public function inserts($params = [])
    {
        // ===================================================================================================================================
        $data = [];
        if (isset($params['data']) && is_array($params['data'])) {
            $data = $params['data'];
        }
        $fields = [];
        if (isset($params['fields']) && is_array($params['fields'])) {
            $fields = $params['fields'];
        }
        // ===================================================================================================================================
        $listFields = [];
        $listFieldReplaces = [];
        foreach ($fields as $field) {
            $listFields[] = $field;
            $listFieldReplaces[] = '?';
        }
        // ===================================================================================================================================
        $db = DB::getInstance();
        $sql = 'INSERT INTO ' . $this->table . ' (' . implode(', ', $listFields) . ') VALUES  (' . implode(', ', $listFieldReplaces) . ')';
        $stmt = $db->prepare($sql);
        try {
            $db->beginTransaction();
            foreach ($data as $row) {
                $stmt->execute($row);
            }
            $db->commit();
        } catch (Exception $e) {
            $db->rollback();
            throw $e;
        }
        return true;
    }

    public function update($params = [])
    {
        $dataSave = [];
        // ===================================================================================================================================
        $data = [];
        $dataKeys = [];
        if (isset($params['data']) && is_array($params['data'])) {
            $data = $params['data'];
            foreach ($data as $key => $value) {
                $dataKeys[] = $key . '=:' . $key;
                $valueP = '\'' . $value . '\'';
                if (gettype($value) == 'integer' || gettype($value) == 'double' || gettype($value) == 'float' || gettype($value) == 'boolean') {
                    $valueP = $value;
                }
                $dataSave[$key] = $valueP;
            }
        }
        // ===================================================================================================================================    
        $counter = 0;
        $where = [];
        $conditions = [];
        if (isset($params['conditions']) && is_array($params['conditions'])) {
            $conditions = $params['conditions'];

            foreach ($conditions as $key => $value) {
                $str = '';
                if ($counter++ > 0) {
                    $str .= (isset($value[2]) ? strtoupper($value[2]) : ' AND ');
                }
                $valueP = NULL;
                if (is_array($value)) {
                    $valueP = (string) $value[0];
                    if (gettype($value[0]) == 'integer' || gettype($value[0]) == 'double' || gettype($value[0]) == 'float' || gettype($value[0]) == 'boolean') {
                        $valueP = $value[0];
                    }
                } else {
                    $valueP =  (string) $value;
                    if (gettype($value) == 'integer' || gettype($value) == 'double' || gettype($value) == 'float' || gettype($value) == 'boolean') {
                        $valueP = $value;
                    }
                }
                $dataSave[$key] = $valueP;
                $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . ':' . $key;
            }
        }
        // ===================================================================================================================================
        if (count($where)) {
            $where =  ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }

        // ===================================================================================================================================
        $db = DB::getInstance();
        $sql = 'UPDATE ' . $this->table . ' SET ' . implode(', ', $dataKeys) . $where;
        $stmt = $db->prepare($sql);
        return $stmt->execute($dataSave);
    }
}
