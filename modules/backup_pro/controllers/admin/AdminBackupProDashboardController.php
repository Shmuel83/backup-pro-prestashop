<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProDashboardController.php
 */
require_once 'BaseAdminController.php';

/**
 * Prestashop - Backup Pro Dashboard Controller
 *
 * Displays the Backup Pro Dashboard
 *
 * @package mithra62\BackupPro
 * @author Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProDashboardController extends BaseAdminController
{

    /**
     * The main base template we're using
     * 
     * @var string
     */
    protected $bp_template = 'dashboard.tpl';

    /**
     * Our actual "Action" method
     */
    public function display()
    {
        switch ($this->platform->getPost('section')) {
            case 'db_backups':
                $this->dbBackupView();
                break;
            
            case 'file_backups':
                $this->fileBackupView();
                break;
            
            case 'restore_confirm':
                $this->restoreDbView();
                break;
            
            case 'restore_db':
                
                break;
            
            case 'remove_confirm':
                $this->removeBackupView();
                break;
            
            default:
                $this->dashboardView();
                break;
        }
        
        parent::display();
    }

    /**
     * The Backup Pro Dashboard Action
     */
    protected function dashboardView()
    {
        $backup = $this->services['backups'];
        $backups = $backup->setBackupPath($this->settings['working_directory'])->getAllBackups($this->settings['storage_details']);
        
        $backup_meta = $backup->getBackupMeta($backups);
        $available_space = $backup->getAvailableSpace($this->settings['auto_threshold'], $backups);
        
        $backups = $backups['database'] + $backups['files'];
        krsort($backups, SORT_NUMERIC);
        
        if (count($backups) > $this->settings['dashboard_recent_total']) {
            // we have to remove a few
            $filtered_backups = array();
            $count = 1;
            foreach ($backups as $time => $backup) {
                $filtered_backups[$time] = $backup;
                if ($count >= $this->settings['dashboard_recent_total']) {
                    break;
                }
                $count ++;
            }
            $backups = $filtered_backups;
        }
        
        $variables = array(
            'settings' => $this->settings,
            'backup_meta' => $backup_meta,
            'backups' => $backups,
            'available_space' => $available_space,
            'errors' => $this->errors,
            'enable_delete' => 'no',
            'enable_type' => 'yes',
            'enable_actions' => 'yes',
            'enable_editable_note' => 'yes',
            'database_restored' => $this->platform->getPost('database_restored', 'no')
        );
        
        $this->context->smarty->assign($variables);
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array(
            'content' => $content
        ));
    }

    /**
     * The Backup Pro Database Backup View Action
     */
    protected function dbBackupView()
    {
        $backup_complete = $this->platform->getPost('backup_complete', 'no');
        $backup = $this->services['backups'];
        $backups = $backup->setBackupPath($this->settings['working_directory'])->getAllBackups($this->settings['storage_details']);
        $backup_meta = $backup->getBackupMeta($backups);
        
        $variables = array(
            'settings' => $this->settings,
            'backup_meta' => $backup_meta,
            'backups' => $backups,
            'errors' => $this->errors,
            'section' => 'db_backups',
            'active_tab' => 'db_backups',
            'backup_complete' => $backup_complete,
            'enable_delete' => 'yes',
            'enable_type' => 'yes',
            'enable_actions' => 'yes',
            'enable_editable_note' => 'yes',
            'bad_restore_filename' => $this->platform->getPost('bad_restore_filename', 'no')
        );
        
        $this->bp_template = 'database_backups.tpl';
        $this->context->smarty->assign($variables);
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array(
            'content' => $content
        ));
    }

    /**
     * The File Backup list view
     */
    protected function fileBackupView()
    {
        $backup_complete = $this->platform->getPost('backup_complete', 'no');
        $backup = $this->services['backups'];
        $backups = $backup->setBackupPath($this->settings['working_directory'])->getAllBackups($this->settings['storage_details']);
        $backup_meta = $backup->getBackupMeta($backups);
        
        $variables = array(
            'settings' => $this->settings,
            'backup_meta' => $backup_meta,
            'backups' => $backups,
            'errors' => $this->errors,
            'section' => 'file_backups',
            'active_tab' => 'file_backups',
            'backup_complete' => $backup_complete,
            'enable_delete' => 'yes',
            'enable_type' => 'yes',
            'enable_actions' => 'yes',
            'enable_editable_note' => 'yes',
            'bad_restore_filename' => $this->platform->getPost('bad_restore_filename', 'no')
        );
        
        $this->bp_template = 'file_backups.tpl';
        $this->context->smarty->assign($variables);
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array(
            'content' => $content
        ));
    }

    /**
     * The Restore Database view
     */
    protected function restoreDbView()
    {
        $encrypt = $this->services['encrypt'];
        $file_name = $encrypt->decode($this->platform->getPost('id'));
        if ($file_name == '') {
            $this->redirect_after = self::$currentIndex . '&section=db_backups&bad_restore_filename=yes&token=' . $this->token;
            ;
            $this->redirect();
        }
        
        $storage = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        
        $file = $storage->getStorage()->getDbBackupNamePath($file_name);
        $backup_info = $this->services['backups']->setLocations($this->settings['storage_details'])->getBackupData($file);
        $variables = array(
            'settings' => $this->settings,
            'backup' => $backup_info,
            'errors' => $this->errors,
            'active_tab' => 'db_backups',
            'method' => $this->platform->getPost('method')
        );
        
        $this->bp_template = 'restore_confirm.tpl';
        $this->context->smarty->assign($variables);
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array(
            'content' => $content
        ));
    }

    /**
     * The Remove Backup view
     */
    protected function removeBackupView()
    {
        $delete_backups = $this->platform->getPost('backups');
        $type = $this->platform->getPost('type');
        $backups = $this->validateBackups($delete_backups, $type);
        $variables = array(
            'settings' => $this->settings,
            'backups' => $backups,
            'backup_type' => $type,
            'method' => $this->platform->getPost('method'),
            'errors' => $this->errors,
            'active_tab' => 'db_backups',
            'enable_type' => 'yes',
            'enable_editable_note' => 'no',
            'enable_actions' => 'no',
            'enable_delete' => 'no'
        );
        
        $this->bp_template = 'delete_confirm.tpl';
        $this->context->smarty->assign($variables);
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array(
            'content' => $content
        ));
    }
}