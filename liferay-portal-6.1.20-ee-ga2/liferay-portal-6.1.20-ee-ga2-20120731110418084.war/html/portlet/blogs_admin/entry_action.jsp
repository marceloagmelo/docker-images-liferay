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

<%@ include file="/html/portlet/blogs_admin/init.jsp" %>

<%
SearchContainer searchContainer = (SearchContainer)request.getAttribute("liferay-ui:search:searchContainer");

String redirect = searchContainer.getIteratorURL().toString();

ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

BlogsEntry entry = (BlogsEntry)row.getObject();
%>

<liferay-ui:icon-menu>
	<c:if test="<%= BlogsEntryPermission.contains(permissionChecker, entry, ActionKeys.VIEW) %>">
		<portlet:renderURL var="viewEntryURL">
			<portlet:param name="struts_action" value="/blogs_admin/view_entry" />
			<portlet:param name="redirect" value="<%= redirect %>" />
			<portlet:param name="entryId" value="<%= String.valueOf(entry.getEntryId()) %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="view"
			url="<%= viewEntryURL %>"
		/>
	</c:if>

	<c:if test="<%= BlogsEntryPermission.contains(permissionChecker, entry, ActionKeys.UPDATE) %>">
		<portlet:renderURL var="editEntryURL">
			<portlet:param name="struts_action" value="/blogs_admin/edit_entry" />
			<portlet:param name="redirect" value="<%= redirect %>" />
			<portlet:param name="entryId" value="<%= String.valueOf(entry.getEntryId()) %>" />
			<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.UPDATE %>" />
		</portlet:renderURL>

		<liferay-ui:icon
			image="edit"
			url="<%= editEntryURL %>"
		/>
	</c:if>

	<c:if test="<%= BlogsEntryPermission.contains(permissionChecker, entry, ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= BlogsEntry.class.getName() %>"
			modelResourceDescription="<%= entry.getTitle() %>"
			resourcePrimKey="<%= String.valueOf(entry.getEntryId()) %>"
			var="permissionsEntryURL"
		/>

		<liferay-ui:icon
			image="permissions"
			url="<%= permissionsEntryURL %>"
		/>
	</c:if>

	<c:if test="<%= BlogsEntryPermission.contains(permissionChecker, entry, ActionKeys.DELETE) %>">
		<portlet:actionURL var="deleteEntryURL">
			<portlet:param name="struts_action" value="/blogs_admin/edit_entry" />
			<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.DELETE %>" />
			<portlet:param name="redirect" value="<%= redirect %>" />
			<portlet:param name="entryId" value="<%= String.valueOf(entry.getEntryId()) %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete url="<%= deleteEntryURL %>" />
	</c:if>
</liferay-ui:icon-menu>