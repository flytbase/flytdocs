#!/bin/bash 
# install dependency script for FlytOS

#installing known python dependencies
sudo apt install -y python-pip python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twisted
sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2 simple_json pyzmp pyros-setup

#installing known ros dependencies
sudo apt install -y ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-eigen-conversions ros-kinetic-camera-info-manager ros-kinetic-pyros-utils

#installing other dependencies
sudo apt install -y v4l2loopback-utils locate lsof minicom libglib2.0-dev gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo -H pip install certifi pyserial 

#removing some modules
sudo apt remove -y modemmanager xfce4-power-manager

exit 0
