<?php defined('SYSPATH') or die('No direct script access.');
class Login_Controller extends Template_Controller {
	
	public function index()
	{
		$this->template->title = 'Login';
        $this->template->message = "";
        $this->template->scripts = html::script("media/js/jquery-1.11.3.js");
        $this->template->scripts .= html::script("media/js/login.js");
        $this->template->styles = html::stylesheet("media/css/login.css");
		$this->template->body = View::factory('login');
	}
    
    public function process_login()
    {   
        $db = new Database();
        //$this->auto_render = false;
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $data = array($user,$password);
        $post = new Validation($data);
        
        $post->add_rules('username', 'required'); 
        $post->add_rules('password', 'required');
        
        //validate input
        //check values to database
        //decrypt value from db and compare to password input
        if ( ! $username OR ! $password )
        {
            die ('name and password required');
        }
        $result = $db->query('SELECT * FROM tbl_users WHERE username = '.$username);
        if( empty($result))
        {
            die ('user '.$username .' not found.');
        }
        $result = current(result);
        if($result['password'] === $password)
        {
            echo 'Login Success!';
        } 
        else
        {
            echo 'invalid username or password.';
        }
    
        //if valid redirect to dashboard
        //else
        //redirect to login page.
        
        $user = new User_Model();
        $user->save();
        
        exit(json_encode($post->errors()));
    }

}