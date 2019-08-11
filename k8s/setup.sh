#!/bin/bash

# Containerized Dev Tools
# Copyright © 2018, Matheson Ventures Pte Ltd
#
# This is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License v2 as published by the Free Software
# Foundation.
#
# This software is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this software.  If not, see http://www.gnu.org/licenses/gpl-2.0.html

# Pre-requisites
apt-get update -y; apt-get upgrade -y;

apt-get install -y \
	wget

# Get binaries.  We do this together and before other commands to increase the chance that these layers can be cached in
# in case later commands are changed
wget -O kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
wget -O helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)-linux-amd64.tar.gz

# kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/

# kops
chmod +x ./kops
mv ./kops /usr/local/bin/

# helm
tar xvzf helm.tar.gz

mv linux-amd64/helm /usr/local/bin
rm -Rf linux-amd64
rm helm.tar.gz
