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

prefix=`cat container_prefix`
name=`cat container_name`
containerName=$prefix/$name
instanceName=${name//\//_}-prod

sudo docker run -it --rm \
	--name $instanceName \
	--mount source=wrk,target=/dat/wrk \
	-v /var/run/docker.sock:/var/run/docker.sock \
	$containerName

