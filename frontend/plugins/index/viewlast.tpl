{* Last seen articles *}

<section>
    <div class="col-md-12">
            <h4>{s name='WidgetsRecentlyViewedHeadline'}{/s}</h4>
            <ul class="viewlast list-unstyled">
            </ul>
    </div>
</section>

<script type="text/javascript">
	;(function($, window, document) {
		$(document).ready(function() {
			var shopId = '{$Shop->getId()}',
				basePath = '{$Shop->getBaseUrl()}',
				localStorage = $.isLocalStorageSupported ? window.localStorage : new StoragePolyFill('local');

			if(localStorage.getItem('lastSeenArticleIndex-' + shopId + '-' + basePath)) {
				var numberOfArticles = '{config name=lastarticlestoshow}';

				$('.viewlast').lastSeenArticlesDisplayer({
					numArticles: numberOfArticles,
					shopId: shopId,
					basePath: basePath
				});
			}
			else {
				$('.viewlast').hide();
			}
		});
	}(jQuery, window, document));
</script>