#!/bin/bash

yum -y install wget
wget http://yum.puppetlabs.com/puppetlabs-release-pc1-el-5.noarch.rpm
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
rpm --import http://mirror.globo.com/epel/RPM-GPG-KEY-EPEL-5
rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
rpm -ivh puppetlabs-release-pc1-el-5.noarch.rpm
rpm -ivh epel-release-latest-5.noarch.rpm
rm -f epel-release-latest-5.noarch.rpm
rm -f puppetlabs-release-pc1-el-5.noarch.rpm

yum install -y git vim-enhanced wget rsync screen bind-utils nc telnet puppet-agent elinks lynx bzip2 unzip tcpdump man mlocate ccze htop traceroute
yum update -y
yum clean all

cat <<'EOF' > /root/.screenrc
shell -$SHELL
startup_message off
defscrollback 5000
hardstatus alwayslastline '%{= wk}%?%-Lw%?%{r}(%{k}%n*%f%t%?(%u)%?%{r})%{k}%?%+Lw%?%?%= %m/%d %C%A'
activity ''
termcapinfo xterm* 'hs:ts=\\E]2;:fs=\\007:ds=\\E]2;screen\\007'
EOF

echo "export PATH=\$PATH:/opt/puppetlabs/bin" > /etc/profile.d/puppet_path.sh
chmod 755 /etc/profile.d/puppet_path.sh
source /etc/profile.d/puppet_path.sh