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
class Private_Template_Controller extends Public_Template_Controller {

function __construct(){
	parent::__construct();
	
	//$this->template->scripts = script();
    $this->template->styles = html::stylesheet('media/css/kube.min.css','screen');
    $this->template->scripts = html::scripts('media/js/jquery-1.11.3.js');
    $this->template->body = view::factory('private_view_template');
	
}


} // End Welcome Controller