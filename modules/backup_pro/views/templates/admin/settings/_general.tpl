<div class="panel">
	<input type="hidden" value="0" name="relative_time" />
	<input type="hidden" value="0" name="allow_duplicates" />
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'configure_backups'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="working_directory">{'working_directory'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="working_directory" name="working_directory" value="{$form_data['working_directory']}" class="" required="required" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'working_directory_instructions'|m62Lang}</div></div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['working_directory']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="cron_query_key">{'cron_query_key'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="cron_query_key" name="cron_query_key" value="{$form_data['cron_query_key']}" class="" required="required" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'cron_query_key_instructions'|m62Lang}</div></div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['cron_query_key']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="dashboard_recent_total">{'dashboard_recent_total'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="dashboard_recent_total" name="dashboard_recent_total" value="{$form_data['dashboard_recent_total']}" class="" required="required" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'dashboard_recent_total_instructions'|m62Lang}</div></div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['dashboard_recent_total']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="auto_threshold">{'auto_threshold'|m62Lang}</label>
			<div class="col-lg-9">
			<select name="auto_threshold" id="auto_threshold" class="form-control fixed-width-xxl">
			{foreach from=$threshold_options key=k item=v}
			<option value="{$k}" {if $form_data['auto_threshold'] == $k}selected="selected"{/if}>{$v}</option>
			{/foreach}
			</select>
			</div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'auto_threshold_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper" >
		<div class="form-group" id="auto_threshold_custom_wrap" style="display:none;">
			<label class="control-label col-lg-3 " for="auto_threshold_custom">{'auto_threshold_custom'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="auto_threshold_custom" name="auto_threshold_custom" value="{$form_data['auto_threshold_custom']}" class="" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'auto_threshold_custom_instructions'|m62Lang}</div></div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['auto_threshold_custom']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper" >
		<div class="form-group">
			<label class="control-label col-lg-3 " for="allow_duplicates">{'allow_duplicates'|m62Lang}</label>
			<div class="col-lg-9">
				<div class="help-block"><label for="allow_duplicates">
					<input type="checkbox" {if $form_data['allow_duplicates'] == '1'}checked="checked"{/if} id="allow_duplicates" name="allow_duplicates" value="1" class="" />
					{'allow_duplicates_instructions'|m62Lang}</label>
				</div>
			</div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['allow_duplicates']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="date_format">{'date_format'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="date_format" name="date_format" value="{$form_data['date_format']}" class="" required="required" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'date_format_instructions'|m62Lang}</div></div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['date_format']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper" >
		<div class="form-group">
			<label class="control-label col-lg-3 " for="relative_time">{'relative_time'|m62Lang}</label>
			<div class="col-lg-9">
				<div class="help-block"><label for="relative_time">
					<input type="checkbox" {if $form_data['relative_time'] == '1'}checked="checked"{/if} id="relative_time" name="relative_time" value="1" class="" />
					{'relative_time_instructions'|m62Lang}</label>
				</div>
			</div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['relative_time']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>