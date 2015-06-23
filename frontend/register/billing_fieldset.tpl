<div class="company_informations">
	<h2>{s name='RegisterHeaderCompany'}{/s}</h2>
	{* Company *}
	{block name='frontend_register_billing_fieldset_input_company'}
		<div class="form-group">
			<label for="register_billing_company" class="control-label">{se name='RegisterLabelCompany'}{/se}:</label>
			<input name="register[billing][company]" type="text" id="register_billing_company" value="{$form_data.company|escape}" class="form-control company required {if $error_flags.company}instyle_error{/if}" />
		</div>
	{/block}
	{* Department *}
	{block name='frontend_register_billing_fieldset_input_department'}
		<div class="form-group">
			<label for="register_billing_department" class="control-label col-md-3">{se name='RegisterLabelDepartment'}{/se}:</label>
			<input name="register[billing][department]" type="text" id="register_billing_department" value="{$form_data.department|escape}" class="form-control col-md-9" />
		</div>
	{/block}
	{* UST Id *}
	{block name='frontend_register_billing_fieldset_input_ustid'}
		<div class="form-group">
			<label for="register_billing_ustid" class="control-label col-md-3">{se name='RegisterLabelTaxId'}{/se}:</label>
			<input name="register[billing][ustid]" type="text" id="register_billing_ustid" value="{$form_data.ustid|escape}" class="form-control col-md-9 {if $error_flags.ustid}instyle_error{/if}" />
		</div>
	{/block}
</div>

<div class="shipping_address">
	{* Street *}
	{block name='frontend_register_billing_fieldset_input_street'}
                <h2>{s name='RegisterBillingHeadline'}{/s}</h2>
		<div class="form-group">
            <label for="street" class="control-label col-md-3">{s name='RegisterBillingLabelStreet'}{/s}</label>
            <div class="col-md-9">
                <div class="row">
                    <div class="col-xs-9">
                        <input name="register[billing][street]" type="text" id="street" value="{$form_data.street|escape}" class="street required form-control{if $error_flags.street} instyle_error{/if}" />
                    </div>
                    <div class="col-xs-3">
                        <input name="register[billing][streetnumber]" type="text" id="streetnumber" value="{$form_data.streetnumber|escape}" class="number streetnumber required form-control{if $error_flags.streetnumber} instyle_error{/if}" />
                    </div>
                </div>
            </div>
		</div>
	{/block}

	{* Zip + City *}
	{block name='frontend_register_billing_fieldset_input_zip_and_city'}
		<div class="form-group">
			<label for="zipcode" class="control-label col-md-3">{se name='RegisterBillingLabelCity'}{/se}</label>
            <div class="col-md-9">
                <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input name="register[billing][zipcode]" type="text" id="zipcode" value="{$form_data.zipcode|escape}" class="zipcode required form-control {if $error_flags.zipcode} text-warning{/if}" />
                </div>
                <div class="col-md-9 col-xs-8">
                    <input name="register[billing][city]" type="text" id="city" value="{$form_data.city|escape}" size="25" class="city required form-control {if $error_flags.city} text-warning{/if}" />
                </div>
                </div>
            </div>
		</div>
	{/block}

	{* Country *}
	{block name='frontend_register_billing_fieldset_input_country'}
		<div class="form-group">
		<label for="country" class="control-label col-md-3">{se name='RegisterBillingLabelCountry'}{/se}</label>
            <div class="col-md-9">
                <select name="register[billing][country]" id="country" class="form-control required {if $error_flags.country}instyle_error{/if}">
                <option value="" selected="selected">{s name='RegisterBillingLabelSelect'}{/s}</option>
                {foreach from=$country_list item=country}
                    <option value="{$country.id}" {if $country.id eq $form_data.country}selected="selected"{/if} {if $country.states}stateSelector="country_{$country.id}_states"{/if}>
                    {$country.countryname}
                    </option>
                {/foreach}
                </select>
            </div>
		</div>
	{/block}

    {* Country state *}
    {block name='frontend_register_billing_fieldset_input_country_states'}
    <div class="country-area-state-selection">
        {foreach $country_list as $country}
            {if $country.states}
                <div class="selection{if $country.id != $form_data.country} hidden{/if}">
                <label for="country_{$country.id}_states" class="control-label col-md-3">{se name='RegisterBillingLabelState'}Bundesstaat:{/se} </label>
                    <select {if $country.id != $form_data.country}disabled="disabled"{/if} name="register[billing][country_state_{$country.id}]" id="country_{$country.id}_states" class="form-control col-md-9 {if $country.force_state_in_registration}required{/if} {if $error_flags.stateID}instyle_error{/if}">
                    <option value="" selected="selected">{s name='RegisterBillingLabelSelect'}{/s}</option>
                        {assign var="stateID" value="country_state_`$country.id`"}
                        {foreach from=$country.states item=state}
                            <option value="{$state.id}" {if $state.id eq $form_data[$stateID]}selected="selected"{/if}>{$state.name}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
        {/foreach}
    </div>
    {/block}

	{* Alternative *}
	{block name='frontend_register_billing_fieldset_different_shipping'}
		{if !$update}
			<div class="alt_shipping">
				<input name="register[billing][shippingAddress]" type="checkbox" id="register_billing_shippingAddress" value="1" class="chkbox" {if $form_data.shippingAddress}checked="checked"{/if} />
				<label for="register_billing_shippingAddress">{s name='RegisterBillingLabelShipping'}{/s}</label>
			</div>
		{/if}
	{/block}
</div>
