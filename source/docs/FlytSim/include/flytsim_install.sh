#!/bin/bash 
# install script for FlytSim
# TODO : for future, download md5 file and check md5sum

#installing known dependencies
apt-get install ros-indigo-rosbridge-suite ros-indigo-control-toolbox python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures ros-indigo-octomap-ros ros-indigo-octomap-msgs libgoogle-glog-dev 
#installing FlytSim package
dpkg -i flytsim_0.2-2_amd64.deb  

exit 0