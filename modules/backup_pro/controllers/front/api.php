<?php
/**
 * mithra62 - Backup Pro
 *
 * @author		Eric Lamb <eric@mithra62.com>
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./modules/backup_pro/controllers/front/api.php
 */
include_once 'BaseController.php';

/**
 * Backup Pro - Prestashop REST API Frontend Controller
 *
 * Contains the Prestashop REST API Frontend Controller
 *
 * @package mithra62\BackupPro
 * @author Eric Lamb <eric@mithra62.com>
 */
class Backup_ProApiModuleFrontController extends BaseController
{

    public function display()
    {
	    $_SERVER['REQUEST_URI'] = '/backup_pro/api'.$this->platform->getPost('bp_method');
	    $this->services['rest']->setPlatform($this->platform)->getServer()->run();
    }
}