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
            $this->backupDatabase();
        }
        else
        {
            $this->backupView('database');
            parent::display();
        }
    }
    
    public function backupView($type)
    {

        $proc_url = FALSE;
        $backup = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        switch($type)
        {
            case 'database':
                $proc_url = 'fdsa';//ee('CP/URL', 'addons/settings/backup_pro/backup_database');
                $errors = $this->services['errors']->clearErrors()->checkWorkingDirectory($this->settings['working_directory'])
                                                 ->checkStorageLocations($this->settings['storage_details'])
                                                 ->getErrors();
                break;
            case 'files':
                $proc_url = ee('CP/URL', 'addons/settings/backup_pro/backup_files');
                $errors = $this->services['errors']->clearErrors()->checkWorkingDirectory($this->settings['working_directory'])
                                                 ->checkStorageLocations($this->settings['storage_details'])
                                                 ->checkFileBackupLocations($this->settings['backup_file_location'])
                                                 ->getErrors();
                break;
        }
    
        if(!$proc_url)
        {
            $this->redirect_after = self::$currentIndex.'&section=storage&can_not_backup=yes&token='.$this->token;;
            $this->redirect();
        }
    
        //ee()->cp->add_js_script('ui', 'progressbar');
        //ee()->javascript->output('$("#progressbar").progressbar({ value: 0 });');
        //ee()->javascript->compile();
    
        $variables = array('proc_url' => $proc_url);
        $variables['errors'] = $this->errors;
        $variables['pre_backup_errors'] = $errors;
        $variables['proc_url'] = $proc_url;
        //$vars['url_base'] = $this->url_base;
        $variables['backup_type'] = $type;
        //$vars['menu_data'] = ee()->backup_pro->get_dashboard_view_menu();
        $variables['method'] = '';
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('backup.tpl');
        $this->context->smarty->assign(array('content' => $content));
    }
    
    public function backupDatabase()
    {
        @session_write_close();
        $error = $this->services['errors'];
        $backup = $this->services['backup']->setStoragePath($this->settings['working_directory']);
        $error->clearErrors()->checkStorageLocations($this->settings['storage_details'])
                             ->checkWorkingDirectory($this->settings['working_directory'])
                             ->checkBackupDirs($backup->getStorage());
        if( $error->totalErrors() == '0' )
        {
            ini_set('memory_limit', -1);
            set_time_limit(0);
        
            $db_info = $this->platform->getDbCredentials();
            if( $backup->setDbInfo($db_info)->database($db_info['database'], $this->settings, $this->services['shell']) )
            {
                $backups = $this->services['backups']->setBackupPath($this->settings['working_directory'])
                ->getAllBackups($this->settings['storage_details']);
        
                $backup->getStorage()->getCleanup()->setStorageDetails($this->settings['storage_details'])
                                    ->setBackups($backups)
                                    ->setDetails($this->services['backups']->getDetails())
                                    ->autoThreshold($this->settings['auto_threshold'])
                                    ->counts($this->settings['max_db_backups'])
                                    ->duplicates($this->settings['allow_duplicates']);
        
                $this->redirect_after = $this->context->link->getAdminLink('AdminBackupProDashboard').'&section=db_backups&backup_complete=yes';
                $this->redirect();
            }
        }
        else
        {
            ee()->session->set_flashdata('message_error', $this->services['lang']->__($error->getError()));
            ee()->functions->redirect($this->url_base.'db_backups');
        }        
    }
}