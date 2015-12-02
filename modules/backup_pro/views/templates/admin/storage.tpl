<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    {include file="./settings/_settings_nav.tpl"}
    
    <div class="panel">
		<div class="panel-heading">
			<i class="icon-folder-open"></i> {'storage_bp_settings_menu'|m62Lang}
		</div>
	
		{include file="./storage/_submenu.tpl"}
	
		<table border="0" cellspacing="0" cellpadding="0" class="table"  width="100%" >
		<thead>
		<tr>
			<th>{'storage_location_name'|m62Lang}</th>
			<th>{'type'|m62Lang}</th>
			<th>{'status'|m62Lang}</th>
			<th>{'created_date'|m62Lang}</th>
		</tr>
		</thead>
		<tbody>
		{if $storage_details|count >= 1}
		<tr>
			<td> {$backup_meta['global']['total_backups']} </td>
			<td>{$backup_meta['global']['total_space_used']}</td>
			<td>{if $settings['auto_threshold'] == '0'} {'unlimited'|m62Lang} {else} {$available_space['available_space']} / {$available_space['max_space']} {/if}</td>
			<td>{if $backup_meta['global']['newest_backup_taken'] != ''} {$backup_meta['global']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
		</tr>
		
		{else}
		<tr>
			<td colspan='4'>{'no_storage_locations_created_yet'|m62Lang}</td>
		</tr>		
		{/if}
		
		
		</tbody>
		
		</table>	
	</div>
	
	
</div>    