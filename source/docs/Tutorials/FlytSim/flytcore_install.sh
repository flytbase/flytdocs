#!/bin/bash 
# install script for FlytCore

if [ -d ~/Downloads ]
	then
	cd ~/Downloads && wget <path to flytcore deb package>
else
	cd /tmp && wget <path to flytcore deb package>     #/tmp or something else?????
fi

# for future, download md5 file and check md5sum
apt-get install ros-indigo-control-toolbox
dpkg -i flytcore_1.0-1_amd64.deb

exit 0