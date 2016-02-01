<div class="form-wrapper">
	<div class="form-group {if $form_errors['rcf_username']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="rcf_username">{'rcf_username'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="rcf_username" name="rcf_username" value="{$form_data['rcf_username']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rcf_username_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['rcf_username']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['rcf_api']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="rcf_api">{'rcf_api'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="rcf_api" name="rcf_api" value="{$form_data['rcf_api']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rcf_api_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['rcf_api']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['rcf_container']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="rcf_container">{'rcf_container'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="rcf_container" name="rcf_container" value="{$form_data['rcf_container']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rcf_container_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['rcf_container']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['rcf_optional_prefix']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3" for="rcf_container">{'rcf_optional_prefix'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="rcf_optional_prefix" name="rcf_optional_prefix" value="{$form_data['rcf_optional_prefix']|escape:'htmlall':'UTF-8'}" class="" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rcf_optional_prefix_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['rcf_optional_prefix']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->	
	
<div class="form-wrapper">
	<div class="form-group">
		<label class="control-label col-lg-3 required" for="rcf_location">{'rcf_location'|m62Lang}</label>
		<div class="col-lg-6">
		<select name="rcf_location" id="rcf_location" class="form-control fixed-width-xl">
			<option value="us" {if $form_data['rcf_location'] == 'us'}selected="selected"{/if}>US</option>
			<option value="uk"  {if $form_data['rcf_location'] == 'uk'}selected="selected"{/if}>UK</option>
		</select>
		</div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rcf_location_instructions'|m62Lang}</div></div>
	</div>
</div><!-- /.form-wrapper -->