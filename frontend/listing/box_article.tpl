{* Columns *}
{* component_article.tpl extends this file 'box_article.tpl' *}
{if $template != 'component_article'} 
{assign var=col value=$sTemplate}
{if $col == 'listing-1col' }
{$col = 12 }
{elseif $col == 'listing-2col' }
{$col = 6 }
{elseif $col == 'listing-3col' }
{$col = 4 }
{elseif $col == 'listing-4col' }
{$col = 3 }
{elseif $col == 'listing' }
{$col = 12 }
{else}
{$col = 12 }
{/if}
{else}
{$col = 0 }
{/if}
<div class="col-md-{$col}{if $lastitem} last{/if}{if $firstitem} first{/if}">
<div class="thumbnail text-center">
		{* Top *}
		{block name='frontend_listing_box_article_hint'}
			{if $sArticle.highlight}
			<div class="label label-primary top">{se name='ListingBoxTip'}{/se}</div>
			{/if}
		{/block}
		
		{* New *}
		{block name='frontend_listing_box_article_new'}
			{if $sArticle.newArticle}
            <div class="label label-success new">{se name='ListingBoxNew'}{/se}</div>
			{/if}
		{/block}
		
		{* ESD article *}
		{block name='frontend_listing_box_article_esd'}
			{if $sArticle.esd}
			<div class="ico_esd">{se name='ListingBoxInstantDownload'}{/se}</div>
			{/if}
		{/block}
		
		{* Article rating *}
        {block name='frontend_listing_box_article_rating'}
        	{if $sArticle.sVoteAverange.averange}
	        <div class="star star{($sArticle.sVoteAverange.averange * 2)|round:0}"></div>
	        {/if}
	    {/block}
        
		{* Article picture *}
		{block name='frontend_listing_box_article_picture'}
		{if $sTemplate eq 'listing-3col' || $sTemplate eq 'listing-2col'}
			{assign var=image value=$sArticle.image.src.3}
		{else}
			{assign var=image value=$sArticle.image.src.2}
		{/if}
		<a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}">
        {if isset($sArticle.image.src)}<img src="{$image})" alt="{$sArticle.articleName}" class="img-rounded" />{/if}
		{if !isset($sArticle.image.src)}<img src="http://placehold.it/350x150" alt="{s name='ListingBoxNoPicture'}{/s}" class="img-responsive" />{/if}</a>
		{/block}
				
		{* Article name *}
		{block name='frontend_listing_box_article_name'}
        <h4><a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" class="title" title="{$sArticle.articleName}">{$sArticle.articleName|truncate:47}</a></h4>
		{/block}
		
		{* Description *}
		{block name='frontend_listing_box_article_description'}
		{if $sTemplate eq 'listing-1col'}
			{assign var=size value=270}
		{else}
			{assign var=size value=60}
		{/if}
		<p class="desc">{if $sTemplate != 'listing'}
			{$sArticle.description_long|strip_tags|truncate:$size}
			{/if}
		</p>
		{/block}
		
		{* Unit price *}
		{block name='frontend_listing_box_article_unit'}
        {if $sArticle.purchaseunit}
            <div class="{if !$sArticle.pseudoprice}article_price_unit{else}article_price_unit_pseudo{/if}">
                {if $sArticle.purchaseunit && $sArticle.purchaseunit != 0}
                    <p>
                        <strong>{se name="ListingBoxArticleContent"}{/se}:</strong> {$sArticle.purchaseunit} {$sArticle.sUnit.description}
                    </p>
                {/if}
                {if $sArticle.purchaseunit != $sArticle.referenceunit}
                    <p>
                        {if $sArticle.referenceunit}
                            <strong class="baseprice">{se name="ListingBoxBaseprice"}{/se}:</strong> {$sArticle.referenceunit} {$sArticle.sUnit.description} = {$sArticle.referenceprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                        {/if}
                    </p>
                {/if}
            </div>
        {/if}
		{/block}    	
		
		{* Article Price *}
		{block name='frontend_listing_box_article_price'}
		<p class="{if $sArticle.pseudoprice}pseudoprice{else}price{/if}">
	        {if $sArticle.pseudoprice}
	        	<span class="pseudo">{s name="reducedPrice"}Statt: {/s}{$sArticle.pseudoprice|currency} {s name="Star"}*{/s}</span>
	        {/if}
	        <span class="price large">{if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}{$sArticle.price|currency} {s name="Star"}*{/s}</span>
        </p>
        {/block}
       	
       	{* Compare and more *}
       	{block name='frontend_listing_box_article_actions'}
       	<div class="actions btn-group-vertical" style="width: 100%">
       		{block name='frontend_listing_box_article_actions_buy_now'}
       		{* Buy now button *}
       		{if !$sArticle.priceStartingFrom && !$sArticle.sConfigurator && !$sArticle.variants && !$sArticle.sVariantArticle && !$sArticle.laststock == 1 && !($sArticle.notification == 1 && {config name="deactivatebasketonnotification"} == 1)}
       			<a href="{url controller='checkout' action='addArticle' sAdd=$sArticle.ordernumber}" title="{s name='ListingBoxLinkBuy'}{/s}" class="btn btn-primary buynow">
                    {s name='ListingBoxLinkBuy'}{/s}</a>
       		{/if}
       		{/block}

       		{block name='frontend_listing_box_article_actions_inline'}
       			{* More informations button *}
				<a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}" title="{$sArticle.articleName}" class="btn btn-default more">
                    {s name='ListingBoxLinkDetails'}{/s}</a>
       		{/block}
		</div>
		{/block}
	</div>
</div>