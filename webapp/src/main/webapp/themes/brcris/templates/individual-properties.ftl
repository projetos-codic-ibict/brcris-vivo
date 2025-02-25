<#-- $This file is distributed under the terms of the license in LICENSE$ -->
<#-- Template for property listing on individual profile page -->

<#list group.properties as property>
    <#assign rangeClass = "noRangeClass">
    <#if property.rangeUri?has_content && property.rangeUri?contains("#")>
        <#assign rangeClass = property.rangeUri?substring(property.rangeUri?last_index_of("#")+1)>
    <#elseif property.rangeUri?has_content >
        <#assign rangeClass = property.rangeUri?substring(property.rangeUri?last_index_of("/")+1)>
    </#if>

    <#assign dynamicKey = property.name?lower_case?replace("/", "_")?replace(" ", "_")>
    <#assign translatedValue = i18n()[dynamicKey]!property.name>
    <#if translatedValue?starts_with("ERROR:")>
        <#assign translatedValue = property.name>
    </#if>

    <article class="property" role="article">
        <#-- Property display name -->
        <#if rangeClass == "Authorship" && individual.editable && (property.domainUri)?? && property.domainUri?contains("Person")>
            <span dynamicKey="${dynamicKey}" id="${property.localName}-${rangeClass}" title="${property.publicDescription!}">
                ${translatedValue} <@p.addLink property editable /> <@p.verboseDisplay property />
                <a id="managePubLink" class="manageLinks" href="${urls.base}/managePublications?subjectUri=${subjectUri[1]!}" title="${i18n().manage_publications_link}" <#if verbose>style="padding-top:10px"</#if>>
                    ${i18n().manage_publications_link}
                </a>
            </span>
        <#elseif rangeClass == "Authorship" && !individual.editable && (property.domainUri)?? && property.domainUri?contains("Person")>
            <span dynamicKey="${dynamicKey}" id="${property.localName}-${rangeClass}" title="${property.publicDescription!}">${translatedValue}<@p.addLink property editable /><@p.verboseDisplay property /></span>
        <#elseif rangeClass == "ResearcherRole" && individual.editable>
            <span dynamicKey="${dynamicKey}" id="${property.localName}-${rangeClass}" title="${property.publicDescription!}">
                ${translatedValue} <@p.addLink property editable /> <@p.verboseDisplay property />
                <a id="manageGrantLink" class="manageLinks" href="${urls.base}/manageGrants?subjectUri=${subjectUri[1]!}" title="${i18n().manage_grants_and_projects_link}" <#if verbose>style="padding-top:10px"</#if>>
                    ${i18n().manage_grants_and_projects_link}
                </a>
            </span>
        <#elseif rangeClass == "Position" && individual.editable>
            <span dynamicKey="${dynamicKey}" id="${property.localName}-${rangeClass}" title="${property.publicDescription!}">
                ${translatedValue} <@p.addLink property editable /> <@p.verboseDisplay property />
                <a id="managePeopleLink" class="manageLinks" href="${urls.base}/managePeople?subjectUri=${subjectUri[1]!}" title="${i18n().manage_affiliated_people_link}" <#if verbose>style="padding-top:10px"</#if>>
                    ${i18n().manage_affiliated_people_link}
                </a>
            </span>
        <#elseif rangeClass == "Name" && property.statements?has_content && editable>
            <span dynamicKey="${dynamicKey}" id="${property.localName}" title="${property.publicDescription!}">${translatedValue}<@p.verboseDisplay property /></span>
        <#elseif rangeClass == "Title" && property.statements?has_content && editable>
            <span dynamicKey="${dynamicKey}" id="${property.localName}" title="${property.publicDescription!}">${translatedValue}<@p.verboseDisplay property /></span>
        <#elseif rangeClass == "ResearcherRole" && !individual.editable>
            <span dynamicKey="${dynamicKey}" id="${property.localName}-${rangeClass}" title="${property.publicDescription!}">${translatedValue}<@p.addLink property editable /><@p.verboseDisplay property /></span>
        <#else>
            <span dynamicKey="${dynamicKey}" id="${property.localName}" title="${property.publicDescription!}">${translatedValue}<@p.addLink property editable /><@p.verboseDisplay property /></span>
        </#if>
        
        <#-- List the statements for each property -->
        <#assign limit = property.getDisplayLimit()!5 />
        <#if limit < 5>
            <#assign limit = 5 />
        </#if>
        <ul class="property-list" role="list" id="${property.localName}-${rangeClass}-List" displayLimit="${limit}">
            <#if property.type == "data">
                <@p.dataPropertyList property editable />
            <#else>
                <@p.objectProperty property editable />
            </#if>
        </ul>
    </article> <!-- end property -->
</#list>
