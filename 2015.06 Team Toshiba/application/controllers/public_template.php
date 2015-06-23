<?php defined('SYSPATH') or die('No direct script access.');
class Public_template_Controller extends Template_Controller {
	public $template = 'public_view_template';
    
   // $this->check_login();
    public function __construct()
    {
        parent::__construct();
        $this->template->styles = html::stylesheet('media/css/kube.min.css','screen');
        $this->template->scripts = html::script('media/js/jquery-1.11.3.js');
        
    }
    
    public function check_login()
    {
        //check if user is logged in.
        //if user is logged in, continue
    //else redirect to login page
    }
}