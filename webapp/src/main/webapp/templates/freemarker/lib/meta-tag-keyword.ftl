<#assign metaKeywords = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#freetextKeyword")!>

<#if metaKeywords?has_content>
    <#list metaKeywords.statements as keywordStatement>
        <#if keywordStatement.value?has_content>
            ${metaTags.add("<meta name=\"keywords\" content=\""  + keywordStatement.value + "\" />")}
        </#if>
    </#list>
</#if>
