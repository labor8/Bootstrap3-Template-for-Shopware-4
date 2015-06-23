{block name='frontend_register_error_messages'}
{if $error_messages}
	<div class="alert alert-danger">
        <h4>{s name='RegisterErrorHeadline'}{/s}</h4>
        {foreach from=$error_messages item=errorItem}
		<p>{$errorItem}</p>
        {/foreach}
	</div>
{/if}
{/block}