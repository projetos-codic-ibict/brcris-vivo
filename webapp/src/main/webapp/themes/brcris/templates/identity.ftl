<#assign homeUrl = "http://brcris.ibict.br">
<#if .locale == "pt_BR">
	<#assign homeUrl += "/pt-BR">
</#if>

<div id="__next">
<nav class="navbar navbar-dark navbar-expand-lg bg-violet px-5 py-3">
  <div class="container-fluid d-flex">
    <div class="flex-nowrap d-flex align-items-center flex-justify-content-between"><a class="navbar-brand" href="/">
      <picture class="navbar-logo"><img class="img-fluid brcris" src="${urls.theme}/images/logo-brcris-pb.png" alt="logo do brcris"></picture>
      </a><a class="navbar-brand" href="https://www.gov.br/ibict/pt-br" target="_blank" rel="noreferrer">
      <picture class="navbar-logo"><img class="img-fluid ibict" src="${urls.theme}/images/logo-ibict-pb-st.png" alt="logo do ibict"></picture>
      </a>
      <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    </div>
    <div class="navbar-collapse collapse" id="navbarNav" style="">
      <div class="navbar-nav me-auto mb-2 mb-lg-0"></div>
      <ul class="navbar-nav nav nav-tabs" role="tablist">
  		<li class="nav-item me-5" role="presentation"><a class="nav-link" href="${homeUrl}">${i18n().brcris_home }</a></li>
        <li class="nav-item me-5" role="presentation"><a class="nav-link" href="${homeUrl}/dashboards">${i18n().dashboards}</a></li>
		
		
		<li class="nav-item me-5" role="presentation">
		  <div class="Dropdown_dropdown__kXFHw">
			<div class="Dropdown_flexCenter__4gAzT"> <a href="#" class="nav-link">${i18n().visualization_tools}
			  <svg height="20" width="20" viewBox="0 0 20 20" aria-hidden="true" focusable="false" class="css-tj5bde-Svg">
				<path fill="#fff" d="M4.516 7.548c0.436-0.446 1.043-0.481 1.576 0l3.908 3.747 3.908-3.747c0.533-0.481 1.141-0.446 1.574 0 0.436 0.445 0.408 1.197 0 1.615-0.406 0.418-4.695 4.502-4.695 4.502-0.217 0.223-0.502 0.335-0.787 0.335s-0.57-0.112-0.789-0.335c0 0-4.287-4.084-4.695-4.502s-0.436-1.17 0-1.615z"></path>
			  </svg>
			  </a></div>
			<div class="Dropdown_dropdownContent__5gxWP">
				<a href="http://carrot.ibict.br/frontend/#/workbench">${i18n().carrot2_tool}</a>
				<a href="https://visao.ibict.br/visao2/viewGroupCategory/403">${i18n().visao_tool}</a> </div>
		  </div>
		</li>
		</a>
		</li>
		
		
        <li class="nav-item me-5" role="presentation"><a class="nav-link" href="${homeUrl}/team">${i18n().team}</a></li>
        <li class="nav-item me-5" role="presentation"><a class="nav-link" href="${homeUrl}/about">${i18n().about_brcris}</a></li>
		<li class="nav-item me-5" role="presentation"><a class="nav-link" href="${homeUrl}/contact">${i18n().brcris_contact}</a></li>
		<li class="nav-item me-5" role="presentation"><div class="Dropdown_dropdown__kXFHw"><div class="Dropdown_flexCenter__4gAzT"><a href="#" class="nav-link">${i18n().lang_menu_en}<svg height="20" width="20" viewBox="0 0 20 20" aria-hidden="true" focusable="false" class="css-tj5bde-Svg"><path fill="#fff" d="M4.516 7.548c0.436-0.446 1.043-0.481 1.576 0l3.908 3.747 3.908-3.747c0.533-0.481 1.141-0.446 1.574 0 0.436 0.445 0.408 1.197 0 1.615-0.406 0.418-4.695 4.502-4.695 4.502-0.217 0.223-0.502 0.335-0.787 0.335s-0.57-0.112-0.789-0.335c0 0-4.287-4.084-4.695-4.502s-0.436-1.17 0-1.615z"></path></svg></a></div><div class="Dropdown_dropdownContent__5gxWP"><a href="${urls.base}/selectLocale?selection=en_US">${i18n().lang_menu_en}</a><a href="${urls.base}/selectLocale?selection=pt_BR">${i18n().lang_menu_pt}</a></div></div></li></a></li>
      </ul>
    </div>
  </div>
</nav>


<main>
	<div class="page-search">
		<div class="App">
			<div class="container page">