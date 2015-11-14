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
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = 'settings.tpl';
    
    /**
     * Our actual "Action" method
     */
    public function display()
    {
        $this->context->smarty->assign(array('test_var' => 'fdsafdsa'));
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array('content' => $content));
        parent::display();
    }
}