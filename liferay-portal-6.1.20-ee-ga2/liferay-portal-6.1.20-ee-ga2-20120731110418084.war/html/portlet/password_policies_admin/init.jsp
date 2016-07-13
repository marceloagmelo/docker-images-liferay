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

<%@ include file="/html/portlet/init.jsp" %>

<%@ page import="com.liferay.portal.DuplicatePasswordPolicyException" %><%@
page import="com.liferay.portal.PasswordPolicyNameException" %><%@
page import="com.liferay.portal.security.ldap.LDAPSettingsUtil" %><%@
page import="com.liferay.portal.service.permission.PasswordPolicyPermissionUtil" %><%@
page import="com.liferay.portal.service.permission.PortalPermissionUtil" %><%@
page import="com.liferay.portlet.passwordpoliciesadmin.search.OrganizationPasswordPolicyChecker" %><%@
page import="com.liferay.portlet.passwordpoliciesadmin.search.PasswordPolicyDisplayTerms" %><%@
page import="com.liferay.portlet.passwordpoliciesadmin.search.PasswordPolicySearch" %><%@
page import="com.liferay.portlet.passwordpoliciesadmin.search.PasswordPolicySearchTerms" %><%@
page import="com.liferay.portlet.passwordpoliciesadmin.search.UserPasswordPolicyChecker" %><%@
page import="com.liferay.portlet.usersadmin.search.OrganizationSearch" %><%@
page import="com.liferay.portlet.usersadmin.search.OrganizationSearchTerms" %><%@
page import="com.liferay.portlet.usersadmin.search.UserSearch" %><%@
page import="com.liferay.portlet.usersadmin.search.UserSearchTerms" %>

<%@ include file="/html/portlet/password_policies_admin/init-ext.jsp" %>