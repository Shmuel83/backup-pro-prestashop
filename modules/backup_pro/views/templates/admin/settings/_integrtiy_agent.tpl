<div class="panel">

	<div class="panel-heading">
		<i class="icon-time"></i> {'integrity_agent_cron'|m62Lang}
	</div>

	<table class="table" border="0" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th width='50%'></th>
			<th width='30%'>{'cron_commands'|m62Lang}</th>
			<th width='20%'>{'test'|m62Lang}</th>
		</tr>
	</thead>
	<tbody>
	{foreach from=$ia_cron_commands key=key item=cron}
	<tr class="even">
		<td width='50%' style="width:50%;">{$key|m62Lang}</td>
		<td style="width:50%;">
			<div class="select_all">{$cron['cmd']|escape:'htmlall':'UTF-8'}</div>
		</td>
		<td style="width:50%;">
			<a href="{$cron['url']|escape:'htmlall':'UTF-8'}" class="test_cron" rel="{$key|escape:'htmlall':'UTF-8'}">
				<img src="{$module_dir|escape}views/img/test.png" />
			</a> <img src="{$module_dir|escape}views/img/indicator.gif" id="animated_{$key|escape:'htmlall':'UTF-8'}" style="display:none" />
		</td>
	</tr>
	{/foreach}
	</tbody>
	</table>			
</div>

<div class="panel">

	<div class="panel-heading">
		<i class="icon-eye-open"></i> {'configure_integrity_agent_verification'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="db_verification_db_name">{'db_verification_db_name'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="db_verification_db_name" name="db_verification_db_name" value="{$form_data['db_verification_db_name']|escape:'htmlall':'UTF-8'}" class="" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'db_verification_db_name_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['db_verification_db_name']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="total_verifications_per_execution">{'total_verifications_per_execution'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="total_verifications_per_execution" name="total_verifications_per_execution" value="{$form_data['total_verifications_per_execution']}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'total_verifications_per_execution_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['total_verifications_per_execution']|m62FormErrors}</div>
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

<div class="panel">

	<div class="panel-heading">
		<i class="icon-envelope"></i> {'configure_integrity_agent_backup_missed_schedule'|m62Lang}
	</div>	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="backup_missed_schedule_notify_email_interval">{'backup_missed_schedule_notify_email_interval'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="backup_missed_schedule_notify_email_interval" name="backup_missed_schedule_notify_email_interval" value="{$form_data['backup_missed_schedule_notify_email_interval']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_missed_schedule_notify_email_interval_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_missed_schedule_notify_email_interval']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="backup_missed_schedule_notify_emails">{'backup_missed_schedule_notify_emails'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="backup_missed_schedule_notify_emails" name="backup_missed_schedule_notify_emails" style="height:150px;">{$form_data['backup_missed_schedule_notify_emails']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_missed_schedule_notify_emails_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_missed_schedule_notify_emails']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="backup_missed_schedule_notify_email_mailtype">{'backup_missed_schedule_notify_email_mailtype'|m62Lang}</label>
			<div class="col-lg-6">
			<select name="backup_missed_schedule_notify_email_mailtype" id="backup_missed_schedule_notify_email_mailtype" class="form-control fixed-width-xl">
				<option value="html" {if $form_data['cron_notify_email_mailtype'] == 'html'}selected="selected"{/if}>HTML</option>
				<option value="text"  {if $form_data['cron_notify_email_mailtype'] == 'text'}selected="selected"{/if}>Text</option>
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_missed_schedule_notify_email_mailtype_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="backup_missed_schedule_notify_email_subject">{'backup_missed_schedule_notify_email_subject'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="backup_missed_schedule_notify_email_subject" name="backup_missed_schedule_notify_email_subject" value="{$form_data['backup_missed_schedule_notify_email_subject']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_missed_schedule_notify_email_subject_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_missed_schedule_notify_email_subject']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="backup_missed_schedule_notify_email_message">{'backup_missed_schedule_notify_email_message'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="backup_missed_schedule_notify_email_message" name="backup_missed_schedule_notify_email_message" style="height:150px;">{$form_data['backup_missed_schedule_notify_email_message']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'backup_missed_schedule_notify_email_message_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['backup_missed_schedule_notify_email_message']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
		
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
			
</div>