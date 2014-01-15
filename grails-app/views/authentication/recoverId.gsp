<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="recover.title"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'authentication.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="recover.order"/></h1>
	<g:form >
		<div>
		<div class="field">
		<g:textField name="mailField" size="27px"/> <br/>
		</div>			
	</div>
		</br>
		<g:actionSubmit value="${message(code:'recover.submit')}"/> <br/></br></br>
		<g:link url="http://localhost:8080/MyStackOverFlow/" ><g:message code="recover.returnHome"/></g:link>
	</g:form>
	</body>
</html>