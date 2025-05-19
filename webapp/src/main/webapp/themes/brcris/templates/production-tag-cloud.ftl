<#assign urlPrefix = "${urls.base}/individual?uri=">
<#assign individualNs = "https://brcris.ibict.br/individual/">
<#assign callingUrl = "${urls.referringPage}"?replace("%2F", "/")>
<#assign individualId = "${callingUrl}"?keep_after_last("/")>
<#assign authorUri = "${individualNs}${individualId}">

<#if keywords?has_content>
    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/themes/brcris/css/tagcloud/style.css"/>')}
	
	<#assign dataString = "[ ">
	   
    <div class="sub_headings">
        <#list keywords as firstRow>
            <hgroup class="title">
                <h1><a href="${urlPrefix}${authorUri}" title="${firstRow["authorName"]}">${firstRow["authorName"]}</a></h1>
           			<h2 class="title">${i18n().prod_tag_cloud_full}</h2>
            </hgroup>
            <#include "popover.ftl">
            <@popover id="data-info"/>
            <#break>
        </#list>
	</div>
	<section id="keywordList">
        <#list keywords as resultRow>
			<#assign keywordData = "{\"key\": \"" + resultRow["tag"]  + "\", \"value\": " + resultRow["total"] + "}, ">	
            <#assign dataString += keywordData> 					
        </#list>
		<#assign dataString = dataString?keep_before_last(", ") + " ]">
    </section>
	
	<section id="cloudRendering">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.0.0/d3.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.5/d3.layout.cloud.js"></script>
	
	<div id="svg-div"></div>
	
	<script>
      var fill = d3.scale.category20();

         var w = 1500,
          h = 700;
		   
	  //var w = window.innerWidth,
		//h = window.innerHeight;

      var svg_location = "#svg-div";

      var fontSize;

      var layout = d3.layout
        .cloud()
        .timeInterval(Infinity)
        .size([w, h])
        .rotate(function() { return 0; })
        .fontSize(function(d) {
          return fontSize(+d.value);
        })
        .text(function(d) {
          return d.key;
        })
        .on("end", draw);

      var svg = d3
        .select(svg_location)
        .append("svg")
        .attr("width", w)
        .attr("height", h)
		.attr("viewBox", [0, 0, w, h])
		.attr("style", "width: 100%; height: auto;");		

      var vis = svg
        .append("g");

      update();

      if (window.attachEvent) {
        window.attachEvent("onresize", update);
      } else if (window.addEventListener) {
        window.addEventListener("resize", update);
      }

      function draw(data, bounds) {

        svg.remove();
        svg = d3
          .select(svg_location)
          .append("svg")
		  .attr("viewBox", [-750, -300, w, h])
		  .attr("style", "max-width: 100%; height: auto; height: intrinsic;");

        vis = svg
          .append("g");

        svg.attr("width", w).attr("height", h);

        var scale = bounds
          ? Math.min(
              w / Math.abs(bounds[1].x - w / 2),
              w / Math.abs(bounds[0].x - w / 2),
              h / Math.abs(bounds[1].y - h / 2),
              h / Math.abs(bounds[0].y - h / 2)
            ) / 2
          : 1;

        var text = vis.selectAll("text").data(data, function(d) {
          return d.text.toLowerCase();
        });
        text
          .transition()
          .duration(1000)
          .attr("transform", function(d) {
            return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
          })
          .style("font-size", function(d) {
            return d.size + "px";
          });
        text
          .enter()
          .append("text")
          .attr("text-anchor", "middle")
          .attr("transform", function(d) {
            return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
          })
          .style("font-size", function(d) {
            return d.size + "px";
          })
          .style("opacity", 1e-6)
          .transition()
          .duration(1000)
          .style("opacity", 1);
        text
          .style("font-family", function(d) {
            return d.font;
          })
          .style("fill", function(d) {
            return fill(d.text.toLowerCase());
          })
          .text(function(d) {
            return d.text;
          });

        vis
          .transition();
      }

      function update() {
        layout.font("sans-serif").spiral("archimedean");
        fontSize = d3.scale["sqrt"]().range([10, 100]);
        
		var dataString = "${dataString?json_string}";
		var data = JSON.parse(dataString);
		
		// filter data to remove duplicates rows (due to multiple author names)
		var ids = data.map(o => o.key);
		var tags = data.filter(({key}, index) => !ids.includes(key, index + 1));
		
		if (tags.length) {
          fontSize.domain([+tags[tags.length - 1].value || 1, +tags[0].value]);
        }
        layout
          .stop()
          .words(tags)
          .start();
      }

      function changeWords(newTags) {
        tags = newTags;
        update();
      }
    
	</script>
	
	</section>

</#if>
