<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="authentication.title"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'authentication.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="authentication.order"/></h1>
	<g:form >
		<div>
		<div class="label">
		<g:message code="authentication.login"/>
		</div>
		<div class="field">
		<g:textField name="loginField" size="27px"/> <br/>
		</div>	
		<div class="label">
		<g:message code="authentication.password"/>
		</div>
		<div class="field">	
		<g:passwordField name="passwordField" size="27px"/>	<br/>
		</div>
		
	</div>
		<g:actionSubmit value="${message(code:'createUser.submit')}"/> <br/>
		<g:link url="recoverId" ><g:message code="authentication.recover"/></g:link> <br/> <br/>
		<g:link url="http://localhost:8080/MyStackOverFlow/" ><g:message code="authentication.returnHome"/></g:link>
	</g:form>
	</body>
</html>
		