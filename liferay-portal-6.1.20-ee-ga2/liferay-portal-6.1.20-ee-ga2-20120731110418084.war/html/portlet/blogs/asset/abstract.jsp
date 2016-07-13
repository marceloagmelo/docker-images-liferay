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

<%@ include file="/html/portlet/blogs/init.jsp" %>

<%
int abstractLength = (Integer)request.getAttribute(WebKeys.ASSET_PUBLISHER_ABSTRACT_LENGTH);

BlogsEntry entry = (BlogsEntry)request.getAttribute(WebKeys.BLOGS_ENTRY);
%>

<c:if test="<%= entry.isSmallImage() %>">

	<%
	String src = StringPool.BLANK;

	if (Validator.isNotNull(entry.getSmallImageURL())) {
		src = entry.getSmallImageURL();
	}
	else {
		src = themeDisplay.getPathImage() + "/blogs/article?img_id=" + entry.getSmallImageId() + "&t=" + WebServerServletTokenUtil.getToken(entry.getSmallImageId());
	}
	%>

	<div class="asset-small-image">
		<img alt="" class="asset-small-image" src="<%= HtmlUtil.escape(src) %>" width="150" />
	</div>
</c:if>

<%
String summary = entry.getDescription();

if (Validator.isNull(summary)) {
	summary = HtmlUtil.stripHtml(entry.getContent());
}
%>

<%= StringUtil.shorten(summary, abstractLength) %>