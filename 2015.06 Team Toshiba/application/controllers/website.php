<?php defined('SYSPATH') or die ('No direct script access.');

class Website_Controller extends Template_Controller {
	public function __construct()
	{
		parent::__construct();

		$this->template->links = array
		(
			'Home' => 'home',
			'About' => 'about',
			'Products' => 'products',
			'Contact' => 'contract'
		);
	}
}