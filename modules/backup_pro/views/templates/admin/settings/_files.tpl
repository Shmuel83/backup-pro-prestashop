<div class="panel">
	<input type="hidden" value="0" name="regex_file_exclude" />
	<div class="panel-heading">
		<i class="icon-folder-close"></i> {'config_files'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="max_file_backups">{'max_file_backups'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="max_file_backups" name="max_file_backups" value="{$form_data['max_file_backups']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'max_file_backups_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['max_file_backups']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="file_backup_alert_threshold">{'file_backup_alert_threshold'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="file_backup_alert_threshold" name="file_backup_alert_threshold" value="{$form_data['file_backup_alert_threshold']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'file_backup_alert_threshold_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['file_backup_alert_threshold']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="backup_file_location">{'backup_file_location'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="backup_file_location" name="backup_file_location" style="height:150px;" required="required">{$form_data['backup_file_location']}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_file_location_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_file_location']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="exclude_paths">{'exclude_paths'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="exclude_paths" name="exclude_paths" style="height:150px;">{$form_data['exclude_paths']}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'exclude_paths_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['exclude_paths']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper" >
		<div class="form-group">
			<label class="control-label col-lg-3 " for="regex_file_exclude">{'regex_file_exclude'|m62Lang}</label>
			<div class="col-lg-9">
				<div class="help-block"><label for="regex_file_exclude">
					<input type="checkbox" {if $form_data['regex_file_exclude'] == '1'}checked="checked"{/if} id="regex_file_exclude" name="regex_file_exclude" value="1" class="" />
					{'regex_file_exclude_instructions'|m62Lang}</label>
				</div>
			</div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['regex_file_exclude']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>	
</div>