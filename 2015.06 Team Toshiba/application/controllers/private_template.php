<?php defined('SYSPATH') OR die('No direct access allowed.');
class Private_Template_Controller extends Public_Template_Controller {

function __construct(){
	parent::__construct();

	$this->template->body = view::factory('login');
}
}