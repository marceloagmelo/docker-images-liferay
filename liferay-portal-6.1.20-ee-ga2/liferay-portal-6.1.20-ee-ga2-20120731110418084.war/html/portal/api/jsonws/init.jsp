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

<%@ page import="com.liferay.portal.kernel.javadoc.JavadocManagerUtil" %><%@
page import="com.liferay.portal.kernel.javadoc.JavadocMethod" %><%@
page import="com.liferay.portal.kernel.jsonwebservice.JSONWebServiceActionMapping" %><%@
page import="com.liferay.portal.kernel.jsonwebservice.JSONWebServiceActionsManagerUtil" %><%@
page import="com.liferay.portal.kernel.util.ContextPathUtil" %><%@
page import="com.liferay.portal.kernel.util.MethodParameter" %>

<%@ page import="java.io.File" %>

<%@ page import="java.lang.reflect.Method" %>

<%
String contextPath = request.getParameter("contextPath");

if (contextPath == null) {
	contextPath = ContextPathUtil.getContextPath(application);
}
%>