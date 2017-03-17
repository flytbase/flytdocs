.. _FlytSim Installation Guide: 

FlytSim Installation Guide
==========================


Before you can start off with installing FlytSim, make sure you fulfill all the following dependencies.

* Intel 64 bit architecture
* `Linux - Ubuntu 16.04`_
* `ROS - Kinetic`_
* `OpenCV 2.4`_ (for vision/video streaming APIs)
* Gazebo7
  
FlytSim requires Gazebo7 which comes pre-packaged with ROS Kinetic. If in case, you have a different version of Gazebo, please install Gazebo7 before moving ahead in this tutorial. Failing to install the right version can render the simulation inoperational. 

.. In future, if need be, we might add support for other versions of Gazebo as well. 
.. But if you want to upgrade your Gazebo version, follow the steps mentioned in `this`_ tutorial. 

.. .. _FlytSim Installation:

.. FlytSim - Installation
.. ----------------------

.. We have provided the following two approaches for installing FlytSim:

.. * `FlytSim binaries - the preferred approach`_
.. * `Build FlytSim from source`_

.. Below is a brief `youtube video <https://www.youtube.com/watch?v=4s2nw5y610o>`_ about FlytSim Installation.

.. ..  youtube:: 4s2nw5y610o
..     :aspect: 16:9
..     :width: 100%

  
.. .. _FlytSim binaries - the preferred approach:

FlytSim binaries
^^^^^^^^^^^^^^^^

To install FlytSim binaries, 

* Click on `this link <https://flyt.blob.core.windows.net/flytos/FlytSIMv0.6-3b.7z>`_ to download the flytsimv0.x.7z file. Once downloaded, unzip the file to find *flytsim_0.x-y_amd64.deb* which is the FlytSim debian package and *flytsim_install.sh*, an install script. Alternatively, you can create your own install script by copying the following lines.

  .. literalinclude:: include/flytsim_install.sh
	   :language: bash
	   :tab-width: 4

* Before proceeding further, add the following three lines at the end of your $HOME/.bashrc file.
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh

* Go to the directory where you extracted flytsimv0.x.7z. 
* Make the install script executable.

  .. code-block:: bash

			$ chmod +x flytsim_install.sh

* Install FlytSim by executing the install script with **sudo** privileges.

  .. code-block:: bash

			$ sudo ./flytsim_install.sh

* Just in case you see any dependency issues cropping up in your screen while executing the install script, kindly run the following command and execute the install script again.
  	
  .. code-block:: bash

	  	$ sudo apt-get -f install 

* Check for ``Congratulations! FlytSim installation completed`` message at the end.

.. * If versions other than Gazebo6 is installed in your system, you might encounter dependency issues related to Gazebo6. We are working to provide support for other versions of Gazebo as well. Till then, please install Gazebo6 in your system, before running the install script again. 

.. _Build FlytSim from source:

.. Build FlytSim from source
.. ^^^^^^^^^^^^^^^^^^^^^^^^^

.. In future, FlytSim source code could be made available in github.


.. _FlytSim update:

FlytSim - Update
----------------

FlytSim versions with bug fixes and additional features are released at regular intervals. To check the version of installed FlytSim in your system, issue the following command in your terminal.

.. code-block:: bash

   $ sudo dpkg -s flytsim

Go to the `FlytSim download`_ page and check if a higher version of FlytSim is available. Download the flytsimv0.x.zip file. Once downloaded, unzip the file to find *flytsim_0.x-y_amd64.deb* which is the FlytSim debian package. To update FlytSim, go to the directory where you extracted flytsimv0.x.zip and run the following command in your terminal.
    
.. code-block:: bash

   $ sudo ./flytsim_install.sh

.. .. _Gazebo7 Installation:

.. Gazebo7 Installation
.. --------------------

.. FlytSim requires Gazebo7 to be installed in your device. To find out the version of Gazebo installed in your system, issue the following command in your terminal.

.. .. code-block:: bash

..    $ gazebo -v

.. If you have Gazebo7 installed, you should get the following output.

.. .. code-block:: bash

..    Gazebo multi-robot simulator, version 7.0.0
..    Copyright (C) 2012-2016 Open Source Robotics Foundation.
..    Released under the Apache 2 License.
..    http://gazebosim.org


..    Gazebo multi-robot simulator, version 7.0.0
..    Copyright (C) 2012-2016 Open Source Robotics Foundation.
..    Released under the Apache 2 License.
..    http://gazebosim.org

.. If you have any other version of Gazebo, then go through the following steps to install Gazebo7.

.. * Uninstall current Gazebo
  
..   You must uninstall your current Gazebo before installing Gazebo7. Issue the following command in your terminal.

.. .. code-block:: bash

..    #replace gazebox by the current version. For example, if you have Gazebo2, issue sudo apt-get remove gazebo2
..    $ sudo apt-get remove gazebox

.. * Install Gazebo7
  
..   Refer to the `Gazebo7 official installation page`_.

.. * Install Gazebo7 ROS-pkgs
  
..  Execute the following command in your terminal.

..   .. code-block:: bash

..    $ sudo apt-get install ros-indigo-gazebo7-*

.. _Linux - Ubuntu 16.04: https://wiki.ubuntu.com/XenialXerus/ReleaseNotes
.. _ROS - Kinetic: http://wiki.ros.org/kinetic/Installation/Ubuntu
.. .. _this: https://github.com/ethz-asl/rotors_simulator/wiki/Gazebo-and-Gazebo-Ros-Installation
.. _FlytSim Download: http://www.flytbase.com/flytos/#flytsim_3d
.. _OpenCV 2.4: http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
.. _Gazebo7 official installation page: http://gazebosim.org/tutorials?cat=install&tut=install_ubuntu&ver=7.0