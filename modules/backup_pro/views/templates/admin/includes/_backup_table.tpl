{if $enable_delete != 'yes'}
{foreach from=$backups key=k item=backup}
	<input type="hidden" name="backups[]" value="{$backup['file_name']|m62Encode}" />
{/foreach}
{/if}

<input type="hidden" value="{$note_url|escape:'htmlall':'UTF-8'}" name="__note_url" id="__note_url" />
<div class="table-responsive-row clearfix">
<table width="100%" class="data existing_backups table data_table" id="existing_backup_table" border="0" cellpadding="0" cellspacing="0">
<thead>
	<tr class="odd">
		<th></th>
	
		{if $enable_delete == 'yes'}
		<th></th>
		{/if}
		<th></th>
		<th></th>
		<th class="">{'taken'|m62Lang}</th>
		{if $enable_type == 'yes'}
		<th class="">{'type'|m62Lang}</th>
		{/if}
		<th class="">{'file_size'|m62Lang}</th>
		<th class="">{'time'|m62Lang}</th>
		<th>{'memory'|m62Lang}</th>
		{if $enable_actions == 'yes'}
		<th class=""></th>
		{/if}
	</tr>
</thead>
<tbody>
{foreach from=$backups key=k item=backup}
<tr class="odd">
	<td class=" backup_pro_backup_status {if $backup['verified'] == '0'}backup_pro_backup_warn{elseif $backup['verified'] == 'success'}backup_pro_backup_success{elseif $backup['verified'] == 'fail'}backup_pro_backup_fail{/if}"></td>
	{if $enable_delete == 'yes'}
	<td><input name="backups[]" id="backup_check_" value="{$backup['file_name']|m62Encode}" type="checkbox"></td>
	{/if}
	<td style="white-space: nowrap">
    	{if isset($backup['storage_locations']) && is_array($backup['storage_locations']) }
    		{foreach from=$backup['storage_locations'] key=location_id item=storage}
    			<img src="{$module_dir|escape:'htmlall':'UTF-8'}views/img/storage/{$storage['icon']|escape:'htmlall':'UTF-8'}.png" class="" title="{$storage['storage_location_name']|escape:'htmlall':'UTF-8'}">
    		{/foreach}
    	{/if}
	</td>
	<td style="width:55%">
		{if $enable_editable_note == 'yes'}
		<div class="bp_editable" rel="{$backup['hash']|escape:'htmlall':'UTF-8'}" id="note_div_{$backup['hash']|escape:'htmlall':'UTF-8'}">{if $backup['note'] == ''}Click to add note...{else}{$backup['note']|escape:'htmlall':'UTF-8'}{/if}</div>
		<input name="note_{$backup['hash']|escape:'htmlall':'UTF-8'}" value="{$backup['note']|escape:'htmlall':'UTF-8'}" id="note_{$backup['hash']|escape:'htmlall':'UTF-8'}" data-backup-type="{$backup['backup_type']|escape:'htmlall':'UTF-8'}" class="note_container" rel="{$backup['file_name']|m62Encode|escape:'url':'UTF-8'}" style="display:none; width:100%" type="text">
		
		{else}
            {if $backup['note'] == ''}{'na'|m62Lang}{else} {$backup['note']|escape:'htmlall':'UTF-8'} {/if}
		{/if}
	</td>
	<td style="white-space: nowrap">
		<!-- {$backup['created_date']} -->{$backup['created_date']|m62DateTime}
	</td>
	{if $enable_type == 'yes'}
	<td>{$backup['backup_type']|m62Lang}</td>
	{/if}
	<td style="white-space: nowrap"><!-- {$backup['compressed_size']} -->{$backup['compressed_size']|m62FileSize}</td>
	<td style="white-space: nowrap"><!-- {$backup['time_taken']} -->{$backup['time_taken']|m62TimeFormat}</td>
	<td style="white-space: nowrap"><!-- {$backup['max_memory']} -->{$backup['max_memory']|m62FileSize}</td>
		{if isset($enable_actions) && $enable_actions == 'yes'}
	<td align="right" style="width:40px; white-space: nowrap">
		<div style="float:right">
            {if $backup['backup_type'] == 'database'} 
            
            {if $backup['can_restore']}
    			<a class="btn btn-default" href="{$link->getAdminLink('AdminBackupProDashboard')|escape:'html':'UTF-8'}&amp;section=restore_confirm&amp;id={$backup['details_file_name']|m62Encode|escape:'url':'UTF-8'}&amp;type={$backup['backup_type']}" title="{'restore'|m62Lang}">
    				<img src="{$module_dir|escape}views/img/restore.png" alt="{'restore'|m62Lang}" class="">
    			</a> 
            {else}
            	<a class="btn btn-default" href="javascript:;" title="{'restore'|m62Lang}">
                	<img src="{$module_dir|escape}views/img/restore.png" alt="{'restore'|m62Lang}" class="desaturate">
                </a>
            {/if}
			
		{/if}
        {if $backup['can_download']}
    		<a class="btn btn-default" href="{$link->getAdminLink('AdminBackupProManage')|escape:'html':'UTF-8'}&amp;section=download&id={$backup['details_file_name']|m62Encode|escape:'url':'UTF-8'}&amp;type={$backup['backup_type']}" title="{'download'|m62Lang}">
    			<img src="{$module_dir|escape}views/img/download.png" alt="{'download'|m62Lang}" class="">
    		</a> 
		{else}
			<a class="btn btn-default" href="javascript:;" title="{'download'|m62Lang}">
				<img src="{$module_dir|escape}views/img/download.png" alt="{'download'|m62Lang}" class="desaturate">
			</a>
		{/if}
		</div>
	</td>
	{/if}
</tr>
{/foreach}

</tbody>
</table>
</div>