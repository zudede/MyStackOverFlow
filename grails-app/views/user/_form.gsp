<%@ page import="mystackoverflow.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="15" required="" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
	<label for="passwordHash">
		<g:message code="user.passwordHash.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwordHash" required="" value="${userInstance?.passwordHash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="user.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${userInstance?.birthday}"  />
</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'pseudo', 'error')} ">
	<label for="pseudo">
		<g:message code="user.pseudo.label" default="Pseudo" />
		
	</label>
	<g:textField name="pseudo" value="${userInstance?.pseudo}"/>
</div>

