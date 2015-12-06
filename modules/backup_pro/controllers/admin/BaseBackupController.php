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

    /**
     * Prepares the view for confirming backup action
     * @param string $type
     */
    public function backupView($type)
    {
        $proc_url = FALSE;
        $backup = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        switch($type)
        {
            case 'database':
                $errors = $this->services['errors']->clearErrors()->checkWorkingDirectory($this->settings['working_directory'])
                                                 ->checkStorageLocations($this->settings['storage_details'])
                                                 ->getErrors();
                break;
            case 'files':
                $errors = $this->services['errors']->clearErrors()->checkWorkingDirectory($this->settings['working_directory'])
                                                 ->checkStorageLocations($this->settings['storage_details'])
                                                 ->checkFileBackupLocations($this->settings['backup_file_location'])
                                                 ->getErrors();
                break;
        }
        
        $variables = array('proc_url' => $proc_url);
        $variables['errors'] = $this->errors;
        $variables['pre_backup_errors'] = $errors;
        $variables['proc_url'] = $proc_url; 
        $variables['backup_type'] = $type;
        $variables['method'] = '';
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('backup.tpl');
        $this->context->smarty->assign(array('content' => $content));
    }
}