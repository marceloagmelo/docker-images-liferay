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

<%@ include file="/html/portal/init.jsp" %>

<%
if (themeDisplay.isFacebook() || themeDisplay.isStateExclusive() || themeDisplay.isStatePopUp() || themeDisplay.isWidget() || layoutTypePortlet.hasStateMax()) {
	String ppid = ParamUtil.getString(request, "p_p_id");

	String velocityTemplateId = null;
	String velocityTemplateContent = null;

	if (themeDisplay.isFacebook() || themeDisplay.isStateExclusive()) {
		velocityTemplateId = theme.getThemeId() + LayoutTemplateConstants.STANDARD_SEPARATOR + "exclusive";
		velocityTemplateContent = LayoutTemplateLocalServiceUtil.getContent("exclusive", true, theme.getThemeId());
	}
	else if (themeDisplay.isStatePopUp() || themeDisplay.isWidget()) {
		velocityTemplateId = theme.getThemeId() + LayoutTemplateConstants.STANDARD_SEPARATOR + "pop_up";
		velocityTemplateContent = LayoutTemplateLocalServiceUtil.getContent("pop_up", true, theme.getThemeId());
	}
	else {
		ppid = StringUtil.split(layoutTypePortlet.getStateMax())[0];

		velocityTemplateId = theme.getThemeId() + LayoutTemplateConstants.STANDARD_SEPARATOR + "max";
		velocityTemplateContent = LayoutTemplateLocalServiceUtil.getContent("max", true, theme.getThemeId());
	}

	RuntimePortletUtil.processTemplate(application, request, response, pageContext, out, ppid, velocityTemplateId, velocityTemplateContent);
}
else {
	String themeId = theme.getThemeId();

	String layoutTemplateId = layoutTypePortlet.getLayoutTemplateId();

	if (Validator.isNull(layoutTemplateId)) {
		layoutTemplateId = PropsValues.DEFAULT_LAYOUT_TEMPLATE_ID;
	}

	LayoutTemplate layoutTemplate = LayoutTemplateLocalServiceUtil.getLayoutTemplate(layoutTemplateId, false, theme.getThemeId());

	if (layoutTemplate != null) {
		themeId = layoutTemplate.getThemeId();
	}

	String velocityTemplateId = themeId + LayoutTemplateConstants.CUSTOM_SEPARATOR + layoutTypePortlet.getLayoutTemplateId();
	String velocityTemplateContent = LayoutTemplateLocalServiceUtil.getContent(layoutTypePortlet.getLayoutTemplateId(), false, theme.getThemeId());
%>

	<c:if test="<%= PropsValues.TAGS_COMPILER_ENABLED %>">
		<liferay-portlet:runtime portletName="<%= PortletKeys.TAGS_COMPILER %>" />
	</c:if>

<%
	RuntimePortletUtil.processTemplate(application, request, response, pageContext, out, velocityTemplateId, velocityTemplateContent);
}
%>

<c:if test="<%= !themeDisplay.isFacebook() && !themeDisplay.isStateExclusive() && !themeDisplay.isStatePopUp() && !themeDisplay.isWidget() %>">

	<%
	for (String portletId : PropsValues.LAYOUT_STATIC_PORTLETS_ALL) {
		if (PortletLocalServiceUtil.hasPortlet(company.getCompanyId(), portletId)) {
	%>

			<liferay-portlet:runtime portletName="<%= portletId %>" />

	<%
		}
	}
	%>

</c:if>

<%@ include file="/html/portal/layout/view/common.jspf" %>