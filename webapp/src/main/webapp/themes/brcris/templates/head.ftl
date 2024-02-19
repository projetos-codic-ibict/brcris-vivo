<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="VIVO ${version.label}" />

<title>${(title?html)!siteName!}</title>

<#-- VIVO OpenSocial Extension by UCSF -->
<#if openSocial??>
    <#if openSocial.visible>
        <#-- Required to add these BEFORE stylesheets.flt and headScripts.ftl are processed -->
        ${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/openSocial/gadgets.css" />')}
        ${headScripts.add('<script type="text/javascript" src="${openSocial.containerJavascriptSrc}"></script>',
                          '<script type="text/javascript" language="javascript">${openSocial.gadgetJavascript}</script>',
                          '<script type="text/javascript" src="${urls.base}/js/openSocial/orng.js"></script>')}
    </#if>
</#if>

<#include "stylesheets.ftl">
	<link rel="preload" href="${urls.theme}/css/bootstrap-v5.2.3.css" as="style">
	<link rel="stylesheet" href="${urls.theme}/css/bootstrap-v5.2.3.css" data-n-g="">
	<link rel="preload" href="${urls.theme}/css/app-base.css" as="style">
	<link rel="stylesheet" href="${urls.theme}/css/app-base.css" as="style">
	<link rel="preload" href="${urls.theme}/css/charts.css" as="style">
	<link rel="stylesheet" href="${urls.theme}/css/charts.css" as="style">		
	
	<link rel="stylesheet" href="${urls.theme}/css/custom-new.css" />	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<#include "headScripts.ftl">

<#if metaTags??>
    ${metaTags.list()}
</#if>

<!--[if (gte IE 6)&(lte IE 8)]>
<script type="text/javascript" src="${urls.base}/js/selectivizr.js"></script>
<![endif]-->

<#-- Inject head content specified in the controller. Currently this is used only to generate an rdf link on
an individual profile page. -->
${headContent!}

<link rel="shortcut icon" type="image/x-icon" href="${urls.base}/favicon.ico">
