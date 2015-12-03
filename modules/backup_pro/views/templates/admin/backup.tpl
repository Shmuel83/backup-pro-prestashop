<div id="container" class="row">

	{if $pre_backup_errors|count >= 1}
	
	{/if}

<form name="new_storage_form" method="POST" action="" class="defaultForm form-horizontal " >
    <div class="panel">
		<div id="backup_instructions">
		{'backup_in_progress_instructions'|m62Lang}
		</div>	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		{'start_backup'|m62Lang}
		</button>
	</div>
	</div>
</form>	
</div>