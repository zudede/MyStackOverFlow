<%@ page import="mystackoverflow.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="comment.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${commentInstance?.body}"/>
</div>



<g:hiddenField name="message.id" value="${commentInstance?.message?.id}"/>

