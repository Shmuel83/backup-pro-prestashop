<div class="form-wrapper">
	<div class="form-group {if $form_errors['gcs_access_key']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="gcs_access_key">{'gcs_access_key'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="gcs_access_key" name="gcs_access_key" value="{$form_data['gcs_access_key']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'gcs_access_key_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['gcs_access_key']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['gcs_secret_key']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="gcs_secret_key">{'gcs_secret_key'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="gcs_secret_key" name="gcs_secret_key" value="{$form_data['gcs_secret_key']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'gcs_secret_key_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['gcs_secret_key']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['gcs_bucket']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="gcs_bucket">{'gcs_bucket'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="gcs_bucket" name="gcs_bucket" value="{$form_data['gcs_bucket']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'gcs_bucket_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['gcs_bucket']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->