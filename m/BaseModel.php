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

namespace App\Model;

use App\Lib\DB;
use App\Lib\Utils;

class BaseModel
{
    public $table;
    public $id;

    function __construct($table, $id = 'id')
    {
        $this->table = $table;
        $this->id = $id;
    }

    public function all($params = [])
    {
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = \PDO::FETCH_OBJ;
        if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
            $fetchType = $params['fetch_type'];
        }
        $order = [];
        if (isset($params['orders']) && is_array($params['orders'])) {
            $orders = $params['orders'];
            foreach ($orders as $key => $value) {
                $str = '';
                if (strtoupper($value) == 'DESC') {
                    $str .= $key . ' DESC';
                } elseif ($value == '' || strtoupper($value) == 'ASC') {
                    $str .= $key . ' ASC';
                }
                $order[] = $str;
            }
        }
        // ===================================================================================================================================
        if (count($order)) {
            $order = ' ORDER BY ' . implode(', ', $order);
        } else {
            $order = '';
        }
        // // ===================================================================================================================================
        // $db = DB::getInstance();
        // $query = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . ' ' . $order;
        // $req = $db->query($query);
        // return $req->fetchAll($fetchType);

        // ===================================================================================================================================
        try {
            $db = DB::getInstance();
            $sql = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . ' ' . $order;
            $stmt = $db->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll($fetchType);
        } catch (\PDOException $e) {
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
        }
        return false;
    }

    public function find($params = [])
    {
        $dataFilter = [];
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = \PDO::FETCH_OBJ;
        if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
            $fetchType = $params['fetch_type'];
        }
        $limit = 20;
        if (isset($params['limit']) && $params['limit'] != '') {
            $limit = (int)$params['limit'];
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
                if (trim(strtolower($value)) == 'is null') {
                    $valueP = NULL;
                } elseif (is_array($value)) {
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
                if (!is_null($valueP)) {
                    $dataFilter[$key] = $valueP;
                    $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . ':' . $key;
                } else {
                    $where[] = $str . $key . ' IS NULL ';
                }
            }
        }
        $order = [];
        if (isset($params['orders']) && is_array($params['orders'])) {
            $orders = $params['orders'];
            foreach ($orders as $key => $value) {
                $str = '';
                if (strtoupper($value) == 'DESC') {
                    $str .= $key . ' DESC';
                } elseif ($value == '' || strtoupper($value) == 'ASC') {
                    $str .= $key . ' ASC';
                }

                $order[] = $str;
            }
        }
        // ===================================================================================================================================
        if (count($where)) {
            $where = ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }
        // ===================================================================================================================================
        if (count($order)) {
            $order = ' ORDER BY ' . implode(', ', $order);
        } else {
            $order = '';
        }

        // ===================================================================================================================================
        try {
            $db = DB::getInstance();
            $sql = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . $where . ' ' . $order . ' LIMIT ' . $limit;
            $stmt = $db->prepare($sql);
            $stmt->execute($dataFilter);
            return $stmt->fetchAll($fetchType);
        } catch (\PDOException $e) {
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
        }
        return false;
    }

    public function findOne($params = [])
    {
        $dataFilter = [];
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = \PDO::FETCH_OBJ;
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
                if (trim(strtolower($value)) == 'is null') {
                    $valueP = NULL;
                } elseif (is_array($value)) {
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
                if (!is_null($valueP)) {
                    $dataFilter[$key] = $valueP;
                    $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . ':' . $key;
                } else {
                    $where[] = $str . $key . ' IS NULL ';
                }
            }
        }
        $order = [];
        if (isset($params['orders']) && is_array($params['orders'])) {
            $orders = $params['orders'];
            foreach ($orders as $key => $value) {
                $str = '';
                if (strtoupper($value) == 'DESC') {
                    $str .= $key . ' DESC';
                } elseif ($value == '' || strtoupper($value) == 'ASC') {
                    $str .= $key . ' ASC';
                }

                $order[] = $str;
            }
        }
        // ===================================================================================================================================
        if (count($where)) {
            $where = ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }
        // ===================================================================================================================================
        if (count($order)) {
            $order = ' ORDER BY ' . implode(', ', $order);
        } else {
            $order = '';
        }
        // ===================================================================================================================================
        try {
            $db = DB::getInstance();
            $sql = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . $where . ' ' . $order;
            $stmt = $db->prepare($sql);
            $stmt->execute($dataFilter);
            return $stmt->fetch($fetchType);
        } catch (\PDOException $e) {
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
        }
        return false;
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
        $dataSave = [];
        if (isset($params['data']) && is_array($params['data'])) {
            $dataSave = $params['data'];
        }
        // ===================================================================================================================================
        $listFields = [];
        $listFieldReplaces = [];
        $listValues = [];
        foreach ($dataSave as $field => $value) {
            $listFields[] = $field;
            $listFieldReplaces[] = ':' . $field;
            $listValues[] = $value;
        }
        // ===================================================================================================================================
        try {
            $db = DB::getInstance();
            $sql = 'INSERT INTO ' . $this->table . ' (' . implode(', ', $listFields) . ') VALUES (' . implode(', ', $listFieldReplaces) . ')';
            $stmt = $db->prepare($sql);
            $stmt->execute($dataSave);
        } catch (\PDOException $e) {
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
        }
        return true;
    }

    public function insertGetId($params = [])
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
        // ===================================================================================================================================
        try {
            $idReturn = '';
            $db = DB::getInstance();
            if (!isset($data[$this->id]) || $data[$this->id] == '') {
                $select = $db->query('SHOW COLUMNS FROM ' . $this->table . ' WHERE field = \'' . $this->id . '\'');
                $meta = $select->fetch();
                if (strpos($meta->Key, 'PRI') >= 0 && strpos($meta->Type, 'char(36)') >= 0 && strpos($meta->Extra, 'auto_increment') === false) {
                    $idReturn = Utils::genUuid();
                    $data[$this->id] = $idReturn;
                }
            } else {
                $idReturn = $data[$this->id];
            }
            // ===================================================================================================================================
            foreach ($data as $field => $value) {
                $listFields[] = $field;
                $listFieldReplaces[] = ':' . $field;
                $listValues[] = $value;
            }
            // ===================================================================================================================================

            $sql = 'INSERT INTO ' . $this->table . ' (' . implode(', ', $listFields) . ') VALUES (' . implode(', ', $listFieldReplaces) . ')';
            $stmt = $db->prepare($sql);
            $stmt->execute($data);

            $lastId = $db->lastInsertId();
            if ($lastId) {
                return $lastId;
            }
            return $idReturn;
        } catch (\PDOException $e) {
            if (__env('APP_DEBUG', true) === true) {
                // echo $e->getMessage();
                throw $e;
            }
            return false;
        }
        return false;
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
        try {
            $db = DB::getInstance();
            $sql = 'INSERT INTO ' . $this->table . ' (' . implode(', ', $listFields) . ') VALUES (' . implode(', ', $listFieldReplaces) . ')';
            $stmt = $db->prepare($sql);
            $db->beginTransaction();
            foreach ($data as $row) {
                $stmt->execute($row);
            }
            $db->commit();
        } catch (\Exception $e) {
            $db->rollback();
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
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
                if (trim(strtolower($value)) == 'null') {
                    $dataSave[$key] = NULL;
                } else if (gettype($value) == 'integer' || gettype($value) == 'double' || gettype($value) == 'float' || gettype($value) == 'boolean') {
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
                // if ($counter++ > 0) {
                //     $str .= (isset($value) && isset($value[2]) ? strtoupper($value[2]) : ' AND ');
                // }
                if ($counter++ > 0) {
                    $str .= ((is_array($value) && isset($value[2]) && $value[2] != '' && $value[2] != 0) ? strtoupper($value[2]) : ' AND ');
                }
                $valueP = NULL;
                if (trim(strtolower($value)) == 'is null') {
                    $valueP = NULL;
                } elseif (is_array($value)) {
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
                if (!is_null($valueP)) {
                    $dataSave[$key] = $valueP;
                    $where[] = $str . $key . (is_array($value) && isset($value[1]) ? $value[1] : '=') . ':' . $key;
                } else {
                    $where[] = $str . $key . ' IS NULL ';
                }
            }
        }
        // ===================================================================================================================================
        if (count($where)) {
            $where =  ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }

        // ===================================================================================================================================     
        try {
            $db = DB::getInstance();
            $sql = 'UPDATE ' . $this->table . ' SET ' . implode(', ', $dataKeys) . $where;
            $stmt = $db->prepare($sql);
            $stmt->execute($dataSave);
        } catch (\Exception $e) {
            if (__env('APP_DEBUG', true) === true) {
                throw $e;
            }
            return false;
        }
        return true;
    }
}
