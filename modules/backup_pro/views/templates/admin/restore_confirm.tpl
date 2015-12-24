<div id="container" class="row">
    {include file="./includes/_errors.tpl"}   
    
	{include file="./includes/_dashboard_nav.tpl"}	
	
	<div class="panel">
		<h3>{'restore_db'|m62Lang}</h3>
		
		<div id="_restore_details_table">
		
			<p>{'restore_db_question'|m62Lang}</p>
			
			<p class="notice">{'action_can_not_be_undone'|m62Lang} {'restore_double_speak'|m62Lang} </p>
			<table border="0" cellspacing="0" cellpadding="0" class="table"  width="100%" >
			<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			{if $backup['note'] != ''}
			<tr>
				<td>{'note'|m62Lang}</td>
				<td>{$backup['note']|escape:'htmlall':'UTF-8'}</td>
			</tr>
			{/if}
			<tr>
				<td>{'taken'|m62Lang}</td>
				<td>{$backup['created_date']|m62DateTime}</td>
			</tr>
			<tr>
				<td>{'backup_type'|m62Lang}</td>
				<td>{$backup['database_backup_type']|m62Lang}</td>
			</tr>
			<tr>
				<td>{'verified'|m62Lang}</td>
				<td>
					{if $backup['verified'] == '0' }
						<span class="notice">{'no'|m62Lang}</span>
					{else}
						<span class="success">{'yes'|m62Lang}</span>
					{/if}			
				</td>
			</tr>
			<tr>
				<td>{'time_taken'|m62Lang}</td>
				<td>{$backup['time_taken']|m62TimeFormat}</td>
			</tr>
			<tr>
				<td>{'max_memory'|m62Lang}</td>
				<td>{$backup['uncompressed_size']|m62FileSize}</td>
			</tr>
			<tr>
				<td>{'uncompressed_sql_size'|m62Lang}</td>
				<td>{$backup['max_memory']|m62FileSize}</td>
			</tr>
			<tr>
				<td>{'total_tables'|m62Lang}</td>
				<td>{$backup['item_count']|escape:'htmlall':'UTF-8'}</td>
			</tr>
			<tr>
				<td>{'md5_hash'|m62Lang}</td>
				<td>{$backup['hash']|escape:'htmlall':'UTF-8'}</td>
			</tr>
			</tbody>
			</table>
		</div>
			
		<div id="restore_running_details"  style="display:none" >
			<div id="backup_instructions">
				{'restore_in_progress_instructions'|m62Lang}
			</div>			
			<br />{'restore_in_progress'|m62Lang}
			<img src="{$module_dir|escape:'htmlall':'UTF-8'}views/img/indicator.gif" id="animated_image" />
		</div>
		
		<form name="remove_backups" action="{$link->getAdminLink('AdminBackupProManage')|escape:'html':'UTF-8'}&amp;section=restore_db" method="POST"  >
			<input type="hidden" name="id" value="{$backup['details_file_name']|m62Encode}" />
			<div class="panel-footer"><button name="submit_button" class="btn btn-primary" value="1" id="_restore_direct" type="submit">
				{'restore_db'|m62Lang}
			</button>
			</div>			
		</form>	
	</div>
</div>