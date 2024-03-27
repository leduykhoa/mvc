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
        // ===================================================================================================================================
        $columns = ['*'];
        if (isset($params['columns']) && is_array($params['columns'])) {
            $columns = $params['columns'];
        }
        $fetchType = PDO::FETCH_OBJ;
        if (isset($params['fetch_type']) && $params['fetch_type'] != '') {
            $fetchType = $params['fetch_type'];
        }
        $conditions = [];
        if (isset($params['conditions']) && is_array($params['conditions'])) {
            $conditions = $params['conditions'];
        }
        // ===================================================================================================================================
        $where = [];
        $counter = 0;
        foreach ($conditions as $filter) {
            $str = '';
            if ($counter++ > 0) {
                $str .= ' ' . (isset($filter[3]) ? strtoupper($filter[3]) : 'AND') . ' ';
            }
            $value = '\'' . $filter[1] . '\'';
            if (gettype($filter[1]) == 'integer' || gettype($filter[1]) == 'double' || gettype($filter[1]) == 'float') {
                $value = $filter[1];
            }
            $where[] = $str . $filter[0] . ' ' . (isset($filter[2]) ? $filter[2] : ' = ' . $value);
        }
        if (count($where)) {
            $where = ' WHERE ' . implode(' ', $where);
        } else {
            $where = '';
        }
        // ===================================================================================================================================
        $db = DB::getInstance();
        $query = 'SELECT ' . implode(', ', $columns) . ' FROM ' . $this->table . $where;
        $req = $db->query($query);
        return $req->fetch($fetchType);
    }

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
}
