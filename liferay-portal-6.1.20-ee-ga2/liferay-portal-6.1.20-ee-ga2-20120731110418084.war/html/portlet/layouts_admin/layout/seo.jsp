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

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>

<%
Layout selLayout = (Layout)request.getAttribute("edit_pages.jsp-selLayout");

UnicodeProperties layoutTypeSettings = null;

if (selLayout != null) {
	layoutTypeSettings = selLayout.getTypeSettingsProperties();
}
%>

<liferay-ui:error-marker key="errorSection" value="seo" />

<aui:model-context bean="<%= selLayout %>" model="<%= Layout.class %>" />

<h3><liferay-ui:message key="meta-tags" /></h3>

<aui:fieldset>
	<aui:input name="description" />

	<aui:input name="keywords" />

	<aui:input name="robots" />
</aui:fieldset>

<c:if test="<%= PortalUtil.isLayoutSitemapable(selLayout) %>">
	<h3><liferay-ui:message key="robots" /></h3>

	<aui:fieldset>

		<%
		boolean include = GetterUtil.getBoolean(layoutTypeSettings.getProperty("sitemap-include"), true);
		String changeFrequency = layoutTypeSettings.getProperty("sitemap-changefreq", PropsValues.SITES_SITEMAP_DEFAULT_CHANGE_FREQUENCY);
		String sitemapPriority = layoutTypeSettings.getProperty("sitemap-priority", PropsValues.SITES_SITEMAP_DEFAULT_PRIORITY);
		%>

		<aui:select label="include" name="TypeSettingsProperties--sitemap-include--">
			<aui:option label="yes" selected="<%= include %>" value="1" />
			<aui:option label="no" selected="<%= !include %>" value="0" />
		</aui:select>

		<aui:input helpMessage="(0.0 - 1.0)" label="page-priority" name="TypeSettingsProperties--sitemap-priority--" size="3" type="text" value="<%= sitemapPriority %>" />

		<aui:select label="change-frequency" name="TypeSettingsProperties--sitemap-changefreq--">
			<aui:option label="always" selected='<%= changeFrequency.equals("always") %>' />
			<aui:option label="hourly" selected='<%= changeFrequency.equals("hourly") %>' />
			<aui:option label="daily" selected='<%= changeFrequency.equals("daily") %>' />
			<aui:option label="weekly" selected='<%= changeFrequency.equals("weekly") %>' />
			<aui:option label="monthly" selected='<%= changeFrequency.equals("monthly") %>' />
			<aui:option label="yearly" selected='<%= changeFrequency.equals("yearly") %>' />
			<aui:option label="never" selected='<%= changeFrequency.equals("never") %>' />
		</aui:select>
	</aui:fieldset>
</c:if>

<aui:fieldset>

	<%
	boolean showAlternateLinks = GetterUtil.getBoolean(layoutTypeSettings.getProperty("show-alternate-links"), true);
	%>

	<h3><liferay-ui:message key="alternate-links" /></h3>

	<aui:input helpMessage="show-alternate-links-help" label="show-alternate-links" name="TypeSettingsProperties--show-alternate-links--" type="checkbox" value="<%= showAlternateLinks %>" />
</aui:fieldset>