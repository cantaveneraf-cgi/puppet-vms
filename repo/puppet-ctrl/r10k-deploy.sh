#!/bin/bash

cd /etc/puppet && /opt/puppetlabs/puppet/bin/r10k deploy environment -p -v
cd /