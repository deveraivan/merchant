<?php defined('SYSPATH') or die('No direct script access.');
class Login_Controller extends Private_Template_Controller {
	
	public function index()
	{
        //$this->session->get('id');
       	//$this->template->title = 'Login::Merchant';
        $this->template->body = view::factory('login');
	}
    
    public function process_login()
    {   
    	$this->session = Session::instance();
      	
        $username = Kohana::debug($this->input->get('username','default_valie'));
        $user = new Tbl_User_Model();   
        $get_user = $user->get_user($username);
       
        $password = Kohana::debug($this->input->get('password','default_valie'));    
        if ($get_user->loaded==TRUE)
        {
        	$password = $get_user->password;
        	if ($password == $password)
        	{
        		$_SESSION['username'] =$get_user->username;
                $_SESSION['password'] =$get_user->password;
                
        		echo 'Login Success!';
        	}
        	else
        	{
        		echo 'Login Failed!';
        	} 
        	if (! $username OR ! $password )
        	{
        		echo 'name and password required';
        	}
        }
    }

}