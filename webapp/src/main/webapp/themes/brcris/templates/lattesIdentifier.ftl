<#assign lattes = propertyGroups.pullProperty("https://brcris.ibict.br/ontology/lattesIdentifier")!>

<#if lattes?has_content>
    <@p.addLinkWithLabel lattes editable />
    <#list lattes.statements as statement>
        <div class="individual-lattes">
            <div class="overview-lattes">
                <a href="${statement.value}" target="_blank">${statement.value}</a>
            </div>
            <@p.editingLinks "${lattes.name}" "" statement editable />
        </div>
    </#list>
</#if>
