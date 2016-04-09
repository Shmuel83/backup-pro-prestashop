<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/projects/view/backup-pro/
 * @version		3.0
 * @filesource 	./modules/backup_pro/
 */
if (! defined('_PS_VERSION_'))
    exit();

require_once 'libraries/mithra62/BackupPro/BackupPro.php';

/**
 * Backup Pro - Prestashop
 *
 * Prestashop Module File
 *
 * @package mithra62\BackupPro
 * @author Eric Lamb
 * @filesource ./modules/backup_pro/backup_pro.php
 */
class Backup_pro extends Module implements \mithra62\BackupPro\BackupPro
{

    /**
     * The Admin menu details
     * 
     * @var array
     */
    protected $admin_tabs = array(
        array(
            'class' => 'AdminBackupProDashboard',
            'title' => 'Backup Pro',
            'children' => array(
                'AdminBackupProDashboard' => 'Dashboard',
                'AdminBackupProBackupDatabase' => 'Backup Database',
                'AdminBackupProBackupFiles' => 'Backup Files',
                'AdminBackupProSettings' => 'Settings'
            ),
            'hidden' => array(
                'AdminBackupProManage' => 'Manage'
            )
        )
    );

    /**
     * Set everything up
     */
    public function __construct()
    {
        $this->name = 'backup_pro';
        $this->tab = 'administration';
        $this->version = self::version;
        $this->author = 'mithra62';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array(
            'min' => '1.6',
            'max' => _PS_VERSION_
        );
        $this->bootstrap = true;
        $this->module_key = '59fa346df72e2a7dfa0bc796beaa8015';
        
        $this->displayName = $this->l('Backup Pro 3');
        $this->description = $this->l('Interface to create database and file backups of your site. ');
        
        parent::__construct();
        
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall Backup Pro 3?');
        $this->admin_tpl_path = _PS_MODULE_DIR_ . $this->name . '/views/templates/admin/';
        $this->hooks_tpl_path = _PS_MODULE_DIR_ . $this->name . '/views/templates/hooks/';
    }

    /**
     * Installs Backup Pro
     * 
     * @return boolean
     */
    public function install()
    {
        if (version_compare(phpversion(), '5.4.0', '<')) {
            throw new \Exception('You must be run PHP 5.4 or greater to use this package.');
        }
         
        if (!function_exists('mysqli_report') && !class_exists('PDO')) {
            throw new \Exception('Backup Pro requires either the mysqli or PDO extension for database use.');
        }
         
        if (!function_exists('mb_check_encoding')) {
            throw new \Exception('Backup Pro requires the Multi Byte extension to ensure proper string encoding.');
        }
         
        if (!function_exists('curl_init')) {
            throw new \Exception('Backup Pro requires the Curl extension to transfer backups to remote locations.');
        }
        
        if (! parent::install() || ! $this->installSettingsTable() || ! $this->registerHook('displayBackOfficeHeader') || ! $this->installModuleTabs()) {
            return false;
        }
        
        return true;
    }

    /**
     * Uninstalls Backup Pro
     * 
     * @return boolean
     */
    public function uninstall()
    {
        if (! parent::uninstall() || ! $this->uninstallSettingsTable() || ! $this->uninstallModuleTabs()) {
            return false;
        }
        return true;
    }

    /**
     * Adds the backup pro CSS for the tab nav to the admin header
     * 
     * @return void
     */
    public function hookDisplayBackOfficeHeader()
    {
        $this->context->controller->addCSS('modules/backup_pro/views/css/backup_pro.css', true);
    }

    /**
     * Prestashop Settings view
     *
     * We redirect to our own internal settings mechanism
     * 
     * @return string
     */
    public function getContent()
    {
        Tools::redirectAdmin($this->context->link->getAdminLink('AdminBackupProSettings'));
    }

    /**
     * Installs the tabs for the admin interface
     */
    private function installModuleTabs()
    {
        foreach ($this->admin_tabs as $value) {
            @copy(_PS_MODULE_DIR_ . $this->name . '/logo.png', _PS_IMG_DIR_ . 't/' . $value['class'] . '.png');
            $parent_tab = new Tab();
            $parent_tab->name[$this->context->language->id] = $this->l($value['title']);
            $parent_tab->class_name = $value['class'];
            $parent_tab->id_parent = 0; // Home tab
            $parent_tab->module = $this->name;
            $parent_tab->add();
            
            if (isset($value['children'])) {
                foreach ($value['children'] as $k => $v) {
                    $tab = new Tab();
                    // Need a foreach for the language
                    $tab->name[$this->context->language->id] = $this->l($v);
                    $tab->class_name = $k;
                    $tab->id_parent = $parent_tab->id;
                    $tab->module = $this->name;
                    $tab->add();
                }
                
                foreach ($value['hidden'] as $k => $v) {
                    $tab = new Tab();
                    // Need a foreach for the language
                    $tab->name[$this->context->language->id] = $this->l($v);
                    $tab->class_name = $k;
                    $tab->id_parent = - 1;
                    $tab->module = $this->name;
                    $tab->add();
                }
            }
        }
        
        return true;
    }

    /**
     * Uninstalls the tags for the admin interface
     * 
     * @return boolean
     */
    private function uninstallModuleTabs()
    {
        foreach ($this->admin_tabs as $value) {
            $idTab = Tab::getIdFromClassName($value['class']);
            if ($idTab != 0) {
                $tab = new Tab($idTab);
                $tab->delete();
                @unlink(_PS_IMG_DIR . "t/" . $value['class'] . ".png");
            }
            
            if (isset($value['children'])) {
                foreach ($value['children'] as $k => $v) {
                    $idTab = Tab::getIdFromClassName($k);
                    if ($idTab != 0) {
                        $tab = new Tab($idTab);
                        $tab->delete();
                    }
                }
            }
        }
        
        return true;
    }

    /**
     * Sets the settings database table up
     * 
     * @return bool
     */
    private function installSettingsTable()
    {
        return (Db::getInstance()->Execute('DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'backup_pro_settings`') && Db::getInstance()->Execute('
			CREATE TABLE `' . _DB_PREFIX_ . 'backup_pro_settings` (
              `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
              `setting_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\',
              `setting_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
              `serialized` int(1) DEFAULT \'0\',
              PRIMARY KEY (`id`)
			) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=UTF8;'));
    }

    /**
     * Drops the settings table
     * 
     * @return bool
     */
    private function uninstallSettingsTable()
    {
        return Db::getInstance()->Execute('DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'backup_pro_settings`');
    }
}