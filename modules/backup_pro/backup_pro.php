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
    /**
     * The Admin menu details
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
                'AdminBackupProManage' => 'Manage',
            )
        ),
    );
    
    /**
     * Set everything up
     */
    public function __construct()
    {
        $this->name = 'backup_pro';
        $this->tab = 'administration';
        $this->version = '3.2';
        $this->author = 'mithra62';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->bootstrap = true;
    
        $this->displayName = $this->l('Backup Pro');
        $this->description = $this->l('Description of my module.');

        parent::__construct();
        $this->context->controller->addCSS('modules/backup_pro/views/css/backup_pro.css', true);
    
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
		$this->admin_tpl_path = _PS_MODULE_DIR_.$this->name.'/views/templates/admin/';
		$this->hooks_tpl_path = _PS_MODULE_DIR_.$this->name.'/views/templates/hooks/';
    }
    
    /**
     * Installs Backup Pro
     * @return boolean
     */
    public function install()
    {
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);
    
        if( !parent::install() || !$this->installSettingsTable() || !$this->installModuleTabs() )
        {
            return false;
        }
        
        return true;
    }
    
    /**
     * Uninstalls Backup Pro
     * @return boolean
     */
    public function uninstall()
    {
        if (!parent::uninstall() || !$this->uninstallModuleTabs())
        {
            return false;
        }
        return true;
    }
    
    /**
     * Prestashop Settings view 
     * 
     * We redirect to our own internal settings mechanism
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
        foreach($this->admin_tabs As $key => $value)
        {
            @copy(_PS_MODULE_DIR_ . $this->name . '/logo.png', _PS_IMG_DIR_ . 't/' . $value['class'] . '.png');
            $parent_tab = new Tab();
            $parent_tab->name[$this->context->language->id] = $this->l($value['title']);
            $parent_tab->class_name = $value['class'];
            $parent_tab->id_parent = 0; // Home tab
            $parent_tab->module = $this->name;
            $parent_tab->add();
            
            if( isset($value['children']) )
            {
                foreach($value['children'] AS $k => $v)
                {
                    $tab = new Tab();
                    // Need a foreach for the language
                    $tab->name[$this->context->language->id] = $this->l($v);
                    $tab->class_name = $k;
                    $tab->id_parent = $parent_tab->id;
                    $tab->module = $this->name;
                    $tab->add();
                }
                
                foreach($value['hidden'] AS $k => $v)
                {
                    $tab = new Tab();
                    // Need a foreach for the language
                    $tab->name[$this->context->language->id] = $this->l($v);
                    $tab->class_name = $k;
                    $tab->id_parent = -1;
                    $tab->module = $this->name;
                    $tab->add();
                }
            }
        }
        
        return true;
    }
    
    /**
     * Uninstalls the tags for the admin interface
     * @return boolean
     */
    private function uninstallModuleTabs() 
    {
        foreach($this->admin_tabs As $key => $value)
        {
            $idTab = Tab::getIdFromClassName($value['class']);
            if ($idTab != 0) 
            {
                $tab = new Tab($idTab);
                $tab->delete();
                @unlink(_PS_IMG_DIR . "t/" . $value['class'] . ".png");
            } 
            
            if( isset($value['children']) )
            {
                foreach($value['children'] AS $k => $v)
                {
                    $idTab = Tab::getIdFromClassName($k);
                    if ($idTab != 0)
                    {
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
     * @return bool
     */
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