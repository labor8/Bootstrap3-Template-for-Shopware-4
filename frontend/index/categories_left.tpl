{* Maincategories left *}
{function name=categories level=0}
<div class="panel panel-default">
     <div class="panel-heading">
         <h4 class="panel-title">Kategorien</h4>
    </div>
	<div class="list-group {if !$level}categories{else}submenu{/if} level{$level}">
	{block name="frontend_index_categories_left_ul"}{/block}
	{foreach from=$categories item=category}
        <a href="{$category.link}" {if $category.flag || $category.subcategories}class="{if $category.flag or $category.subcategories}list-group-item active{if $category.subcategories} sub{/if}{/if}"{else}class="list-group-item"{/if}>{$category.description}</a>
	    	{if $category.subcategories}
		     	{call name=categories categories=$category.subcategories level=$level+1}
		    {/if}
	   
	{/foreach}
	</div>
</div>
{/function}


{if $sCategories}
	{call name=categories categories=$sCategories}
{elseif $sMainCategories}
	{call name=categories categories=$sMainCategories}
{/if}