<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Custom object property statement view for faux property "theses/disserations advising". See the PropertyConfig.n3 file for details.

     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

<@showAdvisorFor statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAdvisorFor statement>
    <#local linkedIndividual>
        <#if statement.documentLabel??>
            <a href="${profileUrl(statement.uri("document"))}" title="${i18n().advisingRel_label}">${statement.documentLabel!}</a>
        </#if>
    </#local>

    ${linkedIndividual}
 </#macro>
