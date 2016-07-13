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

<%@ include file="/html/taglib/init.jsp" %>

<%
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-time-zone:cssClass"));
String name = namespace + request.getAttribute("liferay-ui:input-time-zone:name");
String value = (String)request.getAttribute("liferay-ui:input-time-zone:value");
boolean nullable = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:nullable"));
boolean daylight = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:daylight"));
int displayStyle = GetterUtil.getInteger((String)request.getAttribute("liferay-ui:input-time-zone:displayStyle"));
boolean disabled = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:input-time-zone:disabled"));

String[] timeZones = PropsUtil.getArray(PropsKeys.TIME_ZONES);

NumberFormat numberFormat = NumberFormat.getInstance(locale);
numberFormat.setMinimumIntegerDigits(2);
%>

<select <%= Validator.isNotNull(cssClass) ? "class=\"" + cssClass + "\"" : StringPool.BLANK %> <%= disabled ? "disabled=\"disabled\"" : "" %> name="<%= name %>">
	<c:if test="<%= nullable %>">
		<option value=""></option>
	</c:if>

	<%
	for (int i = 0; i < timeZones.length; i++) {
		TimeZone curTimeZone = TimeZoneUtil.getTimeZone(timeZones[i]);

		int rawOffset = curTimeZone.getRawOffset();
		String offset = StringPool.BLANK;

		if (rawOffset > 0) {
			offset = "+";
		}

		if (rawOffset != 0) {
			String offsetHour = numberFormat.format(rawOffset / Time.HOUR);
			String offsetMinute = numberFormat.format(Math.abs(rawOffset % Time.HOUR) / Time.MINUTE);

			offset += offsetHour + ":" + offsetMinute;
		}
	%>

		<option <%= value.equals(curTimeZone.getID()) ? "selected" : "" %> value="<%= curTimeZone.getID() %>">(UTC <%= offset %>) <%= curTimeZone.getDisplayName(daylight, displayStyle, locale) %></option>

	<%
	}
	%>

</select>