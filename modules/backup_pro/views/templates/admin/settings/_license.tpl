<div class="panel">
												
	<div class="panel-heading">
		<i class="icon-heart-empty"></i> {'license_details'|m62Lang}
	</div>
	
	<div class="form-wrapper">
		<p>{'license_details_instructions'|m62Lang}</p>
		<div class="form-group">
			<label class="control-label col-lg-3 required">{'license_number'|m62Lang}</label>
			<div class="col-lg-9"><input type="text" id="license_number" name="license_number" value="{$form_data['license_number']}" class="" required="required" /></div>
			<div class="col-lg-9 col-lg-offset-3"><div class="help-block">{'license_number_instructions'|m62Lang}</div></div>
		</div>
	</div><!-- /.form-wrapper -->
	
	<div class="panel-footer">
		<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> Save
		</button>
	</div>
							
</div>