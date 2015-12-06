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
                $this->download();
            break;
        }
    }
    
    /**
     * Download a backup action
     */
    public function download()
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
            //$new_name = $backup->getStorage()->makePrettyFilename($file_name, $type, craft()->config->get('siteName'));
            $this->services['files']->fileDownload($download_file_path);
            exit;
        }
        else
        {
            ee()->session->set_flashdata('message_error', $this->services['lang']->__('db_backup_not_found'));
            ee()->functions->redirect($this->url_base.'index');
        }
    }   
    

    /**
     * AJAX Action for updating a backup note
     */
    public function update_backup_note()
    {
        $encrypt = $this->services['encrypt'];
        $file_name = $encrypt->decode(ee()->input->get_post('backup'));
        $backup_type = ee()->input->get_post('backup_type');
        $note_text = ee()->input->get_post('note_text');
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
    public function delete_backups()
    {
        $delete_backups = ee()->input->get_post('backups');
        $type = ee()->input->get_post('type'); 
        $backups = $this->validateBackups($delete_backups, $type);
        if( $this->services['backups']->setBackupPath($this->settings['working_directory'])->removeBackups($backups) )
        {
            ee()->session->set_flashdata('message_success', $this->services['lang']->__('backups_deleted'));
            ee()->functions->redirect($this->url_base.'index');
        }
        else
        {
            ee()->session->set_flashdata('message_error', $this->services['lang']->__('backup_delete_failure'));
            ee()->functions->redirect($this->url_base.'index');
        }
    }
}