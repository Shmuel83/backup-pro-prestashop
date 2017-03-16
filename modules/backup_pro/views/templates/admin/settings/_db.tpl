<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'config_db'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group {if $form_errors['max_db_backups']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 required" for="max_db_backups">{'max_db_backups'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="max_db_backups" name="max_db_backups" value="{$form_data['max_db_backups']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'max_db_backups_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['max_db_backups']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group {if $form_errors['db_backup_alert_threshold']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 required" for="db_backup_alert_threshold">{'db_backup_alert_threshold'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="db_backup_alert_threshold" name="db_backup_alert_threshold" value="{$form_data['db_backup_alert_threshold']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_alert_threshold_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_alert_threshold']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group {if $form_errors['db_backup_method']|m62FormErrors}has-error{/if}">
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
	
	<div class="form-wrapper" id="mysqldump_command_wrap" style="display:none;">
		<div class="form-group {if $form_errors['mysqldump_command']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3" for="mysqldump_command">{'mysqldump_command'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="mysqldump_command" name="mysqldump_command" value="{$form_data['mysqldump_command']|escape:'htmlall':'UTF-8'}" class="" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'mysqldump_command_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['mysqldump_command']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper" id="php_backup_method_select_chunk_limit_wrap" style="display:none;">
		<div class="form-group {if $form_errors['php_backup_method_select_chunk_limit']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3" for="php_backup_method_select_chunk_limit">{'php_backup_method_select_chunk_limit'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="php_backup_method_select_chunk_limit" name="php_backup_method_select_chunk_limit" value="{$form_data['php_backup_method_select_chunk_limit']|escape:'htmlall':'UTF-8'}" class="" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'php_backup_method_select_chunk_limit_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['php_backup_method_select_chunk_limit']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="db_restore_method">{'db_restore_method'|m62Lang}</label>
			<div class="col-lg-6">
			<select name="db_restore_method" id="db_restore_method" class="form-control fixed-width-xl">
				<option value="php" {if $form_data['db_restore_method'] == 'php'}selected="selected"{/if}>PHP</option>
				<option value="mysql"  {if $form_data['db_restore_method'] == 'mysql'}selected="selected"{/if}>MySQL</option>
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_restore_method_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper" id="mysqlcli_command_wrap" style="display:none;">
		<div class="form-group {if $form_errors['mysqlcli_command']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3" for="mysqlcli_command">{'mysqlcli_command'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="mysqlcli_command" name="mysqlcli_command" value="{$form_data['mysqlcli_command']|escape:'htmlall':'UTF-8'}" class="" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'mysqlcli_command_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['mysqlcli_command']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->

	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="m62_settings_submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>

<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'config_ignore_sql'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="db_backup_ignore_tables">{'db_backup_ignore_tables'|m62Lang}</label>
			<div class="col-lg-6">
			<input type="hidden" name="db_backup_ignore_tables[]" value="" />
			<select name="db_backup_ignore_tables[]" multiple="multiple" data-placeholder="{'db_backup_ignore_tables'|m62Lang}" id="db_backup_ignore_tables">
			{foreach from=$db_tables key=k item=v}
			<option value="{$k|escape:'htmlall':'UTF-8'}" {if $k|in_array:$form_data['db_backup_ignore_tables']}selected="selected"{/if}>{$v|escape:'htmlall':'UTF-8'}</option>
			{/foreach}
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_ignore_tables_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="db_backup_ignore_table_data">{'db_backup_ignore_table_data'|m62Lang}</label>
			<div class="col-lg-6">
			<input type="hidden" name="db_backup_ignore_table_data[]" value="" />
			<select name="db_backup_ignore_table_data[]" multiple="multiple" data-placeholder="{'db_backup_ignore_table_data'|m62Lang}" id="db_backup_ignore_table_data">
			{foreach from=$db_tables key=k item=v}
			<option value="{$k|escape:'htmlall':'UTF-8'}" {if $k|in_array:$form_data['db_backup_ignore_table_data']}selected="selected"{/if}>{$v|escape:'htmlall':'UTF-8'}</option>
			{/foreach}
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_ignore_tables_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
			
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit_config_ignore_sql" name="m62_settings_submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
</div>	

<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'config_extra_archive_sql'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="db_backup_archive_pre_sql">{'db_backup_archive_pre_sql'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="db_backup_archive_pre_sql" name="db_backup_archive_pre_sql" style="height:150px;">{$form_data['db_backup_archive_pre_sql']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_archive_pre_sql_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_archive_pre_sql']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="db_backup_archive_post_sql">{'db_backup_archive_post_sql'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="db_backup_archive_post_sql" name="db_backup_archive_post_sql" style="height:150px;">{$form_data['db_backup_archive_post_sql']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_archive_post_sql_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_archive_post_sql']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit_config_extra_archive_sql" name="m62_settings_submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
</div>

<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'config_execute_sql'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="db_backup_execute_pre_sql">{'db_backup_execute_pre_sql'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="db_backup_execute_pre_sql" name="db_backup_execute_pre_sql" style="height:150px;">{$form_data['db_backup_execute_pre_sql']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_execute_pre_sql_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_execute_pre_sql']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="db_backup_execute_post_sql">{'db_backup_execute_post_sql'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="db_backup_execute_post_sql" name="db_backup_execute_post_sql" style="height:150px;">{$form_data['db_backup_execute_post_sql']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_backup_execute_post_sql_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_backup_execute_post_sql']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit_config_execute_sql" name="m62_settings_submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
</div>