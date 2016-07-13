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

<%@ include file="/html/taglib/ui/social_bookmark/init.jsp" %>

<%
String plusOneDisplayStyle = "medium";

if (displayStyle.equals("vertical")) {
	plusOneDisplayStyle = "tall";
}
%>

<liferay-util:html-bottom outputKey="taglib_ui_social_bookmark_plusone">
	<script src="https://apis.google.com/js/plusone.js" type="text/javascript">
		{
			lang: '<%= locale.getDisplayLanguage() %>'
		}
	</script>
</liferay-util:html-bottom>

<g:plusone
	count="<%= !displayStyle.equals("simple") %>"
	href="<%= url %>"
	size="<%= plusOneDisplayStyle %>"
>
</g:plusone>