<?php defined('SYSPATH') or die('No direct script access.');
class Create_User_Controller extends Private_Template_Controller {

    private $input;

    public function index()
	{
        $this->template->title = 'Add User';
        $this->template->message = '';
        $this->template->scripts .= html::script("media/js/create_supply.js");
	$this->template->body->content = View::factory('admin/create_user');
	}
    
    public function process_createuser()
    {
        $this->auto_render = false;
        $firstname = $this->input->post('firstname');
        $lastname = $this->input->post('lastname');
        $email = $this->input->post('email');
        $address = $this->input->post('address');
        //gender
        $town_city = $this->input->post('town_city');
        $postal_code = $this->input->post('postal_code');
        //country
        $comp_address = $this->input->post('comp_address');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $data = array($firstname, $lastname, $email, $address, $town_city, 
                        $postal_code, $comp_address, $username, $password);
        $post = new Validation($data);
        
        $post->add_rules('firstname', 'required');
        $post->add_rules('lastname', 'required');
        $post->add_rules('email', 'required');
        $post->add_rules('address', 'required');
        //gender
        $post->add_rules('town_city', 'required');
        $post->add_rules('postal_code', 'required');
        //country
        $post->add_rules('comp_address', 'required');
        $post->add_rules('username', 'required');
        $post->add_rules('password', 'required');
        
        //validate input
        //check values to database
        //decrypt value from db and compare to password input
        
        //if valid redirect to dashboard
        //else
        //redirect to login page.
        
        //$user = new User_Model();
        //$user->save();
        //url::redirect('login');
        exit(json_encode($post->errors()));
    }

}