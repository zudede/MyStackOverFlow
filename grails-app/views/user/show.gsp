
<%@ page import="mystackoverflow.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="user.show.title"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
				<g:if test="${userInstance.isBlocked==true}">
					<h3><g:message code="user.blocked.label" default="This user is blocked" /></h3> 	
				</g:if>
			
			
				<g:if test="${userInstance.isAdmin==true}">
					<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="user.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:message code="user.role.admin" default="Administrator"/></span>
					
					</li>
				</g:if>
				<g:else>
				<g:if test="${userInstance.isModerator==true}">
					<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="user.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:message code="user.role.moderator" default="Moderator"/></span>
					
					</li>
				</g:if>
				</g:else>
				
				
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="user.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${userInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="user.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate format="dd-MM-yyyy" date="${userInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${userInstance?.pseudo}">
				<li class="fieldcontain">
					<span id="pseudo-label" class="property-label"><g:message code="user.pseudo.label" default="Pseudo" /></span>
					
						<span class="property-value" aria-labelledby="pseudo-label"><g:fieldValue bean="${userInstance}" field="pseudo"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${userInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="user.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${userInstance}" field="score"/></span>
					
				</li>
				</g:if>			
			
				<g:if test="${userInstance?.rewards}">
				<li class="fieldcontain">
					<span id="rewards-label" class="property-label"><g:message code="user.rewards.label" default="Rewards" /></span>
					
						<g:each in="${userInstance.rewards}" var="r">
						<span class="property-value" aria-labelledby="rewards-label">${r}</span>
						</g:each>
					
				</li>
				</g:if>
			
			
				<g:if test="${userInstance?.topics}">
				<li class="fieldcontain">
					<span id="topics-label" class="property-label"><g:message code="user.topics.label" default="Topics" /></span>
					
						<g:each in="${userInstance.topics}" var="t">
						<span class="property-value" aria-labelledby="topics-label"><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.messages}">
				<li class="fieldcontain">
					<span id="messages-label" class="property-label"><g:message code="user.messages.label" default="Messages" /></span>
					
						<g:each in="${userInstance.messages}" var="m">
						<span class="property-value" aria-labelledby="messages-label"><g:link controller="topic" action="show" id="${m.topic.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${userInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="user.comments.label" default="Comments" /></span>
					
						<g:each in="${userInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="topic" action="show" id="${c.message.topic.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:if test="${session.user == userInstance.id  || session.administrator==true}">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</g:if>
					<!--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> -->
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
