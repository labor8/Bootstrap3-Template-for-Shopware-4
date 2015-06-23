{* Customer type *}
{block name='frontend_register_personal_fieldset_customer_type'}
    <h2>{s name='RegisterPersonalHeadline'}{/s}</h2>
    <div class="form-group">
        {if $form_data.sValidation}
            <input type="hidden" name="register[personal][sValidation]" value="{$form_data.sValidation|escape}" />
        {else}
            <fieldset>
                <label for="register_personal_customer_type" class="control-label col-md-3">{s name='RegisterPersonalLabelType'}{/s}*:</label>
                <div class="col-md-9">
                    <select id="register_personal_customer_type" name="register[personal][customer_type]" class="form-control">
                        <option value="private"{if $form_data.customer_type eq "private"} selected="selected"{/if}>{s name='RegisterPersonalLabelPrivate'}{/s}</option>
                        <option value="business"{if $form_data.customer_type eq "business" or $form_data.company or $form_data.sValidation} selected="selected"{/if}>{s name='RegisterPersonalLabelBusiness'}{/s}</option>
                    </select>
                </div>
            </fieldset>
        {/if}
    </div>
{/block}

{* Salutation *}
{block name='frontend_register_personal_fieldset_salutation'}
    <div class="form-group salutation">
        <label class="control-label col-md-3">{s name='RegisterLabelSalutation'}{/s}</label>
        <div class="col-md-9{if $error_flags.salutation} text-warning{/if}">
             <div class="radio">
                 <label for="register_personal_salutation_mr" class="radio">
                     <input class="radio" id="register_personal_salutation_mr" type="radio" name="register[personal][salutation]" value="mr" {if $form_data.salutation eq "mr"}checked="checked"{else}checked="checked"{/if} />{s name='RegisterLabelMr'}{/s}</label>
            </div>
            <div class="radio">
                <label for="register_personal_salutation_ms" class="radio">
                    <input class="radio" id="register_personal_salutation_ms" type="radio" name="register[personal][salutation]" value="ms" {if $form_data.salutation eq "ms"}checked="checked"{/if} />{s name='RegisterLabelMs'}{/s}</label>
            </div>
        </div>
    </div>
{/block}

{* Firstname *}
{block name='frontend_register_personal_fieldset_input_firstname'}		
    <div class="form-group">
        <label for="firstname" class="control-label col-md-3">{se name='RegisterLabelFirstname'}{/se}</label>
        <div class="col-md-9">
            <input name="register[personal][firstname]" type="text" id="firstname" value="{$form_data.firstname|escape}" class="form-control required {if $error_flags.firstname}instyle_error{/if}" />
        </div>
    </div>
{/block}

{* Lastname *}
{block name='frontend_register_personal_fieldset_input_lastname'}
    <div class="form-group">
        <label for="lastname" class="control-label col-md-3">{se name='RegisterLabelLastname'}{/se}</label>
        <div class="col-md-9">
            <input name="register[personal][lastname]" type="text"  id="lastname" value="{$form_data.lastname|escape}" class="form-control required {if $error_flags.lastname}instyle_error{/if}" />
        </div>
    </div>
{/block}

{* Skip login *}
{if !$update}
    {block name='frontend_register_personal_fieldset_skip_login'}
        {if !$sEsd && !$form_data.sValidation && !{config name=NoAccountDisable}}
            <div class="col-md-9 col-md-offset-3 ceckbox">
                <label for="register_personal_skipLogin">
                    <div class="checkbox">
                    <input type="checkbox" value="1" id="register_personal_skipLogin" name="register[personal][skipLogin]" class="checkbox" {if $form_data.skipLogin||$form_data.accountmode || $skipLogin}checked {/if}/><strong>{se name='RegisterLabelNoAccount'}{/se}</strong>
                    </div>
                </label>
            </div>
        {/if}
    {/block}

    {* E-Mail *}
    {block name='frontend_register_personal_fieldset_input_mail'}
        <div class="form-group">
            <label for="register_personal_email" class="control-label col-md-3">{se name='RegisterLabelMail'}{/se}</label>
            <div class="col-md-9">
            <input name="register[personal][email]" type="text" id="register_personal_email" value="{$form_data.email|escape}" class="form-control required email {if $error_flags.email}instyle_error{/if}" />
            </div>
        </div>

        {if {config name=DOUBLEEMAILVALIDATION}}
        <div class="form-group">
            <label for="register_personal_emailConfirmation" class="control-label col-md-3">{se name='RegisterLabelMailConfirmation'}{/se}</label>
            <div class="col-md-9">
                <input name="register[personal][emailConfirmation]" type="text" id="register_personal_emailConfirmation" value="{$form_data.emailConfirmation|escape}" class="form-control emailConfirmation required {if $error_flags.emailConfirmation}instyle_error{/if}" />
            </div>
        </div>
        {/if}
    {/block}
{/if}

{if !$update}
    {* Password *}
    {block name='frontend_register_personal_fieldset_input_password'}
        <div class="form-group fade_password">
            <label for="register_personal_password" class="control-label col-md-3">{se name='RegisterLabelPassword'}{/se}</label>
             <div class="col-md-9">
            <input name="register[personal][password]" type="password" id="register_personal_password" class="form-control required password {if $error_flags.password}instyle_error{/if}" />
            </div>
        </div>
    {/block}

    {* Password confirmation *}
    {block name='frontend_register_personal_fieldset_input_password_confirm'}
        <div class="form-group fade_password">
            <label for="register_personal_passwordConfirmation" class="control-label col-md-3">{se name='RegisterLabelPasswordRepeat'}{/se}</label>
            <div class="col-md-9">
            <input name="register[personal][passwordConfirmation]" type="password" id="register_personal_passwordConfirmation" class="form-control required passwordConfirmation {if $error_flags.passwordConfirmation}instyle_error{/if}" />
        </div>
        </div>
    {/block}

    {* Password description *}
    {block name='frontend_register_personal_fieldset_password_description'}
        <div class="form-group fade_password description">
            <div class="col-md-9 col-md-offset-3">
            {se name='RegisterInfoPassword'}{/se} {config name=MinPassword} {se name='RegisterInfoPasswordCharacters'}{/se}<br /> {se name='RegisterInfoPassword2'}{/se}
                </div>
        </div>
    {/block}
{/if}

{* Phone *}
{block name='frontend_register_personal_fieldset_input_phone'}
    <div class="form-group">
        <label for="phone" class="control-label col-md-3 {if !{config name=requirePhoneField}}normal{/if}">{se name='RegisterLabelPhone'}{/se}</label>
        <div class="col-md-9">
            <input name="register[personal][phone]" type="text" id="phone" value="{$form_data.phone|escape}" class="form-control {if {config name=requirePhoneField}}required{/if} {if $error_flags.phone && {config name=requirePhoneField}}instyle_error{/if}" />
        </div>
    </div>
{/block}

{* Birthday *}
{if !$form_data.skipLogin && !$update}
{block name='frontend_register_personal_fieldset_birthday'}
<div class="form-group">
    <div id="birthdate">
        <label for="register_personal_birthdate" class="control-label col-md-3">{s name='RegisterLabelBirthday'}{/s}</label>
        <div class="col-md-9">
            <div class="row">
                <div class="col-xs-4">
                <select id="register_personal_birthdate" class="form-control" name="register[personal][birthday]">
                <option value="">--</option>	
                {section name="birthdate" start=1 loop=32 step=1}
                <option value="{$smarty.section.birthdate.index}" {if $smarty.section.birthdate.index eq $form_data.birthday}selected{/if}>{$smarty.section.birthdate.index}</option>
                {/section}
                </select>
                </div>

                <div class="col-xs-4">
                <select name="register[personal][birthmonth]" class="form-control">
                <option value="">-</option>	
                {section name="birthmonth" start=1 loop=13 step=1}
                <option value="{$smarty.section.birthmonth.index}" {if $smarty.section.birthmonth.index eq $form_data.birthmonth}selected{/if}>{$smarty.section.birthmonth.index}</option>
                {/section}
                </select>
                </div>

                <div class="col-xs-4">
                <select name="register[personal][birthyear]" class="form-control">
                <option value="">----</option>	
                {section name="birthyear" loop=2000 max=100 step=-1}
                <option value="{$smarty.section.birthyear.index}" {if $smarty.section.birthyear.index eq $form_data.birthyear}selected{/if}>{$smarty.section.birthyear.index}</option>
                {/section}
                </select>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
{/if}