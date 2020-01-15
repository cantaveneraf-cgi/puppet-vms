#echo [INIT] Update the system
#sudo yum -y update

#echo [INIT] install JDK 8
#sudo yum -y install java-1.8.0-openjdk-devel

echo [INIT] install GIT
sudo yum -y install git

echo [INIT] Modify hosts file
sudo echo "192.168.133.10      puppet-server" >> /etc/hosts
sudo echo "192.168.133.11      puppet-agent" >> /etc/hosts

echo [INIT] Install ntp and ntpdate
sudo yum -y install ntp ntpdate && \
	sudo ntpdate 0.centos.pool.ntp.org && \
	sudo systemctl start ntpd && \
	sudo systemctl enable ntpd

echo [INIT] Disable selinux
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux 

echo [INIT] Add the Puppet RPM repository
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

echo [INIT] done!