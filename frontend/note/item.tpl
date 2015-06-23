<div class="row{if $lastrow} lastrow{/if}">
    <div class="col-md-12">
        {* Article informations *}
        <div class="col-md-10">
            <hr />
            <div class="row">
                <div class="col-md-4">
                {* Reviews *}
                {if !{config name=VoteDisable}}
                    <div class="rating">
                        <div class="star star{($sBasketItem.sVoteAverange.averange*2)|round}"></div>
                    </div>
                {/if}
                {* Article picture *}
                {if $sBasketItem.image.src.0}
                    <a href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename}" class="thumb_image">
                        <img src="{$sBasketItem.image.src.2}" border="0" alt="{$sBasketItem.articlename}" />
                    </a>
                    {* Zoom picture *}
                    <a href="{$sBasketItem.image.src.5}" rel="lightbox" class="zoom_picture">
                        {s name='NoteLinkZoom'}{/s}
                    </a>
                {else}
                    <a href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename}" class="thumb_image">
                        <img class="no_image" src="{link file='frontend/_resources/images/no_picture.jpg'}" alt="{$sBasketItem.articlename}" />
                    </a>
                {/if}
                {* Delivery informations *}
                {if {config name=BASKETSHIPPINGINFO}}
                    <div class="delivery">
                        {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem}
                    </div>
                {/if}
                </div>
                <div class="col-md-8 basket_details">
                    {* Article name *}
                    <a class="title" href="{$sBasketItem.linkDetails}" title="{$sBasketItem.articlename}">
                        {$sBasketItem.articlename|truncate:40}
                    </a>

                    {* Supplier name *}
                    <div class="supplier">
                        {s name='NoteInfoSupplier'}{/s} {$sBasketItem.supplierName}
                    </div>

                    {* Order number *}
                    <p class="ordernumber">
                        {se name='NoteInfoId'}{/se} {$sBasketItem.ordernumber}
                    </p>

                    {* Article Description *}
                    <p class="desc">
                        {$sBasketItem.description_long|strip_tags|trim|truncate:160}

                        {* Unit price *}
                        {block name="frontend_note_item_unitprice"}
                        {if $sBasketItem.purchaseunit}
                            <div class="article_price_unit">
                                <p>
                                    <strong>{se name="NoteUnitPriceContent"}{/se}:</strong> {$sBasketItem.purchaseunit} {$sBasketItem.sUnit.description}
                                </p>
                                {if $sBasketItem.purchaseunit != $sBasketItem}
                                    <p>
                                        {if $sBasketItem.referenceunit}
                                            <strong class="baseprice">{se name="NoteUnitPriceBaseprice"}{/se}:</strong> {$sBasketItem.referenceunit} {$sBasketItem.sUnit.description} = {$sBasketItem.referenceprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                                        {/if}
                                    </p>
                                {/if}
                            </div>
                        {/if}
                        {/block}

                    </p>
                    {if $sBasketItem.datum_add}
                        {* added date *}
                        <div class="date">
                            {s name='NoteInfoDate'}Hinzugefügt am:{/s} {$sBasketItem.datum_add|date:DATE_MEDIUM}
                        </div>
                    {/if}
                    {block name="frontend_note_index_items"}{/block}
                </div>
            </div>
        </div>

        {* Unit price *}
        <div class="col-md-2">
            <hr class="hidden-sm" />
            {block name="frontend_note_item_price"}
            {if $sBasketItem.itemInfo}
                {$sBasketItem.itemInfo}
            {else}
            <p><strong class="price">{if $sBasketItem.priceStartingFrom}{s namespace='frontend/listing/box_article' name='ListingBoxArticleStartsAt'}{/s} {/if}{$sBasketItem.price|currency}*</strong></p>
            {/if}  
            {* Remove article *}
            <div class="btn-block">
                <a href="{url controller='note' action='delete' sDelete=$sBasketItem.id}" class="btn btn-danger btn-block" title="{s name='NoteLinkDelete'}{/s}">
                {se name='NoteLinkDelete'}{/se}
                </a>
            </div>
            <div class="btn-group-vertical btn-block">
            {* Additional links *}
            {block name="frontend_note_item_actions"}
                {* Place article in basket *}
                {if !$sBasketItem.sConfigurator && !$sBasketItem.sVariantArticle}
                <a href="{url controller=checkout action=addArticle sAdd=$sBasketItem.ordernumber}" class="btn btn-primary basket" title="{s name='NoteLinkBuy'}{/s}">
                    {s name='NoteLinkBuy'}{/s}
                </a>
                {/if}
                {* Compare article *}
                {block name="frontend_note_item_actions_compare"}{/block}
                {* Article Details *}
                <a href="{$sBasketItem.linkDetails}" class="btn btn-default detail" title="{$sBasketItem.articlename}">
                    {se name='NoteLinkDetails'}{/se}
                </a>
            </div>
            {/block}
        {/block}
        </div>
    </div>
</div>