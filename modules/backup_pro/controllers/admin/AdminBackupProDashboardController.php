<?php

require_once 'BaseAdminController.php';

class AdminBackupProDashboardController extends BaseAdminController
{
    /**
     * The main base template we're using
     * @var string
     */
    protected $bp_template = 'dashboard.tpl';
    
    public function display()
    {
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

}