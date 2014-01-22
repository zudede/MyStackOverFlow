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
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isModerator', 'error')} ">
	<g:if test="${session.administrator==true }">
	<label for="isModerator">
		<g:message code="user.moderator.label" default="Moderator" />
	</label>
		<g:checkBox name="isModerator" value="${userInstance?.isModerator }"/>
	</g:if>
	<g:else>
	<g:hiddenField name="isModerator" value='false'/>
	</g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isBlocked', 'error')} ">
	<g:if test="${session.administrator==true }">
	<label for="isBlocked">
		<g:message code="user.blocked.label" default="Blocked" />
	</label>
		<g:checkBox name="isBlocked" value="${userInstance?.isBlocked }"/>
	</g:if>
	<g:else>
	<g:hiddenField name="isBlocked" value='false'/>
	</g:else>
</div>


