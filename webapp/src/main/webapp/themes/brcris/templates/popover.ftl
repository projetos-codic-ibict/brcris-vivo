<#macro popover id>
<button type="button" id="${id}" class="btn btn-outline-secondary"
  data-bs-toggle="popover" data-bs-html="true" data-bs-placement="bottom"
  title="${i18n().data_source_title}" 
  data-bs-content="Os dados para geração deste gráfico são coletados de várias fontes de pesquisa. Para mais informações, <a href='http://codich1.ibict.br:8086/data-source-info'>clique aqui</a>.">
    <span class="mobile-hidden">${i18n().title_pop_over}</span> <i class="bi bi-question-circle"></i>
</button>
</#macro>
