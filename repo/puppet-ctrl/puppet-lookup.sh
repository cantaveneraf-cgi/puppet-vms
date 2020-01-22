#!/bin/bash

#Sample command to see the value of a hiera variable on a given node
cd /etc/puppet
sudo /opt/puppetlabs/bin/puppet lookup --node puppet-agent-01 --debug --explain --confdir=. --environment=master --environmentpath=./code/environments/ varname