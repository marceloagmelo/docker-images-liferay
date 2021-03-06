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

<%@ include file="/html/portlet/document_library/init.jsp" %>

<%
Folder folder = (Folder)request.getAttribute("view.jsp-folder");

DLUtil.addPortletBreadcrumbEntries(folder, request, liferayPortletResponse);

boolean showSyncMessage = GetterUtil.getBoolean(SessionClicks.get(request, liferayPortletResponse.getNamespace() + "show-sync-message", "true"));

String cssClass = "show-sync-message";

if (showSyncMessage || !PropsValues.DL_SHOW_LIFERAY_SYNC_MESSAGE) {
	cssClass = "show-sync-message aui-helper-hidden";
}
%>

<img alt="<%= LanguageUtil.get(pageContext, "show-liferay-sync-tip") %>" class="<%= cssClass %>" id="<portlet:namespace />showSyncMessageIcon" src="<%= themeDisplay.getPathThemeImages() + "/common/liferay_sync.png" %>" title="<%= LanguageUtil.get(pageContext, "liferay-sync") %>" />

<liferay-ui:breadcrumb showCurrentGroup="<%= false %>" showCurrentPortlet="<%= false %>" showGuestGroup="<%= false %>" showLayout="<%= false %>" showParentGroups="<%= false %>" />