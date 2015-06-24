<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Default Kohana controller. This controller should NOT be used in production.
 * It is for demonstration purposes only!
 *
 * @package    Core
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Left_Navigation_Controller extends Private_Template_Controller {


function __construct(){
	parent::__construct();
	
	//$this->template->scripts = script();
    $this->template->styles = html::stylesheet('media/css/left-menu.css','screen');
	
}	public function index()
	{
		// In Kohana, all views are loaded and treated as objects.
            //$this->template->body->content = 
            $this->template->body->content = view::factory('includes/left-navigation');
	}


} // End Welcome Controller