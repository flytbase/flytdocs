#!/bin/bash 
# install script for FlytSim
# TODO : for future, download md5 file and check md5sum

#installing known dependencies
apt-get install ros-indigo-octomap-ros ros-indigo-octomap-msgs libgoogle-glog-dev ros-indigo-control-toolbox 
#installing FlytSim package
dpkg -i flytsim_1.0-1_amd64.deb 

exit 0