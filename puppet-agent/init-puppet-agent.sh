echo [INIT] bootstrap
/home/vagrant/shared/./bootstrap.sh

echo [INIT] install puppet agent
sudo yum install -y puppet-agent

echo [INIT] copy puppet agent config
sudo cp /home/vagrant/shared/puppet-agent/puppet-agent.conf /etc/puppetlabs/puppet/puppet.conf

echo [INIT] start puppet agent
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true