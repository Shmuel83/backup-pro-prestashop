{if $enable_delete != 'yes'}

{/if}

<input type="hidden" value="<?php echo $note_url; ?>" name="__note_url" id="__note_url" />
<div class="tbl-wrap">
<table width="100%" class="data existing_backups " id="existing_backup_table" border="0" cellpadding="0" cellspacing="0">
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
	<td class="  "><span class="<?php echo $status_class; ?>"><?php echo $status_string; ?></span></td>
	{if $enable_delete == 'yes'}
	<td><?php echo form_checkbox('backups[]', urlencode($view_helper->m62Encode($backup['file_name'])), false, 'id="'.$backup['hash'].'"'); ?></td>
	{/if}
	<td style="white-space: nowrap">
    	<?php if(isset($backup['storage_locations']) && is_array($backup['storage_locations']) ): ?>
    		<?php foreach($backup['storage_locations'] AS $location_id => $storage): ?>
    			<img src="{$module_dir|escape}/images/storage/<?php echo $storage['icon']; ?>.png" class="" title="<?php echo $storage['storage_location_name']; ?>">
    		<?php endforeach; ?>
    	<?php endif; ?>
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
		<?php if(isset($enable_actions) && $enable_actions == 'yes' ): ?>
	<td align="right" style="width:40px; white-space: nowrap">
		<div style="float:right">
		<ul class="toolbar">
            <?php if( $backup['backup_type'] == 'database'): ?> 
            
            <?php if( $backup['can_restore'] ): ?>
    			<li class="sync"><a href="<?php echo ee('CP/URL', 'addons/settings/backup_pro/restore_confirm'.AMP.'id='.urlencode($view_helper->m62Encode($backup['details_file_name'])).AMP.'type='.$backup['backup_type']);?>" title="<?php echo $view_helper->m62Lang('restore'); ?>">
    				
    			</a><?php ?>
            <?php else: ?>
                <img src="<?php echo $theme_folder_url; ?>backup_pro/images/restore.png" alt="<?php echo $view_helper->m62Lang('restore'); ?>" class="desaturate">
            <?php endif; ?>
			
		<?php endif; ?>
        <?php if( $backup['can_download'] ): ?>
    		<li class="download"><a href="<?php echo ee('CP/URL', 'addons/settings/backup_pro/download'.AMP.'id='.urlencode($view_helper->m62Encode($backup['details_file_name'])).AMP.'type='.$backup['backup_type']);?>" title="<?php echo $view_helper->m62Lang('download'); ?>">
    			
    		</a></li>
		<?php else: ?>
		
		<?php endif; ?>
		</ul>
		</div>
	</td>
	<?php endif; ?>	
</tr>
{/foreach}

</tbody>
</table>