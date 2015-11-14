{foreach $bp_errors as $error_type=>$error}
<div class="alert alert-danger">{$error|m62Lang}
{if $error_type eq 'no_storage_locations_setup'}
    <a href="'.ee('CP/URL', 'addons/settings/backup_pro/settings/index').'">Setup Storage Location</a>
{elseif $error_type eq 'license_number'}
    <a href="'.ee('CP/URL', 'addons/settings/backup_pro/settings/license').'">Enter License</a> or <a href="https://mithra62.com/projects/view/backup-pro">Purchase a License</a>
{elseif $error_type eq 'invalid_working_directory'}
    <a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=general">Check Working Directory</a>
{/if}</div>
{/foreach}