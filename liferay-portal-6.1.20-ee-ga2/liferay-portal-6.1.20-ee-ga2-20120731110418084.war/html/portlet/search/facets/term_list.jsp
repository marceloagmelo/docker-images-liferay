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

int frequencyThreshold = dataJSONObject.getInt("frequencyThreshold");
int maxTerms = dataJSONObject.getInt("maxTerms");
%>

<div class="<%= cssClass %>" data-facetFieldName="<%= facet.getFieldName() %>" id="<%= randomNamespace %>facet">
	<aui:input name="<%= facet.getFieldName() %>" type="hidden" value="<%= fieldParam %>" />

	<ul class="lfr-component term-list">
		<li class="facet-value default <%= Validator.isNull(fieldParam) ? "current-term" : StringPool.BLANK %>">
			<a data-value="" href="javascript:;"><liferay-ui:message key="any-term" /></a>
		</li>

		<%
		for (int i = 0; i < termCollectors.size(); i++) {
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
			if (((maxTerms > 0) && (i >= maxTerms)) || ((frequencyThreshold > 0) && (frequencyThreshold > termCollector.getFrequency()))) {
				break;
			}
		%>

			<li class="facet-value <%= fieldParam.equals(termCollector.getTerm()) ? "current-term" : StringPool.BLANK %>">
				<a data-value="<%= termCollector.getTerm() %>" href="javascript:;"><%= termCollector.getTerm() %></a> <span class="frequency">(<%= termCollector.getFrequency() %>)</span>
			</li>

		<%
		}
		%>

	</ul>
</div>