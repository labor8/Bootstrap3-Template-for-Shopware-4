	{block name='frontend_index_footer_menu'}
		{include file='frontend/index/menu_footer.tpl'}
	{/block}
	
	<div class="row">
		<div class="col-md-12">
		{block name='frontend_index_footer_copyright'}
			{s name="IndexCopyright"}Copyright &copy; 2010 shopware AG{/s} | Responsive Bootstrap-Theme erstellt von <a href="http://www.via-form.de">Matthias Wellkamp (via-form.de)</a>
		{/block}
		</div>
		<div class="col-md-12">
		{block name='frontend_index_footer_vatinfo'}
			{if $sOutputNet}
				<p>{s name='FooterInfoExcludeVat'}&nbsp;{/s}</p>
			{else}
				<p>{s name='FooterInfoIncludeVat'}&nbsp;{/s}</p>
			{/if}
		{/block}
		</div>
	</div>