<?php

require_once 'BaseAdminController.php';

class AdminBackupProDashboardController extends BaseAdminController
{

    public function __construct()
    {
        $this->bootstrap = true;
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
        $path = _MODULE_DIR_."backup_pro";
        $this->context->smarty->assign(array('test_var' => 'test'));
        $content = $this->module->display($path, 'views/templates/admin/dashboard.tpl');
        $this->context->smarty->assign(array('content' => $content));
        //$this->template = 'dashboard.tpl';
        parent::display();
    }
    
    public function renderList() {
        $return = $this->context->smarty->fetch(dirname(__FILE__) . '\adminyourmodule.tpl');             
        return $return;
    }
    
    public function setMedia(){
    
  		$this->addJquery();

  		$this->addJS($this->path."/js/mymodule.js");
  		$this->addCSS($this->path.'/css/mymodule.css', 'all');

  		parent::setMedia();
    
    }
}