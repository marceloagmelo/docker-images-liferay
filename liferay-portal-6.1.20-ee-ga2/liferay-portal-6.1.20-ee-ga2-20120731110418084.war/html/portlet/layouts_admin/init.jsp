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

<%@ page import="com.liferay.portal.DuplicateLockException" %><%@
page import="com.liferay.portal.ImageTypeException" %><%@
page import="com.liferay.portal.LARFileException" %><%@
page import="com.liferay.portal.LARTypeException" %><%@
page import="com.liferay.portal.LayoutFriendlyURLException" %><%@
page import="com.liferay.portal.LayoutImportException" %><%@
page import="com.liferay.portal.LayoutNameException" %><%@
page import="com.liferay.portal.LayoutPrototypeException" %><%@
page import="com.liferay.portal.LayoutTypeException" %><%@
page import="com.liferay.portal.LocaleException" %><%@
page import="com.liferay.portal.NoSuchGroupException" %><%@
page import="com.liferay.portal.NoSuchLayoutException" %><%@
page import="com.liferay.portal.NoSuchLayoutRevisionException" %><%@
page import="com.liferay.portal.NoSuchLayoutSetBranchException" %><%@
page import="com.liferay.portal.NoSuchRoleException" %><%@
page import="com.liferay.portal.RemoteExportException" %><%@
page import="com.liferay.portal.RemoteOptionsException" %><%@
page import="com.liferay.portal.RequiredLayoutException" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataException" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandler" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandlerBoolean" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandlerChoice" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandlerControl" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandlerKeys" %><%@
page import="com.liferay.portal.kernel.lar.UserIdStrategy" %><%@
page import="com.liferay.portal.kernel.plugin.PluginPackage" %><%@
page import="com.liferay.portal.kernel.scheduler.SchedulerEngineUtil" %><%@
page import="com.liferay.portal.kernel.scheduler.StorageType" %><%@
page import="com.liferay.portal.kernel.scheduler.messaging.SchedulerResponse" %><%@
page import="com.liferay.portal.kernel.staging.StagingUtil" %><%@
page import="com.liferay.portal.lar.LayoutExporter" %><%@
page import="com.liferay.portal.plugin.PluginUtil" %><%@
page import="com.liferay.portal.util.LayoutLister" %><%@
page import="com.liferay.portal.util.LayoutView" %><%@
page import="com.liferay.portlet.documentlibrary.FileSizeException" %><%@
page import="com.liferay.portlet.layoutconfiguration.util.RuntimePortletUtil" %><%@
page import="com.liferay.portlet.layoutsadmin.util.LayoutsTreeUtil" %><%@
page import="com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup" %><%@
page import="com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance" %><%@
page import="com.liferay.portlet.mobiledevicerules.service.MDRRuleGroupInstanceServiceUtil" %><%@
page import="com.liferay.portlet.mobiledevicerules.service.MDRRuleGroupLocalServiceUtil" %><%@
page import="com.liferay.portlet.mobiledevicerules.service.permission.MDRPermissionUtil" %><%@
page import="com.liferay.portlet.mobiledevicerules.service.permission.MDRRuleGroupInstancePermissionUtil" %><%@
page import="com.liferay.portlet.mobiledevicerules.util.RuleGroupInstancePriorityComparator" %><%@
page import="com.liferay.portlet.sites.util.SitesUtil" %>

<%
Format dateFormatDateTime = FastDateFormatFactoryUtil.getDateTime(locale, timeZone);
%>

<%@ include file="/html/portlet/layouts_admin/init-ext.jsp" %>