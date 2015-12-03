<div id="container" class="row">

{include file="../settings/_settings_nav.tpl"}
    <div class="panel">
		<div class="panel-heading">
			<i class="icon-folder-open"></i> {'edit_storage_location'|m62Lang} ({$storage_engine['name']|m62Lang})
		</div>
	
		{include file="../storage/_submenu.tpl"} <br clear="all" />
		
		<form name="new_storage_form" method="POST" action="" class="defaultForm form-horizontal " >
			{include file="./_form.tpl"}
		</form>
	</div>
</div>