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

<%@ include file="/html/portal/layout/edit/init.jsp" %>

<div class="aui-helper-hidden" id="<portlet:namespace />copyPortletsFromPage">

	<p>
		<liferay-ui:message arguments="<%= HtmlUtil.escape(selLayout.getName(locale)) %>" key="the-portlets-in-page-x-will-be-replaced-with-the-portlets-in-the-page-you-select-below" />
	</p>

	<aui:select label="copy-from-page" name="copyLayoutId" showEmptyOption="<%= true %>">

		<%
		List layoutList = (List)request.getAttribute(WebKeys.LAYOUT_LISTER_LIST);

		for (int i = 0; i < layoutList.size(); i++) {

			// id | parentId | ls | obj id | name | img | depth

			String layoutDesc = (String)layoutList.get(i);

			String[] nodeValues = StringUtil.split(layoutDesc, '|');

			long objId = GetterUtil.getLong(nodeValues[3]);
			String name = nodeValues[4];

			int depth = 0;

			if (i != 0) {
				depth = GetterUtil.getInteger(nodeValues[6]);
			}

			name = HtmlUtil.escape(name);

			for (int j = 0; j < depth; j++) {
				name = "-&nbsp;" + name;
			}

			Layout copiableLayout = null;

			try {
				copiableLayout = LayoutLocalServiceUtil.getLayout(objId);
			}
			catch (Exception e) {
			}

			if (copiableLayout != null) {
		%>

				<aui:option disabled="<%= selLayout.getPlid() == copiableLayout.getPlid() %>" label="<%= name %>" value="<%= copiableLayout.getLayoutId() %>" />

		<%
			}
		}
		%>

	</aui:select>

	<aui:button-row>
		<aui:button name="copySubmitButton" value="copy" />
	</aui:button-row>
</div>

<c:if test="<%= LayoutPermissionUtil.contains(permissionChecker, selLayout, ActionKeys.UPDATE) %>">
	<aui:script use="aui-button-item,aui-dialog">
		var content = A.one('#<portlet:namespace />copyPortletsFromPage');

		var popUp = null;

		var button = new A.ButtonItem(
			{
				handler: function(event) {
					if (!popUp) {
						 popUp = new A.Dialog(
							{
								bodyContent: content.show(),
								centered: true,
								title: '<%= UnicodeLanguageUtil.get(pageContext, "copy-portlets-from-page") %>',
								modal: true,
								width: 500
							}
						).render();
					}

					popUp.show();

					var submitButton = popUp.get('contentBox').one('#<portlet:namespace />copySubmitButton');

					if (submitButton) {
						submitButton.on(
							'click',
							function(event) {
								popUp.close();

								var form = A.one('#<portlet:namespace />fm');

								if (form) {
									form.append(content);
								}

								<portlet:namespace />saveLayout();
							}
						);
					}
				},
				icon: 'copy',
				label: '<%= UnicodeLanguageUtil.get(pageContext, "copy-portlets-from-page") %>'
			}
		);

		var buttonRow = A.one('#<portlet:namespace />layoutToolbar');

		if (buttonRow) {
			var layoutToolbar = buttonRow.getData('layoutToolbar');

			if (layoutToolbar) {
				layoutToolbar.add(button);
			}
		}

		Liferay.on(
			'<portlet:namespace />toggleLayoutTypeFields',
			function(event) {
				button.toggle(event.type == 'portlet');
			}
		);
	</aui:script>
</c:if>