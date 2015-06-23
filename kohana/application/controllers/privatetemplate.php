<?php defined('SYSPATH') or die('No direct script access.');
class Privatetemplate_Controller extends Template_Controller {
	public $template = 'template';
    
   // $this->check_login();
    public function __construct()
    {
    
    }
    
    public function check_login()
    {
        //check if user is logged in.
        //if user is logged in, continue
    //else redirect to login page
    }
}