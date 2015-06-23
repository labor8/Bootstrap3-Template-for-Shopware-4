<head>
{* Http-Tags *}
{block name="frontend_index_header_meta_http_tags"}
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
{/block}

{* Meta-Tags *}
{block name='frontend_index_header_meta_tags'}
	<meta name="author" content="{s name='IndexMetaAuthor'}{/s}" />
	<meta name="copyright" content="{s name='IndexMetaCopyright'}{/s}" />
	<meta name="robots" content="{block name='frontend_index_header_meta_robots'}{s name='IndexMetaRobots'}{/s}{/block}" />
	<meta name="revisit-after" content="{s name='IndexMetaRevisit'}{/s}" />
	<meta name="keywords" content="{block name='frontend_index_header_meta_keywords'}{if $sCategoryContent.metakeywords}{$sCategoryContent.metakeywords}{else}{s name='IndexMetaKeywordsStandard'}{/s}{/if}{/block}" />
	<meta name="description" content="{block name='frontend_index_header_meta_description'}{s name='IndexMetaDescriptionStandard'}{/s}{/block}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<!-- <link rel="shortcut icon" type="image/x-icon" href="{s name='IndexMetaShortcutIcon'}{link file='frontend/_resources/favicon.ico'}{/s}" /> -->
    <link rel="shortcut icon" type="image/x-icon" sizes="16x16 24x24 32x32 48x48 64x64" href="{s name='IndexMetaShortcutIcon'}{link file='frontend/_resources/favicon.ico'}{/s}" />
{/block}

{* Internet Explorer 9 specific meta tags *}
{block name='frontend_index_header_meta_tags_ie9'}
	<meta name="msapplication-navbutton-color" content="{s name='IndexMetaMsNavButtonColor'}#dd4800{/s}" />{* Navbutton color *}
	<meta name="application-name" content="{config name=shopName}" />{* Pinned name *}
	<meta name="msapplication-starturl" content="{url controller='index'}" />{* Start url to launch from the shortcut *}
	<meta name="msapplication-window" content="width=1024;height=768" />{* Size of the window to launch *}
{/block}

{* Canonical link *}
{block name='frontend_index_header_canonical'}{/block}

{* RSS and Atom feeds *}
{block name="frontend_index_header_feeds"}{/block}

{* Page title *}
<title>{block name='frontend_index_header_title'}{strip}
{if $sBreadcrumb}{foreach from=$sBreadcrumb|array_reverse item=breadcrumb}{$breadcrumb.name} | {/foreach}{/if}{config name=sShopname}
{/strip}{/block}</title>

{* Stylesheets and Javascripts *}
{block name="frontend_index_header_css_screen"}
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="{link file='frontend/_resources/styles/custom.css'}" />
{/block}

{* Print Stylesheets *}
{block name="frontend_index_header_css_print"}
	<link type="text/css" rel="stylesheet" media="print" href="{link file='frontend/_resources/styles/print.css'}" />
{/block}

{block name="frontend_index_header_javascript_jquery_lib"}
    {* Grab Google CDN's jQuery, with a protocol relative URL *}
    <!--<script type="text/javascript" src="{link file='frontend/_resources/javascript/jquery-1.7.2.min.js'}"></script>-->
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
{/block}

{block name="frontend_index_header_javascript"}
	<script type="text/javascript">
	//<![CDATA[
        {block name="frontend_index_header_javascript_inline"}
		var timeNow = {time() nocache};

		jQuery.controller =  {ldelim}
            'vat_check_enabled': '{config name='vatcheckendabled'}',
            'vat_check_required': '{config name='vatcheckrequired'}',
			'ajax_cart': '{url controller="checkout"}',
			'ajax_search': '{url controller="ajax_search"}',
			'ajax_login': '{url controller="account" action="ajax_login"}',
			'register': '{url controller="register"}',
			'checkout': '{url controller="checkout"}',
			'ajax_logout': '{url controller="account" action="ajax_logout"}',
			'ajax_validate': '{url controller="register"}'
		{rdelim};
	{/block}
	//]]>
	</script>
    {block name="frontend_index_header_javascript_jquery"}
        <script type="text/javascript" src="{link file='frontend/_resources/javascript/jquery.shopware.js'}"></script>
	{/block}
    
    <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="{link file='frontend/_resources/javascript/custom.js'}"></script>
{/block}


{block name="frontend_index_header_css_ie"}
{/block}
</head>