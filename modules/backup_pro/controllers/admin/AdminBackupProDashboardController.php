<?php

$path = realpath(dirname(__FILE__).'/../../libraries/vendor/autoload.php');
require_once $path;

class AdminBackupProDashboardController extends ModuleAdminController implements \mithra62\BackupPro\BackupPro
{

    public function __construct()
    {
        parent::__construct();
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

    public function display()
    {
        $this->initContent();
        parent::display();
    }
    
    public function test()
    {
        
    }
    
    public function setMedia(){
    
      		$this->addJquery();
    
      		$this->addJS($this->path."/js/mymodule.js");
      		$this->addCSS($this->path.'/css/mymodule.css', 'all');
    
      		parent::setMedia();
    
    }
}