#!/bin/bash 
# install dependency script for FlytOS
# TODO : for future, download md5 file and check md5sum

#installing known ros dependencies
apt-get install -y --force-yes ros-indigo-usb-cam ros-indigo-image-proc ros-indigo-image-transport-plugins ros-indigo-image-transport ros-indigo-rosbridge-suite ros-indigo-control-toolbox ros-indigo-pyros-setup ros-indigo-eigen-conversions
#installing known python dependencies
apt-get install -y --force-yes python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twisted
apt-get install -y --force-yes python-pip
pip install flask-security

exit 0