
<%@ page import="mystackoverflow.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="comment.author.label" default="Author" /></th>
					
						<g:sortableColumn property="body" title="${message(code: 'comment.body.label', default: 'Body')}" />
					
						<g:sortableColumn property="creationDate" title="${message(code: 'comment.creationDate.label', default: 'Creation Date')}" />
					
						<th><g:message code="comment.message.label" default="Message" /></th>
					
						<g:sortableColumn property="rate" title="${message(code: 'comment.rate.label', default: 'Rate')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentInstanceList}" status="i" var="commentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean: commentInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: commentInstance, field: "body")}</td>
					
						<td><g:formatDate date="${commentInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: commentInstance, field: "message")}</td>
					
						<td>${fieldValue(bean: commentInstance, field: "rate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
