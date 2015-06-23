{extends file="frontend/index/index.tpl"}

{* Breadcrumb *}
{block name='frontend_index_start' append}
	{$sBreadcrumb = [['name'=>"{s name='NewsletterTitle'}{/s}", 'link'=>{url}]]}
{/block}

{block name="frontend_index_content"}
    <div id="center" class="col-md-12 tellafriend">

    {if $sStatus.code==3||$sStatus.code==2}
        <p class="alert alert-success">
            {$sStatus.message}
        </p>
    {elseif $sStatus.code != 0}
        <p class="alert alert-danger">
            {$sStatus.message}
        </p>
    {/if}
	
    {if $voteConfirmed == false || $sStatus.code == 0}
        <div class="contact_box register">
            <h2>{s name=NewsletterRegisterHeadline}{/s}</h2>
            <form action="{url controller='newsletter'}" method="post" id="letterForm" class="form-horizontal" role="form">
                <fieldset>
                    <div class="form-group">
                        <label class="control-label col-md-3">{s name=NewsletterLabelSelect}{/s}</label>
                        <div class="col-md-9">
                            <select id="chkmail" name="subscribeToNewsletter" class="form-control" onchange="refreshAction();">
                                <option value="1">{s name=sNewsletterOptionSubscribe}{/s}</option>
                                <option value="-1" {if $_POST.subscribeToNewsletter eq -1 || (!$_POST.subscribeToNewsletter && $sUnsubscribe == true)}selected{/if}>{s name=sNewsletterOptionUnsubscribe}{/s}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newsletter" class="control-label col-md-3">{s name=sNewsletterLabelMail}{/s}</label>
                        <div class="col-md-9">
                            <input name="newsletter" type="text" id="newsletter" value="{if $_POST.newsletter}{$_POST.newsletter}{elseif $_GET.sNewsletter}{$_GET.sNewsletter|escape}{/if}" class="form-control{if $sStatus.sErrorFlag.newsletter} has-warning{/if}" />
                        </div>
                    </div>
                </fieldset>

                <fieldset>
                {if {config name=NewsletterExtendedFields}}
                    <div id="sAdditionalForm">
                        <div class="form-group">
                            <label for="salutation" class="control-label col-md-3">{s name=NewsletterRegisterLabelSalutation}{/s}</label>
                            <div class="col-md-9">
                                <select name="salutation" id="salutation" class="form-control{if $sStatus.sErrorFlag.salutation} instyle_error{/if}">
                                    <option value="">{s name=NewsletterRegisterPleaseChoose}{/s}</option>
                                    <option value="mr" {if $_POST.salutation eq "mr"}selected{/if}>{s name=NewsletterRegisterLabelMr}{/s}</option>
                                    <option value="ms" {if $_POST.salutation eq "ms"}selected{/if}>{s name=NewsletterRegisterLabelMs}{/s}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="control-label col-md-3">{s name=NewsletterRegisterLabelFirstname}{/s}</label>
                            <div class="col-md-9">
                                <input name="firstname" type="text"  id="firstname" value="{$_POST.firstname|escape}" class="form-control{if $sStatus.sErrorFlag.firstname} has-warning{/if}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="control-label col-md-3">{s name=NewsletterRegisterLabelLastname}{/s}</label>
                            <div class="col-md-9">
                                <input name="lastname" type="text"  id="lastname" value="{$_POST.lastname|escape}" class="form-control{if $sStatus.sErrorFlag.lastname} has-warning{/if}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="street" class="control-label col-md-3">{s name=NewsletterRegisterBillingLabelStreet}{/s}</label>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-10 col-xs-9">
                                        <input name="street" type="text" id="street" value="{$_POST.street|escape}" class="street form-control{if $sStatus.sErrorFlag.street} has-warning{/if}" />
                                    </div>
                                    <div class="col-md-2 col-xs-3">
                                        <input name="streetnumber" type="text" id="streetnumber" value="{$_POST.streetnumber|escape}" class="number form-control{if $sStatus.sErrorFlag.streetnumber} has-warning{/if}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="zipcode" class="control-label col-md-3">{s name=NewsletterRegisterBillingLabelCity}{/s}</label>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-2 col-xs-4">
                                        <input name="zipcode" type="text" id="zipcode" value="{$_POST.zipcode|escape}" class="zipcode form-control {if $sStatus.sErrorFlag.zipcode}has-warning{/if}" />
                                    </div>
                                    <div class="col-md-10 col-xs-8">
                                        <input name="city" type="text"  id="city" value="{$_POST.city|escape}" size="25" class="city form-control {if $sStatus.sErrorFlag.city}has-warning{/if}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    {literal}<script type="text/javascript">
                    function refreshAction()
                    {
                        if ($('#chkmail').val()==-1)
                        {
                            $('#sAdditionalForm').hide();
                        }
                        else
                        {
                            $('#sAdditionalForm').show();
                        }
                    }
                    refreshAction();
                    </script>{/literal}
                {/if}

                        <div class="form-group">
                            <div class="description col-md-9 col-md-offset-3">
                                <p>{s name=sNewsletterInfo}{/s}</p>
                                {* Required fields hint *}
                                <p>{s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}</p>
                                <input type="submit" value="{s name=sNewsletterButton}{/s}" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
            <hr />
        </div>
    {/if}
	</div>
{/block}