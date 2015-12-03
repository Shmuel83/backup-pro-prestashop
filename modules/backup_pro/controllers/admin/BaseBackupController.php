<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/BaseBackupController.php
 */
 
require_once 'BaseAdminController.php';

/**
 * Prestashop - Backup Pro Base Backup Controller
 *
 * Abstracts the file and database view 
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
abstract class BaseBackupController extends BaseAdminController
{
    public function backupView($type)
    {
        
    }
}