#!/bin/bash 
# install script for FlytSim
# TODO : for future, download md5 file and check md5sum

#installing known ros dependencies
apt-get install -y ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-octomap-ros ros-kinetic-octomap-msgs ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-eigen-conversions
#installing known python dependencies
apt-get install -y python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq  python-twisted
apt-get install -y python-pip
sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2

#installing FlytSim package
dpkg -i flytsim*.deb  

exit 0
