{extends file='frontend/index/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
	{$sBreadcrumb = [['name'=>"{s name='AccountLoginTitle'}{/s}", 'link'=>{url}]]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
<div id="login" class="col-md-12">
    <div class="row">
        
        <div class="col-md-12">
        {* Error messages *}
        {block name='frontend_account_login_error_messages'}
            {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
        {/block}
        </div>

        {* New customer *}
        {block name='frontend_account_login_new'}
        <div class="col-md-6">
            <h2>{se name="LoginHeaderNew"}{/se} {$sShopname}</h2>
            <p class="help-block">{se name="LoginInfoNew"}{/se}</p>
            <form method="post" name="new_customer" class="new_customer_form" action="{url controller='register'}">
                <fieldset>
                {if !{config name=NoAccountDisable}}
                    <label for="chk_noaccount" class="checkbox">
                        <input type="checkbox" class="chk_noaccount" id="chk_noaccount" name="skipLogin" value="1" />
                        {s name="LoginLabelNoAccount"}Kein Kundenkonto erstellen{/s}
                    </label>
                {/if}
                    <button type="submit" class="btn btn-primary register_now" value="{s name='LoginLinkRegister'}{/s}">{s name='LoginLinkRegister'}{/s}</button>
                </fieldset>
            </form>
        </div>
        {/block}

        {* Existing customer *}
        {block name='frontend_account_login_customer'}
        <div class="col-md-6">	
            <h2>{se name="LoginHeaderExistingCustomer"}{/se}</h2>
            <form name="sLogin" method="post" action="{url action=login}" class="form-horizontal">
                {if $sTarget}<input name="sTarget" type="hidden" value="{$sTarget|escape}" />{/if}
                <fieldset>
                    <p class="help-block">{se name="LoginHeaderFields"}{/se}</p>
                    <div class="form-group">
                        <label for="email" class="control-label col-md-4">{se name='LoginLabelMail'}{/se}</label>
                        <div class="col-md-8">
                            <input name="email" type="text" tabindex="1" value="{$sFormData.email|escape}" id="email" class="form-control {if $sErrorFlag.email}has-error{/if}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwort" class="control-label col-md-4">{se name="LoginLabelPassword"}{/se}</label>
                        <div class="col-md-8">
                            <input name="password" type="password" tabindex="2" id="passwort" class="form-control {if $sErrorFlag.password}has-error{/if}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-4">
                        <a href="{url action=password}" title="{s name='LoginLinkLostPassword'}{/s}">
                            {se name="LoginLinkLostPassword"}{/se}
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-4">
                            <input class="btn btn-primary" type="submit" value="{s name='LoginLinkLogon'}{/s}" name="Submit"/>	
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    {/block}
    </div>
</div>
{/block}

{* Empty sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Empty sidebar right *}
{block name='frontend_index_content_right'}{/block}