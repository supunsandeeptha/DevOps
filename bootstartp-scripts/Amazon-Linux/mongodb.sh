#!/bin/bash
# script requires root privileges
cat <<EOT >> mongodb-org-4.2.repo
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
EOT
cp mongodb-org-4.2.repo /etc/yum.repos.d
rm -r mongodb-org-4.2.repo
yum install -y mongodb-org
service mongod start
chkconfig mongod on