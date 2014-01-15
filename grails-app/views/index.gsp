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
	<g:link controller="CreateUser"><g:message code="index.createUser"/></g:link>
	</div>
	<div class="log">
	<g:link controller="Authentication"><g:message code="index.log"/></g:link>
	</div>
	<div class="topic">
	<g:link controller="CreateTopic"><g:message code="index.createTopic"/></g:link>
	</div>
	</div>
	</g:form>
	</body>
</html>