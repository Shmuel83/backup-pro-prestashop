{if $enable_delete != 'yes'}
{foreach from=$backups key=k item=backup}
	<input type="hidden" name="backups[]" value="{$backup['file_name']|m62Encode}" />
{/foreach}
{/if}

<input type="hidden" value="<?php echo $note_url; ?>" name="__note_url" id="__note_url" />
<div class="table-responsive-row clearfix">
<table width="100%" class="data existing_backups table tableDnD " id="existing_backup_table" border="0" cellpadding="0" cellspacing="0">
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
	<td><?php echo form_checkbox('backups[]', urlencode($view_helper->m62Encode($backup['file_name'])), false, 'id="'.$backup['hash'].'"'); ?></td>
	{/if}
	<td style="white-space: nowrap">
    	{if isset($backup['storage_locations']) && is_array($backup['storage_locations']) }
    		{foreach from=$backup['storage_locations'] key=location_id item=storage}
    			<img src="{$module_dir|escape}views/images/storage/{$storage['icon']}.png" class="" title="{$storage['storage_location_name']}">
    		{/foreach}
    	{/if}
	</td>
	<td style="width:55%">
		{if $enable_editable_note == 'yes'}
		<div class="bp_editable" rel="{$backup['hash']}" id="note_div_{$backup['hash']}">{if $backup['note'] == ''}Click to add note...{else}{$backup['note']}{/if}</div>
		<input name="note_{$backup['hash']}" value="{$backup['note']}" id="note_{$backup['hash']}" data-backup-type="{$backup['backup_type']}" class="note_container" rel="<?php echo urlencode($view_helper->m62Encode($backup['file_name'])); ?>" style="display:none; width:100%" type="text">
		
		{else}
            {if $backup['note'] == ''}{'na'|m62Lang}{else} {$backup['note']} {/if}
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
    			<a href="<?php echo $url_base;?>restore_confirm&id=<?php echo urlencode($view_helper->m62Encode($backup['details_file_name'])); ?>&type=<?php echo $backup['backup_type']; ?>" title="<?php echo $view_helper->m62Lang('restore'); ?>">
    				<img src="{$module_dir|escape}views/images/restore.png" alt="<?php echo $view_helper->m62Lang('restore'); ?>" class="">
    			</a> 
            {else}
                <img src="{$module_dir|escape}views/images/restore.png" alt="<?php echo $view_helper->m62Lang('restore'); ?>" class="desaturate">
            {/if}
			
		{/if}
        {if $backup['can_download']}
    		<a href="<?php echo $url_base;?>download&id=<?php echo urlencode($view_helper->m62Encode($backup['details_file_name'])); ?>&type=<?php echo $backup['backup_type']; ?>" title="<?php echo $view_helper->m62Lang('download'); ?>">
    			<img src="{$module_dir|escape}views/images/download.png" alt="<?php echo $view_helper->m62Lang('download'); ?>" class="">
    		</a> 
		{else}
			<img src="{$module_dir|escape}views/images/download.png" alt="<?php echo $view_helper->m62Lang('download'); ?>" class="desaturate">
		{/if}
		</div>
	</td>
	{/if}
</tr>
{/foreach}

</tbody>
</table>
</div>