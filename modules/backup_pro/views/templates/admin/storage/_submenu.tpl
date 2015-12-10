<div class="row" style="float: right;">
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    New Storage Location
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
    {foreach from=$available_storage_engines key=k item=section}
    <li><a href="{$link->getAdminLink('AdminBackupProSettings')|escape:'html':'UTF-8'}&amp;section=storage&amp;sub=new_storage&engine={$k|escape:'htmlall':'UTF-8'}">
    	<img src="{$module_dir|escape}views/img/storage/{$section['icon']|escape:'htmlall':'UTF-8'}.png" />
    	{$section['name']|m62Lang}
    </a></li>
    {/foreach} 
  </ul>
</div>
</div>