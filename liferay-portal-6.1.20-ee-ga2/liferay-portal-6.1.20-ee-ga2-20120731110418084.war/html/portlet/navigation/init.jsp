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

<%@ include file="/html/portlet/init.jsp" %>

<%
PortletPreferences preferences = renderRequest.getPreferences();

String portletResource = ParamUtil.getString(request, "portletResource");

if (Validator.isNotNull(portletResource)) {
	preferences = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

String defaultBulletStyle = GetterUtil.getString(themeDisplay.getThemeSetting("bullet-style"), "dots");

String bulletStyle = PrefsParamUtil.getString(preferences, renderRequest, "bulletStyle", defaultBulletStyle);

String displayStyle = PrefsParamUtil.getString(preferences, renderRequest, "displayStyle", "relative-with-breadcrumb");

String headerType = PrefsParamUtil.getString(preferences, renderRequest, "headerType", "root-layout");

String rootLayoutType = PrefsParamUtil.getString(preferences, renderRequest, "rootLayoutType", "absolute");
int rootLayoutLevel = PrefsParamUtil.getInteger(preferences, renderRequest, "rootLayoutLevel", 1);

String includedLayouts = PrefsParamUtil.getString(preferences, renderRequest, "includedLayouts", "current");

boolean nestedChildren = PrefsParamUtil.getBoolean(preferences, renderRequest, "nestedChildren", true);
%>

<%@ include file="/html/portlet/navigation/init-ext.jsp" %>