<div id="container" class="row">
    {include file="./includes/_errors.tpl"}
    
    {if $invalid_storage_id == 'yes'}
    <div class="alert alert-danger">Invalid Storage ID</div>
    {/if}
    
    {include file="./settings/_settings_nav.tpl"}
    
    <div class="panel">
		<div class="panel-heading">
			<i class="icon-folder-open"></i> {'storage_bp_settings_menu'|m62Lang}
		</div>
	
		{include file="./storage/_submenu.tpl"}
	
		<table border="0" cellspacing="0" cellpadding="0" class="table"  width="100%" >
		<thead>
		<tr>
			<th>{'storage_location_name'|m62Lang}</th>
			<th>{'type'|m62Lang}</th>
			<th>{'status'|m62Lang}</th>
			<th>{'created_date'|m62Lang}</th>
			{if $can_remove}<th></th>{/if}
		</tr>
		</thead>
		<tbody>
		{if $storage_details|count >= 1}
		{foreach from=$storage_details key=k item=storage}
		<tr>
			<td><a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=storage&amp;sub=edit_storage&amp;id={$k}">{$storage['storage_location_name']}</a></td>
			<td>{$storage['storage_location_driver']}</td>
			<td>{if $storage['storage_location_status'] == '1'} {'active'|m62Lang} {else} {'inactive'|m62Lang} {/if}</td>
			<td>{$storage['storage_location_create_date']|m62DateTime}</td>
			{if $can_remove}<td><a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=storage&amp;sub=remove_storage&amp;id={$k}">Remove</a></td>{/if}
		</tr>
		{/foreach}
		{else}
		<tr>
			<td colspan='4'>{'no_storage_locations_created_yet'|m62Lang}</td>
		</tr>		
		{/if}
		
		
		</tbody>
		
		</table>	
	</div>
	
	
</div>    