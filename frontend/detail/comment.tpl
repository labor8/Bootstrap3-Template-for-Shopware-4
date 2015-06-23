<div id="comments" class="tab-pane">
	{* Response save comment *}
	{if $sAction == "ratingAction"}
		{block name='frontend_detail_comment_error_messages'}
		<div>
			{if $sErrorFlag}
				<div class="error bold center">
					{se name="DetailCommentInfoFillOutFields"}{/se}
				</div>
			{else}
				{if {config name="OptinVote"} && !{$smarty.get.sConfirmation}}
					<div class="success bold center">
						{se name="DetailCommentInfoSuccessOptin"}{/se}
					</div>
				{else}
					<div class="success bold center">
						{se name="DetailCommentInfoSuccess"}{/se}
					</div>
				{/if}
			{/if}
		</div>
		{/block}
	{/if}

	<h2>{s name="DetailCommentHeader"}{/s} "{$sArticle.articleName}"</h2>

	{if $sArticle.sVoteAverange.count}
		<div class="overview_rating">
			<strong>{se name="DetailCommentInfoAverageRate"}{/se}</strong>
			<div class="star star{$sArticle.sVoteAverange.averange}">Star Rating</div>
			<span>({s name="DetailCommentInfoRating"}{/s})</span>
		</div>
	{/if}

	{* Display comments *}
	{if $sArticle.sVoteComments}
		{foreach name=comment from=$sArticle.sVoteComments item=vote}
			<div class="comment_block{if $smarty.foreach.comment.last} last{/if}{if $vote.answer} no_border{/if}">

				<div class="left_container">
				{* Author *}
				{block name='frontend_detail_comment_author'}
					<strong class="author">
						{se name="DetailCommentInfoFrom"}{/se} {$vote.name}
					</strong>
				{/block}

				{* Date *}
				{block name='frontend_detail_comment_date'}
					<span class="date">
						{$vote.datum}
					</span>
				{/block}

				{* Star rating *}
				{block name="frontend_detail_comment_star_rating"}
					<div class="star star{$vote.points*2}"></div>
				{/block}
				</div>

				<div class="right_container">
				{block name='frontend_detail_comment_text'}
					{* Headline *}
					{block name='frontend_detail_comment_headline'}
						<h3>{$vote.headline}</h3>
					{/block}

					{* Comment text *}
					<p>
						{$vote.comment|nl2br}
					</p>
				{/block}
				</div>
			</div>

            {block name="frontend_detail_answer_block"}
                {if $vote.answer}
                <div class="comment_block answer">
                    <div class="left_container">
                        <strong class="author">
                            {se name="DetailCommentInfoFrom"}{/se} {se name="DetailCommentInfoFromAdmin"}Admin{/se}
                        </strong>
                        <span class="date">
                            {$vote.answer_date}
                        </span>
                    </div>
                    <div class="right_container">
                        {$vote.answer}
                    </div>
                    <div class="clear"></div>
                </div>
                {/if}
            {/block}
		{/foreach}
	{/if}

	{block name='frontend_detail_comment_post'}

		{* Display notice if the shop owner needs to unlock a comment before it will'be listed *}
		{if {config name=VoteUnlock}}
			<div class="notice">
				<div class="center">
					<strong>{s name='DetailCommentTextReview'}{/s}</strong>
				</div>
			</div>
		{/if}
		{* Write comment *}
		<h2>{se name="DetailCommentHeaderWriteReview"}{/se}</h2>
		<form method="post" action="{url action='rating' sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}sAction=comments" class="form-horizontal" role="form">
            <fieldset>
            {* Name *}
            {block name='frontend_detail_comment_input_name'}
                <div class="form-group{if !$sErrorFlag.sVoteName} has-warning{/if}">
                <label for="sVoteName" class="col-sm-2 control-label">{se name="DetailCommentLabelName"}{/se}*:</label>
                <div class="col-md-10">
                    <input name="sVoteName" type="text" id="sVoteName" value="{$sFormData.sVoteName|escape}" class="form-control" />
                </div>
                </div>
            {/block}
            {* E-Mail address *}
            {if {config name=OptinVote} == true}
            {block name='frontend_detail_comment_input_mail'}
                <div class="form-group{if !$sErrorFlag.sVoteMail} has-warning{/if}">
                <label for="sVoteMail" class="col-sm-2 control-label">{se name="DetailCommentLabelMail"}{/se}*: </label>
                <div class="col-md-10">
                    <input name="sVoteMail" type="text" id="sVoteMail" value="{$sFormData.sVoteMail|escape}" class="form-control" />
                </div>
                </div>
            {/block}
            {/if}
            {* Comment summary*}
            {block name='frontend_detail_comment_input_summary'}
                <div class="form-group{if !$sErrorFlag.sVoteSummary} has-warning{/if}">
                <label for="sVoteSummary" class="col-sm-2 control-label">{se name="DetailCommentLabelSummary"}{/se}*:</label>
                <div class="col-md-10">
                    <input name="sVoteSummary" type="text" value="{$sFormData.sVoteSummary|escape}" id="sVoteSummary" class="form-control" />
                </div>
                </div>
            {/block}
            </fieldset>
                {* Star Rating *}
            {block name='frontend_detail_comment_input_rating'}
            <fieldset>
                <div class="form-group">
                <label for="sVoteStars" class="col-sm-2 control-label">{se name="DetailCommentLabelRating"}{/se}*:</label>
                <div class="col-md-10">
                <select name="sVoteStars" class="form-control" id="sVoteStars">
                    <option value="10">{s name="Rate10"}{/s}</option>
                    <option value="9">{s name="Rate9"}{/s}</option>
                    <option value="8">{s name="Rate8"}{/s}</option>
                    <option value="7">{s name="Rate7"}{/s}</option>
                    <option value="6">{s name="Rate6"}{/s}</option>
                    <option value="5">{s name="Rate5"}{/s}</option>
                    <option value="4">{s name="Rate4"}{/s}</option>
                    <option value="3">{s name="Rate3"}{/s}</option>
                    <option value="2">{s name="Rate2"}{/s}</option>
                    <option value="1">{s name="Rate1"}{/s}</option>
                </select>
                </div>
                </div>
                </fieldset>
            {/block}
            {* Comment text *}
            {block name='frontend_detail_comment_input_text'}
                <fieldset>
                    <div class="form-group{if !$sErrorFlag.sVoteComment} has-warning{/if}">
                        <label for="sVoteComment" class="col-sm-2 control-label">{se name="DetailCommentLabelText"}{/se}</label>
                        <div class="col-md-10">
                            <textarea name="sVoteComment" id="sVoteComment" cols="3" rows="2" class="form-control">
                            {$sFormData.sVoteComment|escape}
                            </textarea>
                        </div>
                    </div>
                <fieldset>
            {/block}
            {* Captcha *}
            {block name='frontend_detail_comment_input_captcha'}
                <div class="captcha form-group">
                    <div class="col-md-4 col-md-offset-2">
                        <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                        <label class="control-label{if $sErrorFlag.sCaptcha} has-warning{/if}">{se name="DetailCommentLabelCaptcha"}{/se}</label>
                    </div>
                    <div class="col-md-6">
                        <input type="text" name="sCaptcha"  class="form-control" />
                    </div>
                </div>
            {/block}
                <div class="form-group">
                    <div class="col-md-4 col-md-offset-2">
                        <p>{se name="DetailCommentInfoFields"}{/se}</p>
                        <button class="btn btn-large" type="submit" name="Submit" value="{s name="DetailCommentActionSave"}{/s}">
                        {s name="DetailCommentActionSave"}{/s}
                        </button>
                    </div>
                </div>
		</form>
	{/block}
</div>
