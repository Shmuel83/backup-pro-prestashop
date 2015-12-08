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
        switch( $this->getPost('section') )
        {
            case 'download':
                $this->downloadAction();
            break;
            
            case 'remove_backup':
                $this->deleteBackupsAction();
            break;
            
            case 'backup_note':
                $this->updateBackupNoteAction();
            break;
            
            case 'restore_db':
                $this->restoreDbAction();
            break;
                
        }
    }

    /**
     * Restore database action
     */
    public function restoreDbAction()
    {
        $encrypt = $this->services['encrypt'];
        $file_name = $encrypt->decode($this->getPost('id'));
        $storage = $this->services['backup']->setStoragePath($this->settings['working_directory']);
    
        $file = $storage->getStorage()->getDbBackupNamePath($file_name);
        $backup_info = $this->services['backups']->setLocations($this->settings['storage_details'])->getBackupData($file);
        $restore_file_path = false;
        foreach($backup_info['storage_locations'] AS $storage_location)
        {
            if( $storage_location['obj']->canRestore() )
            {
                $restore_file_path = $storage_location['obj']->getFilePath($backup_info['file_name'], $backup_info['backup_type']); //next, get file path
                break;
            }
        }
    
        if($restore_file_path && file_exists($restore_file_path))
        {
            $db_info = $this->platform->getDbCredentials();
            if( $this->services['restore']->setDbInfo($db_info)->setBackupInfo($backup_info)->database($db_info['database'], $restore_file_path, $this->settings, $this->services['shell']) )
            {
                Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProDashboard').'&database_restored=yes');
            }
        }
        else
        {
                Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProDashboard').'&database_restored=fail');
        }
    }
    
    /**
     * Download a backup action
     */
    public function downloadAction()
    {
        $encrypt = $this->services['encrypt'];
        $file_name = $encrypt->decode($this->getPost('id'));
        $type = $this->getPost('type');
        $storage = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        if($type == 'files')
        {
            $file = $storage->getStorage()->getFileBackupNamePath($file_name);
        }
        else
        {
            $file = $storage->getStorage()->getDbBackupNamePath($file_name);
        }
    
    
        $backup_info = $this->services['backups']->setLocations($this->settings['storage_details'])->getBackupData($file);
        $download_file_path = false;
        if( !empty($backup_info['storage_locations']) && is_array($backup_info['storage_locations']) )
        {
            foreach($backup_info['storage_locations'] AS $storage_location)
            {
                if( $storage_location['obj']->canDownload() )
                {
                    $download_file_path = $storage_location['obj']->getFilePath($backup_info['file_name'], $backup_info['backup_type']); //next, get file path
                    break;
                }
            }
        }
    
        if($download_file_path && file_exists($download_file_path))
        {
            $this->services['files']->fileDownload($download_file_path);
            exit;
        }
        else
        {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProDashboard').'&backup_download_fail=yes');
        }
    }   
    

    /**
     * AJAX Action for updating a backup note
     */
    public function updateBackupNoteAction()
    {
        $encrypt = $this->services['encrypt'];
        $file_name = $encrypt->decode($this->getPost('backup'));
        $backup_type = $this->getPost('backup_type');
        $note_text = $this->getPost('note_text');
        if($note_text && $file_name)
        {
            $path = rtrim($this->settings['working_directory'], DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$backup_type;
            $this->services['backup']->getDetails()->addDetails($file_name, $path, array('note' => $note_text));
            echo json_encode(array('success'));
        }
        exit;
    }
    
    /**
     * Delete Backup Action
     */
    public function deleteBackupsAction()
    {
        $delete_backups = $this->getPost('backups');
        $type = $this->getPost('type'); 
        $backups = $this->validateBackups($delete_backups, $type);
        if( $this->services['backups']->setBackupPath($this->settings['working_directory'])->removeBackups($backups) )
        {

            Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProDashboard').'&backups_removed=yes');
        }
        else
        {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProDashboard').'&backups_remove_fail=yes');
        }
    }
}