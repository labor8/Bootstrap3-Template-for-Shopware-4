{* Static sites *}
{if $sMenu.gLeft}
<div class="panel panel-default">
	<div class="panel-heading">
        <h4 class="panel-title">{se name="MenuLeftHeading"}Informationen{/se}</h4>
    </div>
<div class="list-group">
	{foreach from=$sMenu.gLeft item=item}
			<a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description}" {if $item.target}target="{$item.target}"{/if} class="list-group-item">
				{$item.description}
			</a>
	{/foreach}
</div>
</div>
{/if}