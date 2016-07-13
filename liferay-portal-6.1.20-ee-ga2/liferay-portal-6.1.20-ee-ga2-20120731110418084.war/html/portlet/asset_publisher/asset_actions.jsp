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

<%@ include file="/html/portlet/asset_publisher/init.jsp" %>

<%
boolean showIconLabel = ((Boolean)request.getAttribute("view.jsp-showIconLabel")).booleanValue();

AssetRenderer assetRenderer = (AssetRenderer)request.getAttribute("view.jsp-assetRenderer");

boolean showEditURL = ParamUtil.getBoolean(request, "showEditURL", true);

PortletURL editPortletURL = assetRenderer.getURLEdit(liferayPortletRequest, liferayPortletResponse);

String editPortletURLString = StringPool.BLANK;

if (showEditURL && (editPortletURL != null)) {
	editPortletURL.setWindowState(LiferayWindowState.POP_UP);
	editPortletURL.setPortletMode(PortletMode.VIEW);

	if (Validator.isNotNull(portletResource)) {
		editPortletURL.setParameter("referringPortletResource", portletResource);
	}
	else {
		editPortletURL.setParameter("referringPortletResource", portletDisplay.getId());
	}

	PortletURL redirectURL = renderResponse.createRenderURL();

	redirectURL.setWindowState(LiferayWindowState.POP_UP);

	redirectURL.setParameter("struts_action", "/asset_publisher/add_asset_redirect");

	editPortletURL.setParameter("redirect", redirectURL.toString());
	editPortletURL.setParameter("originalRedirect", redirectURL.toString());

	editPortletURLString = editPortletURL.toString();

	editPortletURLString = HttpUtil.addParameter(editPortletURLString, "doAsGroupId", assetRenderer.getGroupId());
	editPortletURLString = HttpUtil.addParameter(editPortletURLString, "refererPlid", plid);
}

Group stageableGroup = themeDisplay.getScopeGroup();

if (themeDisplay.getScopeGroup().isLayout()) {
	stageableGroup = layout.getGroup();
}
%>

<c:if test="<%= assetRenderer.hasEditPermission(permissionChecker) && Validator.isNotNull(editPortletURLString) && !stageableGroup.hasStagingGroup() %>">
	<div class="lfr-meta-actions asset-actions">

		<%
		String taglibEditURL = "javascript:Liferay.Util.openWindow({dialog: {width: 960}, id: '" + renderResponse.getNamespace() + "editAsset', title: '" + LanguageUtil.format(pageContext, "edit-x", HtmlUtil.escape(assetRenderer.getTitle(locale))) + "', uri:'" + HtmlUtil.escapeURL(editPortletURLString) + "'});";
		%>

		<liferay-ui:icon
			image="edit"
			label="<%= showIconLabel %>"
			message='<%= showIconLabel ? LanguageUtil.format(pageContext, "edit-x-x", new Object[] {"aui-helper-hidden-accessible", HtmlUtil.escape(assetRenderer.getTitle(locale))}) : LanguageUtil.format(pageContext, "edit-x", HtmlUtil.escape(assetRenderer.getTitle(locale))) %>'
			url="<%= taglibEditURL %>"
		/>
	</div>
</c:if>