<?php
class AdminBackupProDashboardController extends ModuleAdminController
{

    public function __construct()
    {
        parent::__construct();
    }

    public function display()
    {
        return $this->l('This is admin my module tab !');
    }
    
    public function setMedia(){
    
      		$this->addJquery();
    
      		$this->addJS($this->path."/js/mymodule.js");
      		$this->addCSS($this->path.'/css/mymodule.css', 'all');
    
      		parent::setMedia();
    
    }
}