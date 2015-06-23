{* Breadcrumb *}
<div class="col-md-12">
    <ul class="breadcrumb">
        {if $sShopname}
            <li>{se name='BreadcrumbDefault'}{/se}</li>
            <li><a href="{url controller='index'}">{$sShopname}</a></li>
        {/if}
        {foreach name=breadcrumb from=$sBreadcrumb item=breadcrumb}
        {if $breadcrumb.name}
            {if $smarty.foreach.breadcrumb.last}
            <li>
                <a href="{if $breadcrumb.link}{$breadcrumb.link}{else}#{/if}" title="{$breadcrumb.name}" class="active">{$breadcrumb.name}</a>
            </li>
            {else} 
            <li>
                <a href="{if $breadcrumb.link}{$breadcrumb.link}{else}#{/if}" title="{$breadcrumb.name}">{$breadcrumb.name}</a>
            </li>
            {/if}
        {/if}
        {/foreach}
    </ul>
</div>