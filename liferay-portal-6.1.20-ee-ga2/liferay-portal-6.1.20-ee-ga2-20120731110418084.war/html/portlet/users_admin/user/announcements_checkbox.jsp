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
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
SearchEntry entry = (SearchEntry)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW_ENTRY);

AnnouncementsDelivery delivery = (AnnouncementsDelivery)row.getObject();

int index = entry.getIndex();

String param = "announcementsType" + delivery.getType();
boolean defaultValue = false;
boolean disabled = false;

if (index == 1) {
	param += "Email";
	defaultValue = delivery.isEmail();
}
else if (index == 2) {
	param += "Sms";
	defaultValue = delivery.isSms();
}
else if (index == 3) {
	param += "Website";
	defaultValue = delivery.isWebsite();
	disabled = true;
}
%>

<aui:input disabled="<%= disabled %>" label="" name="<%= param %>" type="checkbox" value="<%= defaultValue %>" />