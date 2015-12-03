<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProBackupDatabaseController.php
 */
 
require_once 'BaseBackupController.php';

/**
 * Prestashop - Backup Pro Backup Database Controller
 *
 * Displays the Backup Pro Backup Database Page
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProBackupDatabaseController extends BaseBackupController
{
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = 'backup.tpl';
    
    /**
     * Our actual "Action" method
     */
    public function display()
    {
        if( $_SERVER['REQUEST_METHOD'] == 'POST' )
        {
            
        }
        else
        {
            $this->backupView();
            parent::display();
        }
    }
    
    public function backupView()
    {


        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('backup.tpl');
        $this->context->smarty->assign(array('content' => $content));
    }
}