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
List results = (List)request.getAttribute("view.jsp-results");

int assetEntryIndex = ((Integer)request.getAttribute("view.jsp-assetEntryIndex")).intValue();

AssetEntry assetEntry = (AssetEntry)request.getAttribute("view.jsp-assetEntry");
AssetRendererFactory assetRendererFactory = (AssetRendererFactory)request.getAttribute("view.jsp-assetRendererFactory");
AssetRenderer assetRenderer = (AssetRenderer)request.getAttribute("view.jsp-assetRenderer");

boolean show = ((Boolean)request.getAttribute("view.jsp-show")).booleanValue();

request.setAttribute("view.jsp-showIconLabel", true);

String title = (String)request.getAttribute("view.jsp-title");

if (Validator.isNull(title)) {
	title = assetRenderer.getTitle(locale);
}

PortletURL viewFullContentURL = renderResponse.createRenderURL();

viewFullContentURL.setParameter("struts_action", "/asset_publisher/view_content");
viewFullContentURL.setParameter("assetEntryId", String.valueOf(assetEntry.getEntryId()));
viewFullContentURL.setParameter("type", assetRendererFactory.getType());

if (Validator.isNotNull(assetRenderer.getUrlTitle())) {
	if (assetRenderer.getGroupId() != scopeGroupId) {
		viewFullContentURL.setParameter("groupId", String.valueOf(assetRenderer.getGroupId()));
	}

	viewFullContentURL.setParameter("urlTitle", assetRenderer.getUrlTitle());
}

String summary = StringUtil.shorten(assetRenderer.getSummary(locale), abstractLength);

String viewURL = null;

if (viewInContext) {
	String viewFullContentURLString = viewFullContentURL.toString();

	viewFullContentURLString = HttpUtil.setParameter(viewFullContentURLString, "redirect", currentURL);

	viewURL = assetRenderer.getURLViewInContext(liferayPortletRequest, liferayPortletResponse, viewFullContentURLString);

	viewURL = HttpUtil.setParameter(viewURL, "redirect", currentURL);
}
else {
	viewURL = viewFullContentURL.toString();
}

if (Validator.isNull(viewURL)) {
	viewURL = viewFullContentURL.toString();
}

String viewURLMessage = viewInContext ? assetRenderer.getViewInContextMessage() : "read-more-x-about-x";

viewURL = _checkViewURL(viewURL, currentURL, themeDisplay);
%>

<c:if test="<%= show %>">
	<div class="asset-abstract <%= defaultAssetPublisher ? "default-asset-publisher" : StringPool.BLANK %>">
		<liferay-util:include page="/html/portlet/asset_publisher/asset_actions.jsp" />

		<h3 class="asset-title">
			<c:choose>
				<c:when test="<%= Validator.isNotNull(viewURL) %>">
					<a href="<%= viewURL %>"><img alt="" src="<%= assetRenderer.getIconPath(renderRequest) %>" /> <%= HtmlUtil.escape(title) %></a>
				</c:when>
				<c:otherwise>
					<img alt="" src="<%= assetRenderer.getIconPath(renderRequest) %>" /> <%= HtmlUtil.escape(title) %>
				</c:otherwise>
			</c:choose>
		</h3>

		<div class="asset-content">
			<div class="asset-summary">

				<%
				String path = assetRenderer.render(renderRequest, renderResponse, AssetRenderer.TEMPLATE_ABSTRACT);

				request.setAttribute(WebKeys.ASSET_RENDERER, assetRenderer);
				request.setAttribute(WebKeys.ASSET_PUBLISHER_ABSTRACT_LENGTH, abstractLength);
				%>

				<c:choose>
					<c:when test="<%= path == null %>">
						<%= HtmlUtil.escape(summary) %>
					</c:when>
					<c:otherwise>
						<liferay-util:include page="<%= path %>" portletId="<%= assetRendererFactory.getPortletId() %>" />
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="<%= Validator.isNotNull(viewURL) %>">
				<div class="asset-more">
					<a href="<%= viewURL %>"><liferay-ui:message arguments='<%= new Object[] {"aui-helper-hidden-accessible", HtmlUtil.escape(assetRenderer.getTitle(locale))} %>' key="<%= viewURLMessage %>" /> &raquo; </a>
				</div>
			</c:if>
		</div>

		<div class="asset-metadata">
			<%@ include file="/html/portlet/asset_publisher/asset_metadata.jspf" %>
		</div>
	</div>

	<c:if test="<%= (assetEntryIndex + 1) == results.size() %>">
		<div class="final-separator"><!-- --></div>
	</c:if>
</c:if>