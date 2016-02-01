<div class="form-wrapper">
	<div class="form-group {if $form_errors['backup_store_location']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="backup_store_location">{'backup_store_location'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="backup_store_location" name="backup_store_location" value="{$form_data['backup_store_location']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_store_location_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_store_location']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->