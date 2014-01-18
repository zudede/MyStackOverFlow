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
	<div class="create">
	<g:link controller="User" class="create" action="create"><g:message code="index.createUser"/></g:link>
	</div>
	<div class="topic">
	<g:link controller="Topic"><g:message code="index.createTopic"/></g:link>
	</div>
	<g:if test="${session.user == null }">
	<div class="log">
	<g:link controller="User" action="connect"><g:message code="index.log"/></g:link>
	</div>
	</g:if>
	<g:else>
	<g:link controller="User" action="disconnect"><g:message code="index.logout"/></g:link>
	</g:else>
	</div>
	</g:form>
	</body>
</html>