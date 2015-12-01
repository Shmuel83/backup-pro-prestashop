<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    
    
    
    {if $form_has_errors}
    	
    	<div class="alert alert-danger">Woops! Looks like we have an issue...

    	</div>
    {/if}    
    
    {include file="./settings/_settings_nav.tpl"}
    
    <form name="fdsafdsafdsa" method="POST" action="" class="defaultForm form-horizontal " >
	{if $section == 'general'}
		{include file="./settings/_general.tpl"}
	{/if}
	
	{if $section == 'db_backups'}
		{include file="./settings/_db.tpl"}
	{/if}	
	
	{if $section == 'license'}
		{include file="./settings/_license.tpl"}
	{/if}	
	</form>
</div>	