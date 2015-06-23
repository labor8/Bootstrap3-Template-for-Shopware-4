<ul class="nav navbar-nav">
    <li class="{if $sCategoryCurrent eq $sCategoryStart} active{/if}">
        <a href="{url controller='index'}" title="{s name='IndexLinkHome'}{/s}" class="first{if $sCategoryCurrent eq $sCategoryStart} active{/if}">
            {se name='IndexLinkHome'}Home{/se}
        </a>
    </li>
    {foreach from=$sMainCategories item=sCategory}
    {if !$sCategory.hidetop}
    <li {if $sCategory.flag} class="active"{/if}>
        <a href="{$sCategory.link}" title="{$sCategory.description}" {if $sCategory.flag} class="active"{/if}>
            {$sCategory.description}
        </a>
    </li>
    {/if}
    {/foreach}
</ul>