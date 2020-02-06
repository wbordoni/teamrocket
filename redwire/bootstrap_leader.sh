#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins

#installation JAVA et demarrage Jenkins
echo "[TASK 2] installation JAVA"
yum install java
service jenkins start
