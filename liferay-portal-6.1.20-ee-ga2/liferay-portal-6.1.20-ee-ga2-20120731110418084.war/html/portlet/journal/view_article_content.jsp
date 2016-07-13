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

<html>

<head>
	<link href="<%= PortalUtil.getStaticResourceURL(request, themeDisplay.getCDNDynamicResourcesHost() + themeDisplay.getPathContext() + "/html/css/main.css") %>" type="text/css" rel="stylesheet" />
	<link href="<%= PortalUtil.getStaticResourceURL(request, themeDisplay.getPathThemeCss() + "/main.css") %>" rel="stylesheet" type="text/css" />

	<c:if test="<%= (layout != null) && Validator.isNotNull(layout.getCssText()) %>">
		<style type="text/css">
			<%= layout.getCssText() %>
		</style>
	</c:if>
</head>

<body>

<%= request.getAttribute(WebKeys.JOURNAL_ARTICLE_CONTENT) %>

</body>

</html>