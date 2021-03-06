<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    
    {if $database_restored == 'yes'}
    <div class="alert alert-success">{'database_restored'|m62Lang}</div>
    {/if}     
    
    
    {include file="./includes/_dashboard_nav.tpl"}
    <div class="panel">
		<table border="0" cellspacing="0" cellpadding="0" class="table"  width="100%" >
		<thead>
		<tr>
			<th width="120">{'total_backups'|m62Lang}</th>
			<th>{'total_space_used'|m62Lang}</th>
			<th>{'total_space_available'|m62Lang} {if $settings['auto_threshold'] != '0'} ({$available_space['available_percentage']}%) {/if}</th>
			<th><div style="float:right">{'last_backup_taken'|m62Lang}</div></th>
			<th><div style="float:right">{'first_backup_taken'|m62Lang}</div></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td width='120'> {$backup_meta['global']['total_backups']|escape:'htmlall':'UTF-8'} </td>
			<td width='150'>{$backup_meta['global']['total_space_used']|escape:'htmlall':'UTF-8'}</td>
			<td>{if $settings['auto_threshold'] == '0'} {'unlimited'|m62Lang} {else} {$available_space['available_space']} / {$available_space['max_space']} {/if}</td>
			<td align='right' width='150'>{if $backup_meta['global']['newest_backup_taken'] != ''} {$backup_meta['global']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
			<td align='right' width='150'>{if $backup_meta['global']['oldest_backup_taken'] != ''} {$backup_meta['global']['oldest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
		</tr>
		</tbody>
		</table>
	</div>
	
	<div class="row panel">
	
		<div class="col-md-6 ">
				<table class="table"  width="100%" border="0" cellpadding="0" cellspacing="0">
					<thead>
						<tr class="odd">
							<th width="50%">{'database_backups'|m62Lang}</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
					<tr class="even">
						<td><strong>{'total_backups'|m62Lang}</strong></td>
						<td>{$backup_meta['database']['total_backups']|escape:'htmlall':'UTF-8'}</td>
					</tr>
					<tr class="odd">
						<td><strong>{'total_space_used'|m62Lang}</strong></td>
						<td>{$backup_meta['database']['total_space_used']|escape:'htmlall':'UTF-8'}</td>
					</tr>
					<tr class="even">
						<td><strong>{'last_backup_taken'|m62Lang}</strong></td>
						<td>{if $backup_meta['database']['newest_backup_taken'] != ''} {$backup_meta['database']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
					</tr>
					</tbody>
				</table>
		</div>
		<div class="col-md-6 ">
		
				<table class="table"  width="100%" border="0" cellpadding="0" cellspacing="0">
					<thead>
						<tr class="odd">
							<th width="50%">{'file_backups'|m62Lang}</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr class="even">
						<td><strong>{'total_backups'|m62Lang}</strong></td>
							<td>{$backup_meta['files']['total_backups']|escape:'htmlall':'UTF-8'}</td>
						</tr>
					<tr class="odd">
						<td><strong>{'total_space_used'|m62Lang}</strong></td>
						<td>{$backup_meta['files']['total_space_used']|escape:'htmlall':'UTF-8'}</td>
					<tr class="even">
						<td><strong>{'last_backup_taken'|m62Lang}</strong></td>
						<td>{if $backup_meta['files']['newest_backup_taken'] != ''} {$backup_meta['files']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
					</tr>
				</tbody>
				</table>		
		
		</div>
	
	</div>
	
	<div class="row panel">
	
		{if $backups|count > 0}
			<h3>{'recent_backups'|m62Lang} ({$backups|count})</h3>
			{include file="./includes/_backup_table.tpl"}
		{else}
			{'no_backups_exist'|m62Lang} <a href="{$link->getAdminLink('AdminBackupProBackupDatabase')|escape:'html':'UTF-8'}">{'would_you_like_to_backup_database_now'|m62Lang}</a>
		{/if}
	
	</div>
</div>	