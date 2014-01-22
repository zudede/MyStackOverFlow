<%@ page import="mystackoverflow.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="comment.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${mystackoverflow.User.list()}" optionKey="id" required="" value="${commentInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="comment.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${commentInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="comment.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${commentInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="comment.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="message" name="message.id" from="${mystackoverflow.Message.list()}" optionKey="id" required="" value="${commentInstance?.message?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="comment.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate" type="number" value="${commentInstance.rate}" required=""/>
</div>

