<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Template for property listing on individual profile page -->

<#import "lib-properties.ftl" as p>
<#assign subjectUri = individual.controlPanelUrl()?split("=") >
<#assign tabCount = 1 >
<#assign sectionCount = 1 >
<#list propertyGroups.all as group>
    <#if (group.properties?size > 0)>
        <#assign groupName = group.getName(nameForOtherGroup)>
        <#assign groupNameHtmlId = p.createPropertyGroupHtmlId(groupName) >
        <#assign verbose = (verbosePropertySwitch.currentValue)!false>
        <section id="${groupNameHtmlId?replace("/","-")}" class="property-group" role="region">
        <nav id="scroller" class="scroll-up hidden" role="navigation">
            <a href="#branding" title="${i18n().scroll_to_menus}" >
                <img src="${urls.images}/individual/scroll-up.gif" alt="${i18n().scroll_to_menus}" />
            </a>
        </nav>

        <#-- Display the group heading -->
        <#if groupName?has_content>
		    <#--the function replaces spaces in the name with underscores, also called for the property group menu-->
    	    <#assign groupNameHtmlId = p.createPropertyGroupHtmlId(groupName) >
            <h2 id="${groupNameHtmlId?replace("/","-")}" pgroup="tabs" class="hidden">${p.capitalizeGroupName(groupName)}</h2>
        <#else>
            <h2 id="properties" pgroup="tabs" class="hidden">${i18n().properties_capitalized}</h2>
        </#if>
        <div id="${groupNameHtmlId?replace("/","-")}Group" >
            <#-- List the properties in the group   -->
            <#include "individual-properties.ftl">
        </div>
        </section> <!-- end property-group -->
        <#assign sectionCount = 2 >
    </#if>
</#list>
<script>
    var individualLocalName = "${individual.localName}";
</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual-property-groups.css" />')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/amplify/amplify.store.min.js"></script>')}
<#--  ${scripts.add('<script type="text/javascript" src="${urls.base}/js/individual/propertyGroupControls.js"></script>')}  -->

