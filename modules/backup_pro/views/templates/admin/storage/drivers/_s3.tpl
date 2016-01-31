<input type="hidden" value="0" name="s3_reduced_redundancy" />
<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="s3_access_key">{'s3_access_key'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="s3_access_key" name="s3_access_key" value="{$form_data['s3_access_key']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'s3_access_key_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['s3_access_key']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="s3_secret_key">{'s3_secret_key'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="s3_secret_key" name="s3_secret_key" value="{$form_data['s3_secret_key']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'s3_secret_key_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['s3_secret_key']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="s3_bucket">{'s3_bucket'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="s3_bucket" name="s3_bucket" value="{$form_data['s3_bucket']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'s3_bucket_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['s3_bucket']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="s3_region">{'s3_region'|m62Lang}</label>
		<div class="col-lg-6">
		<select name="s3_region" id="s3_region" class="form-control fixed-width-xl">
		{foreach from='s3_regions'|m62Options:false key=k item=v}
		<option value="{$k|escape:'htmlall':'UTF-8'}" {if $form_data['s3_region'] == $k}selected="selected"{/if}>{$v|escape:'htmlall':'UTF-8'}</option>
		{/foreach}
		</select>
		</div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'s3_region_instructions'|m62Lang}</div></div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3" for="rcf_container">{'s3_optional_prefix'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="s3_optional_prefix" name="s3_optional_prefix" value="{$form_data['s3_optional_prefix']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'s3_optional_prefix_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['s3_optional_prefix']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	

<div class="form-wrapper" >
	<div class="form-group">
		<label class="control-label col-lg-3 " for="s3_reduced_redundancy">{'s3_reduced_redundancy'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="s3_reduced_redundancy">
				<input type="checkbox" {if $form_data['s3_reduced_redundancy'] == '1'}checked="checked"{/if} id="s3_reduced_redundancy" name="s3_reduced_redundancy" value="1" class="" />
				{'s3_reduced_redundancy_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['s3_reduced_redundancy']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->