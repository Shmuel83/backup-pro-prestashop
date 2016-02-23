<div class="panel">
	<input type="hidden" value="0" name="enable_rest_api" />
	<div class="panel-heading">
		<i class="icon-globe"></i> {'rest_api_details'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<p>{'rest_api_instructions'|m62Lang}</p>
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