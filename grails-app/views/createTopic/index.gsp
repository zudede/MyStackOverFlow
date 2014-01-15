<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="createTopic.title"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'createTopic.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="createTopic.order"/></h1>
	<g:form >
		<div>
		<div class="label">
		<g:message code="createTopic.messageTitle"/>
		</div>
		<div class="field">
		<g:textField name="titleField" size="32px"/> <br/>
		</div>
		<div class="label">
		<g:message code="createTopic.enterMessage"/> <br/>
		</div>
		<div class="textArea">
		<g:textArea name="Message"></g:textArea> <br/>
		</div>			
	</div>
		<g:actionSubmit value="${message(code:'createUser.submit')}"/> <br/> <br/> <br/>
		<g:link url="http://localhost:8080/MyStackOverFlow/"> <g:message code="createTopic.returnHome"/></g:link>
	</g:form>
	</body>
</html>
		