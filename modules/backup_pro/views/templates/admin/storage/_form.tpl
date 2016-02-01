<input type="hidden" value="0" name="storage_location_status" />
<input type="hidden" value="0" name="storage_location_file_use" />
<input type="hidden" value="0" name="storage_location_db_use" />
<input type="hidden" value="0" name="storage_location_include_prune" />

	
<div class="form-wrapper">
	<div class="form-group {if $form_errors['storage_location_name']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="storage_location_name">{'storage_location_name'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="storage_location_name" name="storage_location_name" value="{$form_data['storage_location_name']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'storage_location_name_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['storage_location_name']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->


{include file="./{$_form_template}.tpl"}
	
<div class="form-wrapper" >
	<div class="form-group {if $form_errors['storage_location_status']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="storage_location_status">{'storage_location_status'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="storage_location_status">
				<input type="checkbox" {if $form_data['storage_location_status'] == '1'}checked="checked"{/if} id="storage_location_status" name="storage_location_status" value="1" class="" />
				{'storage_location_status_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['storage_location_status']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper" >
	<div class="form-group {if $form_errors['storage_location_file_use']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="storage_location_file_use">{'storage_location_file_use'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="storage_location_file_use">
				<input type="checkbox" {if $form_data['storage_location_file_use'] == '1'}checked="checked"{/if} id="storage_location_file_use" name="storage_location_file_use" value="1" class="" />
				{'storage_location_file_use_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['storage_location_file_use']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper" >
	<div class="form-group {if $form_errors['storage_location_db_use']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="storage_location_db_use">{'storage_location_db_use'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="storage_location_db_use">
				<input type="checkbox" {if $form_data['storage_location_db_use'] == '1'}checked="checked"{/if} id="storage_location_db_use" name="storage_location_db_use" value="1" class="" />
				{'storage_location_db_use_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['storage_location_db_use']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper" >
	<div class="form-group {if $form_errors['storage_location_include_prune']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="storage_location_include_prune">{'storage_location_include_prune'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="storage_location_include_prune">
				<input type="checkbox" {if $form_data['storage_location_include_prune'] == '1'}checked="checked"{/if} id="storage_location_include_prune" name="storage_location_include_prune" value="1" class="" />
				{'storage_location_include_prune_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['storage_location_include_prune']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

	
<div class="panel-footer">
	<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
	<i class="process-icon-save"></i> Save
	</button>
</div>