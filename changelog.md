# Custom BrCris VIVO Instalation

## 01/03/2024 - Inserting a line break between overview entries in the Person profile page

### *Files modified*
webapp/src/main/webapp/themes/brcris/templates/individual-overview.ftl

## 23/02/2024 - Adding translation for legends and tooltips in custom visualizations

### *Files modified*
webapp/src/main/webapp/themes/brcris/templates/advisor-network-visualization.ftl
webapp/src/main/webapp/themes/brcris/templates/production-full-stats.ftl
webapp/src/main/webapp/themes/brcris/templates/production-research-areas.ftl

## 22/02/2024 - Fixing publication count sparkline visualization in the Person profile page

### *Files modified*
api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/personpubcount/PersonPublicationCountQueryRunner.java
api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/utilities/VisualizationCaches.java

## 21/02/2024 - Listing only instances of bibo:Document as publications for Journal

### *Files modified*
home/src/main/resources/rdf/display/everytime/vivoListViewConfig.rdf

### *Files added*
webapp/src/main/webapp/config/listViewConfig-publicationVenueForDoc.xml
webapp/src/main/webapp/templates/freemarker/body/partials/individual/propStatement-publicationVenueForDoc.ftl

## 20/02/2024 - Fixing co-author network visualization, using only bibo:Document instances

### *File modified*
api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/coauthorship/CoAuthorshipQueryRunner.java

## 19/02/2024 - Current BrCris customizations, including Solr fixes

### *Files modified*
home/src/main/resources/rdf/display/everytime/vivoListViewConfig.rdf  
webapp/src/main/webapp/WEB-INF/resources/startup_listeners.txt  
webapp/src/main/webapp/favicon.ico

### *Files added*
webapp/src/main/webapp/themes/brcris/ (*complete brcris theme, constantly updated*)  
webapp/src/main/webapp/config/listViewConfig-advisedDocIn.xml  
webapp/src/main/webapp/config/listViewConfig-altFullName.xml  
webapp/src/main/webapp/config/listViewConfig-authorForDoc.xml  
webapp/src/main/webapp/config/listViewConfig-authorInAuthorshipForDoc.xml  
webapp/src/main/webapp/config/listViewConfig-birthLocation.xml  
webapp/src/main/webapp/config/listViewConfig-citationName.xml  
webapp/src/main/webapp/config/listViewConfig-documentInAdvising.xml  
webapp/src/main/webapp/config/listViewConfig-fullMailingAddress.xml  
webapp/src/main/webapp/config/listViewConfig-lattesId.xml  
webapp/src/main/webapp/i18n/all_en_US.properties  
webapp/src/main/webapp/i18n/all_pt_BR.properties  
webapp/src/main/webapp/i18n/vivo_all_en_US.properties  
webapp/src/main/webapp/i18n/vivo_all_pt_BR.properties

## 10/10/2024 - Addition and Update Made

- Added the `citation_title` meta tag (lib-meta-tags.ftl)
- Updated the `citation_date` meta tag to `citation_publication_date` (lib-meta-tags.ftl)

## 09/10/2024 - Addition Made

- Added the `citation_author` meta tag for the custom BRCris template (propStatement-authorForDoc.ftl)

## 08/10/2024 - Additions Made

- Added the `keywords` meta tag (meta-tag-keyword.ftl)
- Added the `description` meta tag (individual-overview.ftl)
