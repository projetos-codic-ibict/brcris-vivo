<#-- $This file is distributed under the terms of the license in LICENSE$ -->
<#assign visContainerID = '${sparklineVO.visContainerDivID}'>

<#if sparklineVO.shortVisMode>
    <#assign sparklineContainerID = 'unique_coauthors_short_sparkline_vis'>
<#else>
    <#assign sparklineContainerID = 'unique_coauthors_full_sparkline_vis'>
</#if>

<#-- This is used to prevent collision between sparkline & visualization conatiner div ids. -->
<#if visContainerID?upper_case == sparklineContainerID?upper_case>
    <#assign sparklineContainerID = visContainerID + "_spark">
</#if>

<div class="staticPageBackground">
    <div id="${visContainerID}">
        <script type="text/javascript">
            <#if sparklineVO.shortVisMode>
                var visualizationOptions = {
                    width: 150,
                    height: 60,
                    color: '3399CC',
                    chartType: 'ls',
                    chartLabel: 'r'
                };
            <#else>
                var visualizationOptions = {
                    width: 150,
                    height: 75,
                    color: '3399CC',
                    chartType: 'ls',
                    chartLabel: 'r'
                };
            </#if>

            function drawCoauthorsSparklineVisualization(providedSparklineImgTD) {

                var unknownYearPublicationCounts = ${sparklineVO.unknownYearPublications};
                var onlyUnknownYearPublications = false;

                var data = new google.visualization.DataTable();
                data.addColumn('number', 'Year');
                //data.addColumn('number', 'Unique co-authors');
                data.addColumn('number', '${i18n().unique_coauthors?js_string}');
		data.addRows(${sparklineVO.yearToEntityCountDataTable?size});

                var knownYearPublicationCounts = 0;

                <#list sparklineVO.yearToEntityCountDataTable as yearToUniqueCoauthorsDataElement>
                    data.setValue(${yearToUniqueCoauthorsDataElement.yearToEntityCounter}, 0, ${yearToUniqueCoauthorsDataElement.year});
                    data.setFormattedValue(${yearToUniqueCoauthorsDataElement.yearToEntityCounter}, 0, '${yearToUniqueCoauthorsDataElement.year}');
                    data.setValue(${yearToUniqueCoauthorsDataElement.yearToEntityCounter}, 1, ${yearToUniqueCoauthorsDataElement.currentEntitiesCount});
                    knownYearPublicationCounts += ${yearToUniqueCoauthorsDataElement.currentEntitiesCount};
                </#list>

                <#-- Create a view of the data containing only the column pertaining to coauthors count. -->
                var sparklineDataView = new google.visualization.DataView(data);

                <#if sparklineVO.shortVisMode>

                <#-- For the short view we only want the last 10 year's view of coauthors count, hence we filter
                    the data we actually want to use for render. -->

                sparklineDataView.setRows(data.getFilteredRows([{
                        column: 0,
                        minValue: '${sparklineVO.earliestRenderedPublicationYear?c}',
                        maxValue: '${sparklineVO.latestRenderedPublicationYear?c}'
                }]));

                <#else>

                </#if>


                /*
                This means that all the publications have unknown years & we do not need to display
                the sparkline.
                */
                if (unknownYearPublicationCounts > 0 && knownYearPublicationCounts < 1) {

                    onlyUnknownYearPublications = true;

                } else {

                    <#-- Create the vis object and draw it in the div pertaining to sparkline. -->
                    var sparkline = new google.visualization.LineChart(providedSparklineImgTD[0]);
                    sparkline.draw(sparklineDataView, {
                        width: visualizationOptions.width,
                        height: visualizationOptions.height,
                        showAxisLines: false,
                        showValueLabels: false,
                        labelPosition: 'none',
                        legend: { position: 'none' },
                        chartArea: {'width': '100%', 'height': '100%'},
                        colors: ['3399CC'],
                        hAxis: {
                            gridlines: {color: 'transparent'},
                            baselineColor: 'transparent'
                        },
                        vAxis: {
                            gridlines: {color: 'transparent'},
                            baselineColor: 'transparent'
                        },
                        backgroundColor: {
                            stroke: '#cfe4ed',
                            strokeWidth: 2
                        },
                        tooltip: { 
                            textStyle: {fontSize: 14}
                        }
                    });

                }

                if (${sparklineVO.totalCollaborationshipCount?c}) {
                    var totalPublicationCount = ${sparklineVO.totalCollaborationshipCount?c};
                } else {
                    var totalPublicationCount = knownYearPublicationCounts + unknownYearPublicationCounts;
                }

                <#if sparklineVO.shortVisMode>

                    <#-- We want to display how many coauthors were considered, so this is used to calculate this. -->

                    var shortSparkRows = sparklineDataView.getViewRows();
                    var renderedShortSparks = 0;
                    $.each(shortSparkRows, function(index, value) {
                        renderedShortSparks += data.getValue(value, 1);
                    });

                     /*
                    In case that there are only unknown publications we want the text to mention these counts,
                    which would not be mentioned in the other case because the renderedShortSparks only hold counts
                    of publications which have any date associated with it.
                    */
                    var totalPubs = onlyUnknownYearPublications ? unknownYearPublicationCounts : renderedShortSparks;

                    if (totalPubs === 1) {
                        var pubDisplay = "${i18n().co_author?js_string}";
                    } else {
                        var pubDisplay = "${i18n().co_authors?js_string}";
                    }

                    $('#${sparklineContainerID} td.sparkline_number').text(totalPubs).css("font-weight", "normal").attr("class", "grey").append("<span style='color: #2485AE;'> " + pubDisplay + " <br/></span>");

                    var sparksText = '  ${i18n().within_last_10_years?js_string}';

                    if (totalPubs !== totalPublicationCount) {
                        sparksText += ' (' + totalPublicationCount + ' ${i18n().total?js_string})';
                    }

                 <#else>

                    /*
                     * Sparks that will be rendered will always be the one's which has
                     * any year associated with it. Hence.
                     * */
                    var renderedSparks = ${sparklineVO.renderedSparks?c};

                    /*
                    In case that there are only unknown publications we want the text to mention these counts,
                    which would not be mentioned in the other case because the renderedSparks only hold counts
                    of publications which have any date associated with it.
                    */
                    var totalPubs = onlyUnknownYearPublications ? unknownYearPublicationCounts : renderedSparks;

                    if ( totalPubs == 1 ) {
                        var pubDisplay = "${i18n().co_author?js_string}";
                    } else {
                        var pubDisplay = "${i18n().co_authors?js_string}";
                    }

                    $('#${sparklineContainerID} td.sparkline_number').text(totalPubs).css("font-weight", "normal").attr("class", "grey").append("<span style='color: #2485AE;'> " + pubDisplay + " <br/></span>");

                    var sparksText = '  ${i18n().from?js_string} <span class="sparkline_range">${sparklineVO.earliestYearConsidered?c}'
                                        + ' - ${sparklineVO.latestRenderedPublicationYear?c}</span>';

                    if (totalPubs !== totalPublicationCount) {
                        sparksText += ' (' + totalPublicationCount + ' ${i18n().total?js_string})';
                    }

                    if (totalPublicationCount) {
                        sparksText += ' <br /><a href="${sparklineVO.downloadDataLink}" title="csv ${i18n().file_capitalized?js_string}">(.CSV ${i18n().file_capitalized})</a> ';
                    }

                 </#if>

                 if (!onlyUnknownYearPublications) {
                    $('#${sparklineContainerID} td.sparkline_text').html(sparksText);
                 }

            }

            /*
             * This will activate the visualization. It takes care of creating
             * div elements to hold the actual sparkline image and then calling the
             * drawCoauthorsSparklineVisualization function.
             * */

            $(document).ready(function() {
                var sparklineImgTD;

            /*
             * This is a nuclear option (creating the container in which everything goes)
             * the only reason this will be ever used is the API user never submitted a
             * container ID in which everything goes. The alternative was to let the
             * vis not appear in the calling page at all. So now atleast vis appears but
             * appended at the bottom of the body.
             * */

                if ($('#${visContainerID}').length === 0) {
                    $('<div/>', {
                        'id': '${visContainerID}'
                    }).appendTo('body');
                }

                if ($('#${sparklineContainerID}').length === 0) {

                    $('<div/>', {
                        'id': '${sparklineContainerID}',
                        'class': 'sparkline_style'
                    }).prependTo('#${visContainerID}');

                    var table = $('<table>');
                    table.attr('class', 'sparkline_wrapper_table');
                    var row = $('<tr>');
                    sparklineImgTD = $('<td>');
                    sparklineImgTD.attr('id', '${sparklineContainerID}_img');
                    sparklineImgTD.attr('width', visualizationOptions.width);
                    sparklineImgTD.attr('class', 'sparkline_style');

                    row.append(sparklineImgTD);
                    var row2 = $('<tr>');
                    var sparklineNumberTD = $('<td>');
                    sparklineNumberTD.attr('class', 'sparkline_number');
                    sparklineNumberTD.css('text-align', 'left');
                    row2.append(sparklineNumberTD);
                    var row3 = $('<tr>');

                    var sparklineTextTD = $('<td>');
                    sparklineTextTD.attr('class', 'sparkline_text');
                    sparklineTextTD.css('text-align', 'left');
                    row3.append(sparklineTextTD);
                    table.append(row);
                    table.append(row2);
                    table.append(row3);
                    table.prependTo('#${sparklineContainerID}');

                }

                google.charts.load('current', {
                    callback: function() {
                        drawCoauthorsSparklineVisualization(sparklineImgTD)
                    },
                    packages: ['bar', 'corechart', 'table', 'imagesparkline']
                });

            });
        </script>

    </div>

    <!-- Sparkline Viz -->

    <#if sparklineVO.shortVisMode>
        <#--<span class="vis_link">-->
            <p><a class="all-vivo-publications" href="${sparklineVO.fullTimelineNetworkLink}" title="${i18n().view_full_timeline_and_network}">${i18n().view_full_timeline_and_network}</a></p>
        <#--</span>-->
    <#else>
        <!-- For Full Sparkline - Print the Table of Couauthor Counts per Year -->

            <#if displayTable?? && displayTable>

                <p>
                    <#assign tableID = "coauthors_sparkline_data_table" />
                    <#assign tableCaption = "${i18n().unique_coauthors_per_year} " />
                    <#assign tableActivityColumnName = "${i18n().count_capitalized}" />
                    <#assign tableContent = sparklineVO.yearToActivityCount />
                    <#assign fileDownloadLink = sparklineVO.downloadDataLink />

                    <#include "yearToActivityCountTable.ftl">

                    ${i18n().download_data_as} <a href="${sparklineVO.downloadDataLink}" title="csv ${i18n().download}">.csv</a> ${i18n().file}.
                    <br />
                </p>

            </#if>

    </#if>
</div>
