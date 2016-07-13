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

<%@ include file="/html/portlet/directory/init.jsp" %>

<%
Contact selContact = (Contact)request.getAttribute("user.selContact");

String facebook = selContact.getFacebookSn();
String mySpace = selContact.getMySpaceSn();
String twitter = selContact.getTwitterSn();
%>

<c:if test="<%= Validator.isNotNull(facebook) || Validator.isNotNull(mySpace) || Validator.isNotNull(twitter) %>">
	<h3><liferay-ui:message key="social-network" /></h3>

	<dl class="property-list">
		<c:if test="<%= Validator.isNotNull(facebook) %>">
			<dt>
				<liferay-ui:message key="facebook" />
			</dt>
			<dd>
				<%= HtmlUtil.escape(facebook) %>
			</dd>
		</c:if>

		<c:if test="<%= Validator.isNotNull(mySpace) %>">
			<dt>
				<liferay-ui:message key="myspace" />
			</dt>
			<dd>
				<%= HtmlUtil.escape(mySpace) %>
			</dd>
		</c:if>

		<c:if test="<%= Validator.isNotNull(twitter) %>">
			<dt>
				<liferay-ui:message key="twitter" />
			</dt>
			<dd>
				<%= HtmlUtil.escape(twitter) %>
			</dd>
		</c:if>
	</dl>
</c:if>