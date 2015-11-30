<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'configure_backups'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required">
				<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="{'working_directory_instructions'|m62Lang}" data-html="true">{'working_directory'|m62Lang}</span>
			</label>
			<div class="col-lg-9"><input type="text" id="working_directory" name="working_directory" value="{$form_data['working_directory']}" class="" required="required" /></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required">
				<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="{'cron_query_key_instructions'|m62Lang}" data-html="true">{'cron_query_key'|m62Lang}</span>
			</label>
			<div class="col-lg-9"><input type="text" id="cron_query_key" name="cron_query_key" value="{$form_data['cron_query_key']}" class="" required="required" /></div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required">
				<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="{'dashboard_recent_total_instructions'|m62Lang}" data-html="true">{'dashboard_recent_total'|m62Lang}</span>
			</label>
			<div class="col-lg-9"><input type="text" id="dashboard_recent_total" name="dashboard_recent_total" value="{$form_data['dashboard_recent_total']}" class="" required="required" /></div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>