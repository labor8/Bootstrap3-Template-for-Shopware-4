{block name="frontend_detail_tabs"}
<a id="write_comment">&nbsp;</a>

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	{block name="frontend_detail_tabs_description"}
		<li class="active"><a href="#description" role="tab" data-toggle="tab">{se name='DetailTabsDescription'}{/se}</a></li>
	{/block}
	{block name="frontend_detail_tabs_rating"}
	{if !{config name=VoteDisable}}
		<li>
			<a href="#comments" role="tab" data-toggle="tab">
				<span>
					{s name='DetailTabsRating'}{/s} 
					
					{if $sArticle.sVoteAverange.count}
						[{$sArticle.sVoteAverange.count}]
					{/if}
				</span>
				
				{if $sArticle.sVoteAverange.count}
                    <span class="star star{$sArticle.sVoteAverange.averange}">Star Rating</span>
   				{/if}
			</a>
		</li>
	{/if}
	{/block}
	
	{block name="frontend_detail_tabs_related"}
	{if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
		<li>
			<a href="#related" role="tab" data-toggle="tab">
				{s name='DetailTabsAccessories'}Zubehör{/s} [{$sArticle.sRelatedArticles|@count}]
			</a>
		</li>
	{/if}
	{/block}
</ul>
{/block}