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

<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>

<%
String cssPath = ParamUtil.getString(request, "cssPath");
String cssClasses = ParamUtil.getString(request, "cssClasses");
String languageId = ParamUtil.getString(request, "languageId");
long wikiPageResourcePrimKey = ParamUtil.getLong(request, "wikiPageResourcePrimKey");
String attachmentURLPrefix = ParamUtil.getString(request, "attachmentURLPrefix");
boolean resizable = ParamUtil.getBoolean(request, "resizable");

String linkButtonBar = "['Link', 'Unlink']";

if (wikiPageResourcePrimKey > 0) {
	linkButtonBar = "['Link', 'Unlink', 'Image']";
}
%>

CKEDITOR.config.attachmentURLPrefix = '<%= HtmlUtil.escapeJS(attachmentURLPrefix) %>';

CKEDITOR.config.bodyClass = 'html-editor <%= HtmlUtil.escapeJS(cssClasses) %>';

CKEDITOR.config.decodeLinks = true;

CKEDITOR.config.disableObjectResizing = true;

CKEDITOR.config.extraPlugins = 'creole,wikilink';

CKEDITOR.config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre';

CKEDITOR.config.height = 265;

CKEDITOR.config.language = '<%= HtmlUtil.escapeJS(languageId) %>';

CKEDITOR.config.removePlugins = [
	'elementspath',
	'save',
	'font',
	'bidi',
	'colordialog',
	'colorbutton',
	'div',
	'flash',
	'font',
	'forms',
	'indent',
	'justify',
	'keystrokes',
	'link',
	'menu',
	'maximize',
	'newpage',
	'pagebreak',
	'preview',
	'print',
	'save',
	'scayt',
	'smiley',
	'showblocks',
	'stylescombo',
	'templates',
	'wsc'
].join();

CKEDITOR.config.resize_enabled = '<%= resizable %>';

CKEDITOR.config.toolbar_creole = [
	['Cut','Copy','Paste','PasteText','PasteFromWord'],
	['Undo','Redo'],
	['Bold', 'Italic', '-', 'NumberedList', 'BulletedList' ],
	['Format'],
	<%= linkButtonBar %>,
	['Table', '-', 'HorizontalRule', 'SpecialChar' ],
	['Find','Replace','-','SelectAll','RemoveFormat'],
	['Source']
];