<input type="hidden" value="0" name="ftp_passive" />
<input type="hidden" value="0" name="ftp_ssl" />
	
<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_hostname']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_hostname">{'ftp_hostname'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="ftp_hostname" name="ftp_hostname" value="{$form_data['ftp_hostname']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_hostname_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_hostname']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_username']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_username">{'ftp_username'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="ftp_username" name="ftp_username" value="{$form_data['ftp_username']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_username_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_username']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->
	
<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_password']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_password">{'ftp_password'|m62Lang}</label>
		<div class="col-lg-6"><input type="password" id="ftp_password" name="ftp_password" value="{$form_data['ftp_password']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_password_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_password']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_port']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_port">{'ftp_port'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="ftp_port" name="ftp_port" value="{$form_data['ftp_port']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_port_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_port']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_store_location']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_store_location">{'ftp_store_location'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="ftp_store_location" name="ftp_store_location" value="{$form_data['ftp_store_location']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_store_location_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_store_location']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->
	
<div class="form-wrapper" >
	<div class="form-group {if $form_errors['ftp_passive']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="ftp_passive">{'ftp_passive'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="ftp_passive">
				<input type="checkbox" {if $form_data['ftp_passive'] == '1'}checked="checked"{/if} id="ftp_passive" name="ftp_passive" value="1" class="" />
				{'ftp_passive_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['ftp_passive']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper" >
	<div class="form-group {if $form_errors['ftp_ssl']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 " for="ftp_ssl">{'ftp_ssl'|m62Lang}</label>
		<div class="col-lg-9">
			<div class="help-block"><label for="ftp_ssl">
				<input type="checkbox" {if $form_data['ftp_ssl'] == '1'}checked="checked"{/if} id="ftp_ssl" name="ftp_ssl" value="1" class="" />
				{'ftp_ssl_instructions'|m62Lang}</label>
			</div>
		</div>
		<div class="col-lg-9 col-lg-offset-3">{$form_errors['ftp_ssl']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->

<div class="form-wrapper">
	<div class="form-group {if $form_errors['ftp_timeout']|m62FormErrors}has-error{/if}">
		<label class="control-label col-lg-3 required" for="ftp_timeout">{'ftp_timeout'|m62Lang}</label>
		<div class="col-lg-6"><input type="text" id="ftp_timeout" name="ftp_timeout" value="{$form_data['ftp_timeout']|escape:'htmlall':'UTF-8'}" class="" required="required" /></div>
		<div class="col-lg-6 col-lg-offset-3"><div class="help-block">{'ftp_timeout_instructions'|m62Lang}</div></div>
		<div class="col-lg-6 col-lg-offset-3">{$form_errors['ftp_timeout']|m62FormErrors}</div>
	</div>
</div><!-- /.form-wrapper -->