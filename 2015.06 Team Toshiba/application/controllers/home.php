<?php defined('SYSPATH') OR die('No direct access allowed.');

class Home_Controller extends Website_Controller {
	
	public function index()
	{
		$this->template->title = 'Merchant::Login';
		$this->template->content = new View('login');
		
	}
}