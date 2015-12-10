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
			<div id="backup_running_details"  style="display:none" ><br /><br />
			{'backup_in_progress'|m62Lang}
			<img src="{$module_dir|escape}views/img/indicator.gif" id="animated_image" />
			</div>
						
			<div class="panel-footer">
				<button type="submit" value="1"	id="_backup_direct" name="submitAddprofile" class="btn btn-primary">
				{'start_backup'|m62Lang}
				</button>
			</div>
		</form>	

	{/if}
	</div>
	
</div>