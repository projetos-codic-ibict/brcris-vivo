#!/bin/bash
set -e
echo "Deploying VIVO Dev"

cd ..

# Verifica se a pasta "brcris-vitro" existe
if [ -d "brcris-vitro" ]; then
  echo "O 'brcris-vitro' já foi clonado."
else
  echo "git clone vitro"
  git clone https://github.com/projetos-codic-ibict/brcris-vitro.git
fi

cd brcris-vivo

echo "mvn clean package -s installer/example-settings.xml"
mvn clean package -s installer/example-settings.xml

echo "sudo rm -rf /opt/tomcat/webapps/vivo-dev"
sudo rm -rf /opt/tomcat/webapps/vivo-dev

echo "sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo-dev"
sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo-dev

echo "sudo systemctl restart tomcat.service"
sudo systemctl restart tomcat.service