<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProManageController.php
 */
 
require_once 'BaseBackupController.php';

/**
 * Prestashop - Backup Pro Backup Manage Controller
 *
 * Displays the Backup Pro Backup Manage Actions
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProManageController extends BaseAdminController
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

    }
}