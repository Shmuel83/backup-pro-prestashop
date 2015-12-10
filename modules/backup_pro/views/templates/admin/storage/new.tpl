<div id="container" class="row">
    {include file="../includes/_errors.tpl"}
    
    {if $form_has_errors}
    	
    	<div class="alert alert-danger">Woops! Looks like we have an issue...

    	</div>
    {/if}    
    
    {include file="../settings/_settings_nav.tpl"}
    
    <div class="panel">
		<div class="panel-heading">
			<img src="{$module_dir|escape}views/images/storage/{$storage_engine['icon']|escape:'htmlall':'UTF-8'}.png" /> {'add_storage_location'|m62Lang} ({$storage_engine['name']|m62Lang})
		</div>
	
		{include file="../storage/_submenu.tpl"} <br clear="all" />
		
		<form name="new_storage_form" method="POST" action="" class="defaultForm form-horizontal " >
			{include file="./_form.tpl"}
		</form>
	</div>
</div>    