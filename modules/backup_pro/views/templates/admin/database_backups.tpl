<div id="container" class="row">
    {include file="./includes/_errors.tpl"}   
    
    {if $backup_complete == 'yes'}
    <div class="alert alert-success">{'backup_progress_bar_stop'|m62Lang}</div>
    {/if} 
    
    {if $bad_restore_filename == 'yes'}
    <div class="alert alert-danger">Can't find your backup to restore...</div>
    {/if}    
    
    {include file="./includes/_dashboard_nav.tpl"}
    <div class="panel">
		<table border="0" cellspacing="0" cellpadding="0" class="table"  width="100%" >
		<thead>
		<tr>
			<th width="120">{'total_backups'|m62Lang}</th>
			<th>{'total_space_used'|m62Lang}</th>
			<th><div style="float:right">{'last_backup_taken'|m62Lang}</div></th>
			<th><div style="float:right">{'first_backup_taken'|m62Lang}</div></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td width='120'> {$backup_meta['database']['total_backups']} </td>
			<td width='150'>{$backup_meta['database']['total_space_used']}</td>
			<td align='right' width='150'>{if $backup_meta['database']['newest_backup_taken'] != ''} {$backup_meta['database']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
			<td align='right' width='150'>{if $backup_meta['database']['oldest_backup_taken'] != ''} {$backup_meta['database']['oldest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
		</tr>
		</tbody>
		</table>
	</div>    
	
	
	<div class="row panel">
	
		{if $backups['database']|count > 0}
			<form name="remove_backups" action="{$link->getAdminLink('AdminBackupProDashboard')|escape:'html':'UTF-8'}&amp;section=remove_confirm" method="POST"  >
			<input type="hidden" name="type" id="hidden_backup_type" value="database" />
			<h3>{'recent_backups'|m62Lang} ({$backups['database']|count})</h3>
			{assign var="backups" value=$backups['database']} 
			{include file="./includes/_backup_table.tpl"}
			
			
			<div class="panel-footer"><button name="submit_button" class="btn btn-primary pull-right" value="1" id="submit_button" type="submit">
								{'delete_selected'|m62Lang}
							</button>
			</div>
			</form>			
		{else}
			{'no_backups_exist'|m62Lang} <a href="{$link->getAdminLink('AdminBackupProBackupDatabase')|escape:'html':'UTF-8'}">{'would_you_like_to_backup_database_now'|m62Lang}</a>
		{/if}
	
	</div>	
</div>