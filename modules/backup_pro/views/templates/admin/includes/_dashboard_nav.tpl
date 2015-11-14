    <ul class="nav nav-tabs">
        <li role="presentation" {if $active_tab == 'dashboard'}class="active"{/if}><a href="{$link->getAdminLink('AdminBackupProDashboard')|escape:'html':'UTF-8'}">{'home_bp_dashboard_menu'|m62Lang}</a></li>
        <li role="presentation" {if $active_tab == 'db_backups'}class="active"{/if}><a href="{$link->getAdminLink('AdminBackupProDashboard')|escape:'html':'UTF-8'}&amp;section=db_backups">{'db_bp_dashboard_menu'|m62Lang}</a></li>
        <li role="presentation" {if $active_tab == 'file_backups'}class="active"{/if}><a href="{$link->getAdminLink('AdminBackupProDashboard')|escape:'html':'UTF-8'}&amp;section=file_backups">{'files_bp_dashboard_menu'|m62Lang}</a></li>
    </ul>