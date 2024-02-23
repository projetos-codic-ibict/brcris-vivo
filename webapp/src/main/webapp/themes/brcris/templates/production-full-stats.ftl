<#assign urlPrefix = "${urls.base}/individual?uri=">
<#assign individualNs = "https://brcris.ibict.br/individual/">
<#assign callingUrl = "${urls.referringPage}"?replace("%2F", "/")>
<#assign individualId = "${callingUrl}"?keep_after_last("/")>
<#assign authorUri = "${individualNs}${individualId}">

<#if stats?has_content>
	${stylesheets.add('<link rel="stylesheet" href="${urls.base}/themes/brcris/css/prodstats/style.css"/>')}

        <#assign doctTypeLabel = "${i18n().pub_type_doctoral}">
	<#assign masterTypeLabel = "${i18n().pub_type_master}">
	<#assign journalTypeLabel = "${i18n().pub_type_journal}">
	<#assign confTypeLabel = "${i18n().pub_type_conf}">
	
	<#assign dataString = "[ ">
	
	<section id="pageList">
        <#list stats as firstRow>
            <div class="tab">
                <h2><a href="${urlPrefix}${authorUri}" title="${firstRow["authorName"]}">${firstRow["authorName"]}</a></h2>
            </div>
            <#break>
        </#list>
    </section>
	
	<section id="statsList">
        <#list stats as resultRow>
			<#assign statsData = "{\"date\": " + resultRow["publicationYear"] + ", \"" + resultRow["type"] + "\": " + resultRow["total"] + "}, ">	
            <#assign dataString += statsData> 					
        </#list>
		<#assign dataString = dataString?keep_before_last(", ") + " ]">
    </section>
	
	<section id="graphTitle">
		<div class="title-holder">
			<h2 class="title">${i18n().prod_stats}</h1>
		</div>
	</section>
	
	<section id="graphRendering">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.4.11/d3.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-tip/0.7.1/d3-tip.js"></script>

	<div id="chart"></div>

	<script>
	
    var doctTypeLabel = "${doctTypeLabel?js_string}";
	var masterTypeLabel = "${masterTypeLabel?js_string}";
	var journalTypeLabel = "${journalTypeLabel?js_string}";
	var confTypeLabel = "${confTypeLabel?js_string}";
	var typeLabels = [confTypeLabel, journalTypeLabel, masterTypeLabel, doctTypeLabel];

	var types = ["conference proceedings", "journal article", "master thesis", "doctoral thesis"];
	var dataString = "${dataString?json_string}";
	var rawData = JSON.parse(dataString);
	
	// merge entries with same date
	let obj = {};
	rawData.forEach(a => obj[a.date] = {...obj[a.date], ...a});
	obj = Object.values(obj);

	// fill in missing publication types
	var filled = [];
	for (var i=0; i < obj.length; i++ ){
	  var o = obj[i];
	  for (var j=0; j < types.length; j++){
		var type = types[j];
		if (!Object.hasOwn(o, type)){
		  o[type] = 0;
		}
	  }
	  filled.push(o);
	}

	// parse year as date
	var parseDate = d3.time.format("%Y").parse;
	var handleDates = (list, prop) => {
		return list.map(item => {
		  var obj = Object.assign({}, item);
		  obj[prop] = parseDate(String(obj[prop]));
		  return obj;
		});
	}
	var dataset = handleDates(filled, "date");

	// build chart
	
  
	var margin = {top: 50, right: 250, bottom: 130, left: 50},
		width = 1320,
		height = 500;

	var x = d3.scale.ordinal()
		.rangeRoundBands([0, width]);

	var y = d3.scale.linear()
		.rangeRound([height, 0]);

	var z = d3.scale.category10();

	var xAxis = d3.svg.axis()
		.scale(x)
		.orient("bottom")
		.tickFormat(d3.time.format("%Y"));

	var yAxis = d3.svg.axis()
		.scale(y)
		.orient("left");

	var svg = d3.select("#chart").append("svg")
		.attr("viewBox", `0 0 1320 650`)
		.append("g")
		.attr("style", "max-width: 100%; height: auto;")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		

	var tip = d3.tip()
		.attr('class', 'd3-tip')
		.offset([-10, 0])
		.html(function(data, type) {
			return "<div class=\"tooltip\">" + type + ": " + data.y + "</div>";
		})

	svg.call(tip);

	var layers = d3.layout.stack()(types.map(function(c) {
		return dataset.map(function(d) {
			return {x: d.date, y: d[c]};
		});
		}));

	x.domain(layers[0].map(function(d) { return d.x; }));
	y.domain([0, d3.max(layers[layers.length - 1], function(d) { return d.y0 + d.y; })]).nice();

	var layer = svg.selectAll(".layer")
		.data(layers)
		.enter().append("g")
		.attr("class", "layer")
		.style("fill", function(d, i) { return z(i); });

	layer.selectAll("rect")
		.data(function(d) { return d; })
		.enter().append("rect")
		.attr("x", function(d) { return x(d.x); })
		.attr("y", function(d) { return y(d.y + d.y0); })
		.attr("height", function(d) { return y(d.y0) - y(d.y + d.y0); })
		.attr("width", x.rangeBand() - 1)
		.on("mouseover", function (d, i, j) {
			layer.selectAll("rect")
				.attr("stroke","none")
			d3.select(this)
				.attr("stroke", "black")
				.attr("stroke-width", 1);
			selectedYear = i;
			tip.show(d, typeLabels[typeLabels.length - 1 - j]);
		  })
		.on("mouseout", function (d) {   
				d3.select(this).attr("stroke", "none").attr("stroke-width", 0);
				tip.hide();
			});

	svg.append("g")
		  .attr("class", "axis axis--x")
		  .attr("transform", "translate(0," + height + ")")
		  .call(xAxis)
		  .selectAll("text")  
		  .style("text-anchor", "end")
		  .attr("dx", "-.8em")
		  .attr("dy", ".15em")
		  .attr("transform", "rotate(-55)");

	svg.append("g")
		  .attr("class", "axis axis--y")
		  .attr("transform", "translate(0,0)")
		  .call(yAxis);

	var legend = svg.append("g")
		.attr("transform", "translate(-1270, -50)")
		.selectAll(".legend")
		.data(typeLabels.reverse())
		.enter().append("g")
		.attr("class", "legend")
		.attr("transform", function(d, i) { return "translate(" + i * 180 + ",0)"; });


	legend.append("rect")
		.attr("x", width - 50)
		.attr("width", 18)
		.attr("height", 18)
		.style("fill", function(d, i) { return z(types.length - 1 - i);});

	legend.append("text")
		.attr("x", width - 24)
		.attr("y", 9)
		.attr("dy", ".35em")
		.text(function(d) { return d; });

	</script>
	
	</section>

</#if>
