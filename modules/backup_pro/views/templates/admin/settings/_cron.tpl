<div class="panel">

	<div class="panel-heading">
		<i class="icon-time"></i> {'configure_cron'|m62Lang}		
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
		{foreach from=$backup_cron_commands key=key item=cron}
		<tr class="even">
			<td width='50%' style="width:50%;">{$key|m62Lang}</td>
			<td style="width:50%;">
				<div class="select_all">{$cron['cmd']|escape:'htmlall':'UTF-8'}</div>
			</td>
			<td style="width:50%;">
				<a href="{$cron['url']|escape:'htmlall':'UTF-8'}" class="test_cron" rel="{$key|escape:'htmlall':'UTF-8'}">
					<img src="{$module_dir|escape:'htmlall':'UTF-8'}views/img/test.png" />
				</a> <img src="{$module_dir|escape:'htmlall':'UTF-8'}views/img/indicator.gif" id="animated_{$key|escape:'htmlall':'UTF-8'}" style="display:none" />
			</td>
		</tr>
		{/foreach}
		</tbody>
		</table>
			
</div>


<div class="panel">

	<div class="panel-heading">
		<i class="icon-envelope"></i> {'configure_cron_notification'|m62Lang}
	</div>	
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="cron_notify_emails">{'cron_notify_emails'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="cron_notify_emails" name="cron_notify_emails" style="height:150px;">{$form_data['cron_notify_emails']|escape:'htmlall':'UTF-8'}</textarea></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_emails_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['cron_notify_emails']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="cron_notify_email_mailtype">{'cron_notify_email_mailtype'|m62Lang}</label>
			<div class="col-lg-6">
			<select name="cron_notify_email_mailtype" id="cron_notify_email_mailtype" class="form-control fixed-width-xl">
			{foreach from='email_type'|m62Options key=key item=mail_type}
				<option value="{$key}" {if $form_data['cron_notify_email_mailtype'] == $key}selected="selected"{/if}>{$mail_type}</option>
			{/foreach}
			</select>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_email_mailtype_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3 required" for="cron_notify_email_subject">{'cron_notify_email_subject'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="cron_notify_email_subject" name="cron_notify_email_subject" value="{$form_data['cron_notify_email_subject']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'cron_notify_email_subject_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['cron_notify_email_subject']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group">
			<label class="control-label col-lg-3" for="cron_notify_email_message">{'cron_notify_email_message'|m62Lang}</label>
			<div class="col-lg-6"><textarea id="cron_notify_email_message" name="cron_notify_email_message" style="height:150px;">{$form_data['cron_notify_email_message']|escape:'htmlall':'UTF-8'}</textarea></div>
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