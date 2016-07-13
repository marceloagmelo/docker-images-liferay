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

<%@ include file="/html/portlet/asset_categories_navigation/init.jsp" %>

<c:choose>
	<c:when test="<%= allAssetVocabularies %>">
		<liferay-ui:asset-categories-navigation
			hidePortletWhenEmpty="<%= true %>"
		/>
	</c:when>
	<c:otherwise>
		<liferay-ui:asset-categories-navigation
			hidePortletWhenEmpty="<%= true %>"
			vocabularyIds="<%= assetVocabularyIds %>"
		/>
	</c:otherwise>
</c:choose>