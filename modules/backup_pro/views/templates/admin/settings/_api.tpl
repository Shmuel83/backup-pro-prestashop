<div class="panel">
	<input type="hidden" value="0" name="enable_rest_api" />
	<div class="panel-heading">
		<i class="icon-globe"></i> {'rest_api_details'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<p>{'rest_api_instructions'|m62Lang}</p>
		<div class="form-group {if $form_errors['enable_rest_api']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 " for="enable_rest_api">{'rest_api_route_entry'|m62Lang}</label>
			<div class="col-lg-9">
				<div class="help-block"><a href="{$rest_api_route_entry|escape:'htmlall':'UTF-8'}" target="_blank">{$rest_api_route_entry|escape:'htmlall':'UTF-8'}</a>
				</div>
			</div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'rest_api_route_entry_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="form-wrapper">
		<div class="form-group {if $form_errors['enable_rest_api']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 " for="enable_rest_api">{'enable_rest_api'|m62Lang}</label>
			<div class="col-lg-9">
				<div class="help-block"><label for="enable_rest_api">
					<input type="checkbox" {if $form_data['enable_rest_api'] == '1'}checked="checked"{/if} id="enable_rest_api" name="enable_rest_api" value="1" class="" />
					{'enable_rest_api_instructions'|m62Lang}</label>
				</div>
			</div>
			<div class="col-lg-9 col-lg-offset-3">{$form_errors['enable_rest_api']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper --> 
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>

<div class="panel" id="rest_api_wrap" style="display:none; ">
												
	<div class="panel-heading">
		<i class="icon-cogs"></i> {'rest_api_credentials'|m62Lang}
	</div>

	
	
	<div class="form-wrapper"><p>{'rest_api_credentials_instructions'|m62Lang}</p>
		<div class="form-group {if $form_errors['api_key']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 required" for="api_key">{'api_key'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="api_key" name="api_key" value="{$form_data['api_key']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'api_key_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['api_key']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->
	
	
	<div class="form-wrapper">
		<div class="form-group {if $form_errors['api_secret']|m62FormErrors}has-error{/if}">
			<label class="control-label col-lg-3 required" for="api_secret">{'api_secret'|m62Lang}</label>
			<div class="col-lg-6"><input type="text" id="api_secret" name="api_secret" value="{$form_data['api_secret']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
			<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'api_secret_instructions'|m62Lang}</div></div>
			<div class="col-lg-6 col-lg-offset-3">{$form_errors['api_secret']|m62FormErrors}</div>
		</div>
	</div><!-- /.form-wrapper -->	
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit_keys" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>	
							
</div>