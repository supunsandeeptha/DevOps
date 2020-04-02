#!/bin/bash
# This script requires sudo privilges !
yum -y update
yum install java-1.8.0
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y
service jenkins start
chkconfig --add jenkins

