<?php defined('SYSPATH') or die('No direct script access.');
class Create_Request_Controller extends Private_Template_Controller {

    private $input;

    public function index()
	{
        $this->template->title = 'Add request';
        $this->template->message = '';
        $this->template->scripts .= html::script("media/js/create_request.js");
	$this->template->body->content = View::factory('admin/create_request');
	}
    
    public function process_createrequest()
    {
        $this->auto_render = false;
        $date_requested = $this->input->post('date_requested');
        $date_needed = $this->input->post('date_needed');
        $delivery_address = $this->input->post('delivery_address');
        $request_item = $this->input->post('request_item');
        $quantity = $this->input->post('quantity');
        $data = array($date_needed,$date_requested,$quantity,$delivery_address,$request_item);
        $post = new Validation($data);
        
        $post->add_rules('date_requested', 'required'); 
        $post->add_rules('date_needed', 'required');
        $post->add_rules('delivery_address', 'required');
        $post->add_rules('request_item', 'required');
        $post->add_rules('quantity', 'required');
        
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