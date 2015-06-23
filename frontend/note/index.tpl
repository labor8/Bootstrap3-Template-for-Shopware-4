{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' prepend}
	{$sBreadcrumb = [['name'=>"{s name='NoteTitle'}{/s}", 'link'=>{url}]]}
{/block}

{* Empty sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Main content *}
{block name="frontend_index_content"}
	<div id="notes" class="col-md-12">

	{* Infobox *}
        <h1>{s name='NoteHeadline'}{/s}</h1>
        <p>{s name='NoteText'}{/s}</p>
        <p>{s name='NoteText2'}{/s}</p>
		
		{if $sNotes}
			<div class="row">
			{* Table head *}
            {* Article informations *}
            <div class="col-md-10"><strong>{s name='NoteColumnName'}{/s}</strong></div>
            {* Unit price *}
                <div class="col-md-2"><strong>{s name='NoteColumnPrice'}{/s}</strong></div>
            {block name="frontend_note_index_columns"}{/block}
			
			{foreach from=$sNotes item=sBasketItem name=noteitems}
				{if $smarty.foreach.noteitems.last}
					{assign var=lastrow value=1}
				{else}
					{assign var=lastrow value=0}
				{/if}
				{include file="frontend/note/item.tpl" lastrow=$lastrow}
			{/foreach}
		</div>
		{/if}
        <hr />
</div>
{/block}

{* Sidebar right *}
{block name="frontend_index_content_right"}
{if $sUserLoggedIn}
	<div id="right_account" class="grid_4 last">
		{include file="frontend/account/content_right.tpl"}
	</div>
{/if}
{/block}