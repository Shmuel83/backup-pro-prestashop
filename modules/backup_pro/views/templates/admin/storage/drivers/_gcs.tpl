<input type="hidden" value="0" name="gcs_reduced_redundancy" />
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

<div class="form-wrapper">
	<div class="form-group {if $form_errors['gcs_optional_prefix']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3" for="gcs_optional_prefix">{'gcs_optional_prefix'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="gcs_optional_prefix" name="gcs_optional_prefix" value="{$form_data['gcs_optional_prefix']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'gcs_optional_prefix_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['gcs_optional_prefix']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	

<div class="form-wrapper" >
	<div class="form-group {if $form_errors['gcs_reduced_redundancy']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="gcs_reduced_redundancy">{'gcs_reduced_redundancy'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="gcs_reduced_redundancy">
				<input type="checkbox" {if $form_data['gcs_reduced_redundancy'] == '1'}checked="checked"{/if} id="gcs_reduced_redundancy" name="gcs_reduced_redundancy" value="1" class="" />
				{'gcs_reduced_redundancy_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['gcs_reduced_redundancy']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->