<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- 
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

<@showAdvisedBy statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAdvisedBy statement>
    <#local linkedIndividual>
        <#if statement.advisor??>
            <a href="${profileUrl(statement.uri("advisor"))}" title="${i18n().advisor_label}">${statement.advisorLabel!}</a>
        </#if>
    </#local>

    ${linkedIndividual}
 </#macro>
