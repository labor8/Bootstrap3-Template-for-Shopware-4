{* Step box *}
{block name='frontend_register_steps'}
<div class="col-md-12">
	<ul class="list-inline">
		<li id="first_step" {if $sStepActive=='basket'}class="active"{/if}>
			<span class="badge">{se class="icon" name="CheckoutStepBasketNumber"}{/se}</span>
			{se class="text" name="CheckoutStepBasketText"}{/se}
		</li>
		<li {if $sStepActive=='register'}class="active"{/if}>
			<span class="badge">{se class="icon" name="CheckoutStepRegisterNumber"}{/se}</span>
			{se class="text" name="CheckoutStepRegisterText"}{/se}
		</li>
		<li id="last_step" {if $sStepActive=='finished'}class="active"{elseif !$sUserLoggedIn}class="grey"{/if}>
			<span class="badge">{se class="icon" name="CheckoutStepConfirmNumber"}{/se}</span>
			{se class="text" name="CheckoutStepConfirmText"}{/se}
		</li>
	</ul>
</div>
{/block}