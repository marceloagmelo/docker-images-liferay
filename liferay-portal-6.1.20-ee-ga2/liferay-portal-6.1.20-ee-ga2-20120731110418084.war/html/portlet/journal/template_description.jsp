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

<%@ include file="/html/portlet/journal/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

JournalTemplate template = (JournalTemplate)row.getObject();

String rowHREF = (String)row.getParameter("rowHREF");
%>

<a href="<%= rowHREF %>">

<c:choose>
	<c:when test="<%= template.isSmallImage() %>">
		<img border="0" src="<%= Validator.isNotNull(template.getSmallImageURL()) ? template.getSmallImageURL() : themeDisplay.getPathImage() + "/journal/template?img_id=" + template.getSmallImageId() + "&t=" + WebServerServletTokenUtil.getToken(template.getSmallImageId()) %>" />
	</c:when>
	<c:otherwise>
		<%= HtmlUtil.escape(template.getDescription(locale)) %>
	</c:otherwise>
</c:choose>

</a>