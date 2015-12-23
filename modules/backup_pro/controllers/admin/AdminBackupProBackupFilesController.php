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
class AdminBackupProBackupFilesController extends BaseBackupController
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
            $this->backupFiles();
        }
        else
        {
            $this->backupView('files');
            parent::display();
        }
    }
    
    public function backupFiles()
    {
        @session_write_close();
        $error = $this->services['errors'];
        $backup = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        $error->clearErrors()->checkStorageLocations($this->settings['storage_details'])
              ->checkBackupDirs($backup->getStorage())
              ->checkWorkingDirectory($this->settings['working_directory'])
              ->checkFileBackupLocations($this->settings['backup_file_location']);
        if( $error->totalErrors() == 0 )
        {
            ini_set('memory_limit', -1);
            set_time_limit(0);
            if( $backup->files($this->settings, $this->services['files'], $this->services['regex']) )
            {
                $backups = $this->services['backups']->setBackupPath($this->settings['working_directory'])
                                ->getAllBackups($this->settings['storage_details']);
    
                $backup->getStorage()->getCleanup()->setStorageDetails($this->settings['storage_details'])
                                     ->setBackups($backups)
                                     ->setDetails($this->services['backups']->getDetails())
                                     ->autoThreshold($this->settings['auto_threshold'])
                                     ->counts($this->settings['max_file_backups'], 'files')
                                     ->duplicates($this->settings['allow_duplicates']);
                
                $this->platform->redirect($this->context->link->getAdminLink('AdminBackupProDashboard').'&section=file_backups&backup_complete=yes');
            }
        }
        else
        {
            
            $this->platform->redirect($this->context->link->getAdminLink('AdminBackupProDashboard').'&section=file_backups&backup_system_errors=yes');
        }       
    }
}