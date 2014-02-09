
<%@ page import="mystackoverflow.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'topic.css')}" type="text/css">
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div id="show-topic" class="content scaffold-show" role="main">
			
			<g:if test="${topicInstance?.title}">
			<h1><g:fieldValue bean="${topicInstance}" field="title"/></h1>
			</g:if>	
			
			</br>
			<div id="question">		
			<g:if test="${topicInstance?.question}">	
			${topicInstance?.question}
			</g:if>
			</div>
			<div id="questionInfo">	
			<div id="authorQuestion">
			<div id="tags">
			<g:if test="${topicInstance?.tags}">
				<g:each in="${topicInstance.tags}" var="t">
				<g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
				</g:each>
			</g:if>
			</div>
			<div id="editButton">	
			<g:if test="${session.user == topicInstance.author.id || session.moderator == true }">
				<g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="topic.edit.topic.label"/></g:link>
			</g:if>
			</div>
			<g:if test="${topicInstance?.author}">
				<g:message code="topic.posted.label"/>
				<g:link controller="user" action="show" id="${topicInstance?.author?.id}">${topicInstance?.author?.encodeAsHTML()}</g:link>
				<g:message code="topic.date.intro"/>
				<g:formatDate  format="dd-MM-yyyy HH:mm" date="${topicInstance?.creationDate}" />
			</g:if>
			</div>
			</br>
			<g:if test="${topicInstance?.messages.size() != 0 }">
			<h3><g:message code="topic.answers.label"  args="${topicInstance?.messages.size()}"/></h3>
			</g:if>
			</div>
			
			<g:if test="${topicInstance?.messages}">
			
				<g:each in="${topicInstance.getOrderedMessages()}" var="m">
					<div id="messages">
					${m?.encodeAsHTML()}
					</div>
					<div id="messageInfo">	
					<div id="authorQuestion">
					<div id="editMessageButton">
					<g:if test="${session.user == m.author.id || session.moderator == true }">
						<g:link controller="message" action="edit" resource="${m}"><g:message code="default.button.edit.label" default="Edit Message" /></g:link>
					</g:if>
					</div> 
					<g:message code="topic.posted.label"/>
					<g:link controller="user" action="show" id="${m?.author?.id}">${m?.author?.encodeAsHTML()}</g:link>
					<g:message code="topic.date.intro"/>
					<g:formatDate  format="dd-MM-yyyy HH:mm" date="${m?.creationDate}" />
					<g:message code="topic.rate.label" default="rated "/> ${m?.rate}
					</div>
					</br>
					<g:each in="${m.getOrderedComments()}" var="c">
					<div id="comments">
					${c?.encodeAsHTML()}
					<div id="commentsInfo">
					<g:link controller="user" action="show" id="${c?.author?.id}">${c?.author?.encodeAsHTML()}</g:link>
					<g:formatDate  format="dd-MM-yyyy HH:mm" date="${c?.creationDate}" />
					</div>
					</div>
					</g:each>
					</br>
					<g:if test="${session.user != null }">
					<g:link controller="comment" action="create" params="['message.id': m?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
					</div>
					<g:if test="${m.isNotVotedByCurrentUser(session.user)}">
					<g:link controller="message" action="upvote" resource="${m}"><g:message code="topic.button.upvote.label"/></g:link>
					<g:link controller="message" action="downvote" resource="${m}"><g:message code="topic.button.downvote.label"/></g:link>
					</g:if>
					</g:if>					
					</g:each>
					
					
				
			</g:if>
			
				
			
			
			<g:if test="${session.user != null}">
			<g:link controller="message" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
			</g:if>
		</div>
	</body>
</html>
