<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'config_db'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="max_db_backups">{'max_db_backups'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="max_db_backups" name="max_db_backups" value="{$form_data['max_db_backups']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'max_db_backups_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['max_db_backups']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="db_backup_alert_threshold">{'db_backup_alert_threshold'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="db_backup_alert_threshold" name="db_backup_alert_threshold" value="{$form_data['db_backup_alert_threshold']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_alert_threshold_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_alert_threshold']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="db_backup_method">{'db_backup_method'|m62Lang}</label>
			<div class="col-lg-6">
			<select name="db_backup_method" id="db_backup_method" class="form-control fixed-width-xl">
			<option value="php" {if $form_data['db_backup_method'] == 'php'}selected="selected"{/if}>PHP</option>
			<option value="mysqldump"  {if $form_data['db_backup_method'] == 'mysqldump'}selected="selected"{/if}>MySQLDUMP</option>
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_method_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->

	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="m62_settings_submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>