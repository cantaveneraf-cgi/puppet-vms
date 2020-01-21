echo [INIT] bootstrap
/home/vagrant/shared/./bootstrap.sh

echo [INIT] install GIT
sudo yum -y install git

echo [INIT] install puppet server
sudo yum -y install puppetserver

echo [INIT] copy puppet server config
sudo ln -s /home/vagrant/shared/puppet-server/puppet-server.conf /etc/puppetlabs/puppet/puppet.conf

echo [INIT] start puppet server
sudo systemctl start puppetserver && systemctl enable puppetserver

echo [INIT] Install r10k
#sudo /opt/puppetlabs/puppet/bin/gem install gpgme --no-rdoc --no-ri
#sudo /opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg --no-rdoc --no-ri
sudo /opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri

echo [INIT] Link the Control Repo in /etc/puppet
sudo ln -s /home/vagrant/shared/repo/puppet-ctrl/ /etc/puppet

echo [INIT] Checkout the Puppet Repo in /etc/puppet/code/environments/ see basedir in r10k.yaml and hiera.yaml
sudo /etc/puppet/./r10k-deploy.sh