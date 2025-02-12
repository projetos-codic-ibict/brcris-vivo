<#assign orcid = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#orcidId")!>

<#if orcid?has_content>
    <@p.addLinkWithLabel orcid editable />
    <#list orcid.statements as statement>
        <div class="individual-orcid">
            <div class="overview-orcid">
                <a href="https://orcid.org/${statement.value}" target="_blank">https://orcid.org/${statement.value}</a>
            </div>
            <@p.editingLinks "${orcid.name}" "" statement editable />
        </div>
    </#list>
</#if>
