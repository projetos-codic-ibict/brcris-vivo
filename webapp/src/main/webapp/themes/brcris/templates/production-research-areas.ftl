<#assign urlPrefix = "${urls.base}/individual?uri=">
<#assign individualNs = "https://brcris.ibict.br/individual/">
<#assign callingUrl = "${urls.referringPage}"?replace("%2F", "/")>
<#assign individualId = "${callingUrl}"?keep_after_last("/")>
<#assign authorUri = "${individualNs}${individualId}">

<#if areas?has_content>
    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/themes/brcris/css/researchareas/style.css"/>')}

	<#assign pubsLabel = "${i18n().res_area_pubs}">
  <#assign dataString = "[ ">
	
   <div id="body">
	<div  class="sub_headings">
        <hgroup class="title">
            <h1> <a href="${egoVivoProfileURL}" title="${i18n().author_name}"><span id="ego_label"></span></a></h1>
       			<h2 class="title">${i18n().prod_research_areas_full}</h2>
	    </hgroup>

            <#include "popover.ftl">
    </div>
    <section id="areaList">
        <#list areas as resultRow>
			<#assign areaData = "{\"label\": \"" + resultRow["areaName"]  + "\", \"count\": " + resultRow["total"] + "}, ">	
            <#assign dataString += areaData> 					
        </#list>
		<#assign dataString = dataString?keep_before_last(", ") + " ]">
    </section>
		
	<section id="graphRendering">
	
	<div id="chart">
	
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script>
	
	var pubsLabel = "${pubsLabel?js_string}";
  var dataString = "${dataString?json_string}";
	var data = JSON.parse(dataString);
	
	// filter data to remove duplicates rows (due to multiple author names)
	var ids = data.map(o => o.label);
	var dataset = data.filter(({label}, index) => !ids.includes(label, index + 1));

	// chart dimensions
	var width = 1200;
	var height = 600;
	var donutWidth = 100;
	var radius = Math.min(width/1.5, height/1.5) / 2;

	// legend dimensions
	var legendRectSize = 15; 
	var legendSpacing = 6; 

	// define color scale
	var color = d3.scaleOrdinal(d3.schemeCategory10);
	
	var svg = d3.select('#chart').append('svg')
		.attr("viewBox", `-300 -300 850 600`)
		.attr('width', '100%') 
		.attr('height', 'auto')
		.append('g')
		.attr("style", "max-width: 100%; height: auto;");

	//pie chart
	/*var arc = d3.arc()
		.innerRadius(0) // none for pie chart
		.outerRadius(radius); // size of overall chart*/

	//donut chart
	var arc = d3.arc()
		.innerRadius(radius - donutWidth)             
		.outerRadius(radius);

	var pie = d3.pie() 
		.value(function(d) { return d.count; })
		.sort(null);

	// define tooltip
	var tooltip = d3.select('#chart').append('div').attr('class', 'tooltip');
	tooltip.append('div').attr('class', 'label');	
	tooltip.append('div').attr('class', 'count');                   
	tooltip.append('div').attr('class', 'percent'); 

	dataset.forEach(function(d) {
		d.count = +d.count;
		d.enabled = true;
	});

	// creating the chart
	var path = svg.selectAll('path') 
		.data(pie(dataset)) 
		.enter() 
		.append('path') 
		.attr('d', arc) 
		.attr('fill', function(d) { return color(d.data.label); }) 
		.each(function(d) { this._current - d; }); 

	// mouse event handlers
	path.on('mouseover', function(d) {    
		var total = d3.sum(dataset.map(function(d) {         
			return (d.enabled) ? d.count : 0; 
		}));                                                      
 
		var percent = Math.round(1000 * d.data.count / total) / 10;
		tooltip.select('.label').html(d.data.label);         
		tooltip.select('.count').html(d.data.count + ' ' + pubsLabel);           
		tooltip.style('display', 'block');                   
	});                                                           

	path.on('mouseout', function() {                        
		tooltip.style('display', 'none');
	});

	path.on('mousemove', function(d) {                 
		tooltip.style('top', (d3.event.layerY + 10) + 'px') //10px below the cursor
		.style('left', (d3.event.layerX + 10) + 'px'); //10px to the right of the mouse
  });

	// define legend
  var maxAreas = Math.min(20, color.domain().length)
	var legend = svg.selectAll('.legend')
		.data(color.domain().slice(0, maxAreas))
		.enter()
		.append('g')
		.attr('class', 'legend')
		.attr('transform', function(d, i) {                   
			var height = legendRectSize + legendSpacing;     
			var offset =  height * maxAreas / 2;
			var horz = 20 * legendRectSize; 
			var vert = i * height - offset;              
			return 'translate(' + horz + ',' + vert + ')';      
		});

	// adding colored squares to legend
	legend.append('rect') 
		.attr('width', legendRectSize) 
		.attr('height', legendRectSize) 
		.style('fill', color) 
		.style('stroke', color) 
		.on('click', function(label) {
			var rect = d3.select(this); 
			var enabled = true; 
			var totalEnabled = d3.sum(dataset.map(function(d) { 
				return (d.enabled) ? 1 : 0; 
			}));

    if (rect.attr('class') === 'disabled') { 
      rect.attr('class', ''); 
    } else { 
      if (totalEnabled < 2) return; 
      rect.attr('class', 'disabled'); 
      enabled = false; 
    }

    pie.value(function(d) { 
      if (d.label === label) d.enabled = enabled; 
        return (d.enabled) ? d.count : 0; 
    });

    path = path.data(pie(dataset)); 

    path.transition() 
      .duration(750)  
      .attrTween('d', function(d) { 
        var interpolate = d3.interpolate(this._current, d); 
        this._current = interpolate(0); 
        return function(t) {
          return arc(interpolate(t));
        };
      });
	});

	// adding text to legend
	legend.append('text')                                    
		.attr('x', legendRectSize + legendSpacing)
		.attr('y', legendRectSize - legendSpacing/2)
		.text(function(d) { return d; });
	
	</script>
	
	</div>
	
	</section>

</#if>