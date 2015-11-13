<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProDashboardController.php
 */
 
require_once 'BaseAdminController.php';

/**
 * Prestashop - Backup Pro Dashboard Controller
 *
 * Displays the Backup Pro Dashboard
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProDashboardController extends BaseAdminController
{
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = 'dashboard.tpl';
    
    /**
     * Our actual "Action" method
     */
    public function display()
    {
        $this->context->smarty->assign(array('test_var' => 'test')); 
        $content = $this->module->display($this->bp_template_path, 'views/templates/admin/dashboard.tpl');
        $this->context->smarty->assign(array('content' => $content));
        //$this->template = 'dashboard.tpl';
        parent::display();
    }

}