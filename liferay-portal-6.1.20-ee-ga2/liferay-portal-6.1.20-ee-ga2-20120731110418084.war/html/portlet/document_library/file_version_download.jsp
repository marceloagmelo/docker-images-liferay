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

<%@ include file="/html/portlet/document_library_display/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

Object[] objArray = (Object[])row.getObject();

FileEntry fileEntry = (FileEntry)objArray[0];
FileVersion fileVersion = (FileVersion)objArray[1];
String[] conversions = (String[])objArray[3];
Boolean isLocked = (Boolean)objArray[4];
Boolean hasLock = (Boolean)objArray[5];
%>

<liferay-ui:icon
	image='<%= "../file_system/small/" + fileVersion.getIcon() %>'
	label="<%= true %>"
	message="<%= fileVersion.getExtension().toUpperCase() %>"
	url="<%= DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay, StringPool.BLANK) %>"
/>