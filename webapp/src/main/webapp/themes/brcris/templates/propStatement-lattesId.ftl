<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- VIVO-specific default data property statement template.

     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

<@showStatement statement property />

<#macro showStatement statement property>
    <#assign lattesId = statement.value>
    <#assign lattesUrl = "http://lattes.cnpq.br/" + lattesId>
    <a href="${lattesUrl}" title="Lattes CV" target="_blank">${lattesUrl}</a>
</#macro>





