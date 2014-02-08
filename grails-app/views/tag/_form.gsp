<%@ page import="mystackoverflow.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tagInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'topics', 'error')} ">
	<label for="topics">
		<g:message code="tag.topics.label" default="Topics" />
		
	</label>
	
</div>

