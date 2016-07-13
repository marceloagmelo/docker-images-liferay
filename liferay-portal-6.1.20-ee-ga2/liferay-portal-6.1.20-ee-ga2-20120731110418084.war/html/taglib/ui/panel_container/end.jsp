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

<%@ include file="/html/taglib/ui/panel_container/init.jsp" %>

</div>

<aui:script use="liferay-panel">
	var panel = new Liferay.Panel(
		{
			accordion: <%= accordion %>,
			container: '#<%= id %>',
			persistState: <%= persistState %>
		}
	);

	Liferay.Panel.register('<%= id %>', panel);
</aui:script>