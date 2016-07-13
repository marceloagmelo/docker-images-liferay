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

<%@ include file="/html/portlet/users_admin/init.jsp" %>

<%
Contact selContact = (Contact)request.getAttribute("user.selContact");
%>

<h3><liferay-ui:message key="social-network" /></h3>

<c:choose>
	<c:when test="<%= selContact != null %>">
		<aui:model-context bean="<%= selContact %>" model="<%= Contact.class %>" />

		<aui:fieldset>
			<div class="social-network">
				<aui:input label="facebook" name="facebookSn" />

				<img alt="<liferay-ui:message key="facebook" />" src="<%= themeDisplay.getPathThemeImages() %>/users_admin/facebook.jpg" />
			</div>

			<div class="social-network">
				<aui:input label="myspace" name="mySpaceSn" />

				<img alt="<liferay-ui:message key="myspace" />" src="<%= themeDisplay.getPathThemeImages() %>/users_admin/myspace.jpg" />

			</div>

			<div class="social-network">
				<aui:input label="twitter" name="twitterSn" />

				<img alt="<liferay-ui:message key="twitter" />" class="social-network-logo" src="<%= themeDisplay.getPathThemeImages() %>/users_admin/twitter.jpg" />
			</div>
		</aui:fieldset>
	</c:when>
	<c:otherwise>
		<div class="portlet-msg-info">
			<liferay-ui:message key="this-section-will-be-editable-after-creating-the-user" />
		</div>
	</c:otherwise>
</c:choose>