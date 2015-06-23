{* Filter supplier *}
{block name="frontend_listing_filter_supplier"}
{if $sSuppliers|@count>1 && $sCategoryContent.parent != 1}
<div class="panel panel-default supplier">
    <div class="panel-heading">
        <h2 class="panel-title">{s name='FilterSupplierHeadline'}{/s}</h2>
    </div>
	{foreach from=$sSuppliers key=supKey item=supplier name=supplier}{/foreach}
		{block name="frontend_listing_filter_supplier_each"}
		<div class="list-group">
	        {foreach from=$sSuppliers key=supKey item=supplier name=supplier}
	        {if $supplier.image} 
            <div id="n{$supKey+1}" class="list-group-item image">
                <a href="{$supplier.link}" title="{$supplier.name}">
                    <img src="{link file=$supplier.image}" alt="{$supplier.name}" border="0" title="{$supplier.name}" />
                </a>
            </div>
	        {else}
            <div {if $smarty.foreach.supplier.last}class="list-group-item last"{/if} id="n{$supKey+1}" {if $sSupplierInfo.name eq $supplier.name}class="list-group-item active"{else}class="list-group-item"{/if}>
                <a href="{$supplier.link}" title="{$supplier.name}">
                    {$supplier.name} <span class="badge pull-right">{$supplier.countSuppliers}</span>
                </a>
            </div>
	        {/if}
			{/foreach}		 
    	</div>
    	{/block}
    </div>
{/if}
{/block}