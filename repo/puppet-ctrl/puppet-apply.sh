#!/bin/bash

cd /etc/puppet
sudo puppet apply ./environments/master/manifests/site.pp --confdir=. --environment=master --environmentpath=./environments/