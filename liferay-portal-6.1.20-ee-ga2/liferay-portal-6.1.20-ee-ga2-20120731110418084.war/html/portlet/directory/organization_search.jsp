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
themeDisplay.setIncludeServiceJs(true);

OrganizationSearch searchContainer = (OrganizationSearch)request.getAttribute("liferay-ui:search:searchContainer");

OrganizationDisplayTerms displayTerms = (OrganizationDisplayTerms)searchContainer.getDisplayTerms();

String type = displayTerms.getType();
%>

<liferay-ui:search-toggle
	buttonLabel="search"
	displayTerms="<%= displayTerms %>"
	id="toggle_id_directory_organization_search"
>
	<aui:fieldset>
		<aui:input name="<%= displayTerms.NAME %>" size="20" type="text" value="<%= displayTerms.getName() %>" />

		<aui:select name="<%= displayTerms.TYPE %>">
			<aui:option value=""></aui:option>

			<%
			for (String curType : PropsValues.ORGANIZATIONS_TYPES) {
			%>

				<aui:option label="<%= curType %>" selected="<%= type.equals(curType) %>" />

			<%
			}
			%>

		</aui:select>

		<aui:input name="<%= displayTerms.STREET %>" size="20" type="text" value="<%= displayTerms.getStreet() %>" />

		<aui:select label="country" name="<%= displayTerms.COUNTRY_ID %>" />

		<aui:input name="<%= displayTerms.CITY %>" size="20" type="text" value="<%= displayTerms.getCity() %>" />

		<aui:select label="region" name="<%= displayTerms.REGION_ID %>" />

		<aui:input label="postal-code" name="<%= displayTerms.ZIP %>" size="20" type="text" value="<%= displayTerms.getZip() %>" />
	</aui:fieldset>
</liferay-ui:search-toggle>

<%
Organization organization = null;

if (displayTerms.getParentOrganizationId() > 0) {
	try {
		organization = OrganizationLocalServiceUtil.getOrganization(displayTerms.getParentOrganizationId());
	}
	catch (NoSuchOrganizationException nsoe) {
	}
}
%>

<c:if test="<%= organization != null %>">
	<aui:input name="<%= UserDisplayTerms.ORGANIZATION_ID %>" type="hidden" value="<%= organization.getOrganizationId() %>" />

	<br />

	<liferay-ui:message key="filter-by-organization" />: <%= HtmlUtil.escape(organization.getName()) %><br />
</c:if>

<c:if test="<%= windowState.equals(WindowState.MAXIMIZED) %>">
	<aui:script>
		Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace /><%= displayTerms.NAME %>);
		Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace /><%= displayTerms.KEYWORDS %>);
	</aui:script>
</c:if>

<aui:script use="liferay-dynamic-select">
	new Liferay.DynamicSelect(
		[
			{
				select: '<portlet:namespace /><%= displayTerms.COUNTRY_ID %>',
				selectData: Liferay.Address.getCountries,
				selectDesc: 'name',
				selectId: 'countryId',
				selectVal: '<%= displayTerms.getCountryId() %>'
			},
			{
				select: '<portlet:namespace /><%= displayTerms.REGION_ID %>',
				selectData: Liferay.Address.getRegions,
				selectDesc: 'name',
				selectId: 'regionId',
				selectVal: '<%= displayTerms.getRegionId() %>'
			}
		]
	);
</aui:script>