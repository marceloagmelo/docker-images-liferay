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

<%@ include file="/html/portlet/directory/init.jsp" %>

<%
PortletURL portletURL = (PortletURL)request.getAttribute("view.jsp-portletURL");
%>

<liferay-ui:search-container
	searchContainer="<%= new OrganizationSearch(renderRequest, portletURL) %>"
>
	<aui:input disabled="<%= true %>" name="organizationsRedirect" type="hidden" value="<%= portletURL.toString() %>" />

	<liferay-ui:search-form
		page="/html/portlet/directory/organization_search.jsp"
	/>

	<%
	OrganizationSearchTerms searchTerms = (OrganizationSearchTerms)searchContainer.getSearchTerms();

	LinkedHashMap organizationParams = new LinkedHashMap();

	long parentOrganizationId = ParamUtil.getLong(request, "parentOrganizationId", OrganizationConstants.DEFAULT_PARENT_ORGANIZATION_ID);

	if (parentOrganizationId <= 0) {
		parentOrganizationId = OrganizationConstants.ANY_PARENT_ORGANIZATION_ID;
	}
	%>

	<liferay-ui:search-container-results>
		<c:choose>
			<c:when test="<%= PropsValues.ORGANIZATIONS_INDEXER_ENABLED && PropsValues.ORGANIZATIONS_SEARCH_WITH_INDEX %>">
				<%@ include file="/html/portlet/users_admin/organization_search_results_index.jspf" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/html/portlet/users_admin/organization_search_results_database.jspf" %>
			</c:otherwise>
		</c:choose>
	</liferay-ui:search-container-results>

	<liferay-ui:search-container-row
		className="com.liferay.portal.model.Organization"
		escapedModel="<%= true %>"
		keyProperty="organizationId"
		modelVar="organization"
	>
		<portlet:renderURL var="rowURL">
			<portlet:param name="struts_action" value="/directory/view_organization" />
			<portlet:param name="tabs1" value="<%= HtmlUtil.escape(tabs1) %>" />
			<portlet:param name="redirect" value="<%= searchContainer.getIteratorURL().toString() %>" />
			<portlet:param name="organizationId" value="<%= String.valueOf(organization.getOrganizationId()) %>" />
		</portlet:renderURL>

		<%@ include file="/html/portlet/directory/organization/search_columns.jspf" %>
	</liferay-ui:search-container-row>

	<div class="separator"><!-- --></div>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>