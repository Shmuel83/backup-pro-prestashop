<div id="container" class="row">

{include file="../settings/_settings_nav.tpl"}
    <div class="panel">
		<div class="panel-heading">
			<img src="{$module_dir|escape}views/img/storage/{$storage_engine['icon']|escape:'htmlall':'UTF-8'}.png" /> {'remove_storage_location'|m62Lang} ({$storage_details['storage_location_name']|escape:'htmlall':'UTF-8'})
		</div>
		
		{include file="../storage/_submenu.tpl"} <br clear="all" />
		
		<form name="new_storage_form" method="POST" action="" class="defaultForm form-horizontal " >
			
			<p>{'delete_storage_confirm'|m62Lang}</p>
			<p class="notice">{'action_can_not_be_undone'|m62Lang}</p>   
			<p>{$storage_details['storage_location_name']}</p> 
                    
			<div class="panel-footer">
				<button type="submit" value="1"	id="m62_settings_submit" name="submitAddprofile" class="btn btn-default pull-right">
				<i class="process-icon-delete"></i> Remove {'remove'|m62Lang}
				</button>
			</div>                    
		</form>		
		
	</div>
</div>	