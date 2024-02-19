<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#--
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->
<@showCitationName statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showCitationName statement>

    <#if statement.citationName?has_content>
        <p class="address-line">
            ${statement.citationName}
        </p>
    </#if>

</#macro>
