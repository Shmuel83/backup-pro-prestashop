<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    {include file="./settings/_settings_nav.tpl"}
    
    <form name="" method="POST" action="" class="defaultForm form-horizontal AdminProfiles" >
	{if $section == 'general'}
		{include file="./settings/_general.tpl"}
	{/if}
	
	{if $section == 'license'}
		{include file="./settings/_license.tpl"}
	{/if}	
	</form>
</div>	