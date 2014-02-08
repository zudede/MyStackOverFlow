
<%@ page import="mystackoverflow.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tag" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${tagInstance}" field="name"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tag">
			
			
				<g:if test="${tagInstance?.topics}">
				<li class="fieldcontain">
					<span id="topics-label" class="property-label"><g:message code="tag.topics.label" default="Topics" /></span>
					
						<g:each in="${tagInstance.topics}" var="t">
						<span class="property-value" aria-labelledby="topics-label"><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
