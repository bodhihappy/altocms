{**
 * Комментарий
 *
 * bAllowNewComment      true если разрешно добавлять новые комментарии
 * bOneComment
 * bNoCommentFavourites  true если не нужно выводить кнопку добавления в избранное
 * iAuthorId             ID автора топика
 * bList                 true если комментарий выводится в списках (например на странице Избранные комментарии)
 *
 * @styles css/comments.css
 *}

{$oUser = $oComment->getUser()}
{$oVote = $oComment->getVote()}


{* Выводим ссылки на блог и топик в котором находится комментарий (только в списках) *}
{if $bList}
	{$oTopic = $oComment->getTarget()}
	{$oBlog = $oTopic->getBlog()}

	<div class="comment-path">
		<a href="{$oBlog->getUrlFull()}" class="comment-path-blog">{$oBlog->getTitle()|escape:'html'}</a> &rarr;
		<a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
		<a href="{$oTopic->getUrl()}#comments">({$oTopic->getCountComment()})</a>
	</div>
{/if}


{* Комментарий *}
<section id="comment_id_{$oComment->getId()}" class="comment
														{if ! $bList}
															{if $oComment->isBad()}
																comment-bad
															{/if}

															{if $oComment->getDelete()}
																comment-deleted
															{elseif $oUserCurrent and $oComment->getUserId() == $oUserCurrent->getId()} 
																comment-self
															{elseif $sDateReadLast <= $oComment->getDate()} 
																comment-new
															{/if}
														{else}
															comment-list-item
														{/if}">
	{if ! $oComment->getDelete() OR $bOneComment OR E::IsAdmin()}
		<a name="comment{$oComment->getId()}"></a>


		{* Информация *}
		<ul class="comment-info">
			<li>
				{* Аватар пользователя *}
				<a href="{$oUser->getProfileUrl()}">
					<img src="{$oUser->getAvatarUrl(24)}" alt="{$oUser->getLogin()}" class="avatar" />
				</a>
			</li>
			{* Автор комментария *}
			 <li class="comment-author">
				<!--{if $iAuthorId == $oUser->getId()}
					<span class="comment-topic-author" title="{if $sAuthorNotice}{$sAuthorNotice}{/if}">{$aLang.comment_target_author}</span>
				{/if}-->

				<a href="{$oUser->getProfileUrl()}">{$oUser->getLogin()}</a>
			</li> 

			{* Дата *}
			<li class="comment-date">
				<a href="{if Config::Get('module.comment.nested_per_page')}{router page='comments'}{else}#comment{/if}{$oComment->getId()}" title="{$aLang.comment_url_notice}">
					<time datetime="{date_format date=$oComment->getDate() format='c'}">{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time>
				</a>
			</li>

			{* Ссылки на родительские/дочерние комментарии *}
			{if ! $bList and $oComment->getPid()}
				<li class="comment-goto comment-goto-parent">
					<a href="#" onclick="ls.comments.goToParentComment({$oComment->getId()},{$oComment->getPid()}); return false;" title="{$aLang.comment_goto_parent}">↑</a>
				</li>
			{/if}

			<li class="comment-goto comment-goto-child"><a href="#" title="{$aLang.comment_goto_child}">↓</a></li>

			{**
			 * Блок голосования
			 * Не выводим блок голосования в личных сообщениях и списках
			 *}
			{if $oComment->getTargetType() != 'talk'}
				<li data-vote-type="comment"
					data-vote-id="{$oComment->getId()}"
					class="vote vote-comment js-vote
						{if $oComment->getRating() > 0}
							vote-count-positive
						{elseif $oComment->getRating() < 0}
							vote-count-negative
						{/if}    

						{if $oVote} 
							voted 

							{if $oVote->getDirection() > 0}
								voted-up
							{else}
								voted-down
							{/if}
						{/if}">
					<div class="vote-item vote-down js-vote-down"><i></i></div>
					<span class="vote-item vote-count js-vote-rating">{if $oComment->getRating() > 0}+{/if}{$oComment->getRating()}</span>
					<div class="vote-item vote-up js-vote-up"><i></i></div>
				</li>
			{/if}
		</ul>


		{* Текст комментария *}
		<div id="comment_content_id_{$oComment->getId()}" class="comment-content text">
			{$oComment->getText()}
		</div>


		{* Кнопки ответа, удаления и т.д. *}
		{if $oUserCurrent}
			<ul class="comment-actions">
				{if ! $bList AND ! $oComment->getDelete() AND ! $bAllowNewComment}
					<li><a href="#" onclick="ls.comments.toggleCommentForm({$oComment->getId()}); return false;" class="reply-link link-dotted">{$aLang.comment_answer}</a></li>
				{/if}

				{if ! $oComment->getDelete() AND E::IsAdmin()}
					<li><a href="#" class="comment-delete link-dotted" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;">{$aLang.comment_delete}</a></li>
				{/if}

				{if $oComment->getDelete() AND E::IsAdmin()}
					<li><a href="#" class="comment-repair link-dotted" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;">{$aLang.comment_repair}</a></li>
				{/if}

				{hook run='comment_action' comment=$oComment}
			</ul>
		{/if}
	{else}
		{$aLang.comment_was_delete}
	{/if}
</section>