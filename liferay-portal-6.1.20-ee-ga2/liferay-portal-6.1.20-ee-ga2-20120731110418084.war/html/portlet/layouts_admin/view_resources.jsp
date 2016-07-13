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

<%@ include file="/html/portlet/layouts_admin/init.jsp" %>

<%@ include file="/html/portlet/layouts_admin/init_attributes.jspf" %>

<%
boolean viewTree = ParamUtil.getBoolean(request, "viewTree");
boolean viewLayout = ParamUtil.getBoolean(request, "viewLayout");

SitesUtil.addPortletBreadcrumbEntries(group, pagesName, redirectURL, request, renderResponse);
%>

<c:if test="<%= viewTree %>">
	<div id="<portlet:namespace />viewTree">
		<liferay-util:include page="/html/portlet/layouts_admin/tree_js.jsp">
			<liferay-util:param name="treeId" value="layoutsTree" />
		</liferay-util:include>
	</div>
</c:if>

<c:if test="<%= viewLayout %>">
	<div id="<portlet:namespace />viewLayout">
		<c:choose>
			<c:when test="<%= selPlid > 0 %>">
				<liferay-util:include page="/html/portlet/layouts_admin/edit_layout.jsp" />
			</c:when>
			<c:otherwise>
				<liferay-util:include page="/html/portlet/layouts_admin/edit_layout_set.jsp" />
			</c:otherwise>
		</c:choose>
	</div>
</c:if>