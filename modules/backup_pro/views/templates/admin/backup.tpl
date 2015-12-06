<div id="container" class="row">

	<div class="panel">
	{if $pre_backup_errors|count >= 1}
		<h3>{'pre_backup_setting_issue_blurb'|m62Lang}</h3>
		{assign var="bp_errors" value=$pre_backup_errors} 
		{include file="./includes/_errors.tpl"}
	{else}

		<form name="new_storage_form" method="POST" action="" class="defaultForm form-horizontal " >
			<div id="backup_instructions">
				{'backup_in_progress_instructions'|m62Lang}
			</div>	
			<div class="panel-footer">
				<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
				{'start_backup'|m62Lang}
				</button>
			</div>
		</form>	

	{/if}
	</div>
	
</div>