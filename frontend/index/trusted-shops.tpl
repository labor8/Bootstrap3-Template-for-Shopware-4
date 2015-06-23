{* Trusted Shops *} 
{if {config name=TSID}}
    <a href="https://www.trustedshops.com/shop/certificate.php?shop_id={config name=TSID}" title="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" target="_blank"><img src="{link file='frontend/_resources/images/logo_trusted_shop_top.png'}" alt="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" />
        <span>{s name='WidgetsTrustedLogoText2'}<span><strong>Sicher</strong> einkaufen</span><br />Trusted Shops zertifiziert{/s}</span>
    </a>
{/if}
{* Language and Currency bar *} 
{block name='frontend_index_actions'}{/block} 
{block name='frontend_index_navigation_inline'} 
{/block}