<%@ page import="mystackoverflow.Message" %>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="message.body.label" default="Body" />
		
	</label>
	<g:textArea name="body" value="${messageInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="message.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${messageInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['message.id': messageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>

</div>

<<g:hiddenField name="topic.id" value="${messageInstance?.topic?.id}"/>
<!-- 
<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="message.topic.label" default="Topic" />
		<span class="required- indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${mystackoverflow.Topic.list()}" optionKey="id" required="" value="${messageInstance?.topic?.id}" class="many-to-one"/>
</div>  -->
 
