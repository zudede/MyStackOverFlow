<%@ page import="mystackoverflow.Topic" %>


<!-- 
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="topic.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${mystackoverflow.User.list()}" optionKey="id" required="" value="${topicInstance?.author?.id}" class="many-to-one"/>
</div>  -->

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="topic.question.label" default="Question" />
		
	</label>
	<g:textArea name="question" value="${topicInstance?.question }"></g:textArea>
	
	
<!--  	
<ul class="one-to-many">
<g:each in="${topicInstance?.messages?}" var="m">
    <li><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="message" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
</li>
</ul>
 -->
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="topic.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${mystackoverflow.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${topicInstance?.tags*.id}" class="many-to-many"/>
</div>

