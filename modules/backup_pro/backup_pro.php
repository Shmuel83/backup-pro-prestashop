<?php 
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/projects/view/backup-pro/
 * @version		3.0
 * @filesource 	./modules/backup_pro/
 */
 
if (!defined('_PS_VERSION_'))
    exit;

/**
 * Backup Pro - Prestashop
 *
 * Prestashop Module File
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb
 * @filesource 	./modules/backup_pro/backup_pro.php
 */
class Backup_pro extends Module
{
    public function __construct()
    {
        $this->name = 'backup_pro';
        $this->tab = 'administration';
        $this->version = '3.2';
        $this->author = 'mithra62';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->bootstrap = true;
    
        parent::__construct();
    
        $this->displayName = $this->l('Backup Pro');
        $this->description = $this->l('Description of my module.');
    
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
		$this->admin_tpl_path = _PS_MODULE_DIR_.$this->name.'/views/templates/admin/';
		$this->hooks_tpl_path = _PS_MODULE_DIR_.$this->name.'/views/templates/hooks/';
        
        if (!Configuration::get('BACKUP_PRO_NAME'))
            $this->warning = $this->l('No name provided');
    }
    
    
    
    public function install()
    {
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);
    
        if( !parent::install() || !$this->installSettingsTable() || !$this->installModuleTab('AdminBackupProDashboard', array(1 => 'Backup Pro'), -1) )
        {
            return false;
        }
        
        return true;
    }
    
    public function uninstall()
    {
        if (!parent::uninstall() || !$this->uninstallModuleTab('AdminBackupProDashboard'))
        {
            return false;
        }
        return true;
    }
    
    public function getContent()
    {
        return 'ff';
    }
    

    private function installModuleTab($tabClass, $tabName, $idTabParent) {
        @copy(_PS_MODULE_DIR_ . $this->name . '/logo.png',
            _PS_IMG_DIR_ . 't/' . $tabClass . '.png');

        // Install Tabs
        $parent_tab = new Tab();
        // Need a foreach for the language
        $parent_tab->name[$this->context->language->id] = $this->l('Backup Pro');
        $parent_tab->class_name = 'AdminBackupProDashboard';
        $parent_tab->id_parent = 0; // Home tab
        $parent_tab->module = $this->name;
        $parent_tab->add();
        $tab = new Tab();
        // Need a foreach for the language
        $tab->name[$this->context->language->id] = $this->l('Dashboard');
        $tab->class_name = 'AdminBackupProDashboard';
        $tab->id_parent = $parent_tab->id;
        $tab->module = $this->name;
        $tab->add();
        
        return true;
    }
    
    private function uninstallModuleTab($tabClass) {
        $idTab = Tab::getIdFromClassName($tabClass);
        if ($idTab != 0) {
            $tab = new Tab($idTab);
            $tab->delete();
            @unlink(_PS_IMG_DIR . "t/" . $tabClass . ".png");
            return true;
        }
        return false;
    }
    
    private function installSettingsTable()
    {
        return (
            Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'backup_pro_settings`') &&
            Db::getInstance()->Execute('
			CREATE TABLE `'._DB_PREFIX_.'backup_pro_settings` (
              `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
              `setting_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\',
              `setting_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
              `serialized` int(1) DEFAULT \'0\',
              PRIMARY KEY (`id`)
			) ENGINE = '._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;')
        );
    
    }
}