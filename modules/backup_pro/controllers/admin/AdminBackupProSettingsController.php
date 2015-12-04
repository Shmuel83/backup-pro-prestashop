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
     * The default Storage form field values
     * @var unknown
     */
    public $storage_form_data_defaults = array(
        'storage_location_name' => '',
        'storage_location_file_use' => '1',
        'storage_location_status' => '1',
        'storage_location_db_use' => '1',
        'storage_location_include_prune' => '1',
    );
    
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
                $this->storage();
            break;
            
            case 'settings':
            default:
                $this->settingsView();
            break;
        }
    
        parent::display();
    }
    
    protected function storage()
    {
        switch( $this->getPost('sub') )
        {
            
            case 'new_storage':
                $this->newStorageView();
            break; 
            
            case 'edit_storage':
                $this->editStorageView();
            break;
            
            case 'remove_storage':
                $this->removeStorageView();
            break;
            
            case 'view_storage':
            default:
                $this->viewStorageView();
            break;                
        }
    }
    
    protected function removeStorageView()
    {
        $storage_id = $this->getPost('id');
        $sub = $this->getPost('sub', 'view_storage');
        $section = $this->getPost('section', 'storage');
        if( count($this->settings['storage_details']) <= 1 )
        {
            $this->redirect_after = self::$currentIndex.'&section=storage&fail_min_storage_location_needs=yes&token='.$this->token;;
            $this->redirect();            
        }
        
        if( empty($this->settings['storage_details'][$storage_id]) )
        {
            $this->redirect_after = self::$currentIndex.'&section=storage&invalid_storage_id=yes&token='.$this->token;;
            $this->redirect();            
        }
        
        $storage_details = $this->settings['storage_details'][$storage_id];
        
        $variables = array();
        $variables['form_data'] = array('remove_remote_files' => '0');
        $variables['form_errors'] = array('remove_remote_files' => false);
        $variables['errors'] = $this->errors;
        $variables['available_storage_engines'] = $this->services['backup']->getStorage()->getAvailableStorageDrivers();
        $variables['storage_engine'] = $variables['available_storage_engines'][$storage_details['storage_location_driver']];
        $variables['storage_details'] = $storage_details;
        
        if( $_SERVER['REQUEST_METHOD'] == 'POST' )
        {
            $data = $_POST;
            $backups = $this->services['backups']->setBackupPath($this->settings['working_directory'])
                                                 ->getAllBackups($this->settings['storage_details'], $this->services['backup']->getStorage()->getAvailableStorageDrivers());
        
            if( $this->services['backup']->getStorage()->getLocations()->setSetting($this->services['settings'])->remove($storage_id, $data, $backups) )
            {
                $this->redirect_after = $this->context->link->getAdminLink('AdminBackupProSettings').'&section=storage&storage_removed=yes';
                $this->redirect();
            }
            else
            {
                $variables['form_errors'] = array_merge($variables['form_errors'], $settings_errors);
            }
        }
        
        $variables['section'] = 'storage';
        $variables['storage_id'] = $storage_id;
        $variables['active_tab'] = $section;
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('storage/remove.tpl');
        $this->context->smarty->assign(array('content' => $content));
    }
    
    protected function editStorageView()
    {
        $storage_id = $this->getPost('id');
        $sub = $this->getPost('sub', 'view_storage');
        $section = $this->getPost('section', 'storage');
        if( empty($this->settings['storage_details'][$storage_id]) )
        {
            $this->redirect_after = self::$currentIndex.'&section=storage&invalid_storage_id=yes&token='.$this->token;;
            $this->redirect();
        }
        
        $storage_details = $this->settings['storage_details'][$storage_id];
        
        $variables = array();
        $variables['storage_details'] = $storage_details;
        $variables['form_data'] = array_merge($this->storage_form_data_defaults, $storage_details);
        $variables['form_errors'] = $this->returnEmpty($storage_details); //array_merge($storage_details, $this->form_data_defaults);
        $variables['errors'] = $this->errors;
        $variables['available_storage_engines'] = $this->services['backup']->getStorage()->getAvailableStorageOptions();
        $variables['storage_engine'] = $variables['available_storage_engines'][$storage_details['storage_location_driver']];
        $variables['_form_template'] = './drivers/_'.$storage_details['storage_location_driver'];
        
        if(  $_SERVER['REQUEST_METHOD'] == 'POST' )
        {
            $data = $_POST;
            $variables['form_data'] = $data;
            $data['location_id'] = $storage_id;
            $settings_errors = $this->services['backup']->getStorage()->validateDriver($this->services['validate'], $storage_details['storage_location_driver'], $data, $this->settings['storage_details']);
            if( !$settings_errors )
            {
                if( $this->services['backup']->getStorage()->getLocations()->setSetting($this->services['settings'])->update($storage_id, $variables['form_data']) )
                {
                    $this->redirect_after = $this->context->link->getAdminLink('AdminBackupProSettings').'&section=storage&updated=yes';
                    $this->redirect();
                }
            }
            else
            {
                $variables['form_errors'] = array_merge($variables['form_errors'], $settings_errors);
            }
        }
        
        $variables['section'] = 'storage';
        $variables['storage_id'] = $storage_id;
        $variables['active_tab'] = $section;  
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('storage/edit.tpl');
        $this->context->smarty->assign(array('content' => $content));       
    }
    
    protected function newStorageView()
    {
        $sub = $this->getPost('sub', 'view_storage');
        $engine = $this->getPost('engine', 'local');
        $section = $this->getPost('section', 'storage');
        $variables = array();
        $variables['available_storage_engines'] = $this->services['backup']->getStorage()->getAvailableStorageDrivers();
        
        if( !isset($variables['available_storage_engines'][$engine]) )
        {
            $engine = 'local';
        }
        
        $variables['storage_details'] = $this->settings['storage_details'];
        $variables['storage_engine'] = $variables['available_storage_engines'][$engine];
        $variables['form_data'] = array_merge($this->settings, $variables['storage_engine']['settings'], $this->storage_form_data_defaults);
        $variables['form_errors'] = array_merge($this->returnEmpty($this->settings), $this->returnEmpty($variables['storage_engine']['settings']), $this->storage_form_data_defaults);
        $variables['form_has_errors'] = false;
        if(  $_SERVER['REQUEST_METHOD'] == 'POST' )
        {
            $data = $_POST;
            $variables['form_data'] = $data;
            $settings_errors = $this->services['backup']->getStorage()->validateDriver($this->services['validate'], $engine, $data, $this->settings['storage_details']);
            if( !$settings_errors )
            {
                if( $this->services['backup']->getStorage()->getLocations()->setSetting($this->services['settings'])->create($engine, $variables['form_data']) )
                {
                    $this->redirect_after = $this->context->link->getAdminLink('AdminBackupProSettings').'&section=storage&added=yes';
                    $this->redirect();
                }
            }
            else
            {
                $variables['form_has_errors'] = true;
                $variables['form_errors'] = array_merge($variables['form_errors'], $settings_errors);
            }
        }
        
        $variables['errors'] = $this->errors;
        $variables['_form_template'] = false;
        if( $variables['storage_engine']['obj']->hasSettingsView() )
        {
            $variables['_form_template'] = './drivers/_'.$engine;
        }
        
        $variables['section'] = 'storage';
        $variables['engine'] = $engine;
        $variables['section'] = 'storage';
        $variables['active_tab'] = $section;
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('storage/new.tpl');
        $this->context->smarty->assign(array('content' => $content));    
    }
    
    /**
     * The default Storage Locations view
     */
    protected function viewStorageView()
    {
        $sub = $this->getPost('sub', 'view_storage');
        $section = $this->getPost('section', 'storage');
        $invalid_storage_id = $this->getPost('invalid_storage_id', 'no');
        $fail_min_storage_location_needs = $this->getPost('fail_min_storage_location_needs', 'no');
        $storage_removed = $this->getPost('storage_removed', 'no');
        $updated = $this->getPost('updated', 'no');
        $added = $this->getPost('added', 'no');
        $variables = array();
        $variables['can_remove'] = true;
        if( count($this->settings['storage_details']) <= 1 )
        {
            $variables['can_remove'] = false;
        }
        
        $variables['errors'] = $this->errors;
        $variables['available_storage_engines'] = $this->services['backup']->getStorage()->getAvailableStorageDrivers();
        $variables['storage_details'] = $this->settings['storage_details'];
        $variables['section'] = 'storage';
        $variables['active_tab'] = $section;
        $variables['invalid_storage_id'] = $invalid_storage_id;
        $variables['fail_min_storage_location_needs'] = $fail_min_storage_location_needs;
        $variables['storage_removed'] = $storage_removed;
        $variables['updated'] = $updated;
        $variables['added'] = $added;
        $variables['fail_min_storage_location_needs'] = $fail_min_storage_location_needs;
        
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent('storage.tpl');
        $this->context->smarty->assign(array('content' => $content));
    }
    
    /**
     * The Backup Pro Settings view
     * 
     * Handles displaying and processing settings 
     */
    protected function settingsView()
    {
        $section = $this->getPost('section', 'general');
        $update = $this->getPost('update', 'no');
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
                if( $this->services['settings']->update($data) )
                {
                    $this->redirect_after = self::$currentIndex.'&section='.$section.'&update=yes&token='.$this->token;;
                    $this->redirect();
                }
            }
            else
            {
                $variables['form_has_errors'] = true;
                $variables['form_errors'] = array_merge($variables['form_errors'], $settings_errors);
            }
        }
        
        $variables['section'] = $section;
        $variables['update'] = $update;
        $variables['db_tables'] = $this->services['db']->getTables();
        $variables['backup_cron_commands'] = $this->platform->getBackupCronCommands($this->settings);
        $variables['ia_cron_commands'] = $this->platform->getIaCronCommands($this->settings);
        $variables['errors'] = $this->errors;
        $variables['threshold_options'] = $this->services['settings']->getAutoPruneThresholdOptions();
        $variables['available_db_backup_engines'] = $this->services['backup']->getDataBase()->getAvailableEnginesOptions();
        
        $variables['view_helper'] = $this->view_helper;
        $variables['active_tab'] = $section;
        $this->context->smarty->assign( $variables );
        $content = $this->prepareContent($this->bp_template);
        $this->context->smarty->assign(array('content' => $content));
    }
}