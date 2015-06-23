{block name="frontend_detail_buy"}
<div class="col-md-12">
	<form name="sAddToBasket" method="post" action="{url controller=checkout action=addArticle}" class="form-horizontal basketform">
		{if $sArticle.sConfigurator&&$sArticle.sConfiguratorSettings.type==3}
			{foreach from=$sArticle.sConfigurator item=group}
				<input type="hidden" name="group[{$group.groupID}]" value="{$group.selected_value}" />
	    	{/foreach}   
		{/if}
		
		{* Configurator Table *}			
		{if $sArticle.sConfigurator && $sArticle.sConfiguratorSettings.type==2}
			{block name='frontend_detail_buy_config_table'}
				{include file="frontend/detail/config_table.tpl"}
			{/block}
		{/if}
		
		<input type="hidden" name="sActionIdentifier" value="{$sUniqueRand}" />
		<input type="hidden" name="sAddAccessories" id="sAddAccessories" value="" />
		
		{if !$sArticle.sConfigurator && $sArticle.sVariants}
        {block name='frontend_detail_buy_variant'}
            <fieldset>
                <select name="sAdd" id="sAdd" class="variant">
                    <option value="">{s name="DetailBuyValueSelect"}{/s}</option>
                    <option value="{$sArticle.ordernumber}">
                        {if $sArticle.additionaltext}
                            {$sArticle.additionaltext}
                        {else}
                            {$sArticle.articleName}
                        {/if}
                    </option>
                    {foreach from=$sArticle.sVariants item=variant}
                        <option value="{$variant.ordernumber}">
                            {if $variant.additionaltext}
                                {$variant.additionaltext}
                            {else}
                                {$variant.ordernumber}
                            {/if}
                        </option>
                    {/foreach}
                </select>
            </fieldset>
        {/block}
		{elseif !$sArticle.sConfigurator || $sArticle.sConfiguratorSettings.type!=2}
			<input type="hidden" name="sAdd" value="{$sArticle.ordernumber}" />
		{/if}
		
		{* Article accessories *}
		{if $sArticle.sAccessories}
		{block name='frontend_detail_buy_accessories'}
			<div class="accessory_container">
			{foreach from=$sArticle.sAccessories item=sAccessory}
				
				{* Group name *}
				<h2 class="headingbox">{$sAccessory.groupname}</h2>
				<div class="accessory_group">
				
				{* Group description *}
				<p class="groupdescription">
					{$sAccessory.groupdescription}
				</p>
	
				{foreach from=$sAccessory.childs item=sAccessoryChild}
					
	            	<input type="checkbox" class="sValueChanger chkbox" name="sValueChange" id="CHECK{$sAccessoryChild.ordernumber}" value="{$sAccessoryChild.ordernumber}" />
	            	<label for="CHECK{$sAccessoryChild.ordernumber}">{$sAccessoryChild.optionname|truncate:35}
	            		({se name="DetailBuyLabelSurcharge"}{/se}: {$sAccessoryChild.price} {$sConfig.sCURRENCYHTML})
	            	</label>
	            	
	            	<div id="DIV{$sAccessoryChild.ordernumber}" class="accessory_overlay">
	            		{include file="frontend/detail/accessory.tpl" sArticle=$sAccessoryChild.sArticle}
	            	</div>
				{/foreach}
				</div>
		 	{/foreach}
		 	</div>
	 	{/block}
		{/if}
		{assign var="sCountConfigurator" value=$sArticle.sConfigurator|@count}
		{if ($sArticle.sConfiguratorSettings.type!=1 || $sArticle.sConfigurator[$sCountConfigurator-1].user_selected) && (!isset($sArticle.active) || $sArticle.active)}	
			{block name='frontend_detail_buy_laststock'}
				{if $sArticle.laststock}
				<div id="detailBuyInfoNotAvailable"{if $sArticle.instock > 0} style="display: none;"{/if}>
					<div class="space">&nbsp;</div>
					<div class="error bold center">
						{s name="DetailBuyInfoNotAvailable"}{/s}
					</div>
				</div>
				{/if}
			{/block}
			{if !$sArticle.laststock || $sArticle.sVariants || $sArticle.instock>0}
            <div class="form-group">
                <div id="detailCartButton" {if $NotifyHideBasket && $sArticle.notification && $sArticle.instock <= 0}style="display: none;"{/if}>
                    {block name='frontend_detail_buy_quantity'}
                            {if $sArticle.laststock && !$sArticle.sVariants && $sArticle.instock < $sArticle.maxpurchase}
                                {assign var=maxQuantity value=$sArticle.instock+1}
                            {else}
                                {assign var=maxQuantity value=$sArticle.maxpurchase+1}
                            {/if}
                            <label for="sQuantity" class="label-control">{s name="DetailBuyLabelQuantity"}{/s}:</label>
                            <select id="sQuantity" name="sQuantity" class="form-control">
                                {section name="i" start=$sArticle.minpurchase loop=$maxQuantity step=$sArticle.purchasesteps}
                                    <option value="{$smarty.section.i.index}">{$smarty.section.i.index}{if $sArticle.packunit} {$sArticle.packunit}{/if}</option>
                                {/section}
                            </select>
                    {/block}
                </div>
            </div>
            <div class="form-group">
                <div class="btn-group btn-block">
                {* Cart button *}
                {block name='frontend_detail_buy_button'}
                    <button type="input" id="basketButton" class="btn btn-primary btn-lg col-lg-10" name="{s name="DetailBuyActionAdd"}{/s}" value="{s name="DetailBuyActionAdd"}{/s}">{* {$sArticle.articleName} *} {s name="DetailBuyActionAdd"}{/s}</button>
                        <button type="button" class="btn btn-primary btn-lg col-lg-2 dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                    {/block}
                    <ul class="dropdown-menu col-lg-12" role="menu">
                        <li>{block name='frontend_detail_actions_notepad'}
                            <a href="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" rel="nofollow" title="{s name='DetailLinkNotepad'}{/s}">
                                {se name="DetailLinkNotepad"}{/se}
                            </a>
                            {/block}
                        </li>
                        {* Additional links *}
                        {block name="frontend_detail_index_actions"}
                        {include file="frontend/detail/actions.tpl"}
                        {/block}
                    </ul>
                </div>
            </div>
			{/if}
		{/if}
	</form>
</div>
{/block}