<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- 
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->

 <#import "lib-meta-tags.ftl" as lmt>

<@showAuthors statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAuthors statement>
	<@lmt.addCitationMetaTag uri="http://vivoweb.org/ontology/core#Authorship" content=statement.authorName />
    <#local linkedIndividual>
        <#if statement.author??>
            <a href="${profileUrl(statement.uri("author"))}" title="${i18n().author_name}">${statement.authorName!}</a>
        </#if>
    </#local>

    ${linkedIndividual}
 </#macro>
