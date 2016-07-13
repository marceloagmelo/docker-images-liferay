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

<%@ include file="/html/taglib/ui/journal_content_search/init.jsp" %>

<%
String defaultKeywords = LanguageUtil.get(pageContext, "search") + "...";
String unicodeDefaultKeywords = UnicodeFormatter.toString(defaultKeywords);

String keywords = ParamUtil.getString(request, namespace + "keywords", defaultKeywords);

PortletURL portletURL = null;

if (portletResponse != null) {
	LiferayPortletResponse liferayPortletResponse = (LiferayPortletResponse)portletResponse;

	portletURL = liferayPortletResponse.createLiferayPortletURL(PortletKeys.JOURNAL_CONTENT_SEARCH, PortletRequest.RENDER_PHASE);
}
else {
	portletURL = new PortletURLImpl(request, PortletKeys.JOURNAL_CONTENT_SEARCH, plid, PortletRequest.RENDER_PHASE);
}

portletURL.setWindowState(WindowState.MAXIMIZED);
portletURL.setPortletMode(PortletMode.VIEW);

portletURL.setParameter("struts_action", "/journal_content_search/search");
%>

<form action="<%= HtmlUtil.escape(portletURL.toString()) %>" class="aui-form" method="post" name="<%= namespace %>fm" onSubmit="submitForm(this); return false;">

<%
String taglibOnBlur = "if (this.value == '') { this.value = '" + unicodeDefaultKeywords + "'; }";
String taglibOnFocus = "if (this.value == '" + unicodeDefaultKeywords + "') { this.value = ''; }";
%>

<aui:input cssClass="lfr-search-keywords" inlineField="<%= true %>" label="" name="keywords" onBlur="<%= taglibOnBlur %>" onFocus="<%= taglibOnFocus %>" size="30" title="search-web-content" type="text" value="<%= HtmlUtil.escape(keywords) %>" />

<aui:input alt="search" cssClass="lfr-search-button" inlineField="<%= true %>" label="" name="search" src='<%= themeDisplay.getPathThemeImages() + "/common/search.png" %>' type="image" />