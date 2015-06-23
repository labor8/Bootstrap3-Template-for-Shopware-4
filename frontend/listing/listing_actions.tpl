{if !$sOffers}

{block name="frontend_listing_actions_class"}
<div class="col-md-12 listing_actions{if !$sPages || $sPages.numbers|@count <= 1 || $sNumberPages <= 1} normal{/if}">
{/block}
{block name='frontend_listing_actions_top'}
		{* Sort filter *}
		{block name='frontend_listing_actions_sort'}
        <div class="col-md-3">
            <div class="row">
			<form method="get" action="{url controller=cat sCategory=$sCategoryContent.id}" role="form">
                <div class="form-group">
                    {foreach from=$categoryParams key=key item=value}
                        {if $key == 'sSort'}
                            {continue}
                        {/if}
                        <input type="hidden" name="{$key}" value="{$value}">
                    {/foreach}
                    <input type="hidden" name="sPage" value="1">
                    <div class="sort-filter">
                        <label for="sSort">{s name='ListingLabelSort'}{/s}</label>
                        <select name="sSort" class="form-control auto_submit">
                            <option value="1"{if $sSort eq 1} selected="selected"{/if}>{s name='ListingSortRelease'}{/s}</option>
                            <option value="2"{if $sSort eq 2} selected="selected"{/if}>{s name='ListingSortRating'}{/s}</option>
                            <option value="3"{if $sSort eq 3} selected="selected"{/if}>{s name='ListingSortPriceLowest'}{/s}</option>
                            <option value="4"{if $sSort eq 4} selected="selected"{/if}>{s name='ListingSortPriceHighest'}{/s}</option>
                            <option value="5"{if $sSort eq 5} selected="selected"{/if}>{s name='ListingSortName'}{/s}</option>
                            {block name='frontend_listing_actions_sort_values'}{/block}
                        </select>
                    </div>
                </div>
			</form>
            </div>
        </div>
		{/block}
        
        {* Change layout *}
		{block name="frontend_listing_actions_change_layout"}
		{if !$sCategoryContent.noViewSelect}
			<div class="col-md-6 text-center list-settings">
                <label class="col-md-12">{s name='ListingActionsSettingsTitle'}Darstellung:{/s}</label>
                <ul class="list-inline btn-group">
                    <li><a href="{url params=$categoryParams sViewport='cat' sCategory=$sCategoryContent.id sPage=1 sTemplate='table'}" class="btn btn-default table-view {if $sBoxMode=='table'}active{/if}" title="{s name='ListingActionsSettingsTable'}Tabellen-Ansicht{/s}"><i class="fa fa-table"></i></a></li>
                    <li><a href="{url params=$categoryParams sViewport='cat' sCategory=$sCategoryContent.id sPage=1 sTemplate='list'}" class="btn btn-default list-view {if $sBoxMode=='list'}active{/if}" title="{s name='ListingActionsSettingsList'}Listen-Ansicht{/s}"><i class="fa fa-list"></i></a></li>
                </ul>
            </div>
		{/if}
		{/block}

		{* Article per page *}
		{block name='frontend_listing_actions_items_per_page'}
		{if $sPerPage}
			<form method="get" action="{url controller=cat sCategory=$sCategoryContent.id}" class="col-md-3" role="form">
                <div class="row">
                    <div class="form-group">
                        {foreach from=$categoryParams key=key item=value}
                            {if $key == 'sPerPage'}
                                {continue}
                            {/if}
                            <input type="hidden" name="{$key}" value="{$value}">
                        {/foreach}
                        <input type="hidden" name="sPage" value="1">
                        <div class="articleperpage{if $sCategoryContent.noViewSelect} rightalign{/if}">
                            <label>{s name='ListingLabelItemsPerPage'}{/s}</label>
                            <select name="sPerPage" class="form-control auto_submit">
                            {foreach from=$sPerPage item=perPage}
                                <option value="{$perPage.value}" {if $perPage.markup}selected="selected"{/if}>{$perPage.value}</option>
                            {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
			</form>
		{/if}
		{/block}

		<noscript>
			<input type="submit" class="buttonkit green small rounded" value="OK" />
		</noscript>
{/block}
{block name='frontend_listing_actions_paging'}
	{if $sNumberPages && $sNumberPages > 1}
	<div class="row">
        <div class="col-md-12">
        <hr />
        <label>{s name='ListingPaging'}{/s}</label>
        {block name='frontend_listing_actions_count'}
		{* Count sites *}
		<div class="display_sites">
			{se name="ListingTextSite"}Seite{/se} <strong>{$sPage}</strong> {se name="ListingTextFrom"}von{/se} <strong>{$sNumberPages}</strong>
		</div>
		{/block}
		{* Paging *}
		<ul class="pagination">
			{if $sPages.previous}
				<li><a href="{$sPages.previous|rewrite:$sCategoryInfo.name}" title="{s name='ListingLinkPrevious'}{/s}" class="navi prev">{s name="ListingTextPrevious"}&lt;{/s}</a></li>
			{/if}
			{* Articles per page *}
			{foreach from=$sPages.numbers item=page}
				{if $page.value<$sPage+4 AND $page.value>$sPage-4}
					{if $page.markup AND (!$sOffers OR $sPage)}
						<li><a title="{$sCategoryInfo.name}" class="navi on">{$page.value}</a></li>
					{else}
						<li><li><a href="{$page.link|rewrite:$sCategoryInfo.name}" class="navi">{$page.value}</a></li>
					{/if}
				{elseif $page.value==$sPage+4 OR $page.value==$sPage-4}
					<li class="more">...</li>
				{/if}
			{/foreach}
			{if $sPages.next}
				<li><a href="{$sPages.next|rewrite:$sCategoryInfo.name}" title="{s name='ListingLinkNext'}{/s}" class="navi more">{s name="ListingTextNext"}&gt;{/s}</a></li>
			{/if}
		</ul>
    </div>
	</div>
	{/if}
{/block}
{block name="frontend_listing_actions_close"}
</div>
{/block}
{else}
	{if $sCategoryContent.parent != 1}
	<div class="listing_actions normal">
		<div class="top">
			<a class="offers" href="{url controller='cat' sPage=1 sCategory=$sCategoryContent.id}">
				{s name="ListingActionsOffersLink"}Weitere Artikel in dieser Kategorie &raquo;{/s}
			</a>
		</div>
	</div>
	{/if}
{/if}
