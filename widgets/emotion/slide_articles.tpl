{* {$width = $sElementWidth-61} *}
<!-- <div class="slide" style="width:{$width|round:0}px;height:{$sElementHeight}px"> -->
<ul class="slide list-inline">
	{foreach from=$articles item=article}
    {assign var=image value=$article.image.src.4}
    {* Columns *}
    {assign var=col value=$sPerPage}
    {if $col == 2 }
    {$col = 6 }
    {elseif $col == 3 }
    {$col = 4 }
    {elseif $col == 4 }
    {$col = 3 }
    {elseif $col == 6 }
    {$col = 2 }
    {else}
    {$col = 12 }
    {/if}
        <li class="col-md-{$col} col-xs-12">
            <div class="sliding_articles thumbnail pam text-center">
            <!-- article 1 -->
            {if $image}
            <a class="article-thumb-wrapper" title="{$article.articleName}" href="{$article.linkDetails}">
                <img src="{$image}" title="{$article.articleName}" class="img-responsive center-block" />
            </a>
            {else}
            <a class="article-thumb-wrapper" title="{$article.articleName}" href="{$article.linkDetails}">
                <img src="{link file="frontend/_resources/images/no_picture.jpg"}" title="{$article.articleName}" class="img-responsive center-block" />
            </a>
            {/if}
            <a title="{$article.articleName}" class="title" href="{$article.linkDetails}">{$article.articleName|truncate:35}</a>

            {if $article.purchaseunit && $article.purchaseunit != 0}
                <p class="article-purchase-unit">
                    <span class="purchaseunit">
                        <strong>{se name="ListingBoxArticleContent" namespace="frontend/listing/box_article"}{/se}:</strong> {$article.purchaseunit} {$article.sUnit.description}
                    </span>
            {/if}
            {if $article.purchaseunit != $article.referenceunit}
                    {if $article.referenceunit}
                        <span class="referenceunit">
                         ({$article.referenceprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s} / {$article.referenceunit} {$article.sUnit.description})
                        </span>
                    {/if}
                </p>
            {/if}

            <p>
                {if $article.pseudoprice}
                    <span class="pseudo">
                    <em>
                    	{s name="reducedPrice"}Statt: {/s}{$article.pseudoprice|currency} {s name="Star"}*{/s}
                    </em>
                    </span>
                {/if}
                <span class="price{if $article.pseudoprice} pseudo{/if}">{if $article.priceStartingFrom && !$article.liveshoppingData}{s namespace="frontend/plugins/recommendation/slide_articles" name='ListingBoxArticleStartsAt'}{/s} {/if}{$article.price|currency} *</span>
            </p>
            </div>
        </li>
	{/foreach}
</ul>
{if $pages}
<div class="pages">{$pages}</div>
{/if}
