<%@ page import="mystackoverflow.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="tag.name.label"/>
		
	</label>
	<g:textField name="name" value="${tagInstance?.name}"/>
</div>

