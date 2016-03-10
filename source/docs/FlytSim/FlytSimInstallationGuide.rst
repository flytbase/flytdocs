.. _FlytSim Installation Guide: 

FlytSim Installation Guide
==========================


Before you can start off with installing FlytSim, make sure you fulfill all the following dependencies.

* Intel 64 bit architecture
* Linux - Ubuntu 14.04
* `ROS - Indigo`_
  
FlytSim is based on Gazebo2 which comes in packaged with ROS Indigo. If in case, you have an upgraded version of Gazebo, please install Gazebo2 before moving ahead in this tutorial. In future, we will add support for upgraded versions of Gazebo as well. 

.. But if you want to upgrade your Gazebo version, follow the steps mentioned in `this`_ tutorial. 

Below is a brief `youtube video <https://www.youtube.com/watch?v=4s2nw5y610o>`_ about FlytSim Installation.

..  youtube:: 4s2nw5y610o
    :aspect: 16:9
    :width: 100%


We have provided the following two approaches for installing FlytSim:

* `FlytSim binaries - the preferred approach`_
* `Build FlytSim from source`_
  
.. _FlytSim binaries - the preferred approach:

FlytSim binaries
^^^^^^^^^^^^^^^^

To install FlytSim binaries, 

* Go to the `FlytSim download`_ page. Download the flytsimv0.x.zip file. Once downloaded, unzip the file to find *flytsim_0.x-y_amd64.deb* which is the FlytSim debian package and *flytsim_install.sh*, an install script. Alternatively, you can create your own install script by copying the following lines.

  .. literalinclude:: include/flytsim_install.sh
	   :language: bash
	   :tab-width: 4

* Before proceeding further, add the following two lines at the end of your $HOME/.bashrc file.
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash

* Go to the directory where you extracted flytsimv0.x.zip. 
* Make the install script executable.

  .. code-block:: bash

			$ chmod +x flytsim_install.sh

* Install FlytSim by executing the install script with **sudo** privileges.

  .. code-block:: bash

			$ sudo ./flytsim_install.sh

* Just in case you see any dependency issues cropping up in your screen **other than that of Gazebo2** while executing the install script, kindly run the following command and execute the install script again.
  	
  .. code-block:: bash

	  	$ sudo apt-get -f install 

* If versions other than Gazebo2 is installed in your system, you might encounter dependency issue for Gazebo2. We are working to provide support for higher versions of Gazebo as well. Till then, please install Gazebo2 in your system, before running the install script again. 

.. _Build FlytSim from source:

Build FlytSim from source
^^^^^^^^^^^^^^^^^^^^^^^^^

Currently, efforts are being put to make FlytSim source code available in github.


.. _ROS - Indigo: http://wiki.ros.org/indigo/Installation/Ubuntu
.. _this: https://github.com/ethz-asl/rotors_simulator/wiki/Gazebo-and-Gazebo-Ros-Installation
.. _FlytSim Download: http://www.flytbase.com/flytos/#flytsim_3d
