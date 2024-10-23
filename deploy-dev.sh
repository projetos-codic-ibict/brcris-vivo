#!/bin/bash
set -e
echo "Deploying VIVO Dev"

echo "git pull"
git pull

echo "mvn clean package -s installer/example-settings.xml"
mvn clean package -s installer/example-settings.xml

echo "sudo rm -rf /opt/tomcat/webapps/vivo-dev"
sudo rm -rf /opt/tomcat/webapps/vivo-dev

echo "sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo-dev"
sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo-dev

echo "sudo systemctl restart tomcat.service"
sudo systemctl restart tomcat.service