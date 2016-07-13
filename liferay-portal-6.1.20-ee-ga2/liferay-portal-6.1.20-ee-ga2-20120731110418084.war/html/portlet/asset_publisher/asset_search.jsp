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

<%@ include file="/html/portlet/asset_publisher/init.jsp" %>

<%
AssetSearch searchContainer = (AssetSearch)request.getAttribute("liferay-ui:search:searchContainer");

AssetDisplayTerms displayTerms = (AssetDisplayTerms)searchContainer.getDisplayTerms();

long groupId = ParamUtil.getLong(request, "groupId");
%>

<liferay-ui:search-toggle
	buttonLabel="search"
	displayTerms="<%= displayTerms %>"
	id="toggle_id_asset_search"
>
	<aui:fieldset>
		<aui:input name="<%= displayTerms.TITLE %>" size="20" type="text" value="<%= displayTerms.getTitle() %>" />

		<aui:input name="<%= displayTerms.DESCRIPTION %>" size="20" type="text" value="<%= displayTerms.getDescription() %>" />

		<aui:input name="<%= displayTerms.USER_NAME %>" size="20" type="text" value="<%= displayTerms.getUserName() %>" />

		<aui:select label="my-sites" name="<%= displayTerms.GROUP_ID %>" showEmptyOption="<%= false %>">

			<%
			if (groupId > 0) {
				Group group = GroupLocalServiceUtil.getGroup(groupId);
			%>

				<aui:option label="<%= group.getDescriptiveName(locale) %>" selected="true" value="<%= groupId %>" />

			<%
			}
			else {
				for (long curGroupId : groupIds) {
					Group group = GroupLocalServiceUtil.getGroup(curGroupId);
				%>

					<aui:option label="<%= group.getDescriptiveName(locale) %>" selected="<%= displayTerms.getGroupId() == curGroupId %>" value="<%= curGroupId %>" />

				<%
				}
			}
			%>

		</aui:select>
	</aui:fieldset>
</liferay-ui:search-toggle>