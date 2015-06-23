{* Promotion *}
{include file='frontend/listing/promotions.tpl' sTemplate=$sTemplate}

{* Sorting and changing layout *}
{block name="frontend_listing_top_actions"}
{if !$sOffers}
	{include file='frontend/listing/listing_actions.tpl' sTemplate=$sTemplate}
{/if}
{/block}

{* Supplier filter *}
{block name="frontend_listing_list_filter_supplier"}
{if $sSupplierInfo} 
	<div id="supplierfilter" {if $sSupplierInfo.image}class="col-md-12 supplierfilter_image"{else}class="col-md-12"{/if}>
		{if $sSupplierInfo.image}
			<img src="{$sSupplierInfo.image}" alt="{$sSupplierInfo.name}" name="{$sSupplierInfo.name}" border="0" title="{$sSupplierInfo.name}" />
		{else}
        <div class="text-info">
            {se name='ListingInfoFilterSupplier'}{/se} <strong>{$sSupplierInfo.name}</strong>
        </div>
		{/if}
        <a href="{$sSupplierInfo.link}" title="{s name='ListingLinkAllSuppliers'}{/s}" class="btn btn-default bt_allsupplier">{se name='ListingLinkAllSuppliers'}{/se}</a>
        <hr />
	</div>
{/if}
{/block}

{* Hide actual listing if a promotion is active *}
{if !$sOffers} 
{* <div id="{$sTemplate}"> *}
{block name="frontend_listing_list_inline"}
		{* Actual listing *}
		{foreach $sArticles as $sArticle}
			{include file="frontend/listing/box_article.tpl" sTemplate=$sTemplate lastitem=$sArticle@last firstitem=$sArticle@first}
		{/foreach}
{/block}
{* </div> *}
{/if}

{* Paging *}
{block name="frontend_listing_bottom_paging"}
	{include file='frontend/listing/listing_actions.tpl' sTemplate=$sTemplate}
{/block}