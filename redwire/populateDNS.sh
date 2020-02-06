#!/bin/bash

cat >/etc/resolv.conf<<EOF
search m2i.form
nameserver 8.8.8.8
nameserver 10.0.2.3
EOF


scp /etc/resolv.conf nexus:/etc/resolv.conf
scp /etc/resolv.conf gitlab:/etc/resolv.conf
for i in `seq 1 3`
do
scp /etc/resolv.conf worker$i:/etc/resolv.conf
done
