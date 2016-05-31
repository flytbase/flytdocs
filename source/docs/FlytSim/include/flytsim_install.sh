#!/bin/bash 
# install script for FlytSim
# TODO : for future, download md5 file and check md5sum

#confirming gazebo6 and its ros dependencies are installed
apt-get install gazebo6 libgazebo6-dev ros-indigo-gazebo6-*
#installing known ros dependencies
apt-get install ros-indigo-rosbridge-suite ros-indigo-control-toolbox ros-indigo-octomap-ros ros-indigo-octomap-msgs libgoogle-glog-dev ros-indigo-pyros-setup ros-indigo-eigen-conversions
#installing known python dependencies
apt-get install python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq 
apt-get install python-pip
pip install flask-security
#installing FlytSim package
dpkg -i flytsim_0.4-1_amd64.deb  

exit 0