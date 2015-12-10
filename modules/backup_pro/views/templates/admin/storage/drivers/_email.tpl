<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="email_storage_emails">{'email_storage_emails'|m62Lang}</label>
		<div class="col-lg-6"><textarea id="email_storage_emails" name="email_storage_emails" style="height:150px;" required="required">{$form_data['email_storage_emails']|escape:'htmlall':'UTF-8'}</textarea></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'email_storage_emails_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['email_storage_emails']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="email_storage_attach_threshold">{'email_storage_attach_threshold'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="email_storage_attach_threshold" name="email_storage_attach_threshold" value="{$form_data['email_storage_attach_threshold']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'email_storage_attach_threshold_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['email_storage_attach_threshold']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->