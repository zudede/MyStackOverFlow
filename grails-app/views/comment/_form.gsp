<%@ page import="mystackoverflow.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'body', 'error')} ">
	<g:textArea name="body" value="${commentInstance?.body}"/>
</div>



<g:hiddenField name="message.id" value="${commentInstance?.message?.id}"/>

