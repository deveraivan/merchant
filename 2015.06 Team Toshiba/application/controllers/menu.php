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
class Menu_Controller extends Private_Template_Controller {


	public function index()
	{
		// In Kohana, all views are loaded and treated as objects.
		$this->template->body->content = view::factory('includes/menu');
	}


} // End Welcome Controller