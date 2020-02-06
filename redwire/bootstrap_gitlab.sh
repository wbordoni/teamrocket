# Set Root password
echo "[TASK 12] Set root password"
echo "root" | passwd --stdin root >/dev/null 2>&1

#Install gitlab
echo "Install gitlab"
yum -y install curl policycoreutils openssh-server openssh-clients postfix
systemctl start sshd
systemctl start postfix
systemctl enable sshd
systemctl enable postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
yum -y install gitlab-ce
