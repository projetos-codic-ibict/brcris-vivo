<#assign urlPrefix = "${urls.base}/individual?uri=">
<#assign individualNs = "https://brcris.ibict.br/individual/">
<#assign callingUrl = "${urls.referringPage}"?replace("%2F", "/")>
<#assign individualId = "${callingUrl}"?keep_after_last("/")>
<#assign advisorUri = "${individualNs}${individualId}">

<#if advisees?has_content>
    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/themes/brcris/css/advising/style.css"/>')}

	<#assign nodesString = "{\"nodes\": [ ">
	
    <section id="pageList">
        <#list advisees as firstRow>
		    <#assign advisorNode = "{\"id\": 1, \"name\": \"" + firstRow["advisorName"] + "\", \"uri\": \"" + advisorUri + "\", \"level\": 1}, ">
			<#assign nodesString += advisorNode>
            <div class="sub_headings">
                <h2><a class="tab" href="${urlPrefix}${advisorUri}" title="${firstRow["advisorName"]}">${firstRow["advisorName"]}</a><br/>${i18n().advising_network_full}</h2>
            </div>	
			<div class="png-file-link">(<a href="#" id="download" title="${i18n().download_png}">${i18n().download_as_picture}</a>)</div>
            <#break>
        </#list>
    </section>
    <section id="adiviseeList">
	    <#assign id = 2>
		<#assign linksString = "\"links\": [ ">
		<#list advisees as resultRow>
			<#-- Only for node coloring purposes: "doctoral thesis" = level 2, "master thesis" = level 3 -->
		    <#assign level = resultRow["level"] == "doctoral thesis">
			<#assign adviseeNode = "{\"id\": " + id + ", \"name\": \"" + resultRow["adviseeName"]  + "\", \"uri\": \"" + resultRow["advisee"] + "\", \"level\": " + level?then(2, 3) + "}, ">	
			<#assign adviseeLink = "{\"source\": 1, \"target\": " + id + ", \"value\": 1}, ">
            <#assign nodesString += adviseeNode> 
			<#assign linksString += adviseeLink>
			<#assign id++>			
        </#list>
		<#assign nodesString = nodesString?keep_before_last(", ") + " ], ">
		<#assign linksString = linksString?keep_before_last(", ") + " ]}">
		<#assign graphString = nodesString + linksString>
    </section>
	
	<section id="graphRendering">
	<div id="graph"></div>
	
	<script src="https://cdn.rawgit.com/eligrey/canvas-toBlob.js/f1a01896135ab378aa5c0118eadd81da55e698d8/canvas-toBlob.js"></script>
	<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/e9d941381475b5df8b7d7691013401e171014e89/FileSaver.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	
	<script>
	
var urlPrefix = "${urlPrefix?js_string}";
var levels = new Map([[1, "Advisor"], [2, "Doctoral thesis"], [3, "Master thesis"]]);

var width = 950;
var height = 850;

var svg = d3.select('#graph')
		.append('svg') 
		.attr('width', width) 
		.attr('height', height)
		.attr("viewBox", [0, 0, width, height])
		.attr("style", "width: 100%; height: auto;");

//var svg = d3.select("#graph").append("svg").attr("width", 900).attr("height", 800).append("g").attr('transform', 'translate(900, 800)');
    //width = +svg.attr("width"),
    //height = +svg.attr("height");

var color = d3.scaleOrdinal().domain(Array.from(levels.keys())).range(d3.schemeCategory10);

svg.append("circle").attr("cx",805).attr("cy",50).attr("r", 8).attr("fill", color(1))
svg.append("circle").attr("cx",805).attr("cy",70).attr("r", 8).attr("fill", color(2))
svg.append("circle").attr("cx",805).attr("cy",90).attr("r", 8).attr("fill", color(3))
svg.append("text").attr("x", 820).attr("y", 53).text(levels.get(1)).attr("alignment-baseline","middle").style("cursor", "default")
svg.append("text").attr("x", 820).attr("y", 74).text(levels.get(2)).attr("alignment-baseline","middle").style("cursor", "default")
svg.append("text").attr("x", 820).attr("y", 95).text(levels.get(3)).attr("alignment-baseline","middle").style("cursor", "default")

var simulation = d3.forceSimulation()
    .force("link", d3.forceLink().id(function(d) { return d.id; }))
    .force("charge", d3.forceManyBody().strength(-5000))
    .force("center", d3.forceCenter(width / 2.3, height / 2));

var graphString = "${graphString?json_string}";
var graph = JSON.parse(graphString);

  var link = svg.append("g")
      .attr("class", "links")
    .selectAll("line")
    .data(graph.links)
    .enter().append("line")
      .attr("stroke-width", function(d) { return Math.sqrt(d.value); });

  var node = svg.append("g")
      .attr("class", "nodes")
    .selectAll("g")
    .data(graph.nodes)
    .enter().append("g")

  var circles = node.append("circle")
    .attr("r", 10)
    .attr("fill", function(d) { return color(d.level); });

  // Create a drag handler and append it to the node object instead
  var drag_handler = d3.drag()
      .on("start", dragstarted)
      .on("drag", dragged)
      .on("end", dragended);

  drag_handler(node);
  
  var labels = node.append("text")
      .text(function(d) {
        return d.name;
      })
      .attr('x', 6)
      .attr('y', 3)
      .on('click', function(d, i) {
         window.location.href =  urlPrefix + d.uri;
      });
      
  node.append("title")
      .text(function(d) { return d.name; });

  simulation
      .nodes(graph.nodes)
      .on("tick", ticked);

  simulation.force("link")
      .links(graph.links);
	  

  function ticked() {
    link
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node
        .attr("transform", function(d) {
          return "translate(" + d.x + "," + d.y + ")";
        })
  }

function dragstarted(d) {
  if (!d3.event.active) simulation.alphaTarget(0.3).restart();
  d.fx = d.x;
  d.fy = d.y;
}

function dragged(d) {
  d.fx = d3.event.x;
  d.fy = d3.event.y;
}

function dragended(d) {
  if (!d3.event.active) simulation.alphaTarget(0);
  d.fx = null;
  d.fy = null;
}

// Set-up the export button
d3.select('#download').on('click', function(){
	var svgString = getSVGString(svg.node());
	svgString2Image( svgString, 2*width, 2*height, 'png', save ); // passes Blob and filesize String to the callback

	function save( dataBlob, filesize ){
		saveAs( dataBlob, 'advising-network.png' ); // FileSaver.js function
	}
});

// Below are the functions that handle actual exporting:
// getSVGString ( svgNode ) and svgString2Image( svgString, width, height, format, callback )
function getSVGString( svgNode ) {
	svgNode.setAttribute('xlink', 'http://www.w3.org/1999/xlink');
	var cssStyleText = getCSSStyles( svgNode );
	appendCSS( cssStyleText, svgNode );

	var serializer = new XMLSerializer();
	var svgString = serializer.serializeToString(svgNode);
	svgString = svgString.replace(/(\w+)?:?xlink=/g, 'xmlns:xlink='); // Fix root xlink without namespace
	svgString = svgString.replace(/NS\d+:href/g, 'xlink:href'); // Safari NS namespace fix

	return svgString;

	function getCSSStyles( parentElement ) {
		var selectorTextArr = [];

		// Add Parent element Id and Classes to the list
		selectorTextArr.push( '#'+parentElement.id );
		for (var c = 0; c < parentElement.classList.length; c++)
				if ( !contains('.'+parentElement.classList[c], selectorTextArr) )
					selectorTextArr.push( '.'+parentElement.classList[c] );

		// Add Children element Ids and Classes to the list
		var nodes = parentElement.getElementsByTagName("*");
		for (var i = 0; i < nodes.length; i++) {
			var id = nodes[i].id;
			if ( !contains('#'+id, selectorTextArr) )
				selectorTextArr.push( '#'+id );

			var classes = nodes[i].classList;
			for (var c = 0; c < classes.length; c++)
				if ( !contains('.'+classes[c], selectorTextArr) )
					selectorTextArr.push( '.'+classes[c] );
		}

		// Extract CSS Rules
		var extractedCSSText = "";
		for (var i = 0; i < document.styleSheets.length; i++) {
			var s = document.styleSheets[i];
			
			try {
			    if(!s.cssRules) continue;
			} catch( e ) {
		    		if(e.name !== 'SecurityError') throw e; // for Firefox
		    		continue;
		    	}

			var cssRules = s.cssRules;
			for (var r = 0; r < cssRules.length; r++) {
				if ( includes( cssRules[r].selectorText, selectorTextArr ) )
					extractedCSSText += cssRules[r].cssText;
			}
		}
		

		return extractedCSSText;

		function contains(str,arr) {
			return arr.indexOf( str ) === -1 ? false : true;
		}
		
		function includes(str,arr) {
			if ("undefined" !== typeof str) {
				for (var q = 0; q < arr.length; q++) {
					if (str.indexOf(arr[q]) !== -1) { return true; }
				}
			}
		}

	}

	function appendCSS( cssText, element ) {
		var styleElement = document.createElement("style");
		styleElement.setAttribute("type","text/css"); 
		styleElement.innerHTML = cssText;
		var refNode = element.hasChildNodes() ? element.children[0] : null;
		element.insertBefore( styleElement, refNode );
	}
}


function svgString2Image( svgString, width, height, format, callback ) {
	var format = format ? format : 'png';

	var imgsrc = 'data:image/svg+xml;base64,'+ btoa( unescape( encodeURIComponent( svgString ) ) ); // Convert SVG string to data URL

	var canvas = document.createElement("canvas");
	var context = canvas.getContext("2d");

	canvas.width = width;
	canvas.height = height;

	var image = new Image();
	image.onload = function() {
		context.clearRect ( 0, 0, width, height );
		context.drawImage(image, 0, 0, width, height);

		canvas.toBlob( function(blob) {
			var filesize = Math.round( blob.length/1024 ) + ' KB';
			if ( callback ) callback( blob, filesize );
		});

		
	};

	image.src = imgsrc;
}

</script>
</section>

</#if>
 
