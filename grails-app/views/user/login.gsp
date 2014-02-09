<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="authentication.title"/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'authentication.css')}" type="text/css">
	</head>
	<body>
	<h1><g:message code="authentication.order"/></h1>
	<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
	<g:form url="[resource:userInstance, action:'login']" >
		<div>
		<div class="label">
		<g:message code="authentication.login"/>
		</div>
		<div class="field">
		<g:textField name="login" size="27px" value="${userInstance?.login}"/> <br/>
		</div>	
		<div class="label">
		<g:message code="authentication.password"/>
		</div>
		<div class="field">	
		<g:passwordField name="passwordHash" size="27px" value="${userInstance?.passwordHash}"/>	<br/>
		</div> </br>
		<g:if test="${authenticationFailed}">
		<g:message code="authentication.wrong"/>
		</g:if>
		
	</div>
		<g:actionSubmit value="${message(code:'createUser.submit')}" action="login"/> </br>
		<g:link uri=""><g:message code="authentication.returnHome"/></g:link>
	</g:form>
	</body>
</html>
		