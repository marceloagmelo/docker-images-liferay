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

<%@ include file="/html/portlet/search/facets/init.jsp" %>

<%
if (termCollectors.isEmpty()) {
	return;
}

String displayStyle = dataJSONObject.getString("displayStyle", "cloud");
int frequencyThreshold = dataJSONObject.getInt("frequencyThreshold");
int maxTerms = dataJSONObject.getInt("maxTerms", 10);
boolean showAssetCount = dataJSONObject.getBoolean("showAssetCount", true);
%>

<div class="asset-tags <%= cssClass %>" data-facetFieldName="<%= facet.getFieldName() %>" id="<%= randomNamespace %>facet">
	<aui:input name="<%= facet.getFieldName() %>" type="hidden" value="<%= fieldParam %>" />

	<ul class="lfr-component <%= (showAssetCount && displayStyle.equals("cloud")) ? "tag-cloud" : "tag-list" %>">
		<li class="facet-value default <%= Validator.isNull(fieldParam) ? "current-term" : StringPool.BLANK %>">
			<a data-value="" href="javascript:;"><img alt="" src="<%= themeDisplay.getPathThemeImages() %>/common/<%= facetConfiguration.getLabel() %>.png" /><liferay-ui:message key="any" /> <liferay-ui:message key="<%= facetConfiguration.getLabel() %>" /></a>
		</li>

		<%
		int maxCount = 1;
		int minCount = 1;

		if (showAssetCount && displayStyle.equals("cloud")) {
			for (int i = 0; i < termCollectors.size(); i++) {
				if (i >= maxTerms) {
					break;
				}

				TermCollector termCollector = termCollectors.get(i);

				int frequency = termCollector.getFrequency();

				if (frequencyThreshold > frequency) {
					continue;
				}

				maxCount = Math.max(maxCount, frequency);
				minCount = Math.min(minCount, frequency);
			}
		}

		double multiplier = 1;

		if (maxCount != minCount) {
			multiplier = (double)5 / (maxCount - minCount);
		}

		for (int i = 0; i < termCollectors.size(); i++) {
			if (i >= maxTerms) {
				break;
			}

			TermCollector termCollector = termCollectors.get(i);
		%>

				<c:if test="<%= fieldParam.equals(termCollector.getTerm()) %>">
					<aui:script use="liferay-token-list">
						Liferay.Search.tokenList.add(
							{
								clearFields: '<%= UnicodeFormatter.toString(renderResponse.getNamespace() + facet.getFieldName()) %>',
								text: '<%= UnicodeFormatter.toString(termCollector.getTerm()) %>'
							}
						);
					</aui:script>
				</c:if>

		<%
			int popularity = (int)(1 + ((maxCount - (maxCount - (termCollector.getFrequency() - minCount))) * multiplier));

			if (frequencyThreshold > termCollector.getFrequency()) {
				continue;
			}
		%>

			<li class="facet-value tag-popularity-<%= popularity %> <%= fieldParam.equals(termCollector.getTerm()) ? "current-term" : StringPool.BLANK %>">
				<a data-value="<%= HtmlUtil.escapeAttribute(termCollector.getTerm()) %>" href="javascript:;"><%= HtmlUtil.escape(termCollector.getTerm()) %></a>

				<c:if test="<%= showAssetCount %>">
					<span class="frequency">(<%= termCollector.getFrequency() %>)</span>
				</c:if>
			</li>

		<%
		}
		%>

	</ul>
</div>