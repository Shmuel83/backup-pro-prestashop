<div id="container" class="row">

    {include file="./includes/_errors.tpl"}   
    {include file="./includes/_dashboard_nav.tpl"}
    <div class="panel">
		<h3>{'delete_backup'|m62Lang} ( {$backups|count} )</h3>
		
		<p>{'delete_backup_confirm'|m62Lang}</p>
		
		<p class="notice">{'action_can_not_be_undone'|m62Lang}</p>
			<br /><br />
			<form name="remove_backups" action="{$link->getAdminLink('AdminBackupProManage')|escape:'html':'UTF-8'}&amp;section=remove_backup" method="POST"  >
			<input type="hidden" value="{$backup_type|escape:'htmlall':'UTF-8'}" name="type" />
			{include file="./includes/_backup_table.tpl"}
			
			
			<div class="panel-footer"><button name="submit_button" class="btn btn-primary pull-right" value="1" id="submit_button" type="submit">
								{'delete'|m62Lang}
							</button>
			</div>
			</form>

	</div>
</div>