<div style="float: right;">
<select name="NewStorageDropdown" id="NewStorageDropdown" >
     <option value="0">New Storage Location</option>
			{foreach from=$available_storage_engines key=k item=section}
			<option value="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=storage&amp;sub=new_storage&engine={$k}" >{$section['name']|m62Lang}</option>
			{/foreach}  
</select>
</div>