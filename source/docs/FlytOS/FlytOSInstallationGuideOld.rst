.. _flytos_install_guide:

FlytOS - Installation Guide
===========================

Currently FlytOS has been tested on two platforms: :ref:`FlytPOD<about flytpod>` and '`Pixhawk`_ + `ODROID-XU4`_'. Developers are encouraged to try FlytOS on 'Pixhawk + other ARM based companion computers'. 

.. _flytos install:

FlytOS - Installation
---------------------

FlytPOD
^^^^^^^

FlytOS comes pre-installed in FlytPOD. To update the package, please go to :ref:`FlytOS - update<flytos update>` section.

Pixhawk + ODROID-XU4
^^^^^^^^^^^^^^^^^^^^

Hardware Setup
""""""""""""""

FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk's Telemetry port to ODROID-XU4. There are many ways to do that as the following setup video suggests:

a. **[Recommended]** Connect ``Pixhawk's Telem2 port`` to ``ODROID UART0`` port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as ``GPA0.0(RX)`` and ``GPA0.1(TX)`` have been used as serial port UART0. 
b. [Has known issues] Connect ``Pixhawk's micro-USB`` to the ``USB port of ODROID``.
c. [Not Tested] Connect ``Pixhawk's Telem2 port`` to the ``USB port of ODROID`` using UART-USB converter.

FlytOS comes packed with :ref:`FlytConsole<about flytconsole>` (a web-based drone configuration utility). To enable access to vehicle, WiFi-dongle must be installed onboard the ODROID-XU4.
 
Below is a hardware setup `youtube video <https://www.youtube.com/watch?v=B40pE02bjJI>`_ for Pixhawk + ODROID-XU4 covering all the necessary information.

..  youtube:: B40pE02bjJI
    :aspect: 16:9
    :width: 100%

|br|

Firmware Setup
""""""""""""""

**Pixhawk Firmware**

a. **[Recommended]** *Using Binaries* - Download and install the latest stable PX4/APM firmware release using QGC or any other means. 
b. *Build from source* - Clone the PX4/APM stable branch, build and install on Pixhawk.			

**FlytOS on ODROID-XU4**

a. **[Recommended]** *Using FlytImage* - Download the `FlytImage`_ on your local machine.

   1) FlytImage comes pre-installed with FlytOS. To update FlytOS, please go to :ref:`FlytOS - update<flytos update>` section.

   .. important:: Do Not forget to update your FlytOS, as the pre-installed package would be old.



   2) Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID's SD/eMMC card.
   3) After installing the image on the ODROID's SD/eMMC card, launch the ODROID Utility App on the desktop. Enter the FlytPOD's password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.
   
   
   .. 1. FlytImage comes pre-installed with FlytOS. To update FlytOS, please go to :ref:`FlytOS - update<flytos update>` section.
  
   ..    .. important:: Do Not forget to update your FlytOS, as the pre-installed package would be old.

   .. ii. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID's SD/eMMC card. 

   .. iii. After installing the image on the ODROID's SD/eMMC card, launch the ODROID Utility App on the desktop. Enter the FlytPOD's password(flytpod) at the command prompt and select the fourth option i.e Resize your root partition and reboot the system.

b. *Using FlytOS Debian Package* - FlytOS debian package for armhf architecture is also available for installation.

   1) But, before doing that, install the following dependencies first:

      * Linux - Ubuntu 16.04
      * `ROS - Kinetic`_ 
      * `OpenCV 2.4`_ (for vision/video streaming APIs)
      * Other dependencies - Run the following commands in your terminal with *sudo* permission.
           
      .. literalinclude:: include/flytos_dependency.sh
         :language: bash
         :tab-width: 4 

   2) You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with *sudo* permission
    
      .. literalinclude:: include/kernel_module_update.sh
         :language: bash
         :tab-width: 4 

   3) Before proceeding further, add the following three lines at the end of your /etc/bash.bashrc file. Please note that you will need *sudo* permission to edit the file.
    
   .. code-block:: bash
       
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash

   4) Download the flytOS_0.x-y_armhf.deb file from `FlytOS Download`_ page. Once downloaded, run the following command in your terminal to install FlytOS.
    
   .. code-block:: bash
   
       $ sudo dpkg -i <path to debian package location>/flytOS_0.x-y_armhf.deb


   5) Just in case you see any dependency issues cropping up in your screen while executing the install script, kindly run the following command and execute the previous command again.
    
   .. code-block:: bash
    
       $ sudo apt-get -f install 

   6) Check for ``Congratulations! FlytOS installation completed`` message at the end.
    

   .. i. But, before doing that, install the following dependencies first:

   ..    + Linux - Ubuntu 14.04
   ..  	+ `ROS - Indigo`_
   ..  	+ `OpenCV 2.4`_ (for vision/video streaming APIs)
   ..  	+ Other dependencies - Run the following commands in your terminal.
      
  	.. 		.. literalinclude:: include/flytos_dependency.sh
   ..   		   :language: bash
   ..   			:tab-width: 4 

   .. ii. Before proceeding further, add the following two lines at the end of your $HOME/.bashrc file.
    
   .. .. code-block:: bash

   ..    export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
   ..    source /flyt/flytos/flytcore/setup.bash

   .. iii. Download the flytOS_0.x-y_armhf.deb file from `FlytOS Download`_ page. Once downloaded, run the following command in your terminal to install FlytOS.
    
   .. .. code-block:: bash

   ..    $ sudo dpkg -i <path to debian package location>/flytOS_0.x-y_armhf.deb

   .. iv. Just in case you see any dependency issues cropping up in your screen while executing the install script, kindly run the following command and execute the previous command again.
    
   .. .. code-block:: bash

   ..    $ sudo apt-get -f install 

   .. v. Check for ``Congratulations! FlytOS installation completed`` message at the end.


.. _flytos update:

FlytOS - Update
---------------

FlytOS versions with bug fixes and additional features are released at regular intervals. To check the version of installed FlytOS in your system, issue the following command in your terminal.

.. code-block:: bash

	 $ sudo dpkg -s flytcore

Its better to again check for FlytOS dependencies just in case, the list is updated. Issue the following commands in your terminal with *sudo* permission.

.. literalinclude:: include/flytos_dependency.sh
   :language: bash
   :tab-width: 4   

Download the flytOS_0.x-y_armhf.zip file from `FlytOS Download`_ page. Once downloaded, extract the contents of the zip file. Update the autopilot firmware, by running the following command.

.. code-block:: bash

   $ sudo $(rospack find core_api)/scripts/firmware_upgrade_usart.sh <path to debian package location>/nuttx-navstik-v1-default.flyt

Once the update is complete, run the following command in your terminal to update FlytOS.
    
.. code-block:: bash

   $ sudo dpkg -i <path to debian package location>/flytOS_0.x-y_armhf.deb 		#fill in the v0.x-y with the correct version number




.. |br| raw:: html

   <br />

.. _ROS - Kinetic: http://wiki.ros.org/kinetic/Installation/Ubuntu
.. _FlytOS Download: http://flytbase.com/flytos/#download
.. _Pixhawk: https://pixhawk.org/choice
.. _ODROID-XU4: http://www.hardkernel.com/main/products/prdt_info.php
.. _FlytImage: http://www.flytbase.com/flytos/#download
.. _OpenCV 2.4: http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html