<?php  
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/BaseAdminController.php
 */

require_once realpath(dirname(__FILE__).'/../../libraries/vendor/autoload.php');

use mithra62\BackupPro\Platforms\Controllers\Prestashop AS PrestashopController;

/**
 * Prestashop - Backup Pro Base Controller
 *
 * Contains all the actions for viewing Backups
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
abstract class BaseAdminController extends PrestashopController implements \mithra62\BackupPro\BackupPro
{
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = false;
    
    /**
     * The path to our template directory
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
        
        $this->context->smarty->registerPlugin('modifier', 'm62Lang', array($this->view_helper, 'm62Lang'));
        $this->context->smarty->registerPlugin('modifier', 'm62FileSize', array($this->view_helper, 'm62FileSize'));
        $this->context->smarty->registerPlugin('modifier', 'm62DateTime', array($this->view_helper, 'm62DateTime'));
        $this->context->smarty->registerPlugin('modifier', 'm62Encode', array($this->view_helper, 'm62Encode'));
        $this->context->smarty->registerPlugin('modifier', 'm62Decode', array($this->view_helper, 'm62Decode'));
        $this->context->smarty->registerPlugin('modifier', 'm62FormErrors', array($this->view_helper, 'm62FormErrors'));
        
        $this->bp_template_path = _MODULE_DIR_."backup_pro";
    }
    
    public function initContent()
    {
        $this->initTabModuleList();
        if (!$this->loadObject(true)) {
            return;
        }
        
        $this->initToolbar();
        $this->initPageHeaderToolbar();
        $this->context->smarty->assign(array(
            'localization_form' => $this->renderForm(),
            'localization_options' => $this->renderOptions(),
            'url_post' => self::$currentIndex.'&token='.$this->token,
            'show_page_header_toolbar' => $this->show_page_header_toolbar,
            'page_header_toolbar_title' => $this->page_header_toolbar_title,
            'page_header_toolbar_btn' => $this->page_header_toolbar_btn
        ));
    }
    
    public function setMedia()
    {
  		$this->addJquery();
  		
  		$this->addJS('modules/backup_pro/views/js/chosen.jquery.js', true);
  		$this->addJS('modules/backup_pro/views/js/global.js', true);
  		$this->addJS('modules/backup_pro/views/js/dashboard.js', true);
  		$this->addJS('modules/backup_pro/views/js/backup.js', true);
  		$this->addJS('modules/backup_pro/views/js/settings.js', true);
  		
  		$this->addCss('modules/backup_pro/views/css/backup_pro.css', true);
  		$this->addCss('modules/backup_pro/views/css/chosen.css', true);
  		parent::setMedia();
    }
    
    protected function prepareContent($template)
    {
        return $this->module->display($this->bp_template_path, 'views/templates/admin/'.$template);
    }
    
    /**
     * Handy little helper method to figure out the passed variables 
     * 
     * We check the _POST then _GET in that order. 
     * @param string $index The GET or POST variable we want
     * @param string $default The value to use if the expected isn't set
     * @return unknown|string
     */
    public function getPost($index, $default = false)
    {
        if ( isset($_POST[$index]) )
        {
            return $_POST[$index];
        }
        elseif( isset( $_GET[$index]) )
        {
            return $_GET[$index];
        }
        
        return $default;
    }
}