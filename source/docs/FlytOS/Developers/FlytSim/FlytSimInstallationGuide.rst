.. _FlytSim Installation Guide: 

Installation Guide
==================

FlytSim Dependencies
^^^^^^^^^^^^^^^^^^^^

1. Before you can start off with installing FlytSim, make sure you fulfill all the following dependencies.

* Intel 64 bit architecture
* `Linux - Ubuntu 16.04`_ (preferably **NOT** in a Virtual Machine environment)
* `ROS - Kinetic`_ (install *ros-kinetic-desktop-full*)
* `OpenCV 2.4`_ (for vision/video streaming APIs)
* Gazebo7 (comes with ROS-Kinetic)
* Other dependencies - To install run the following commands in your terminal.

  .. literalinclude:: include/flytos_dependency.sh
     :language: bash

FlytSim requires Gazebo7 which comes pre-packaged with ROS Kinetic. If in case, you have a different version of Gazebo, please install Gazebo7 before moving ahead in this tutorial. Failing to install the right version can render the simulation inoperational. 

2. Before proceeding further, add the following lines at the end of your /etc/bash.bashrc file. To open the file for editing, run the following command in the terminal ``sudo nano /etc/bash.bashrc`` and to save your edited file, press ``ctrl+o+ENTER`` and to exit press ``ctrl+x``.

   .. code-block:: bash
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash
       source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh
       export CPATH=$CPATH:/opt/ros/kinetic/include

3. Run the following additional command in your terminal:

   .. code-block:: bash
   
       sed -i 's#source /opt/ros/kinetic/setup.bash##g' ~/.bashrc

Install FlytSim
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed. 

1. `Login <https://my.flytbase.com>`_ to your FlytBase Account.
2. Download the `FlytSim Debian Package <https://my.flytbase.com/FlytOS>`_ from your FlytBase Account.
3. Once you have downloaded the Debian package, run the following command in your terminal to install FlytSim: 
   
.. code-block:: bash
   
   #make sure to provide absolute path of the debian package file: /home/flytpod/flyt*.deb
   $ sudo apt install -y <path to debian package location>/flyt*.deb 

4. Check for **Congratulations! FlytSim installation completed** message at the end.
5. Just in case you see any dependency issues cropping up in your screen while installing FlytSim, kindly run the following command and execute the previous command again:
   
.. code-block:: bash
   
   $ sudo apt -f -y install

.. caution:: You must :ref:`activate your device<activate_flytsim>`, without which critical APIs would not function.

.. _activate_flytsim:

Activate FlytSim
^^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytSim, without which critical APIs would not function.

1. Make sure your machine has internet access before proceeding.
2. :ref:`Launch FlytSim <launch flytsim>` and ignore warnings thrown in the terminal for license not being activated.
3. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in your browser using the URL ``http://localhost/flytconsole`` or on some other PC's browser using the URL ``http://ip-address-of-device/flytconsole``. In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in. 
4. Choose a device nick-name and select your compute engine. 
5. In the drop down for license, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.  
6. Click on Save Changes to register device and generate a license key.
7. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


Update FlytSim
^^^^^^^^^^^^^^

FlytSim comes with automatic over-the-air update feature whenever it detects an updated version of FlytSim in our servers. To know more about automatic updates, click :ref:`here <flytos_updates>`.

.. _Linux - Ubuntu 16.04: https://wiki.ubuntu.com/XenialXerus/ReleaseNotes
.. _ROS - Kinetic: http://wiki.ros.org/kinetic/Installation/Ubuntu
.. _OpenCV 2.4: http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
