<%@ page import="mystackoverflow.Message" %>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<g:textArea name="body" value="${messageInstance?.body}"/>
</div>


<g:hiddenField name="topic.id" value="${messageInstance?.topic?.id}"/>
<!-- 
<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="message.topic.label" default="Topic" />
		<span class="required- indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${mystackoverflow.Topic.list()}" optionKey="id" required="" value="${messageInstance?.topic?.id}" class="many-to-one"/>
</div>  -->
 
