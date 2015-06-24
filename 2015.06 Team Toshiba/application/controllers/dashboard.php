<?php defined('SYSPATH') or die('No direct script access.');
class Dashboard_Controller extends Private_Template_Controller {
	
	public function index()
	{
        $this->template->title = 'OJT-Team_Toshiba:Home';
        $this->template->message = '';
        $this->template->body->content = View::factory('admin/dashboard.php');
	}
    
}