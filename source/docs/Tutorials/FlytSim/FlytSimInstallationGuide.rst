.. _FlytSim Installation Guide: 

FlytSim Installation Guide
==========================


Before you can start off with installing FlytSim, make sure you fulfill all the following dependencies.

* Intel 64 bit architecture
* Linux - Ubuntu 14.04
* `ROS - Indigo`_
  
FlytSim is based on Gazebo which comes in packaged with ROS Indigo (Gazebo 2). But if you want to upgrade your Gazebo version, follow the steps mentioned in `this`_ tutorial. 

We have provided the following two approaches for installing FlytSim:

* `FlytSim binaries - the preferred approach`_
* `Build FlytSim from source`_
  
.. _FlytSim binaries - the preferred approach:

FlytSim binaries
^^^^^^^^^^^^^^^^

To install FlytSim binaries, 

* Download :download:`this <flytsim_install.sh>` FlytSim install script. Alternatively, you can create your own install script by copying the following lines.

.. literalinclude:: flytsim_install.sh
   :language: bash
   :tab-width: 4

* Make the file executable.

.. code-block:: bash

		$ chmod +x <path to install script>/flytsim_install.sh

* Install FlytSim by executing the install script with **sudo** privileges::

.. code-block:: bash

		$ sudo <path to install script>/flytsim_install.sh

* Just in case you see any dependency issues cropping up in your screen while executing the install script, kindly run the following command and execute the install script again.
  	
.. code-block:: bash

  	$ sudo apt-get -f install 

.. _Build FlytSim from source:

Build FlytSim from source
^^^^^^^^^^^^^^^^^^^^^^^^^

Currently, efforts are being put to make FlytSim source code available in github.



.. _ROS - Indigo: http://wiki.ros.org/indigo/Installation/Ubuntu
.. _this: https://github.com/ethz-asl/rotors_simulator/wiki/Gazebo-and-Gazebo-Ros-Installation
.. _FlytSim install script: https://

