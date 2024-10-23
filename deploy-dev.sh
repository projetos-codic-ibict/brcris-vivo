#!/bin/bash
git pull
mvn clean package -s installer/example-settings.xml
sudo rm -rf /opt/tomcat/webapps/vivo-dev
sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo-dev
sudo systemctl restart tomcat.service