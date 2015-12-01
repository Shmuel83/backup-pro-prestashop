<div class="panel">

	<div class="panel-heading">
		<i class="icon-cogs"></i> {'configure_cron'|m62Lang}
	</div>
		
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
			
</div>


<div class="panel">

	<div class="panel-heading">
		<i class="icon-cogs"></i> {'configure_cron_notification'|m62Lang}
	</div>	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="cron_notify_emails">{'cron_notify_emails'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="cron_notify_emails" name="cron_notify_emails" style="height:150px;">{$form_data['cron_notify_emails']}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_emails_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['cron_notify_emails']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="cron_notify_email_mailtype">{'cron_notify_email_mailtype'|m62Lang}</label>
			<div class="col-lg-6">
			<select name="cron_notify_email_mailtype" id="cron_notify_email_mailtype" class="form-control fixed-width-xl">
				<option value="html" {if $form_data['cron_notify_email_mailtype'] == 'html'}selected="selected"{/if}>HTML</option>
				<option value="text"  {if $form_data['cron_notify_email_mailtype'] == 'text'}selected="selected"{/if}>Text</option>
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_email_mailtype_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="cron_notify_email_subject">{'cron_notify_email_subject'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="cron_notify_email_subject" name="cron_notify_email_subject" value="{$form_data['cron_notify_email_subject']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_email_subject_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['cron_notify_email_subject']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="cron_notify_email_message">{'cron_notify_email_message'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="cron_notify_email_message" name="cron_notify_email_message" style="height:150px;">{$form_data['cron_notify_email_message']}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_email_message_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['cron_notify_email_message']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
		
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
			
</div>