<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>StackOverFlow</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="index.welcome"/></h1>
	<g:form>
	<div>
	<div class="userList">
	<g:link controller="User"><g:message code="index.listUser" default="User List"/></g:link>
	</div>
	<div class="topic">
	<g:link controller="Topic" action="create"><g:message code="index.createTopic"/></g:link>
	</div>
	<g:if test="${session.user == null }">
	<div class="create">
	<g:link controller="User" class="create" action="create"><g:message code="index.createUser"/></g:link>
	</div>
	<div class="log">
	<g:link controller="User" action="connect"><g:message code="index.log"/></g:link>
	</div>
	</g:if>
	<g:else>
	<g:link controller="User" action="disconnect"><g:message code="index.logout"/></g:link>
	</g:else>
	</div>
	</g:form>
	</br> </br> </br>
	<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="home.topicList.Label" default="Topic List"/></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'topic.title.label', default: 'Title')}" />
		

						<th><g:message code="topic.author.label" default="Author" /></th>
						
						<th><g:message code="topic.rate.label" default="Rate" /></th>
						
						<th><g:message code="topic.creationDate.label" default="Creation Date" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="Topic" action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "title")}</g:link></td>
					
						<td><g:link action="show" controller="User" id="${topicInstance.author.id}">${fieldValue(bean: topicInstance, field: "author")}</g:link></td>
						
						<td>${fieldValue(bean: topicInstance, field: "rate")}</td>
						
						<td><g:formatDate  format="dd-MM-yyyy HH:mm" date="${topicInstance.creationDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>