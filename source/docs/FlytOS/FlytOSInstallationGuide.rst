

FlytOS Installation guide
=========================

.. _create_flytbase_account:

Create a FlytBase Account
-------------------------

FlytBase Account allows you to activate your FlytOS by registering your Flight Computer and also lets you manage your license subscriptions. Follow the steps given below to create your FlytBase Account.

1. Create your own account by signing up `here <http://my.flytbase.com>`_ and filling out the required information.
2. Once done, an email ID confirmation link would be sent to your registered email ID asking you to set a password for your account.
3. Login using your registered email ID and password.


Preparing your Flight Computer
------------------------------


FlytOS requires a lot of dependencies to be installed. For this, we have provided the following two approaches:

* :ref:`Installing FlytOS Linux Image <FlytOS_linux_image>`
* :ref:`Installing FlytOS dependencies in your custom image<install_dependencies>`

.. _FlytOS_linux_image:


Installing FlytOS Linux Image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This section will help you in installing FlytOS Linux Image on any SD/eMMC card for your specific board. FlytOS is currently compatible with :ref:`FlytPOD<about_flytpod>`, :ref:`FlytPOD PRO<about_flytpodpro>`, `ODROID-XU4 <http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825>`_ and  `Raspberry Pi 3 <https://www.raspberrypi.org/products/raspberry-pi-3-model-b/>`_. We would soon launch compatibility with a lot many popular SBC's available in the drone ecosystem. FlytPOD/PRO comes with FlytOS Linux Image pre-installed on their respective 32GB storage devices. Follow this step ONLY if you want to re-flash your FlytPOD/PRO device.

This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

FlytPOD/PRO
"""""""""""

FlytOS Linux Image is pre-installed in FlytPOD/PRO. In case you want to re-flash their respective 32GB SD/eMMC card, or create a duplicate 32GB SD/eMMC card follow the steps given below. You can use 16GB SD/eMMC cards as well, but 32GB is preferable.

**Image download:**

1. `Login <http://my.flytbase.com>`_ to your FlytBase Account.
2. Download the `FlytOS Linux Image <http://my.flytbase.com/FlytOS>`_ for FlytPOD/PRO from your FlytBase account.
3. Download size of the image is about 2.5 GBs.
4. Check *md5sum* to verify the integrity of downloaded file:

   * Linux- launch a terminal and execute the following command ``md5sum <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- launch a command window and execute the following command ``CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5``.
   * Mac OS- launch a terminal and execute the following command ``md5 <path-to-downloaded-image>/flyt*.img.gz``.
5. Compare the md5 hash generated to *MD5 Hash* mentioned in the `download page <http://my.flytbase.com/FlytOS>`_.
6. Uncompress/extract the downloaded image:

   * Linux- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
   * Mac OS- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   
**Image write to SD/eMMC Card:**

1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too. 
2. Format the micro SD Card.
3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.
4. After installing the image on the ODROID-XU4’s SD/eMMC card, launch the ODROID-XU4 Utility App on the desktop. Enter FlytPOD’s password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.

.. 5. Crisp pointsfrom above link.

.. **Expanding SD Card partion:**

.. Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partion to the maximum possible size to utilize all memory.

|br|

ODROID-XU4
""""""""""

This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

**Download Image:**

1. `Login <http://my.flytbase.com>`_ to your FlytBase Account.
2. Download the `FlytOS Linux Image <http://my.flytbase.com/FlytOS>`_ for ODROID-XU4 from your FlytBase account.
3. Download size of the image is about 2.5 GBs.
4. Check *md5sum* to verify the integrity of downloaded file:

   * Linux- launch a terminal and execute the following command ``md5sum <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- launch a command window and execute the following command ``CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5``.
   * Mac OS- launch a terminal and execute the following command ``md5 <path-to-downloaded-image>/flyt*.img.gz``.
5. Compare the md5 hash generated to *MD5 Hash* mentioned in the `download page <http://my.flytbase.com/FlytOS>`_.
6. Uncompress/extract the downloaded image:

   * Linux- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
   * Mac OS- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   
**Write Image to SD Card:**

1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too. 
2. Format the micro SD Card.
3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.
4. After installing the image on the ODROID-XU4’s SD/eMMC card, launch the ODROID-XU4 Utility App on the desktop. Enter FlytPOD’s password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.

**Expand partition on SD Card:**

Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partition to the maximum possible size to utilize all memory.

|br|

Raspberry Pi 3
""""""""""""""

This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

**Image download**

1. `Login <http://my.flytbase.com>`_ to your FlytBase Account.
2. Download the `FlytOS Linux Image <http://my.flytbase.com/FlytOS>`_ for Raspberry Pi 3 from your FlytBase account.
3. Download size of the image is about 2.5 GBs.
4. Check *md5sum* to verify the integrity of downloaded file:

   * Linux- launch a terminal and execute the following command ``md5sum <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- launch a command window and execute the following command ``CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5``.
   * Mac OS- launch a terminal and execute the following command ``md5 <path-to-downloaded-image>/flyt*.img.gz``.
5. Compare the md5 hash generated to *MD5 Hash* mentioned in the `download page <http://my.flytbase.com/FlytOS>`_.
6. Uncompress/extract the downloaded image:

   * Linux- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   * Windows- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
   * Mac OS- launch a terminal and execute the following command ``gunzip <path-to-downloaded-image>/flyt*.img.gz``.
   
   
**Image write to SD Card**

1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too. 
2. Format the micro SD Card.
3. Follow the instructions `here <https://www.raspberrypi.org/documentation/installation/installing-images/linux.md>`_ to copy the image on to the sdcard/emmc.
   
**Expand SD card**

Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partition to the maximum possible size to utilize all memory.



.. _install_dependencies:

Installing FlytOS dependencies in your custom image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. warning:: Follow this step ONLY if you have chosen to NOT TO install :ref:`FlytOS Linux Image <FlytOS_linux_image>`.

This guide assumes you already have a working image for your Flight Computer. We would lay down steps to install dependencies and configure your device for FlytOS.

1. List of FlytOS dependencies to be installed in your Flight Computer:

   a) Linux - Ubuntu 16.04
   b) `ROS - Kinetic <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (install *ros-kinetic-desktop* package)
   c) `OpenCV 2.4 <http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html>`_ (for vision/video streaming APIs).
   d) Other dependencies - To install run the following commands in your terminal.

   .. literalinclude:: include/flytos_dependency.sh
      :language: bash   
 
.. 2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
   
..    .. literalinclude:: include/kernel_module_update.sh
..       :language:  bash  

2. Before proceeding further, add the following lines at the end of your /etc/bash.bashrc file. To open the file for editing, run the following command the terminal ``sudo nano /etc/bash.bashrc``. To save your edited file, press ``ctrl+o+ENTER`` and to exit press ``ctrl+x``.

   .. code-block:: bash
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash

Download and Install FlytOS
---------------------------

FlytOS is compatible with :ref:`FlytPOD<about_flytpod>`, :ref:`FlytPOD PRO<about_flytpodpro>`, `ODROID-XU4 <http://www.hardkernel.com/main/products/prdt_info.php?g_code=G143452239825>`_ and  `Raspberry Pi 3 <https://www.raspberrypi.org/products/raspberry-pi-3-model-b/>`_ . We would soon launch compatibility with a lot many popular SBC's available in the drone ecosystem. 
This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.
Once you have installed the latest FlytOS Linux Image, we recommend you to update your FlytOS by following the steps below:



1. **Download FlytOS:** Download the Board specific `FlytOS <http://fmy.flytbase.com/FlytOS/>`_ from your FlytBase account.
2. **Install FlytOS:** Once you have downloaded the Debian package, run the following command in your terminal to install FlytOS: 
   
   .. code-block:: bash
   
       $ sudo dpkg -i <path to debian package location>/flytOS_*.deb 

   

4. Replace flytOS_* with the correct file name of the debian package.

5. Check for **Congratulations! FlytOS installation completed** message at the end.
6. Just in case you see any dependency issues cropping up in your screen while installing FlytOS, kindly run the following command and execute the previous command again:
   
   .. code-block:: bash
   
       $ sudo apt -f install

FlytOS Basics
-------------

**Start/Stop FlytOS on boot**

1. If you are using FlytOS Linux image, FlytOS starts automatically on bootup.
2. On bootup FlytOS will also check for any updates. Available updates will be downloaded and installed automatically.
3. You can find more information on FlytOS updates :ref:`here<flytos_updates>`.

**Start/Stop FlytOS from command line**

1. Launch FlytOS
       
   Once you have installed FlytOS, you are ready to build your own apps and test it out on the pixhawk. If you have installed FlytOS Linux Image, FlytOS would be launched automatically at every system bootup. To prevent this behavior, comment the following line in /etc/rc.local file.

   To launch FlytOS, run this command in the terminal.

   .. code-block:: bash
       
       $ sudo $(rospack find core_api)/scripts/launch_flytOS.sh

   .. In case you are using APM on Pixhawk, launch FlytOS using the following script.

   .. .. code-block:: python
       
   ..     $ sudo $(rospack find core_api)/scripts/launch_flytOS_apm.sh

   .. important:: If you get this error: ``Error: package 'core_api' not found``, source your $HOME/.bashrc file.

   You can use FlytAPIs in your command line to do some simple maneuvers. For example,

   .. code-block:: bash

	    #To make the vehicle take off at its spot, execute this command in your terminal. 
	    $ rosservice call /flytpod/navigation/take_off "takeoff_alt: 4.0"

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

      .. code-block:: bash
       
          $ sudo $(rospack find core_api)/scripts/stop_flytOS.sh
       

.. **Security and Authentication**

.. From a Security and Authentication perspective, following layers are considered:


.. 1. Secure WiFi network using WPA2:
..    This is achieved by setting up a secure WiFi network (on FlytPOD by default or on a ground router).
.. 2. SSL (https and wss) encryption:
..    FlytOS uses SSL certificates and secure protocols (https, wss).
.. 3. User and Request authentication:
..    The last point involves, authenticating a user and providing role based access via a login mechanism. It also includes authenticating all the FlytAPIs for which a token based authentication mechanism is used.

**Accessing apps with FlytOS**

1. Open your browser and go to the following link - ``http://ip-address-of-device/flytconsole``.
2. Enter ``flytPOD`` as the IP address in case you are connected to FlytPOD- ``http://flytpod/flytconsole``.


.. 3. You will be directed to a page that shows a warning **Connection is not private**. FlytOS contains self signed SSL certificates to enable access over local network.
   
       
..    .. image:: /_static/Images/fOSinst1.png
..       :align: center
.. 4. Bypass the warning by clicking Advanced> Proceed to localhost. Confirm adding an exception if prompted to do so.
.. 5. Next you will be directed to FlytOS login page. Login using the default credentials provided to you.
       
..    .. image:: /_static/Images/fOSinst2.png
..       :align: center
.. 6. Once you have logged in you will see the list of standard apps along with other settings.
       
..    .. image:: /_static/Images/fOSinst3.png
..       :align: center

.. When a user tries to access an onboard web app e.g. FlytConsole, a login page is served asking for user credentials. The user credentials are validated and home page for the app is served. The response of a login request contains a token. All the FlytAPI calls need to have this token in the http header otherwise the request fails with unauthorized error.

.. The user authentication follows Single Sign On approach with a common login for FlytPOD allowing access to all the onboard apps.


.. **FlytAdmin for User Administration**
   
.. There is an inbuilt app FlytAdmin for user administration. Only ‘admin’ users have access to this app. The FlytOS admins of a device will be able to add, activate, edit, delete, deactivate users for that device using this app. The app provides views for Users and Roles. 

.. .. image:: /_static/Images/fOSinst4.png
..    :align: center

.. .. image:: /_static/Images/fOSinst5.png
..    :align: center


Activate FlytOS
---------------

Click `here <http://my.flytbase.com>`_ to register your device and activate FlytOS. Learn more about setting up your FlytBase account here. 

.. |br| raw:: html

   <br />