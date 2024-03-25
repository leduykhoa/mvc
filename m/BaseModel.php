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
            $value = '\''.$filter[1].'\'';
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
        // print_r($params);
        // print_r($conditions);
        // die($query);
        $req = $db->query($query);
        return $req->fetch($fetchType);
    }
}
