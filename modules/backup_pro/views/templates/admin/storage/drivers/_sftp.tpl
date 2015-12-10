<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="sftp_host">{'sftp_host'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_host" name="sftp_host" value="{$form_data['sftp_host']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_host_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_host']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 " for="sftp_username">{'sftp_username'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_username" name="sftp_username" value="{$form_data['sftp_username']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_username_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_username']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3" for="sftp_password">{'sftp_password'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="sftp_password" name="sftp_password" value="{$form_data['sftp_password']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_password_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_password']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3" for="sftp_private_key">{'sftp_private_key'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_private_key" name="sftp_private_key" value="{$form_data['sftp_private_key']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_private_key_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_private_key']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="sftp_port">{'sftp_port'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_port" name="sftp_port" value="{$form_data['sftp_port']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_port_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_port']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="sftp_root">{'sftp_root'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_root" name="sftp_root" value="{$form_data['sftp_root']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_root_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_root']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="sftp_timeout">{'sftp_timeout'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="sftp_timeout" name="sftp_timeout" value="{$form_data['sftp_timeout']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'sftp_timeout_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['sftp_timeout']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	