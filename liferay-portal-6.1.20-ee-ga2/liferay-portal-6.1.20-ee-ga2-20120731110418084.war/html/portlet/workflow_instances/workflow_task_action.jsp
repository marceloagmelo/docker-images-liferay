<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/portlet/workflow_instances/init.jsp" %>

<%
String randomId = PwdGenerator.getPassword(PwdGenerator.KEY3, 4);

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

WorkflowTask workflowTask = (WorkflowTask)row.getObject();
%>

<liferay-ui:icon-menu>
	<c:if test="<%= portletName.equals(PortletKeys.WORKFLOW_DEFINITIONS) && !workflowTask.isCompleted() && !_isAssignedToUser(workflowTask, user) %>">
		<portlet:actionURL var="assignToMeURL">
			<portlet:param name="struts_action" value="/workflow_instances/edit_workflow_instance_task" />
			<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.ASSIGN %>" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="workflowTaskId" value="<%= String.valueOf(workflowTask.getWorkflowTaskId()) %>" />
			<portlet:param name="assigneeUserId" value="<%= String.valueOf(user.getUserId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon
			cssClass='<%= "workflow-task-" + randomId + " task-assign-to-me-link" %>'
			image="assign"
			message="assign-to-me"
			method="get"
			url="<%= assignToMeURL %>"
		/>
	</c:if>

	<c:if test="<%= !workflowTask.isCompleted() && _isAssignedToUser(workflowTask, user) %>">

		<%
		List<String> transitionNames = WorkflowTaskManagerUtil.getNextTransitionNames(company.getCompanyId(), user.getUserId(), workflowTask.getWorkflowTaskId());

		for (String transitionName : transitionNames) {
			String message = "proceed";

			if (Validator.isNotNull(transitionName)) {
				message = transitionName;
			}
		%>

			<portlet:actionURL var="editURL">
				<portlet:param name="struts_action" value="/workflow_instances/edit_workflow_instance_task" />
				<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.SAVE %>" />
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="workflowTaskId" value="<%= StringUtil.valueOf(workflowTask.getWorkflowTaskId()) %>" />
				<portlet:param name="assigneeUserId" value="<%= StringUtil.valueOf(workflowTask.getAssigneeUserId()) %>" />

				<c:if test="<%= transitionName != null %>">
					<portlet:param name="transitionName" value="<%= transitionName %>" />
				</c:if>
			</portlet:actionURL>

			<liferay-ui:icon
				cssClass='<%= "workflow-task-" + randomId + " task-change-status-link" %>'
				image="../aui/shuffle"
				message="<%= message %>"
				method="get"
				url="<%= editURL %>"
			/>

		<%
		}
		%>

	</c:if>
</liferay-ui:icon-menu>

<div class="aui-helper-hidden" id="<%= randomId %>updateComments">
	<aui:input cols="55" name="comment" rows="10" type="textarea" />
</div>

<aui:script use="aui-dialog">
	var showPopup = function(url, title) {
		var form = A.Node.create('<form />');

		form.setAttribute('action', url);
		form.setAttribute('method', 'POST');

		var comments = A.one('#<%= randomId %>updateComments');

		if (comments) {
			form.append(comments);

			comments.show();
		}

		var dialog = new A.Dialog(
			{
				bodyContent: form,
				buttons: [
					{
						handler: function() {
							submitForm(form);
						},
						label: '<%= UnicodeLanguageUtil.get(pageContext, "ok") %>'
					},
					{
						handler: function() {
							dialog.close();
						},
						label: '<%= UnicodeLanguageUtil.get(pageContext, "cancel") %>'
					}
				],
				centered: true,
				modal: true,
				title: title,
				width: 400
			}
		).render();
	};

	A.all('.workflow-task-<%= randomId %> a').on(
		'click',
		function(event) {
			event.preventDefault();

			var icon = event.currentTarget;
			var title = icon.text();

			showPopup(icon.attr('href'), title);
		}
	);
</aui:script>