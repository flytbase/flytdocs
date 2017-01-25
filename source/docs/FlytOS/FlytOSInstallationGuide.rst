

FlytOS Installation guide
=========================

.. _create_flytbase_account:

Create a FlytBase account
-------------------------

FlytBase account allows you to activate your FlytOS by registering your device and also lets you manage your license subscriptions. Follow the steps given below to create your FlytBase account.

1) Connect your device to the internet. 
   
   .. note:: If you are connected to FlytPOD/PRO, you will have to be in client mode. Follow the `WiFi Setup <http://docs.flytbase.com/en/master/docs/FlytPOD/RouterSetup.html>`_ guide to do so.
   
   

2) Create your account by signing up `here <http://my.flytbase.com>`_ and filling out the required information.
3) Once done, an email ID confirmation link would be sent to your registered ID asking you to set a password for your account.
4) Login using your registered user ID and password.



Preparing your Flight Computer
------------------------------

In this section, we would help you install FlytOS Linux Image on a 32GB SD/eMMC card for your specific board. FlytOS is currently compatible with `FlytPOD <http://docs.flytbase.com/en/master/docs/FlytPOD/About_FlytPOD.html>`_, `FlytPOD PRO <http://docs.flytbase.com/en/master/docs/FlytPOD/About_FlytPOD.html>`_, `ODROID-XU4 <http://docs.flytbase.com/en/master/docs/FlytOS/FlytOSInstallationGuide.html#pixhawk-odroid-xu4>`_ and  `Raspberry Pi 3 <https://www.raspberrypi.org/products/raspberry-pi-3-model-b/>`_. FlytPOD/FlytPOD PRO comes with FlytOS Linux Image installed on their respective 32GB storage devices. Follow this step ONLY if you want to reflash your device.

This step requires you to have a registered FlytBase account. In case you don't have an account follow the steps to create a FlytBase account :ref:`here<create_flytbase_account>` before you proceed.

FlytPOD / PRO
^^^^^^^^^^^^^

Flytmage is pre installed in FlytPOD and FlytPOD PRO. In case you want to reflash their respective 32GB SD/eMMC card , follow the steps given below.

**Image download:**

1. Download the `FlytOS Linux Image <http://flytonline-staging.azurewebsites.net/FlytOS/>`_ for FlytPOD/FlytPOD PRO from your FlytBase account.
2. Download FlytOS Linux Image mdsum.
3. It is about 2.7 GBs in size compressed (md5sum 3355a1ea968ede3d7571452fa19b2e05) and ~ 7.9 GBs uncompressed. 
4. Check mdsum.
5. Uncompress the file using the following command in your terminal: gunzip pi_flytimage.img.gz 
6. Size of uncompressed image.
   
**Image write to SD Card:**

1. We recommend using a 32 GB sd card, but a 16 GB card would work fine too. 
2. Format the micro sd card.
3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.
4. After installing the image on the ODROID-XU4’s SD/eMMC card, launch the ODROID-XU4 Utility App on the desktop. Enter FlytPOD’s password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.

5. Crisp pointsfrom above link.

**SD card expansion:**

1. Why should it be expanded?
2. How to expand in detail. 

You can install all FlytOS dependencies by either installing FlytOS Linux Image(the preferred approach) in your 32GB storage device or separately install all the dependencies by following this guide:

1. Install the following dependencies first:

   a) Linux - Ubuntu 16.04
   b) `ROS - Kinetic <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_
   c) `OpenCV 2.4 <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (for vision/video streaming APIs).
   d) Other dependencies - Run the following commands in your terminal with sudo permission.

      .. code-block:: python
       
           #!/bin/bash 
           # install dependency script for FlytOS

           #installing known python dependencies
           sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2 simple_json pyzmp pyros-setup

           apt-get install -y python-pip python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twistedsudo 

           #installing known ros dependencies
           apt-get install -y ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-eigen-conversions ros-kinetic-camera-info-manager ros-kinetic-pyros-utils

           #installing other dependencies
           apt-get install -y v4l2loopback-utils lsof minicom libglib2.0-dev
           sudo -H pip install certifi
           #removing modemmanager 
           apt-get remove -y modemmanager

           exit 0
 
    
2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
   
   .. code-block:: python
   
       #!/bin/bash 
       # install v4l2loopback kernel module required for FlytOS

       #Run this script as root

       cd $HOME
       git clone https://github.com/umlaeute/v4l2loopback.git
       cd v4l2loopback/
       apt-get install linux-headers-$(uname -r)
       apt-get update
       ln -s /usr/src/linux-headers-$(uname -r)/ /lib/modules/$(uname -r)/build
       sed -i 's/#define CONFIG_NEED_MACH_MEMORY_H 1/\/\/#define CONFIG_NEED_MACH_MEMORY_H 1/g' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
       sed -i '$a \\n#define CONFIG_ARCH_MULTIPLATFORM 1\n' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
       make && make install
       cd ..
       rm -rf v4l2loopback/

       exit 0



3. Before proceeding further, add the following three lines at the end of your /etc/bash.bashrc file. Please note that you will need sudo permission to edit the file.
 
   
   .. code-block:: python
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash

4. Rc.local gpio_init.sh



ODROID-XU4
^^^^^^^^^^

FlytOS is compatible with ODROID-XU4. Download FlytOS Linux Image from your FlytBase account and follow the steps below to install the image on your ODROID-XU4. This step requires you to have a registered FlytBase account. In case you don't have an account follow the steps to create a FlytBase account :ref:`here<create_flytbase_account>` before you proceed.

**Image download:**

1. Download the `FlytOS Linux Image <http://flytonline-staging.azurewebsites.net/FlytOS/>`_ for ODROID-XU4 from your FlytBase account.
2. Download FlytOS Linux Image mdsum.
3. It is about 2.7 GBs in size compressed (md5sum 3355a1ea968ede3d7571452fa19b2e05) and ~ 7.9 GBs uncompressed. 
4. Check mdsum.
5. Uncompress the file using the following command in your terminal: gunzip pi_flytimage.img.gz 
6. Size of uncompressed image.
   
**Image write to SD Card:**

1. We recommend using a 32 GB sd card, but a 16 GB card would work fine too. 
2. Format the micro sd card.
3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.
4. After installing the image on the ODROID-XU4’s SD/eMMC card, launch the ODROID-XU4 Utility App on the desktop. Enter FlytPOD’s password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.

5. Crisp pointsfrom above link.

**SD card expansion:**

1. Why should it be expanded?
2. How to expand in detail. 

You can install all FlytOS dependencies by either installing FlytOS Linux Image(the preferred approach) in your 32GB storage device or separately install all the dependencies by following this guide:

1. Install the following dependencies first:

   a) Linux - Ubuntu 16.04
   b) `ROS - Kinetic <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_
   c) `OpenCV 2.4 <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (for vision/video streaming APIs).
   d) Other dependencies - Run the following commands in your terminal with sudo permission.

      .. code-block:: python
       
           #!/bin/bash 
           # install dependency script for FlytOS

           #installing known python dependencies
           sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2 simple_json pyzmp pyros-setup

           apt-get install -y python-pip python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twistedsudo 

           #installing known ros dependencies
           apt-get install -y ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-eigen-conversions ros-kinetic-camera-info-manager ros-kinetic-pyros-utils

           #installing other dependencies
           apt-get install -y v4l2loopback-utils lsof minicom libglib2.0-dev
           sudo -H pip install certifi
           #removing modemmanager 
           apt-get remove -y modemmanager

           exit 0

 
    
2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
   
   .. code-block:: python
   
       #!/bin/bash 
       # install v4l2loopback kernel module required for FlytOS

       #Run this script as root

       cd $HOME
       git clone https://github.com/umlaeute/v4l2loopback.git
       cd v4l2loopback/
       apt-get install linux-headers-$(uname -r)
       apt-get update
       ln -s /usr/src/linux-headers-$(uname -r)/ /lib/modules/$(uname -r)/build
       sed -i 's/#define CONFIG_NEED_MACH_MEMORY_H 1/\/\/#define CONFIG_NEED_MACH_MEMORY_H 1/g' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
       sed -i '$a \\n#define CONFIG_ARCH_MULTIPLATFORM 1\n' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
       make && make install
       cd ..
       rm -rf v4l2loopback/

       exit 0




3. Before proceeding further, add the following three lines at the end of your /etc/bash.bashrc file. Please note that you will need sudo permission to edit the file.
 
   
   .. code-block:: python
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash


Raspberry Pi 3
^^^^^^^^^^^^^^

FlytOS is compatible with Raspberry Pi 3. Download FlytOS Linux Image from your FlytBase account and follow the steps below to install the image on your Raspberry Pi 3. This step requires you to have a registered FlytBase account. In case you don't have an account follow the steps to create a FlytBase account :ref:`here<create_flytbase_account>` before you proceed.

**Image download**

1. Download the `FlytOS Linux Image <http://flytonline-staging.azurewebsites.net/FlytOS/>`_ for Raspberry Pi 3 from your FlytBase account. 
2. Download FlytOS Linux Image mdsum.
3. It is about 2.7 GBs in size compressed (md5sum 3355a1ea968ede3d7571452fa19b2e05) and ~ 7.9 GBs uncompressed.
4. Check mdsum.
5. Uncompress the file using the following command in your terminal:
gunzip pi_flytimage.img.gz 

6. Size of uncompressed image.
   
**Image write to SD Card**

1. We recommend using a 32 GB sd card, but a 16 GB card would work fine too. 
2. Format the micro sd card.
3. Follow the instructions `here <https://www.raspberrypi.org/documentation/installation/installing-images/linux.md>`_ to copy the image on to the sdcard/emmc.
   
**Expand SD card**

Since the image is only 7.9 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partion to the maximum possible size to utilize all memory.

Insert the sd card in your Raspberry Pi 3 and apply power to boot it. By default a WiFi access point is created on the Pi with following credentials:
Ssid:       Flytpod_wifi
Password:   FlytPOD12#

Connect to the access point on another computer. Open the following link in your browser to view flytconsole:
10.42.0.1:9090/flytconsole



Download and Install FlytOS
---------------------------

FlytOS is currently compatible with `FlytPOD <http://docs.flytbase.com/en/master/docs/FlytPOD/About_FlytPOD.html>`_, `FlytPOD PRO <http://docs.flytbase.com/en/master/docs/FlytPOD/About_FlytPOD.html>`_, `ODROID-XU4 <http://docs.flytbase.com/en/master/docs/FlytOS/FlytOSInstallationGuide.html#pixhawk-odroid-xu4>`_ and  `Raspberry Pi 3 <https://www.raspberrypi.org/products/raspberry-pi-3-model-b/>`_ . This step requires you to have a registered FlytBase account. In case you don't have an account follow the steps to create a FlytBase account :ref:`here<create_flytbase_account>` before you proceed.
Once you have installed the latest FlytOS Linux Image, we recommend you to update your FlytOS by following the steps below:



1. **Download FlytOS:** Download the Board specific `FlytOS <http://flytonline-staging.azurewebsites.net/FlytOS/>`_ from your FlytBase account.
2. **Install FlytOS:** Once you have downloaded the Debian package, run the following command in your terminal to install FlytOS: 
   
   .. code-block:: python
   
       $ sudo dpkg -i <path to debian package location>/flytOS_*.deb 

   

4. Replace flytOS_* with the correct file name of the debian package.

5. Check for **Congratulations! FlytOS installation completed** message at the end.
6. Just in case you see any dependency issues cropping up in your screen while installing FlytOS, kindly run the following command and execute the previous command again:
   
   .. code-block:: python
   
       $ sudo apt -f install

FlytOS Basics
-------------

**Start/Stop FlytOS on boot**

1. If you are using FlytOS Linux image, FlytOS starts automatically on bootup.
2. On bootup FlytOS will also check for any updates. Available updates will be downloaded and installed automatically.
3. You can find more information on FlytOS updates here(link to FlytOS updates).

**Start/Stop FlytOS**

1. Launch FlytOS
       
   Once you have installed FlytOS, you are ready to build your own apps and test it out on the pixhawk. If you have installed FlytOS Linux Image, FlytOS would be launched automatically at every system bootup. To prevent this behaviour, comment the following line in /etc/rc.local file.

   To launch FlytOS, run this command in the terminal.

   .. code-block:: python
       
       $ sudo $(rospack find core_api)/scripts/launch_flytOS.sh

   In case you are using APM on Pixhawk, launch FlytOS using the following script.

   .. code-block:: python
       
       $ sudo $(rospack find core_api)/scripts/launch_flytOS_apm.sh

   .. important:: If you get this error: ``Error: package 'core_api' not found``, source your $HOME/.bashrc file.

   You can use FlytAPIs in your command line to do some simple maneuvers. For example,

   .. code-block:: bash

	    #To make the vehicle take off at its spot, execute this command in your terminal. 
	    $ rosservice call /flytpod/navigation/take_off "takeoff_alt: 2.0"

   .. code-block:: bash

	    #To send a position setpoint to the vehicle in NED frame, execute this command in your terminal.
	    rosservice call /flytpod/navigation/position_set "twist:
	    header:
	    seq: 0
	    stamp: {secs: 0, nsecs: 0}
	    frame_id: ''
	    twist:
	    linear: {x: 3.0, y: 1.0, z: -2.0}
	    angular: {x: 0.0, y: 0.0, z: 0.0}
	    tolerance: 0.0
	    async: false
	    relative: false
	    yaw_valid: false
	    body_frame: false"


   To know more about such commands, please refer to :ref:`FlytAPIs<list-of-APIs>` for more details.	

   2. Kill FlytOS
       
      To kill this instance of FlytOS, run this command in your terminal. 

      .. code-block:: python
       
          $ sudo $(rospack find core_api)/scripts/stop_flytOS.sh
       

**Security and Authentication**

From a Security and Authentication perspective, following layers are considered:


1. Secure WiFi network using WPA2:
   This is achieved by setting up a secure WiFi network (on FlytPOD by default or on a ground router).
2. SSL (https and wss) encryption:
   FlytOS uses SSL certificates and secure protocols (https, wss).
3. User and Request authentication:
   The last point involves, authenticating a user and providing role based access via a login mechanism. It also includes authenticating all the FlytAPIs for which a token based authentication mechanism is used.

**Accessing apps with FlytOS**

1. Open your browser and go to the following link - ``https://ip-address-of-device``.
2. Enter ``flytPOD`` as the IP address in case you are connected to FlytPOD- ``https://flytpod``.
3. You will be directed to a page that shows a warning **Connection is not private**. FlytOS contains self signed SSL certificates to enable access over local network.
   
       
   .. image:: /_static/Images/fOSinst1.png
      :align: center
4. Bypass the warning by clicking Advanced> Proceed to localhost. Confirm adding an exception if prompted to do so.
5. Next you will be directed to FlytOS login page. Login using the default credentials provided to you.
       
   .. image:: /_static/Images/fOSinst2.png
      :align: center
6. Once you have logged in you will see the list of standard apps along with other settings.
       
   .. image:: /_static/Images/fOSinst3.png
      :align: center

When a user tries to access an onboard web app e.g. FlytConsole, a login page is served asking for user credentials. The user credentials are validated and home page for the app is served. The response of a login request contains a token. All the FlytAPI calls need to have this token in the http header otherwise the request fails with unauthorized error.

The user authentication follows Single Sign On approach with a common login for FlytPOD allowing access to all the onboard apps.


**FlytAdmin for User Administration**
   
There is an inbuilt app FlytAdmin for user administration. Only ‘admin’ users have access to this app. The FlytOS admins of a device will be able to add, activate, edit, delete, deactivate users for that device using this app. The app provides views for Users and Roles. 

.. image:: /_static/Images/fOSinst4.png
   :align: center

.. image:: /_static/Images/fOSinst5.png
   :align: center


Activate FlytOS
---------------

Follow the steps `here <http://my.flytbase.com>`_ to register your device and activate FlytOS. 



.. 1) **Image Download** : Download the FlytOS for RPi3 image from this link https://drive.google.com/file/d/0B2IXB8LxWs-qMjFsVlRHSnpzS3M/view?usp=sharing. It is about 2.7 GBs in size compressed (md5sum 3355a1ea968ede3d7571452fa19b2e05) and ~ 7.9 GBs uncompressed. Uncompress the file using the following command in your terminal:
 
.. .. code-block:: bash

.. 	 gunzip pi_flytimage.img.gz

.. 2) **Image Write to SD Card** : Format a micro sd card (we recommend using a 32 GB sdcard, but a 16 GB card would work fine too). Follow these instructions to copy the image on to the sdcard/emmc: https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
.. 3) **Expand SD Card** : Since the image is only 7.9 GBs, the rest of the sdcard would have unallocated memory. Follow this guide to expand the partion to the maximum possible size to utilize all memory: http://elinux.org/RPi_Resize_Flash_Partitions
.. 4) **Download latest version of FlytOS** : We highly recommend you to update the FlytOS version on your Rpi3. Download new debian from this link here: https://drive.google.com/file/d/0B2IXB8LxWs-qUkM1UUM0ME5kVTA/view?usp=sharing
.. 5) **Install FlytOS** : Install it by running the following command in your RasPi’s terminal:

.. .. code-block:: bash

..     $ sudo dpkg -i flytcore_0.7-4b_armhf.deb

.. 6) Insert the sd card in RPi3 and apply power to boot it. By default a wifi access point is created on the Pi with following credentials:

..    a. Ssid: ``Flytpod_wifi`` 
..    b. Password: ``FlytPOD12#``

.. 7) Connect to the access point on another computer. Open the following link in your browser to view flytconsole: ``10.42.0.1:9090/flytconsole``
