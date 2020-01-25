#!/bin/bash

# TODO: This file should probably be discarded as we will use "puppet agent -t" on the agent side
cd /etc/puppet
sudo /opt/puppetlabs/bin/puppet apply ./code/environments/master/manifests/site.pp --confdir=. --environment=master --environmentpath=./code/environments/
