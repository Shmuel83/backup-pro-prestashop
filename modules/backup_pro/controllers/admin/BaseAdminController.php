<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/BaseAdminController.php
 */
require_once realpath(dirname(__FILE__) . '/../../libraries/vendor/autoload.php');

use mithra62\BackupPro\Platforms\Controllers\Prestashop as PrestashopController;

/**
 * Prestashop - Backup Pro Base Controller
 *
 * Contains all the actions for viewing Backups
 *
 * @package mithra62\BackupPro
 * @author Eric Lamb <eric@mithra62.com>
 */
abstract class BaseAdminController extends PrestashopController implements \mithra62\BackupPro\BackupPro
{

    /**
     * The main base template we're using
     * 
     * @var string
     */
    protected $bp_template = false;

    /**
     * The path to our template directory
     * 
     * @var unknown
     */
    protected $bp_template_path = false;

    /**
     * Set it up
     */
    public function __construct()
    {
        $this->bootstrap = true;
        parent::__construct();
        $this->context->smarty->assign(array(
            'settings' => $this->settings,
            'bp_errors' => $this->bp_errors,
            'active_tab' => 'dashboard'
        ));
        
        $this->context->smarty->registerPlugin('modifier', 'm62Lang', array(
            $this->view_helper,
            'm62Lang'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62FileSize', array(
            $this->view_helper,
            'm62FileSize'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62DateTime', array(
            $this->view_helper,
            'm62DateTime'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62Encode', array(
            $this->view_helper,
            'm62Encode'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62Decode', array(
            $this->view_helper,
            'm62Decode'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62FormErrors', array(
            $this->view_helper,
            'm62FormErrors'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62TimeFormat', array(
            $this->view_helper,
            'm62TimeFormat'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62RelativeDateTime', array(
            $this->view_helper,
            'm62RelativeDateTime'
        ));
        $this->context->smarty->registerPlugin('modifier', 'm62Options', array(
            $this->view_helper,
            'm62Options'
        ));
        $this->bp_template_path = _MODULE_DIR_ . "backup_pro";
    }

    public function initContent()
    {
        $this->initTabModuleList();
        if (! $this->loadObject(true)) {
            return;
        }
        
        // grab the backup details
        $backup = $this->services['backups'];
        $backups = $backup->setBackupPath($this->settings['working_directory'])
                            ->getAllBackups($this->settings['storage_details']);
        $backup_meta = $backup->getBackupMeta($backups);
        
        $this->initToolbar();
        $this->initPageHeaderToolbar();
        $this->context->smarty->assign(array(
            'localization_form' => $this->renderForm(),
            'localization_options' => $this->renderOptions(),
            'url_post' => self::$currentIndex . '&token=' . $this->token,
            'show_page_header_toolbar' => $this->show_page_header_toolbar,
            'page_header_toolbar_title' => $this->page_header_toolbar_title,
            'page_header_toolbar_btn' => $this->page_header_toolbar_btn,
            'note_url' => $this->context->link->getAdminLink('AdminBackupProManage') . '&section=backup_note',
           // 'help_link' => 'https://www.mithra62.com/docs/table-of-contents/backup-pro',
            'backup_meta' => $backup_meta,
            'last_database_backup_rel_time' => 
                $this->view_helper->m62RelativeDateTime($backup_meta['database']['newest_backup_taken_raw']),
            'database_backup_url' => $this->context->link->getAdminLink('AdminBackupProBackupDatabase'),
            'last_file_backup_rel_time' => 
                $this->view_helper->m62RelativeDateTime($backup_meta['files']['newest_backup_taken_raw']),
            'file_backup_url' => $this->context->link->getAdminLink('AdminBackupProBackupFiles')
        ));
    }

    public function setMedia()
    {
        $this->addJquery();
        
        $this->addJS('modules/backup_pro/views/js/chosen.jquery.js', true);
        $this->addJS('modules/backup_pro/views/js/global.js', true);
        $this->addJS('modules/backup_pro/views/js/dashboard.js', true);
        $this->addJS('modules/backup_pro/views/js/backup.js', true);
        $this->addJS('modules/backup_pro/views/js/restore.js', true);
        $this->addJS('modules/backup_pro/views/js/settings.js', true);
        $this->addJS('modules/backup_pro/views/js/prestashop/backup_pro.js', true);
        
        $this->addCss('modules/backup_pro/views/css/backup_pro.css', true);
        $this->addCss('modules/backup_pro/views/css/chosen.css', true);
        parent::setMedia();
    }

    protected function prepareContent($template)
    {
        return $this->module->display($this->bp_template_path, 'views/templates/admin/' . $template);
    }

    /**
     * Validates the POST'd backup data and returns the clean array
     * 
     * @param array $delete_backups            
     * @param string $type            
     * @return multitype:array
     */
    public function validateBackups($delete_backups, $type)
    {
        $encrypt = $this->services['encrypt'];
        $backups = array();
        
        $locations = $this->settings['storage_details'];
        $drivers = $this->services['backup']->getStorage()->getAvailableStorageDrivers();
        foreach ($delete_backups as $file_name) {
            $file_name = $encrypt->decode($file_name);
            if ($file_name != '') {
                $path = rtrim($this->settings['working_directory'], DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR . $type;
                $file_data = $this->services['backup']->getDetails()->getDetails($file_name, $path);
                $file_data = $this->services['backups']->getBackupStorageData($file_data, $locations, $drivers);
                $backups[] = $file_data;
            }
        }
        
        return $backups;
    }
}