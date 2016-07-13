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

<%@ include file="/html/portlet/mobile_device_rules/action/init.jsp" %>

<%
String layoutTemplateId = GetterUtil.getString(typeSettingsProperties.getProperty("layoutTemplateId"));

List<LayoutTemplate> layoutTemplates = LayoutTemplateLocalServiceUtil.getLayoutTemplates();
%>

<liferay-ui:error-marker key="errorSection" value="layout" />

<h5><%= LanguageUtil.get(pageContext, "layout-template") %></h5>

<%@ include file="/html/portlet/layouts_admin/layout/layout_templates.jspf" %>