#!/bin/bash

cd /etc/puppet
sudo /opt/puppetlabs/bin/puppet apply ./code/environments/master/manifests/site.pp --confdir=. --environment=master --environmentpath=./code/environments/
