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
 * @package mithra62\BackupPro
 * @author Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProBackupDatabaseController extends BaseBackupController
{

    /**
     * The main base template we're using
     * 
     * @var string
     */
    protected $bp_template = 'backup.tpl';

    /**
     * Our actual "Action" method
     */
    public function display()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->backupDatabase();
        } else {
            $this->backupView('database');
            parent::display();
        }
    }

    public function backupDatabase()
    {
        @session_write_close();
        $error = $this->services['errors'];
        $backup = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        $error->clearErrors()
            ->checkStorageLocations($this->settings['storage_details'])
            ->checkWorkingDirectory($this->settings['working_directory'])
            ->checkBackupDirs($backup->getStorage());
        if ($error->totalErrors() == '0') {
            ini_set('memory_limit', - 1);
            set_time_limit(0);
            
            $db_info = $this->platform->getDbCredentials();
            if ($backup->setDbInfo($db_info)->database($db_info['database'], $this->settings, $this->services['shell'])) {
                $backups = $this->services['backups']->setBackupPath($this->settings['working_directory'])->getAllBackups($this->settings['storage_details']);
                
                $backup->getStorage()
                    ->getCleanup()
                    ->setStorageDetails($this->settings['storage_details'])
                    ->setBackups($backups)
                    ->setDetails($this->services['backups']->getDetails())
                    ->autoThreshold($this->settings['auto_threshold'])
                    ->counts($this->settings['max_db_backups'])
                    ->duplicates($this->settings['allow_duplicates']);
                
                $this->platform->redirect($this->context->link->getAdminLink('AdminBackupProDashboard') . '&section=db_backups&backup_complete=yes');
            }
        } else {
            $this->platform->redirect($this->context->link->getAdminLink('AdminBackupProDashboard') . '&section=db_backups&backup_system_errors=yes');
        }
    }
}