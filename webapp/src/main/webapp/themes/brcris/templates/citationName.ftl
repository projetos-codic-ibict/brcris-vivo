<#assign citationName = propertyGroups.pullProperty("https://brcris.ibict.br/ontology/citationName")!>

<#if citationName?has_content>
    <@p.addLinkWithLabel citationName editable />
    <#list citationName.statements as statement>
        <div class="author-citation">
            <h2>${statement.value}</h2>
        </div>
        <@p.editingLinks "${citationName.name}" "" statement editable />
    </#list>
</#if>
