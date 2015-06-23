{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' prepend}
	{$sBreadcrumb = [['name'=>{$sSupport.name}, 'link'=>{url controller=ticket sFid=$sSupport.id}]]}
{/block}

{* Empty sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Main content *}
{block name='frontend_index_content'}
<div id="center" class="col-md-12 supportrequest">
    <h2>{$sSupport.name}</h2>
        {if $sSupport.sElements}
            <div class="text-info">
                {eval var=$sSupport.text}
            </div>
            {block name='frontend_forms_index_elements'}
                {include file="frontend/forms/elements.tpl"}
            {/block}
        {elseif $sSupport.text2}
            <div class="text-success">
                {eval var=$sSupport.text2}
            </div>
            <a href="{url controller='index'}" class="btn btn-default">{s name='FormsLinkBack'}{/s}</a>
        {else}
                <p>{s name='FormsTextContact'}{/s}</p>
                <a href="{url controller='index'}" class="btn btn-default">{s name='FormsLinkBack'}{/s}</a>
        {/if}
</div>
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}
	{include file="frontend/custom/right.tpl"}
{/block}