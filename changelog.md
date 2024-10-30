# Custom BrCris VIVO Instalation

## 01/03/2024 - Inserting a line break between overview entries in the Person profile page

### _Files modified_

webapp/src/main/webapp/themes/brcris/templates/individual-overview.ftl

## 23/02/2024 - Adding translation for legends and tooltips in custom visualizations

### _Files modified_

webapp/src/main/webapp/themes/brcris/templates/advisor-network-visualization.ftl
webapp/src/main/webapp/themes/brcris/templates/production-full-stats.ftl
webapp/src/main/webapp/themes/brcris/templates/production-research-areas.ftl

## 22/02/2024 - Fixing publication count sparkline visualization in the Person profile page

### _Files modified_

api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/personpubcount/PersonPublicationCountQueryRunner.java
api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/utilities/VisualizationCaches.java

## 21/02/2024 - Listing only instances of bibo:Document as publications for Journal

### _Files modified_

home/src/main/resources/rdf/display/everytime/vivoListViewConfig.rdf

### _Files added_

webapp/src/main/webapp/config/listViewConfig-publicationVenueForDoc.xml
webapp/src/main/webapp/templates/freemarker/body/partials/individual/propStatement-publicationVenueForDoc.ftl

## 20/02/2024 - Fixing co-author network visualization, using only bibo:Document instances

### _File modified_

api/src/main/java/edu/cornell/mannlib/vitro/webapp/visualization/coauthorship/CoAuthorshipQueryRunner.java

## 19/02/2024 - Current BrCris customizations, including Solr fixes

### _Files modified_

home/src/main/resources/rdf/display/everytime/vivoListViewConfig.rdf  
webapp/src/main/webapp/WEB-INF/resources/startup_listeners.txt  
webapp/src/main/webapp/favicon.ico

### _Files added_

webapp/src/main/webapp/themes/brcris/ (_complete brcris theme, constantly updated_)  
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

## 10/2024 - New layout By Eric and Jesiel

- Added the `citation_title` meta tag (files modified: webapp/src/main/webapp/templates/freemarker/lib/lib-meta-tags.ftl)
- Updated the `citation_date` meta tag to `citation_publication_date` (files modified: webapp/src/main/webapp/templates/freemarker/lib/lib-meta-tags.ftl)
- Added the `citation_author` meta tag for the custom BRCris template (files modified: webapp/src/main/webapp/themes/brcris/templates/propStatement-authorForDoc.ftl)
- Added the `keywords` meta tag (files created: webapp/src/main/webapp/templates/freemarker/lib/meta-tag-keyword.ftl, files modified: webapp/src/main/webapp/themes/brcris/templates/individual-overview.ftl)
- Added the `description` meta tag (files modified: individual-overview.ftl)
- Removing tabs from publication and author pages (files modified: webapp/src/main/webapp/themes/brcris/templates/individual-properties.ftl)
- Change of property name tag from H3 to span (files created: webapp/src/main/webapp/themes/brcris/templates/individual-properties.ftl)
- Adding span to label property values (files created: webapp/src/main/webapp/themes/brcris/templates/freemarker/body/partials/individual/propStatement-default.ftl)
- Custom CSS for BrCris theme (files modified: webapp/src/main/webapp/themes/brcris/css/brcris.css)
- Added Google Analytics tracking tag (file modified: webapp/src/main/webapp/themes/brcris/templates/head.ftl)
- Adjusting Formatting (files modified: webapp/src/main/webapp/themes/brcris/templates/individual-overview.ftl)
- Displaying Research Areas Links in Columns without Separators on Mobile (files modified: webapp/src/main/webapp/themes/brcris/css/brcris.css)