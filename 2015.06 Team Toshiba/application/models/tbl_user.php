<?php defined('SYSPATH') or die('No direct script access.');
class Tbl_User_Model extends ORM {
	
    public function get_user($username)
    {
      $user = ORM::factory('tbl_user')
      			->SELECT('*')
      			->WHERE('username',$username)
      			->find();
      return $user;
    }
}