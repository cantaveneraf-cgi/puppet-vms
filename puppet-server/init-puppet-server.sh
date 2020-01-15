echo [INIT] bootstrap
/home/vagrant/shared/./bootstrap.sh

echo [INIT] install puppet server
sudo yum -y install puppetserver

echo [INIT] copy puppet server config
sudo cp /home/vagrant/shared/puppet-server/puppet-server.conf /etc/puppetlabs/puppet/puppet.conf

echo [INIT] start puppet server
sudo systemctl start puppetserver && systemctl enable puppetserver


echo [INIT] install ruby23
sudo yum -y install centos-release-scl && \
	sudo yum -y install rh-ruby23 && \
	scl enable rh-ruby23 bash
	
echo [INIT] install bundler
sudo gem install bundler

