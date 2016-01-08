#!/bin/bash 
# install script for FlytSim

if [ -d ~/Downloads ]
	then
	cd ~/Downloads && wget https://docs.flytbase.com/binaries/flytsim_1.0-1_amd64.deb
else
	cd /tmp && wget https://docs.flytbase.com/binaries/flytsim_1.0-1_amd64.deb     #/tmp or something else?????
fi

# for future, download md5 file and check md5sum
apt-get install ros-indigo-octomap-ros ros-indigo-octomap-msgs libgoogle-glog-dev 
dpkg -i flytsim_1.0-1_amd64.deb

exit 0