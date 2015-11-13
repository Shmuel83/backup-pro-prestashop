<?php  
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/admin/BaseAdminController.php
 */

$path = realpath(dirname(__FILE__).'/../../libraries/vendor/autoload.php');
require_once $path;

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
    
    public function __construct()
    {
        $this->bootstrap = true;
        parent::__construct();
        $this->context->smarty->assign(array('settings' => $this->settings, 'bp_errors' => $this->bp_errors));
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
  		$this->addJS($this->path."/js/mymodule.js");
  		$this->addCSS($this->path.'/css/mymodule.css', 'all');
  		parent::setMedia();
    }
}