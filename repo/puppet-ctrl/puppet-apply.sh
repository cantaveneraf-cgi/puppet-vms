#!/bin/bash

puppet apply ./environments/production/manifests/site.pp --confdir=. --environment=production --environmentpath=./environments/