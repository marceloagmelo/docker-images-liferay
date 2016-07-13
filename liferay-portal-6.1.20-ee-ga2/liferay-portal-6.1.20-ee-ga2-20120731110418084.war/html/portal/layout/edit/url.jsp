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

<%@ include file="/html/portal/layout/edit/init.jsp" %>

<%
UnicodeProperties typeSettingsProperties = selLayout.getTypeSettingsProperties();

String url = typeSettingsProperties.getProperty("url", StringPool.BLANK);
String description = typeSettingsProperties.getProperty("description", StringPool.BLANK);
%>

<aui:input cssClass="lfr-input-text-container" label="url" name="TypeSettingsProperties--url--" type="text" value="<%= url %>" />

<aui:input cssClass="layout-description" label="description" name="TypeSettingsProperties--description--" type="textarea" value="<%= description %>" wrap="soft" />