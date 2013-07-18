<?php
// HTTP
/*define('HTTP_SERVER', 'http://nycsupermall.com/test/');
define('HTTP_IMAGE', 'http://nycsupermall.com/test/image/');
define('HTTP_ADMIN', 'http://nycsupermall.com/test/admin/');
*/

define('HTTP_SERVER', 'http://yibadatech.com/gotobus/');
define('HTTP_IMAGE', HTTP_SERVER.'image/');

//define('HTTP_ADMIN', 'http://yibadatech.com/gotobus/admin/');
define('HTTP_ADMIN', HTTP_SERVER.'admin/');

// HTTPS
/*define('HTTPS_SERVER', 'http://nycsupermall.com/test/');
define('HTTPS_IMAGE', 'http://nycsupermall.com/test/image/');
*/
define('HTTPS_SERVER', 'http://yibadatech.com/gotobus/');
define('HTTPS_IMAGE', HTTPS_SERVER.'image/');


// DIR
//define('DIR_ROOT', '/home/content/71/8049371/html/test/');
define('DIR_ROOT', realpath(dirname(__FILE__)) . '/');
define('DIR_APPLICATION', DIR_ROOT.'catalog/');
define('DIR_SYSTEM', DIR_ROOT.'system/');
define('DIR_DATABASE', DIR_ROOT.'system/database/');
define('DIR_LANGUAGE', DIR_ROOT.'catalog/language/');
define('DIR_TEMPLATE', DIR_ROOT.'catalog/view/theme/');
define('DIR_CONFIG', DIR_ROOT.'system/config/');
define('DIR_IMAGE', DIR_ROOT.'image/');
define('DIR_CACHE', DIR_ROOT.'system/cache/');
define('DIR_DOWNLOAD', DIR_ROOT.'download/');
define('DIR_LOGS', DIR_ROOT.'system/logs/');

// DB
define('DB_DRIVER', 'mysql');

//define('DB_HOSTNAME', 'nycsupermall.db.8049371.hostedresource.com');
//define('DB_HOSTNAME', '');
//define('DB_USERNAME', 'pqtoursc_usafun');
//define('DB_PASSWORD', 'Mh+5&=55%oxS');
//define('DB_DATABASE', 'pqtoursc_usafun');
//define('DB_PREFIX', '');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'yibadate_gotobus');
define('DB_PASSWORD', 'Cc$;KqI}NdzD');
define('DB_DATABASE', 'yibadate_gotobus');
define('DB_PREFIX', '');
?>