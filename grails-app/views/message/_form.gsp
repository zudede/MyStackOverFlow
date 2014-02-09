<%@ page import="mystackoverflow.Message" %>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<g:textArea name="body" value="${messageInstance?.body}"/>
</div>


<g:hiddenField name="topic.id" value="${messageInstance?.topic?.id}"/>
 
