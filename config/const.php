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
 *  Date: 2024/03/05
 *  Time: 08:08:08
 */


// ===================================================================================================================================
//
define('ASC', 'ASC');
define('DESC', 'DESC');
// ===================================================================================================================================
//
define('SCOPE_STORE',  0);
define('SCOPE_GLOBAL', 1);
define('SCOPE_WEBSITE',  2);
// ===================================================================================================================================
//
define('SUCCESS', 'success');
define('WARNING', 'warning');
define('DANGER', 'danger');
define('UNKNOWN', 'unknown');

define('MESSAGE', 'message');
define('ERROR', 'error');
define('CODE', 'code');
define('DATA', 'data');

define('HTML', 'html');
define('JSON', 'json');
define('XML', 'xml');
define('css', 'css');
define('js', 'js');
define('style', 'style');
define('javascript', 'javascript');

// ===================================================================================================================================
//
define('_DELETE', 'delete');
define('_DEFAULT', 'default');
define('EMPTY', 'empty');
define('OTHER', 'other');
define('SYSTEM', 'system');
define('CONFIG', 'config');
define('LANGUAGE', 'language');
define('PUBLIC', 'public');
define('SECRET', 'secret');
define('ENTERPRISE', 'enterprise');
define('COMPANY', 'company');
define('PRODUCT', 'product');
define('PACKAGE', 'package');
define('SERVICE', 'service');
define('IMAGE', 'image');
define('DOCUMENT', 'document');
define('GALLERY', 'gallery');
define('MEDIA', 'media');
define('FILE', 'file');
define('UNIT', 'unit');
define('ORDER', 'order');
define('CANCEL', 'cancel');
define('NEW', 'new');
define('EDIT', 'edit');
define('DUPLICATE', 'duplicate');
define('CLONE', 'clone');
define('CUSTOM', 'custom');
define('QUICK', 'quick');
define('IMPORT', 'import');
define('EXPORT', 'export');
define('TRANSFER', 'transfer');
define('MOVING', 'moving');
define('SHIP', 'ship');
define('PLAN', 'plan');
define('DONE', 'done');
define('APPROVED', 'approved');
define('APPROVE', 'approve');
define('WAREHOUSE', 'warehouse');
define('PERMISSION', 'permission');
define('ROLE', 'role');
define('GROUP', 'group');
define('BACKEND', 'backend');
define('FRONTEND', 'frontend');
define('ADMINISTRATOR', 'administrator');
define('OPERATOR', 'operator');
define('ADMIN', 'admin');
define('SUPPLY', 'supply');
define('MANAGE', 'manage');
define('SESSION', 'session');
// ===================================================================================================================================
// HEADER_FORWARDED = 0b000001; // When using RFC 7239
// HEADER_X_FORWARDED_FOR = 0b000010;
// HEADER_X_FORWARDED_HOST = 0b000100;
// HEADER_X_FORWARDED_PROTO = 0b001000;
// HEADER_X_FORWARDED_PORT = 0b010000;
// HEADER_X_FORWARDED_PREFIX = 0b100000;

// HEADER_X_FORWARDED_AWS_ELB = 0b0011010; // AWS ELB doesn't send X-Forwarded-Host
// HEADER_X_FORWARDED_TRAEFIK = 0b0111110; // All "X-Forwarded-*" headers sent by Traefik reverse proxy
define('HEADER_FORWARDED', 0b000001);
define('HEADER_X_FORWARDED_FOR', 0b000010);
define('HEADER_X_FORWARDED_HOST', 0b000100);
define('HEADER_X_FORWARDED_PROTO', 0b001000);
define('HEADER_X_FORWARDED_PORT', 0b010000);
define('HEADER_X_FORWARDED_PREFIX', 0b100000);
define('HEADER_X_FORWARDED_AWS_ELB', 0b0011010);
define('HEADER_X_FORWARDED_TRAEFIK', 0b0111110);
// ===================================================================================================================================
// get
// post
// put
// patch
// delete
// options
// any
define('REQUEST_METHOD_HEAD', 'HEAD');
define('REQUEST_METHOD_GET', 'GET');
define('REQUEST_METHOD_POST', 'POST');
define('REQUEST_METHOD_PUT', 'PUT');
define('REQUEST_METHOD_PATCH', 'PATCH');
define('REQUEST_METHOD_DELETE', 'DELETE');
define('REQUEST_METHOD_PURGE', 'PURGE');
define('REQUEST_METHOD_OPTIONS', 'OPTIONS');
define('REQUEST_METHOD_TRACE', 'TRACE');
define('REQUEST_METHOD_CONNECT', 'CONNECT');
define('REQUEST_METHOD_ANY', 'any');

// ===================================================================================================================================
//
define('DEFAULT_USER_LOGIN_TYPE_ANONYMOUS', 'anonymous');
define('DEFAULT_USER_LOGIN_TYPE_USER', 'user');
define('DEFAULT_USER_LOGIN_TYPE_CUSTOMER', 'customer');
define('DEFAULT_USER_LOGIN_TYPE_MERCHANT', 'merchant');
define('DEFAULT_USER_LOGIN_TYPE_CONSUMER', 'consumer');
define('DEFAULT_USER_LOGIN_TYPE_ADMIN', ADMIN);
// ===================================================================================================================================
//
define('PERMISSION_ALLOW', 'allow');
define('PERMISSION_DENIED', 'denied');
define('PERMISSION_CREATE', 'create');
define('PERMISSION_READ', 'read');
define('PERMISSION_UPDATE', 'update');
define('PERMISSION_DELETE', 'delete');
// ===================================================================================================================================
// https://momentjs.com/docs/#/parsing/string-format/
define('DATE_TIME_FORMAT_ISO', 'YYYY-MM-DDTHH:mm:ss.SSSZ');
define('DATE_TIME_FORMAT_FULL', 'YYYY/MM/DD HH:mm:ss');
define('DATE_TIME_FORMAT_SHORT', 'YYYY/MM/DD HH:mm');
define('DATE_FORMAT_FULL', 'YYYY/MM/DD');
define('DATE_FORMAT_SHORT', 'MM/DD');
define('TIME_FORMAT_FULL', 'HH:mm:ss');
define('TIME_FORMAT_SHORT', 'HH:mm');
// https://xdsoft.net/jqplugins/datetimepicker/
define('DATE_TIME_PICKER_FORMAT_ISO', 'Y-m-dTH:i:sZ');
define('DATE_TIME_PICKER_FORMAT_FULL', 'Y/m/d H:i:s');
define('DATE_TIME_PICKER_FORMAT_SHORT', 'Y/m/d H:i');
define('DATE_PICKER_FORMAT_FULL', 'Y/m/d');
define('DATE_PICKER_FORMAT_SHORT', 'm/d');
# https://www.php.net/manual/en/datetime.format.php
define('DATE_TIME_MYSQL_FORMAT_ISO',  'Y-m-d H:iTH:i:sZ');
define('DATE_TIME_MYSQL_FORMAT_FULL', 'Y-m-d H:i:s');
define('DATE_TIME_MYSQL_FORMAT_SHORT', 'Y-m-d H:i');
define('DATE_MYSQL_FORMAT_FULL', 'Y-m-d');
define('DATE_MYSQL_FORMAT_SHORT', 'm-d');
// ===================================================================================================================================
//
define('DEFAULT_PATTERN_EMPTY', '^\S+$');
define('DEFAULT_PATTERN_NO_HTML', '<(\/)?\w+');
define('DEFAULT_PATTERN_NUMBER', '^\\s*-?\\d*(\\.\\d*)?\\s*$');
define('DEFAULT_PATTERN_DIGITS', '!/[^\d]/');
define('DEFAULT_PATTERN_ALPHA', '^[a-zA-Z]+$');
define('DEFAULT_PATTERN_CODE', '^[a-z]+[a-z0-9_]+$');
define('DEFAULT_PATTERN_ALPHA_NUMBER', '^[a-zA-Z0-9]+$');
define('DEFAULT_PATTERN_ALPHA_NUMBER_SPACE', '^[a-zA-Z0-9 ]+$');
define('DEFAULT_PATTERN_STREET', '^[ \w]{3,}([A-Za-z]\.)?([ \w]*\#\d+)?(\r\n| )[ \w]{3,}');
define('DEFAULT_PATTERN_PHONE', '^(\()?\d{3}(\))?(-|\s)?\d{3}(-|\s)\d{4}$');
define('DEFAULT_PATTERN_EMAIL', '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
define('DEFAULT_PATTERN_PASSWORD', '^w+$');
// ===================================================================================================================================
//
define('MESSAGE_SUCCESS_ITEM_WAS_CREATED_SUCCESSFULLY', 'Item was created successfully.');
define('MESSAGE_SUCCESS_ITEM_WAS_UPDATED_SUCCESSFULLY', 'Item was updated successfully.');
define('MESSAGE_SUCCESS_ITEM_WAS_DELETED_SUCCESSFULLY', 'Item was deleted successfully.');
define('MESSAGE_SUCCESS_ITEM_WAS_DUPLICATED_SUCCESSFULLY', 'Item was duplicated successfully.');

define('MESSAGE_WARNING_ID_DOSE_NOT_EXIST', 'Id does not exist.');
define('MESSAGE_WARNING_ID_DOSE_NOT_VALIDATED', 'Id does not validate.');
define('MESSAGE_WARNING_ITEM_DOSE_NOT_EXIST', 'Item does not exist.');
define('MESSAGE_WARNING_ITEM_CAN_NOT_CREATE', 'Item can\'t create.');
define('MESSAGE_WARNING_ITEM_CAN_NOT_UPDATE', 'Item can\'t update.');
define('MESSAGE_WARNING_ITEM_CAN_NOT_DELETE', 'Item can\'t delete.');
define('MESSAGE_WARNING_ITEM_CAN_NOT_DUPLICATE', 'Item can\'t duplicate.');

define('MESSAGE_DANGER_ITEM_IS_DUPLICATE', 'Item is duplicate.');
define('MESSAGE_DANGER_INTERNAL_SERVER_ERROR', 'Internal Server Error.');
define('MESSAGE_DANGER_CAN_NOT_CONNECT_TO_SERVER', 'Can\'t connect to server.');
// ===================================================================================================================================
//
define('DB_RENDER', 'DB_RENDER');
// ===================================================================================================================================
