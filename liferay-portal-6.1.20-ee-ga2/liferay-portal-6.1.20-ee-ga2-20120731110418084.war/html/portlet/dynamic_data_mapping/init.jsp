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

<%@ page import="com.liferay.portal.LocaleException" %><%@
page import="com.liferay.portlet.documentlibrary.model.DLFileEntryMetadata" %><%@
page import="com.liferay.portlet.documentlibrary.model.DLFolderConstants" %><%@
page import="com.liferay.portlet.documentlibrary.util.DLUtil" %><%@
page import="com.liferay.portlet.dynamicdatalists.model.DDLRecordSet" %><%@
page import="com.liferay.portlet.dynamicdatamapping.NoSuchStructureException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.RequiredStructureException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.StructureDuplicateElementException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.StructureFieldException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.StructureNameException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.StructureXsdException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.TemplateNameException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.TemplateScriptException" %><%@
page import="com.liferay.portlet.dynamicdatamapping.model.DDMStructure" %><%@
page import="com.liferay.portlet.dynamicdatamapping.model.DDMStructureConstants" %><%@
page import="com.liferay.portlet.dynamicdatamapping.model.DDMTemplate" %><%@
page import="com.liferay.portlet.dynamicdatamapping.model.DDMTemplateConstants" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.StructureDisplayTerms" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.StructureSearch" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.StructureSearchTerms" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.TemplateDisplayTerms" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.TemplateSearch" %><%@
page import="com.liferay.portlet.dynamicdatamapping.search.TemplateSearchTerms" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.DDMStructureServiceUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.DDMTemplateServiceUtil" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.permission.DDMPermission" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.permission.DDMStructurePermission" %><%@
page import="com.liferay.portlet.dynamicdatamapping.service.permission.DDMTemplatePermission" %><%@
page import="com.liferay.portlet.dynamicdatamapping.storage.StorageType" %><%@
page import="com.liferay.portlet.dynamicdatamapping.util.DDMXSDUtil" %>

<%
PortalPreferences portalPreferences = PortletPreferencesFactoryUtil.getPortalPreferences(request);

String chooseCallback = ParamUtil.getString(request, "chooseCallback");
String ddmResource = ParamUtil.getString(request, "ddmResource");
String saveCallback = ParamUtil.getString(request, "saveCallback");
String scopeAvailableFields = ParamUtil.getString(request, "scopeAvailableFields");
String scopeStorageType = ParamUtil.getString(request, "scopeStorageType");
String scopeStructureName = ParamUtil.getString(request, "scopeStructureName");
String scopeStructureType = ParamUtil.getString(request, "scopeStructureType");
String scopeTemplateMode = ParamUtil.getString(request, "scopeTemplateMode");
String scopeTemplateType = ParamUtil.getString(request, "scopeTemplateType");
boolean showGlobalScope = ParamUtil.getBoolean(request, "showGlobalScope");
boolean showManageTemplates = ParamUtil.getBoolean(request, "showManageTemplates", true);
boolean showToolbar = ParamUtil.getBoolean(request, "showToolbar", true);

long classNameId = PortalUtil.getClassNameId(scopeStructureType);

String storageTypeValue = StringPool.BLANK;

if (scopeStorageType.equals("expando")) {
	storageTypeValue = StorageType.EXPANDO.getValue();
}
else if (scopeStorageType.equals("xml")) {
	storageTypeValue = StorageType.XML.getValue();
}

String templateHeaderTitle = ParamUtil.getString(request, "templateHeaderTitle");

String templateTypeValue = StringPool.BLANK;

if (scopeTemplateType.equals(DDMTemplateConstants.TEMPLATE_TYPE_DETAIL)) {
	templateTypeValue = DDMTemplateConstants.TEMPLATE_TYPE_DETAIL;
}
else if (scopeStorageType.equals(DDMTemplateConstants.TEMPLATE_TYPE_LIST)) {
	templateTypeValue = DDMTemplateConstants.TEMPLATE_TYPE_LIST;
}

Format dateFormatDateTime = FastDateFormatFactoryUtil.getDateTime(locale, timeZone);
%>

<%@ include file="/html/portlet/dynamic_data_mapping/init-ext.jsp" %>