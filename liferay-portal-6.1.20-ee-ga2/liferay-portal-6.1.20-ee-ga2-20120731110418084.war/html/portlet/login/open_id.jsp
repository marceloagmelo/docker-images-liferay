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

<%@ include file="/html/portlet/login/init.jsp" %>

<%
String openId = ParamUtil.getString(request, "openId");
%>

<portlet:actionURL var="openIdURL">
	<portlet:param name="saveLastPath" value="0" />
	<portlet:param name="struts_action" value="/login/open_id" />
</portlet:actionURL>

<aui:form action="<%= openIdURL %>" method="post" name="fm">
	<liferay-ui:error exception="<%= AssociationException.class %>" message="an-error-occurred-while-establishing-an-association-with-the-open-id-provider" />
	<liferay-ui:error exception="<%= ConsumerException.class %>" message="an-error-occurred-while-initializing-the-open-id-consumer" />
	<liferay-ui:error exception="<%= DiscoveryException.class %>" message="an-error-occurred-while-discovering-the-open-id-provider" />
	<liferay-ui:error exception="<%= DuplicateUserEmailAddressException.class %>" message="the-email-address-associated-with-your-open-id-account-is-already-being-used" />
	<liferay-ui:error exception="<%= MessageException.class %>" message="an-error-occurred-while-communicating-with-the-open-id-provider" />

	<aui:fieldset>
		<aui:input cssClass="openid-login" name="openId" type="text" value="<%= openId %>" />

		<aui:button-row>
			<aui:button type="submit" value="sign-in" />
		</aui:button-row>
	</aui:fieldset>
</aui:form>

<liferay-util:include page="/html/portlet/login/navigation.jsp" />

<c:if test="<%= windowState.equals(WindowState.MAXIMIZED) %>">
	<aui:script>
		Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace />openId);
	</aui:script>
</c:if>