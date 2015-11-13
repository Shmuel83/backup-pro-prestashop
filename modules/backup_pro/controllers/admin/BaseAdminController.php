<?php  
/**
 * mithra62 - Backup Pro
 *
 * @copyright	Copyright (c) 2015, mithra62, Eric Lamb.
 * @link		http://mithra62.com/
 * @version		3.0
 * @filesource 	./backuppro/controllers/BackupProController.php
 */

$path = realpath(dirname(__FILE__).'/../../libraries/vendor/autoload.php');
require_once $path;

use mithra62\BackupPro\Platforms\Controllers\Prestashop AS PrestashopController;

/**
 * Craft - Backup Pro View Backups Controller
 *
 * Contains all the actions for viewing Backups
 *
 * @package 	mithra62\BackupPro
 * @author		Eric Lamb <eric@mithra62.com>
 */
abstract class BaseAdminController extends PrestashopController implements \mithra62\BackupPro\BackupPro
{
    
}