<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="createUser.title"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'createUser.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="createUser.order"/></h1>
	<g:form >
		<div>
		<div class="label">
		<g:message code="createUser.login"/>
		</div>
		<div class="field">
		<g:textField name="loginField" size="27px"/> <br/>
		</div>	
		<div class="label">
		<g:message code="createUser.password"/>
		</div>
		<div class="field">	
		<g:passwordField name="passwordField" size="27px"/>	<br/>
		</div>
		<div class="label">
		<g:message code="createUser.mail"/>
		</div>
		<div class="field">
		<g:textField name="mailField" size="27px"/>	<br/>
		</div>
		<div class="label">
		<g:message code="createUser.name"/>
		</div>
		<div class="field">
		<g:textField name="nameField" size="27px"/>	<br/>
		</div>
		<div class="label">
		<g:message code="createUser.firstName"/>
		</div>
		<div class="field">
		<g:textField name="firstNameField" size="27px"/> <br/>
		</div>
		<div class="label">
		<g:message code="createUser.birthday"/>
		</div>
		<div class="field">
		<g:datePicker precision="day" name="birthdayDatePicker"/> <br/>
		</div>
	</div>
		<g:actionSubmit value="${message(code:'createUser.submit')}"/> <br/> <br/> <br/>
		<g:link url="http://localhost:8080/MyStackOverFlow/" ><g:message code="createUser.returnHome"/></g:link>
	</g:form>
	</body>
</html>
		