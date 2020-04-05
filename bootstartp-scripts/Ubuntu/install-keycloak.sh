#!/bin/bash

#This bootstrap script required sudo privileges

apt-get update
apt-get install default-jdk -y
wget https://downloads.jboss.org/keycloak/6.0.1/keycloak-6.0.1.tar.gz
tar -xvzf keycloak-6.0.1.tar.gz
mv keycloak-6.0.1 keycloak
mv keycloak /opt
cd /opt
groupadd keycloak
useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak
chown -R keycloak: keycloak
chmod o+x /opt/keycloak/bin
cat <<EOT >> keycloak.service
[Unit]
Description=Jboss Application Server
After=network.target
[Service]
Type=idle
User=keycloak
Group=keycloak
ExecStart=/opt/keycloak/bin/standalone.sh -b 0.0.0.0
TimeoutStartSec=600
TimeoutStopSec=600
[Install]
WantedBy=multi-user.target
EOT
mv keycloak.service /etc/systemd/system/keycloak.service
systemctl daemon-reload
systemctl start keycloak.service
# changing the directory to create a user for keycloak # CHANGE THE PASSWORD
cd /opt/keycloak/bin
# creating the user
./add-user-keycloak.sh --user admin --password <password> --realm master
# Logging in to the server using the created user # CHANGE THE PASSWORD
./kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password <password>
# removing SSL required option
./kcadm.sh update realms/master -s sslRequired=NONE