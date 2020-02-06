#!/bin/bash

# Set Root password
echo "[TASK 1] Set root password"
echo "leader" | passwd --stdin root >/dev/null 2>&1

# Install package
echo "[TASK 2] install packages"
yum install -y vim wget
yum install -y java-1.8.0-openjdk-devel

# Install jenkins
echo "[TASK 2] Jenkins"
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y  install jenkins
systemctl start jenkins
systemctl enable jenkins

#installation ansible
echo "[TASK 4] installation ansible"
yum install -y -q epel-release
yum install -y -q ansible

#installation Docker
echo "[TASK 5] installation docker"
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker
systemctl start docker
systemctl enable docker

#installation maven
echo "[TASK 6] installation maven"
yum -y install maven

#configuration fichier inventory ansible
echo "[TASK 7] configuration inventory hosts"
cat /vagrant/Ansible/hosts > /etc/ansible/hosts
