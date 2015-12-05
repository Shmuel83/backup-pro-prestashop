<div id="container" class="row">
    {include file="./includes/_errors.tpl"}   
    
	{include file="./includes/_dashboard_nav.tpl"}	
	
	<div class="panel">
		<h3>{'restore_db'|m62Lang}</h3>
		
		<p>{'restore_db_question'|m62Lang}</p>
		
		<p class="notice">{'action_can_not_be_undone'|m62Lang} {'restore_double_speak'|m62Lang} </p>
		
		<p>
			<strong>{'taken'|m62Lang}:</strong> {$backup['created_date']|m62DateTime} <br />
			<strong>{'backup_type'|m62Lang}:</strong> {$backup['database_backup_type']|m62Lang}<br />
			<strong>{'verified'|m62Lang}:</strong> 
				{if $backup['verified'] == '0' }
					<span class="notice">{'no'|m62Lang}</span>
				{else}
					<span class="success">{'yes'|m62Lang}</span>
				{/if} <br />
			<strong>{'time_taken'|m62Lang}:</strong> {$backup['time_taken']|m62TimeFormat} <br />
			<strong>{'max_memory'|m62Lang}:</strong> {$backup['max_memory']|m62FileSize} <br />
			<strong>{'uncompressed_sql_size'|m62Lang}:</strong> {$backup['uncompressed_size']|m62FileSize} <br />
			<strong>{'total_tables'|m62Lang}:</strong> <?php echo $backup['item_count']; ?><br />
			<strong>{'md5_hash'|m62Lang}:</strong> {$backup['hash']}
		</p>
		
		<form name="remove_backups" action="{$link->getAdminLink('AdminBackupProManage')|escape:'html':'UTF-8'}&amp;section=restore_db" method="POST"  >
			<input type="hidden" name="id" value="{$backup['details_file_name']|m62Encode}" />
			<div class="panel-footer"><button name="submit_button" class="btn btn-primary" value="1" id="submit_button" type="submit">
				{'restore'|m62Lang}
			</button>
			</div>
		</form>	
	</div>
</div>