<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Template for sparkline visualization on individual profile page -->

<#-- Determine whether this person is an author -->
<#assign isAuthor = p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Authorship") />

<#-- Determine whether this person is involved in any grants -->
<#assign obo_RO53 = "http://purl.obolibrary.org/obo/RO_0000053">

<#assign isInvestigator = ( p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}InvestigatorRole") ||
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}PrincipalInvestigatorRole") ||
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}CoPrincipalInvestigatorRole") ) >

<#-- CHANGING HERE -->
<#assign isAdvisor = p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}AdvisingRelationship") />
<#-- END CHANGE -->

<#if (isAuthor || isInvestigator)>

    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/visualization/visualization.css" />')}
    <#assign standardVisualizationURLRoot ="/visualization">

        <#if isAuthor>
            <#assign coAuthorIcon = "${urls.theme}/images/co_author_icon.png">
            <#assign mapOfScienceIcon = "${urls.theme}/images/scimap_icon.png">
			<#assign fullPub = "${urls.theme}/images/publication-stats.png">
            <#assign coAuthorVisUrl = individual.coAuthorVisUrl()>
            <#assign mapOfScienceVisUrl = individual.mapOfScienceUrl()>

            <#assign googleJSAPI = "https://www.google.com/jsapi?autoload=%7B%22modules%22%3A%5B%7B%22name%22%3A%22visualization%22%2C%22version%22%3A%221%22%2C%22packages%22%3A%5B%22imagesparkline%22%5D%7D%5D%7D">
             <span id="sparklineHeading">${i18n().publications_in_vivo}</span>
            <div id="vis_container_coauthor">&nbsp;</div>

            <div class="collaboratorship-link-separator"></div>
            
            <#-- CHANGING HERE -->
            <#assign prodFullStatsVisUrl = "${urls.base}/prod-full-stats-vis?author=${individual.uri}">
            <div id="fullstats_link_container" class="collaboratorship-link-container">
              <div class="collaboratorship-icon">
                  <a href="${prodFullStatsVisUrl}" title="${i18n().prod_full_stats}"><img src="${fullPub}" alt="${i18n().prod_full_stats}" width="25px" height="25px" /></a>
              </div>
              <div class="collaboratorship-link"><a href="${prodFullStatsVisUrl}" title="${i18n().prod_full_stats}">${i18n().prod_full_stats}</a></div>
            </div>

            <div class="collaboratorship-link-separator"></div>
            <#-- END CHANGE -->

            <div id="coauthorship_link_container" class="collaboratorship-link-container">
				<div class="collaboratorship-icon">
                    <a href="${coAuthorVisUrl}" title="${i18n().co_author}"><img src="${coAuthorIcon}" alt="${i18n().co_author}" width="25px" height="25px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${coAuthorVisUrl}" title="${i18n().co_author_network}">${i18n().co_author_network}</a></div>
            </div>

            <div class="collaboratorship-link-separator"></div>

  	      	<div id="mapofscience_link_container" class="collaboratorship-link-container">
            	
		<#-- CHANGED HERE -->
        <#--
		<#assign prodResAreaVisUrl = "${urls.base}/prod-res-area-vis?author=${individual.uri}">
		<#assign prodAreasIcon = "${urls.theme}/images/production-areas-icon.png">
        	<div class="collaboratorship-icon">
                    <a href="${prodResAreaVisUrl}" title="${i18n().prod_research_areas}"><img src="${prodAreasIcon}" alt="${i18n().prod_research_areas}" width="25px" height="25px" /></a>
                </div>
                 -->
                <div class="collaboratorship-link"><a href="${prodResAreaVisUrl}" title="${i18n().prod_research_areas}">${i18n().prod_research_areas}</a></div>
                
                <#assign prodTagCloudVisUrl = "${urls.base}/prod-tag-cloud-vis?author=${individual.uri}">
                <#assign tagCloudIcon = "${urls.theme}/images/production-tag-icon.png">
				
                
                <div class="collaboratorship-link-separator"></div>            
                <div id="tagcloud_link_container" class="collaboratorship-link-container">
                <div class="collaboratorship-icon">
                    <a href="${prodTagCloudVisUrl}" title="${i18n().prod_tag_cloud}"><img src="${tagCloudIcon}" alt="${i18n().prod_tag_cloud}" width="25px" height="25px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${prodTagCloudVisUrl}" title="${i18n().prod_tag_cloud}">${i18n().prod_tag_cloud}</a></div>
            </div>
 		<#-- END CHANGE -->
		 </div>

            ${scripts.add('<script type="text/javascript" src="${googleJSAPI}"></script>',
                          '<script type="text/javascript" src="${urls.base}/js/visualization/visualization-helper-functions.js"></script>',
                          '<script type="text/javascript" src="${urls.base}/js/visualization/sparkline.js"></script>')}

            <script type="text/javascript">
                var visualizationUrl = '${urls.base}/visualizationAjax?uri=${individual.uri?url}&template=${visRequestingTemplate!}';
                var infoIconSrc = '${urls.images}/iconInfo.png';
            </script>

            <#if isInvestigator>
                <div class="collaboratorship-link-separator"></div>
            </#if>
        </#if>

        <#if isInvestigator>
            <#assign coInvestigatorVisUrl = individual.coInvestigatorVisUrl()>
            <#assign coInvestigatorIcon = "${urls.images}/visualization/coauthorship/co_investigator_icon.png">

            <div id="coinvestigator_link_container" class="collaboratorship-link-container">
                <div class="collaboratorship-icon">
                    <a href="${coInvestigatorVisUrl}" title="${i18n().co_investigator_network}"><img src="${coInvestigatorIcon}" alt="${i18n().co_investigator_network}" width="25px" height="25px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${coInvestigatorVisUrl}" title="${i18n().co_investigator_network}">${i18n().co_investigator_network_capitalized}</a></div>
            </div>
        </#if>

        <#-- CHANGED HERE -->
		<#if isAdvisor>
            <#assign advisingVisUrl = "${urls.base}/advising-network?advisor=${individual.uri}">
            <#assign advisingIcon = "${urls.theme}/images/advising-network-icon.png">

            <div class="collaboratorship-link-separator"></div>            
            <div id="advisor_link_container" class="collaboratorship-link-container">
                <div class="collaboratorship-icon">
                    <a href="${advisingVisUrl}" title="${i18n().advising_network}"><img src="${advisingIcon}" alt="${i18n().advising_network}" width="25px" height="25px" /></a>
                </div>
                <div class="collaboratorship-link"><a href="${advisingVisUrl}" title="${i18n().advising_network}">${i18n().advising_network}</a></div>
            </div>
        </#if>
		<#-- END CHANGE -->
</#if>

