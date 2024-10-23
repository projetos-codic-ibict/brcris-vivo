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

echo "permissão para o github actions executar o git clean no próximo deploy"
sudo chmod -R 777 .

echo "sudo rm -rf /opt/tomcat/webapps/vivo"
sudo rm -rf /opt/tomcat/webapps/vivo

echo "sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo"
sudo cp -rf installer/webapp/target/vivo /opt/tomcat/webapps/vivo

echo "sudo systemctl restart tomcat.service"
sudo systemctl restart tomcat.service