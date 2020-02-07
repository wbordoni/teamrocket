# Set Root password
echo "[TASK 12] Set root password"
echo "root" | passwd --stdin root >/dev/null 2>&1

# Install prerequisites
yum install -y epel-release unzip vim wget
yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

# Creating necessory folder structure
# # mkdir -p /zone/nexus-data /opt/nexus

# Download latest Nexus artifact
# # wget -O /tmp/nexus.tar.gz http://download.sonatype.com/nexus/3/latest-unix.tar.gz

# Extract it to /opt/nexus
# # tar xvfz /tmp/nexus.tar.gz -C /opt/nexus --strip-components 1

# Adding a service account for nexus
# # sudo useradd --system --no-create-home nexus

# Provide necessory folder permissions
# # chown -R nexus:nexus /opt/nexus
# # chown -R nexus:nexus /zone/nexus-data

# Setting up the default JDK
# # alternatives --config java

# Setting up JAVA_HOME by adding the following line at the bottom of /etc/bashrc
# # export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))

# Setting up NEXUS_HOME by adding the following line at the bottom of /etc/bashrc
# # export NEXUS_HOME=/opt/nexus

# Get the updated JAVA_HOME and NEXUS_HOME into current shell
# # source /etc/bashrc


