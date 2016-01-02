<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="dropbox_access_token">{'dropbox_access_token'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="dropbox_access_token" name="dropbox_access_token" value="{$form_data['dropbox_access_token']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'dropbox_access_token_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['dropbox_access_token']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->
	
<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="dropbox_app_secret">{'dropbox_app_secret'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="dropbox_app_secret" name="dropbox_app_secret" value="{$form_data['dropbox_app_secret']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'dropbox_app_secret_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['dropbox_app_secret']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3" for="dropbox_prefix">{'dropbox_prefix'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="dropbox_prefix" name="dropbox_prefix" value="{$form_data['dropbox_prefix']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'dropbox_prefix_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['dropbox_prefix']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->