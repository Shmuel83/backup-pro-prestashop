<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    
    
    
    {if $form_has_errors}
    	
    	<div class="alert alert-danger">Woops! Looks like we have an issue...

    	</div>
    {/if}     
    
    {if $update == 'yes'}
    <div class="alert alert-success">{'settings_updated'|m62Lang}</div>
    {/if} 
    
    {include file="./settings/_settings_nav.tpl"}
    
    <form name="backup_pro_settings" method="POST" action="" class="defaultForm form-horizontal " >
	{if $section == 'general'}
		{include file="./settings/_general.tpl"}
	{elseif $section == 'file_backups'}
		{include file="./settings/_files.tpl"}
	{elseif $section == 'db_backups'}
		{include file="./settings/_db.tpl"}
	{elseif $section == 'cron'}
		{include file="./settings/_cron.tpl"}
	{elseif $section == 'license'}
		{include file="./settings/_license.tpl"}
	{else}
		{include file="./settings/_integrtiy_agent.tpl"}
	{/if}	
	</form>
</div>	