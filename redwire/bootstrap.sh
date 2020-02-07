#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >/etc/hosts<<EOF
10.222.222.1 leader.m2i.form leader
10.222.222.2 nexus.m2i.form nexus
10.222.222.3 gitlab.m2i.form gitlab

10.222.222.11 worker1.m2i.form worker1
10.222.222.12 worker2.m2i.form worker2
10.222.222.13 worker3.m2i.form worker3

EOF

# Enable ssh password authentication
echo "[TASK 2] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 3] clé"
mkdir /root/.ssh/
cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys
