<?php defined('SYSPATH') or die('No direct script access.');
class Create_supply_Controller extends Privatetemplate_Controller {
	
	public function index()
	{
		$this->template->title = 'Create A Supply';
        $this->template->message = '';
        $this->template->scripts = html::script("media/js/jquery-1.11.3.js");
        $this->template->scripts .= html::script("media/js/create_supply.js");
		$this->template->body = View::factory('admin/create_supply');
	}
    
    public function process_createsupply()
    {
        $this->auto_render = false;
        $item = $this->input->post('item');
        $description = $this->input->post('description');
        $hardware_type = $this->input->post('hardware_type');
        $number_of_supply = $this->input->post('number_of_supply');
         $date_acquired = $this->input->post('date_acquired');
        $price = $this->input->post('price');
        $manufacturer = $this->input->post('manufacturer');
        $status = $this->input->post('status');
        $data = array($item,$description,$hardware_type,$number_of_supply,$price, $manufacturer,$status);
        $post = new Validation($data);
        
        $post->add_rules('item', 'required'); 
        $post->add_rules('description', 'required');
        $post->add_rules('hardware_type', 'required');
        $post->add_rules('number_of_supply', 'required');
        $post->add_rules('price', 'required');
        $post->add_rules('date_acquired', 'required');
        $post->add_rules('manufacturer', 'required');
        $post->add_rules('status', 'required');
        
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