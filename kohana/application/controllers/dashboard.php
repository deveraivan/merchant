<?php defined('SYSPATH') or die('No direct script access.');
class Dashboard_Controller extends Privatetemplate_Controller {
	
	public function index()
	{
		$this->template->title = 'Login';
        $this->template->message = '';
        $this->template->scripts = html::script("media/js/jquery-1.11.3.js");
        $this->template->scripts .= html::script("media/js/login.js");
		$this->template->body = View::factory('login');
	}
    
    public function process_login()
    {
        $this->auto_render = false;
        $user = $this->input->post('username');
        $password = $this->input->post('password');
        $data = array($user,$password);
        $post = new Validation($data);
        
        $post->add_rules('username', 'required'); 
        $post->add_rules('password', 'required');
        
        //validate input
        //check values to database
        //decrypt value from db and compare to password input
        
        //if valid redirect to dashboard
        //else
        //redirect to login page.
        exit(json_encode($post->errors()));
    }

}