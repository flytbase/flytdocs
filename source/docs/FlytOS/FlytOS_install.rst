.. _flytos_install_guide:

FlytOS - Installation Guide
===========================

Currently FlytOS has been tested on two platforms: :ref:`FlytPOD<about flytpod>` and '`Pixhawk`_ + `ODROID-XU4`_'. Developers are encouraged to try FlytOS on 'Pixhawk + other ARM based companion computers'. 

.. _flytos install:

FlytOS - Installation
---------------------

FlytPOD
^^^^^^^

FlytOS comes pre-installed in FlytPOD. To update your firmware, please go to :ref:`FlytOS-update<flytos update>` section.

Pixhawk + ODROID-XU4
^^^^^^^^^^^^^^^^^^^^

Hardware Setup
""""""""""""""

Below is a hardware setup `youtube video <https://www.youtube.com/watch?v=B40pE02bjJI>`_ for Pixhawk + ODROID-XU4.

..  youtube:: B40pE02bjJI
    :aspect: 16:9
    :width: 100%


* FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk Telem2 port to ODROID-XU4. There are many ways to do that as the setup video suggests:

  - **[Recommended]** Connect Telem2 port of Pixhawk to ODROID UART0 port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0(RX)/GPA0.1(TX) have been used. 
  - [has known issues] Connect micro-USB port of Pixhawk to USB port of ODROID.
  - [Not Tested] Connect Telem2 port of Pixhawk to USB port of ODROID using UART-USB converter.

* FlytOS comes packed with FlytConsole (a web-based drone configuration utility). To enable access to vehicle, WiFi-dongle must be installed onboard the ODROID-XU4.
  
Firmware Setup
""""""""""""""

**Pixhawk Firmware**

* **[Recommended]** *Using Binaries* - Download and install the latest stable PX4 firmware release using QGC. 
* *Build from source* - Clone the PX4 stable branch, build and install on Pixhawk.			
  
**FlytOS on ODROID-XU4**

* **[Recommended]** *Using FlytImage* - Download the `FlytImage`_ on your local machine. This image comes pre-installed with FlytOS. Do Not forget to update your FlytOS, as the pre-installed package would be old. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID's SD/eMMC card. After installing the image on the ODROID's SD/eMMC card, launch the ODROID Utility App on the desktop. Enter the FlytPOD's password(flytpod) at the prompt. Select the fourth option i.e Resize your root partition and reboot the system.

* *Using FlytOS Debian Package* - FlytOS debian package for armhf architecture is also available for installation.

  - But, before doing that, install the following dependencies on ODROID:

    + `ROS - Indigo`_
    + Other dependencies - Run the following command in your terminal.
      
      .. code-block:: bash

			$ sudo apt-get install ros-indigo-rosbridge-suite python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures

  - Download the flytOS_0.3-1_armhf.deb file from `FlytOS Download`_ page. Once downloaded, run the following command in your terminal to install FlytOS.
    
    .. code-block:: bash

			$ sudo dpkg -i <path to debian package location>/flytOS_0.3-1_armhf.deb

.. _flytos update:

FlytOS - Update
---------------

FlytOS versions with bug fixes and additional features are released at regular intervals. To check the version of installed FlytOS in your system, issue the following command in your terminal.

.. code-block:: bash

	 $ sudo dpkg -s flytcore

Download the flytOS_0.x-y_armhf.deb file from `FlytOS Download`_ page. Once downloaded, run the following command in your terminal to update FlytOS.
    
.. code-block:: bash

   $ sudo dpkg -i <path to debian package location>/flytOS_0.x-y_armhf.deb 		#fill in the v0.x-y with the correct version number


.. _ROS - Indigo: http://wiki.ros.org/indigo/Installation/Ubuntu
.. _FlytOS Download: http://flytbase.com/flytos/
.. _Pixhawk: https://pixhawk.org/choice
.. _ODROID-XU4: http://www.hardkernel.com/main/products/prdt_info.php
.. _FlytImage: http://www.flytbase.com/flytos/#download
