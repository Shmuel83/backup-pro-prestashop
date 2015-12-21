{foreach $bp_errors as $error_type=>$error}
	<div class="alert alert-warning">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	{$error|m62Lang}
	{if $error_type eq 'no_storage_locations_setup'}
	    <a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=storage&sub=new_storage&engine=local" class="alert-link">{'setup_storage_location'|m62Lang}</a>
	{elseif $error_type eq 'license_number'}
	    <a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=license" class="alert-link">{'enter_license'|m62Lang}</a> or <a href="https://mithra62.com/projects/view/backup-pro" class="alert-link">{'purchase_a_license'|m62Lang}</a>
	{elseif $error_type eq 'invalid_working_directory'}
	    <a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=general" class="alert-link">{'check_working_dir'|m62Lang}</a>
	{elseif $error_type eq 'no_backup_file_location'}
		<a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=file_backups" class="alert-link">Set File Backup Locations</a>    
	{elseif $error_type eq 'no_db_backups_exist_yet'}	
		<a href="{$link->getAdminLink('AdminBackupProBackupDatabase')|escape:'html':'UTF-8'}" class="alert-link">{'would_you_like_to_backup_database_now'|m62Lang}</a> 
	{elseif $error_type eq 'no_file_backups_exist_yet'}	
		<a href="{$link->getAdminLink('AdminBackupProBackupFiles')|escape:'html':'UTF-8'}" class="alert-link">{'would_you_like_to_backup_files_now'|m62Lang}</a> 
	{elseif $error_type eq 'db_backup_past_expectation'}	
		{'db_backup_past_expectation'|m62Lang|sprintf:$last_database_backup_rel_time:$database_backup_url}
	{elseif $error_type eq 'file_backup_past_expectation'}
		{'files_backup_past_expectation'|m62Lang|sprintf:$last_file_backup_rel_time:$file_backup_url}
	{/if}
	
	</div>
{/foreach}