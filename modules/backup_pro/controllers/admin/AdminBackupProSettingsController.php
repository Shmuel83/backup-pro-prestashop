<?php  
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProSettingsController.php
 */

require_once 'BaseAdminController.php';

/**
 * Prestashop - Backup Pro Settings Controller
 *
 * Contains the methods for updating Backup Pro settings
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProSettingsController extends BaseAdminController
{
    protected $bp_template = 'settings.tpl';
    
    public function display()
    {
        $path = _MODULE_DIR_."backup_pro";
        $this->context->smarty->assign(array('test_var' => 'fdsafdsa'));
        $content = $this->module->display($path, 'views/templates/admin/dashboard.tpl');
        $this->context->smarty->assign(array('content' => $content));
        //$this->template = 'dashboard.tpl';
        parent::display();
    }
    
    public function renderList() {
        $return = $this->context->smarty->fetch(dirname(__FILE__) . '\adminyourmodule.tpl');             
        return $return;
    }
}