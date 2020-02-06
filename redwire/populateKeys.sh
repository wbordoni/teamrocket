#!/bin/bash

echo "Generate ssh-keypair"
ssh-keygen -q -N "" -f /home/vagrant/.ssh/id_rsa

echo "Copy keys to nodes"
ssh-copy-id -i /home/vagrant/.ssh/id_rsa leader
ssh-copy-id -i /home/vagrant/.ssh/id_rsa nexus
ssh-copy-id -i /home/vagrant/.ssh/id_rsa gitlab
for i in `seq 1 3`
do
ssh-copy-id -i /home/vagrant/.ssh/id_rsa worker$i
done
