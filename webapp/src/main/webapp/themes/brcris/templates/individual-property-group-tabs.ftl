<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Template for property listing on individual profile page -->

<#import "lib-properties.ftl" as p>
<#assign subjectUri = individual.controlPanelUrl()?split("=") >
<#assign tabCount = 1 >
<#assign sectionCount = 1 >
<section class="property-group" role="region">
    <#list propertyGroups.all as group>
        <#if (group.properties?size > 0)>
            <#assign groupName = group.getName(nameForOtherGroup)>
            <#assign groupNameHtmlId = p.createPropertyGroupHtmlId(groupName) >
            <#assign verbose = (verbosePropertySwitch.currentValue)!false>
                <#-- List the properties in the group   -->
                <#include "individual-properties.ftl">
            <#assign sectionCount = 2 >
        </#if>
    </#list>
</section> <!-- end property-group -->
<script>
    var individualLocalName = "${individual.localName}";
</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual-property-groups.css" />')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/amplify/amplify.store.min.js"></script>')}
<#--  ${scripts.add('<script type="text/javascript" src="${urls.base}/js/individual/propertyGroupControls.js"></script>')}  -->

