<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    {include file="./includes/_dashboard_nav.tpl"}
    <div class="panel">
		<table border="0" cellspacing="0" cellpadding="0" class="widefat"  width="100%" >
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
			<td width='120'> {$backup_meta['global']['total_backups']} </td>
			<td width='150'>{$backup_meta['global']['total_space_used']}</td>
			<td align='right' width='150'>{if $backup_meta['global']['newest_backup_taken'] != ''} {$backup_meta['global']['newest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
			<td align='right' width='150'>{if $backup_meta['global']['oldest_backup_taken'] != ''} {$backup_meta['global']['oldest_backup_taken']|m62DateTime} {else} {'na'|m62Lang} {/if}</td>
		</tr>
		</tbody>
		</table>
	</div>    
</div>