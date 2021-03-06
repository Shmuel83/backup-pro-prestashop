<?php
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/BackupPro/controllers/front/BaseController.php
 */
require_once realpath(dirname(__FILE__) . '/../../libraries/vendor/autoload.php');

use mithra62\BackupPro\Traits\Controller;
use JaegerApp\Traits\Log;
use mithra62\BackupPro\Platforms\Prestashop as Platform;
use mithra62\BackupPro\Exceptions\BackupException;
use mithra62\BackupPro\Platforms\View\Smarty;

/**
 * Prestashop - Backup Pro Base Controller
 *
 * Contains all the actions for viewing Backups
 *
 * @package mithra62\BackupPro
 * @author Eric Lamb <eric@mithra62.com>
 */
abstract class BaseController extends ModuleFrontController implements \mithra62\BackupPro\BackupPro
{
    use Controller;
    //use Log;

    /**
     * The abstracted platform object
     * 
     * @var \mithra62\Platforms\Craft
     */
    protected $platform = null;

    /**
     * The Backup Pro Settings
     * 
     * @var array
     */
    protected $settings = array();

    /**
     * A container of system messages and errors
     * 
     * @var array
     */
    protected $bp_errors = array();

    /**
     * Set it up
     * 
     * @param unknown $id            
     * @param string $module            
     */
    public function __construct()
    {
        parent::__construct();
        $this->initController();
        $this->platform = new Platform();
        $this->m62->setService('platform', function ($c) {
            return $this->platform;
        });
        
        $this->m62->setDbConfig($this->platform->getDbCredentials());
        $this->settings = $this->services['settings']->get();
        $errors = $this->services['errors']->checkWorkingDirectory($this->settings['working_directory'])
            ->checkStorageLocations($this->settings['storage_details'])
            ->licenseCheck($this->settings['license_number'], $this->services['license']);
        
        if ($errors->totalErrors() == '0') {
            $errors = $errors->checkBackupState($this->services['backups'], $this->settings);
        }
        
        $this->bp_errors = $errors->getErrors();
        $this->view_helper = new Smarty($this->services['lang'], $this->services['files'], $this->services['settings'], $this->services['encrypt'], $this->platform);
        $this->m62->setService('view_helpers', function ($c) {
            return $this->view_helper;
        });
    }

    /**
     * Handy little helper method to figure out the passed variables
     *
     * We check the _POST then _GET in that order.
     * 
     * @param string $index
     *            The GET or POST variable we want
     * @param string $default
     *            The value to use if the expected isn't set
     * @return unknown|string
     */
    public function getPost($index, $default = false)
    {
        return $this->platform->getPost($index, $default);
    }
}