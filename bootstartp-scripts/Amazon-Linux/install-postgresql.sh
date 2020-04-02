#!/bin/bash
#script requires sudo privileges !
amazon-linux-extras install postgresql10 vim epel -y
yum install -y postgresql-server postgresql-devel
/usr/bin/postgresql-setup --initdb
systemctl enable postgresql
systemctl start postgresql
