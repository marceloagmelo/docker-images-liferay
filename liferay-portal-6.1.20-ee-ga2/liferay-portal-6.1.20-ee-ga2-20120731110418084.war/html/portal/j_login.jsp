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

<%@ include file="/html/common/init.jsp" %>

<%
String jSecurityCheck = "j_security_check";

if (!ServerDetector.isWebSphere()) {
	jSecurityCheck = themeDisplay.getPathMain() + "/portal/" + jSecurityCheck;
}

String jUserName = (String)session.getAttribute("j_username");
String jPassword = (String)session.getAttribute("j_password");

if (PropsValues.PORTAL_JAAS_ENABLE && (user != null)) {
	if (PropsValues.PORTAL_JAAS_AUTH_TYPE.equals("emailAddress")) {
		jUserName = user.getEmailAddress();
	}
	else if (PropsValues.PORTAL_JAAS_AUTH_TYPE.equals("screenName")) {
		jUserName = user.getScreenName();
	}
	else if (PropsValues.PORTAL_JAAS_AUTH_TYPE.equals("login")) {
		jUserName = user.getLogin();
	}
}
%>

<c:choose>
	<c:when test="<%= Validator.isNotNull(jUserName) && Validator.isNotNull(jPassword) %>">
		<html dir="<liferay-ui:message key="lang.dir" />">

		<head>
			<meta content="<%= ContentTypes.TEXT_HTML_UTF8 %>" http-equiv="content-type" />
			<meta content="no-cache" http-equiv="Cache-Control" />
			<meta content="no-cache" http-equiv="Pragma" />
			<meta content="0" http-equiv="Expires" />
			<script src="<%= themeDisplay.getCDNHost() + themeDisplay.getPathJavaScript() %>/misc/xp_progress.js" type="text/javascript"></script>
		</head>

		<body onLoad="setTimeout('document.fm.submit()', 100);">

		<center>

		<table border="0" cellpadding="0" cellspacing="0" height="100%" width="600">
		<tr>
			<td align="center" valign="middle">
				<form action="<%= jSecurityCheck %>" method="post" name="fm">
				<input name="j_username" type="hidden" value="<%= HtmlUtil.escapeAttribute(jUserName) %>" />
				<input name="j_password" type="hidden" value="<%= HtmlUtil.escapeAttribute(jPassword) %>" />
				</form>

				<font face="Verdana, Tahoma, Arial" size="3">
				<strong><liferay-ui:message key="processing-login" /></strong>
				</font><br /><br />

				<script type="text/javascript">
					var progressBar = createBar(300, 15, "#FFFFFF", 1, "#000000", "", 85, 7, 3, "");
				</script>
			</td>
		</tr>
		</table>

		</center>

		</body>

		</html>

		<%
		session.removeAttribute("j_username");
		session.removeAttribute("j_password");

		SessionMessages.clear(request);
		SessionErrors.clear(request);
		%>

	</c:when>
	<c:otherwise>

		<!--
		This only happens if you're logged in and the server is rebooted and
		the user's old session is not recovered. Forward the user to the default
		page instead of posting to the protected page with invalid credentials.
		-->

		<%
		try {
			session.invalidate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		%>

		<html dir="<liferay-ui:message key="lang.dir" />">

		<head>
			<title></title>
			<meta content="0; url=<%= themeDisplay.getPathMain() %>" http-equiv="refresh" />
			<meta content="no-cache" http-equiv="Cache-Control" />
			<meta content="no-cache" http-equiv="Pragma" />
			<meta content="0" http-equiv="Expires" />
		</head>

		<body onLoad="javascript:location.replace('<%= themeDisplay.getPathMain() %>')">

		</body>

		</html>
	</c:otherwise>
</c:choose>