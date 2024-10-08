<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Overview on individual profile page -->

<#-- Processa a propriedade 'overview' para exibir na página individual e gerar meta tags -->
<#assign overview = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#overview")!>

<#-- Verifica se a propriedade overview tem conteúdo -->
<#if overview?has_content>

    <#-- Exibe o overview na página individual -->
    <@p.addLinkWithLabel overview editable />
    <#list overview.statements as statement>
        <div class="individual-overview">
            <div class="overview-value">
                ${statement.value}
            </div>
            <@p.editingLinks "${overview.name}" "" statement editable />
        </div>

        <#-- Gera as meta tags com base no valor do overview -->
        <#if statement.value?has_content>
            ${metaTags.add("<meta name=\"description\" content=\"" + statement.value + "\" />")}
        </#if>

    </#list>

</#if>
