<?php  
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/AdminBackupProSettingsController.php
 */

require_once 'BaseAdminController.php';

/**
 * Prestashop - Backup Pro Settings Controller
 *
 * Contains the methods for updating Backup Pro settings
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
class AdminBackupProSettingsController extends BaseAdminController
{
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = 'settings.tpl';

    /**
     * Our actual "Action" method
     */
    public function display()
    {
        switch( $this->getPost('section') )
        {
            case 'storage':
                $this->fileBackupView();
            break;
            
            case 'settings':
            default:
                $this->settings();
            break;
        }
    
        parent::display();
    }
    
    protected function settings()
    {
        $section = $this->getPost('section', 'general');
        $variables = array('form_data' => $this->settings, 'form_errors' => $this->returnEmpty($this->settings));
        $variables['form_data']['cron_notify_emails'] = implode("\n", $this->settings['cron_notify_emails']);
        $variables['form_data']['exclude_paths'] = implode("\n", $this->settings['exclude_paths']);
        $variables['form_data']['backup_file_location'] = implode("\n", $this->settings['backup_file_location']);
        $variables['form_data']['db_backup_archive_pre_sql'] = implode("\n", $this->settings['db_backup_archive_pre_sql']);
        $variables['form_data']['db_backup_archive_post_sql'] = implode("\n", $this->settings['db_backup_archive_post_sql']);
        $variables['form_data']['db_backup_execute_pre_sql'] = implode("\n", $this->settings['db_backup_execute_pre_sql']);
        $variables['form_data']['db_backup_execute_post_sql'] = implode("\n", $this->settings['db_backup_execute_post_sql']);
        $variables['form_data']['backup_missed_schedule_notify_emails'] = implode("\n", $this->settings['backup_missed_schedule_notify_emails']);
        $variables['form_has_errors'] = false;
        if( $_SERVER['REQUEST_METHOD'] == 'POST' )
        {
            $data = $_POST;
        
            $variables['form_data'] = array_merge(array('db_backup_ignore_tables' => '', 'db_backup_ignore_table_data' => ''), $data);
            $backup = $this->services['backups'];
            $backups = $backup->setBackupPath($this->settings['working_directory'])->getAllBackups($this->settings['storage_details']);
            $data['meta'] = $backup->getBackupMeta($backups);
            $extra = array('db_creds' => $this->platform->getDbCredentials());
            $settings_errors = $this->services['settings']->validate($data, $extra);
            if( !$settings_errors )
            {
                echo 'f';
                exit;
            }
            else
            {
                $variables['form_has_errors'] = true;
                $variables['form_errors'] = array_merge($variables['form_errors'], $settings_errors);
            }
        }
        
        $variables['section']= $section;
        $variables['db_tables'] = $this->services['db']->getTables();
        $variables['backup_cron_commands'] = $this->platform->getBackupCronCommands($this->settings);
        $variables['ia_cron_commands'] = $this->platform->getIaCronCommands($this->settings);
        $variables['errors'] = $this->errors;
        $variables['threshold_options'] = $this->services['settings']->getAutoPruneThresholdOptions();
        $variables['available_db_backup_engines'] = $this->services['backup']->getDataBase()->getAvailableEnginesOptions();
        //$variables['menu_data'] = $this->backup_lib->getSettingsViewMenu();
        
        $variables['view_helper'] = $this->view_helper;
        $variables['active_tab'] = $section;
        //$variables['url_base'] = $this->url_base;
        //$variables['theme_folder_url'] = plugin_dir_url(self::name);
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array('content' => $content));
    }
}