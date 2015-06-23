<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2015-06-13 22:36:26 --- CRITICAL: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt in your bootstrap.php. For more information check the documentation ~ SYSPATH\classes\Kohana\Cookie.php [ 158 ] in C:\wamp\www\kohana\system\classes\Kohana\Cookie.php:67
2015-06-13 22:36:26 --- DEBUG: #0 C:\wamp\www\kohana\system\classes\Kohana\Cookie.php(67): Kohana_Cookie::salt('PHPSESSID', NULL)
#1 C:\wamp\www\kohana\system\classes\Kohana\Request.php(151): Kohana_Cookie::get('PHPSESSID')
#2 C:\wamp\www\kohana\index.php(117): Kohana_Request::factory(true, Array, false)
#3 {main} in C:\wamp\www\kohana\system\classes\Kohana\Cookie.php:67