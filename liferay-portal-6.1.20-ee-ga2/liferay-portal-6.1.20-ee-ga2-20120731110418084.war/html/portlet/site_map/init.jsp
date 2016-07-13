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

<%@ page import="com.liferay.portal.util.LayoutLister" %><%@
page import="com.liferay.portal.util.LayoutView" %>

<%
PortletPreferences preferences = renderRequest.getPreferences();

String portletResource = ParamUtil.getString(request, "portletResource");

if (Validator.isNotNull(portletResource)) {
	preferences = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

String rootLayoutUuid = GetterUtil.getString(preferences.getValue("rootLayoutUuid", StringPool.BLANK));
int displayDepth = GetterUtil.getInteger(preferences.getValue("displayDepth", StringPool.BLANK));
boolean includeRootInTree = GetterUtil.getBoolean(preferences.getValue("includeRootInTree", StringPool.BLANK));
boolean showCurrentPage = GetterUtil.getBoolean(preferences.getValue("showCurrentPage", StringPool.BLANK));
boolean useHtmlTitle = GetterUtil.getBoolean(preferences.getValue("useHtmlTitle", StringPool.BLANK));
boolean showHiddenPages = GetterUtil.getBoolean(preferences.getValue("showHiddenPages", StringPool.BLANK));

Layout rootLayout = null;

long rootLayoutId = LayoutConstants.DEFAULT_PARENT_LAYOUT_ID;

if (Validator.isNotNull(rootLayoutUuid)) {
	rootLayout = LayoutLocalServiceUtil.getLayoutByUuidAndGroupId(rootLayoutUuid, scopeGroupId);

	if (rootLayout != null) {
		rootLayoutId = rootLayout.getLayoutId();
	}
}
else {
	includeRootInTree = false;
}

if (rootLayoutId == LayoutConstants.DEFAULT_PARENT_LAYOUT_ID) {
	includeRootInTree = false;
}
%>

<%@ include file="/html/portlet/site_map/init-ext.jsp" %>