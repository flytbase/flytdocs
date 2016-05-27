#!/bin/bash 
# install dependency script for FlytOS
# TODO : for future, download md5 file and check md5sum

#installing known ros dependencies
apt-get install ros-indigo-usb-cam ros-indigo-image-proc ros-indigo-image-transport-plugins ros-indigo-image-transport ros-indigo-rosbridge-suite ros-indigo-control-toolbox ros-indigo-pyros-setup
#installing known python dependencies
apt-get install python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq 
apt-get install python-pip
pip install flask-security

exit 0