{** * Shopware 4.2 Template * 
* @category Shopware 
* @package Shopware_Template 
* @subpackage Shopware_Template_Frontend 
* @copyright Copyright (c) 2015 | Via-Form (http://www.via-form.de) *} 
{block name="frontend_index_start"}{/block} 
{block name="frontend_index_doctype"}
<!doctype html>
{/block} {block name='frontend_index_html'}
<html>
{/block}
{block name='frontend_index_header'} 
{include file='./frontend/index/header.tpl'} 
{/block}

<body {if $Controller}class="ctl_{$Controller}" {/if}>
    {* Message if javascript is disabled *} 
    {block name="frontend_index_no_script_message"}
    <noscript>
        <div class="row">
            <div class="alert alert-error">
                {s name="IndexNoscriptNotice"}{/s}
            </div>
        </div>
    </noscript>
    {/block} 
    {block name='frontend_index_before_page'}{/block} 
    {* Shop header *} 
    {block name='frontend_index_navigation'}
    <header>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    {* Shop logo *} {block name='frontend_index_logo'}
                    <a href="{url controller='index'}" title="{$sShopname} - {s name='IndexLinkDefault'}{/s}" class="navbar-brand">{$sShopname}</a>
                    {/block}
                </div>
                <div class="collapse navbar-collapse" id="main-navbar-collapse">
                    {* Maincategories navigation top *} {block name='frontend_index_navigation_categories_top'} {include file='frontend/index/categories_top.tpl'} {/block} {* Search *} {block name='frontend_index_search'} {include file="frontend/index/search.tpl"} {/block} {* Shop navigation *} {block name='frontend_index_checkout_actions'} {action module=widgets controller=checkout action=info} {/block}
                </div>
            </div>
        </nav>
    </header>
    {/block} 

        <div class="container">
            <div class="row">
            {* Trusted Shops *}
            {include file='frontend/index/trusted-shops.tpl'}
            {* Breadcrumb *} 
            {block name='frontend_index_breadcrumb'} 
            {include file='frontend/index/breadcrumb.tpl'} 
            {/block} 
            {* Content section *}
            {* Content top container *} 
            {block name="frontend_index_content_top"}
            {/block} 
            {* Sidebar left *} 
            {block name='frontend_index_content_left'}
            {/block}
            {* Main content *} 
            {block name='frontend_index_content'}
            {/block} 
            {* Sidebar right *} 
            {* {block name='frontend_index_content_right'}
            {/block} *}
            {* Footer *} 
            {block name="frontend_index_footer"} 
            {if $sLastArticlesShow && !$isEmotionLandingPage} 
            {include file="frontend/plugins/index/viewlast.tpl"} 
            {/if} 
            {/block} 
        </div>
    </div>

    {* FOOTER *}
    {block name="frontend_index_shopware_footer"}
    <footer class="container">
    {include file='frontend/index/footer.tpl'} 
        {s name="IndexRealizedWith"}Realisiert mit{/s}
        <a href="http://www.shopware.de" target="_blank" title="{s name='IndexRealizedShopsystem'}Shopware{/s}">
            {s name="IndexRealizedShopsystem"}Shopware{/s}
        </a>
    </footer>
    {/block}
    {block name='frontend_index_body_inline'}{/block}
</body>

</html>