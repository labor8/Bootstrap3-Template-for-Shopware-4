<ul class="nav navbar-nav pull-right">
    {block name="frontend_index_checkout_actions_account"}
    <li><a href="{url controller='account'}" title="{s name='IndexLinkAccount'}{/s}">{s name='IndexLinkAccount'}{/s}</a>
    </li>
    {/block} {block name="frontend_index_checkout_actions_notepad"}
    <li><a href="{url controller='note'}" title="{s name='IndexLinkNotepad'}{/s}" class="note">{s name='IndexLinkNotepad'}{/s} ({$sNotesQuantity})</a>
    </li>
    {/block}
    <li>
        {block name="frontend_index_checkout_actions_cart"}
        <form class="navbar-form navbar-right">
            <div class="form-group">
                <button type="button" class="popover-cart btn btn-primary" title="" data-container="body" data-toggle="popover" data-placement="bottom">
                    {if $sUserLoggedIn}{s name='IndexLinkCheckout'}{/s}{else}{$sBasketQuantity} {s name='IndexInfoArticles'}{/s}{$sBasketAmount|currency}*{/if}
                </button>
                <div id="popover-cart" class="hidden">
                    <a href="{url controller='checkout' action='cart'}" title="{s name='IndexLinkCart'}{/s}">{s name='IndexLinkCart'}{/s}</a>
                    <div class="ajax_basket_container hide_script">
                        <div class="ajax_basket">
                            {s name='IndexActionShowPositions'}{/s}
                        </div>
                    </div>
                </div>
            </div>
        </form>
        {/block}
        {block name="frontend_index_checkout_actions_inner"}{/block}
    </li>
</ul>