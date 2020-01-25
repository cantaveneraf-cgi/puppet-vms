echo [INIT] bootstrap
/home/vagrant/shared/./bootstrap.sh

echo [INIT] install GIT
sudo yum -y install git

echo [INIT] install puppet server
sudo yum -y install puppetserver

echo [INIT] copy puppet server config
sudo cp /home/vagrant/shared/puppet-server/puppet-server.conf /etc/puppetlabs/puppet/puppet.conf

echo [INIT] start puppet server
sudo systemctl start puppetserver && systemctl enable puppetserver

echo [INIT] Install r10k
#sudo /opt/puppetlabs/puppet/bin/gem install gpgme --no-rdoc --no-ri
#sudo /opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg --no-rdoc --no-ri
sudo /opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri

echo [INIT] Copy the Control Repo in /etc/puppetlabs/code/control
sudo cp /home/vagrant/shared/repo/puppet-ctrl/ /etc/puppetlabs/code/control

echo [INIT] Checkout the Puppet Repo
sudo /etc/puppetlabs/code/control/./r10k-deploy.sh
