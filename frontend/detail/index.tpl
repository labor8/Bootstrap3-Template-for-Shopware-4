{extends file='frontend/index/index.tpl'}

{block name='frontend_index_header'}
	{include file="frontend/detail/header.tpl"}
{/block}

{* Main content *}
{block name='frontend_index_content'}
	<section id="detail" class="col-md-12">
        {block name="frontend_detail_index_navigation"}
            {include file='frontend/detail/navigation.tpl'}
        {/block}
        <div class="row">
            <div class="col-md-3">
                {* Order number *}
                {if $sArticle.ordernumber} 
                    {block name='frontend_detail_data_ordernumber'}
                        <p class="ordernumber">{se name="DetailDataId"}{/se} {$sArticle.ordernumber}</p>
                    {/block}
                {/if}
                {* Article name *}
                {block name='frontend_detail_index_name'}
                    <h1>{$sArticle.articleName}</h1>
                {/block}
                {* Supplier name *}
                {if $sArticle.supplierName}
                    {block name='frontend_detail_index_supplier'}
                        <strong class="supplier">{se name="DetailFrom"}{/se}: {$sArticle.supplierName}</strong>
                    {/block}
                {/if}
                {* Caching variant article details *}
                {if $sArticle.sVariants}
                    {foreach name=line from=$sArticle.sVariants item=sVariant}
                        <div id="{$sVariant.ordernumber}">
                            {include file="frontend/detail/data.tpl" sArticle=$sVariant}
                        </div>
                    {/foreach}
                {/if}
            </div>
            <div class="col-md-6 text-center">
                {* Center *}
                {include file="frontend/detail/image.tpl"}
            </div>
            <div class="col-md-3">
                {if $sArticle.sBundles || $sArticle.sRelatedArticles && $sArticle.crossbundlelook || $sArticle.sVariants}
                <div id="{$sArticle.ordernumber}" class="row">
                    {include file="frontend/detail/data.tpl" sArticle=$sArticle}
                </div>
                {/if}
                {* Article data *}
                <div id="article_details" class="row">
                    {block name='frontend_detail_index_data'}
                    {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
                    {/block}
                </div>
                {block name='frontend_detail_index_after_data'}{/block}
                {* Configurator table // div buybox *}
                {if $sArticle.sConfigurator && $sArticle.sConfiguratorSettings.type==2}
                {else}
                {/if}
                {* Article notification *}
                {block name="frontend_detail_index_notification"}
                {if $sArticle.notification && ($sArticle.instock <= 0 || $sArticle.sVariants) && $ShowNotification}
                    {include file="frontend/plugins/notification/index.tpl"}
                {/if}
                {/block}
                {* Configurator drop down menu *}
                {block name="frontend_detail_index_configurator"}
                    {if $sArticle.sConfigurator}
                        {if $sArticle.sConfiguratorSettings.type eq 1}
                        {include file="frontend/detail/config_step.tpl"}
                        {elseif $sArticle.sConfiguratorSettings.type != 2}
                        {include file="frontend/detail/config_upprice.tpl"}
                        {/if}
                    {/if}
                {/block}
                {* Include buy button and quantity box *}
                {block name="frontend_detail_index_buybox"}
                    {include file="frontend/detail/buy.tpl"}
                {/block}
            </div>
        </div>
    </section>
    {* Detailinfo *}
    {block name="frontend_detail_index_detail"}
    <section id="detailinfo" class="col-md-12">
        {* Bundle *}
        {block name="frontend_detail_index_bundle"}
            {include file='frontend/detail/bundle/include.tpl'}
        {/block}
        {block name="frontend_detail_index_tabs"}
            {* Tabs *}
            <div id="tabs">
                {* Tabsnavigation *}
                {include file="frontend/detail/tabs.tpl"}
                <!-- Tab panes -->
                <div class="tab-content">
                    {* Article description *}
                    {block name="frontend_detail_index_tabs_description"}
                        {include file="frontend/detail/description.tpl"}
                    {/block}
                    {* Article rating *}
                    {if !{config name=VoteDisable}}
                    {block name="frontend_detail_index_tabs_rating"}
                        {include file="frontend/detail/comment.tpl"}
                    {/block}
                    {/if}
                    {* Related articles *}
                    {block name="frontend_detail_index_tabs_related"}
                        {include file="frontend/detail/related.tpl"}
                    {/block}
                    {* Similar articles *}
                    {include file='frontend/detail/similar.tpl'}
                </div>
            </div>
            {* "Customers bought also" slider *}
            {block name="frontend_detail_index_also_bought_slider"}
                {if {config name=alsoBoughtShow}}
                    {action module=widgets controller=recommendation action=bought articleId=$sArticle.articleID}
                {/if}
            {/block}
            {* "Customers similar viewed slider *}
            {block name="frontend_detail_index_similar_viewed_slider"}
                {if {config name=similarViewedShow}}
                    {action module=widgets controller=recommendation action=viewed articleId=$sArticle.articleID}
                {/if}
            {/block}
        {/block}
    </section>
    {/block}
{/block}