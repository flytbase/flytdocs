.. _flytos_install_update:

FlytOS - Installation and Update
================================

Currently FlytOS has been tested on two platforms: :ref:`FlytPOD<about flytpod>` and '`Pixhawk`_ + `ODROID-XU4`_'. Developers are welcomed to try FlytOS on 'Pixhawk + other ARM based companion computers'. 


FlytOS - Installation
---------------------

FlytPOD
^^^^^^^

FlytOS comes pre-installed in FlytPOD. To update your firmware, please go to FlytOS-update<link> section.


Pixhawk + ODROID-XU4
^^^^^^^^^^^^^^^^^^^^

Hardware Setup
""""""""""""""

<link to video>

* FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk Telem2 port to ODROID-XU4. There are many ways to do that as the setup video suggests:

  - **[Recommended]** Connect Telem2 port of Pixhawk to ODROID UART0 port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0(RX)/GPA0.1(TX) have been used. 
  - [has known issues] Connect micro-USB port of Pixhawk to USB port of ODROID.
  - [Not Tested] Connect Telem2 port of Pixhawk to USB port of ODROID using UART-USB converter.

* FlytOS comes packed with FlytConsole (a web-based drone configuration utility). To enable access to vehicle, WiFi-dongle must be installed onboard the ODROID-XU4.
  
Firmware Setup
""""""""""""""

Pixhawk Firmware
++++++++++++++++

* **[Recommended]** *Using Binaries* - Download and install the latest stable PX4 firmware release using QGC. 
* *Build from source* - Clone the PX4 stable branch, build and install on Pixhawk.
  
FlytOS on ODROID-XU4
++++++++++++++++++++

* **[Recommended]** *Using FlytImage* - Download the FlytImage <link> on your local machine. This image comes pre-installed with FlytOS. Do Not forget to update your FlytOS, as the pre-installed firmware would be old. Follow this<link> guide to install the image on ODROID's SD/eMMC card.

* *Using FlytOS Debian Package* - FlytOS debian package for armhf architecture is also available to install if you dont want to use FlytImage. 

  - But, before doing that, install the following dependencies on ODROID:

    + `ROS - Indigo`_
    + Other dependencies - Run the following command in your terminal.
      
      .. code-block:: bash

			$ sudo apt-get install ros-indigo-rosbridge-suite	python-serial	install python-flask python-wtforms	python-sqlalchemy python-concurrent.futures
  - Go to the `FlytOS download`_ page. Download the FlytOSv0.3-1.deb file. Once downloaded, run the following command in your terminal to install FlytOS.
    
    .. code-block:: bash

			$ sudo dpkg -i <path to install file>/FlytOSv0.3-1.deb

FlytOS - Update
---------------

FlytOS versions with bug fixes and additional features are released in regular intervals. To check the version of installed FlytOS in your system, issue the following command in your terminal.

.. code-block:: bash

	 $ sudo dpkg -s flytcore

Go to the `FlytOS download`_ page. Download the FlytOSv0.x-y.deb file. Once downloaded, run the following command in your terminal to install FlytOS.
    
.. code-block:: bash

   $ sudo dpkg -i <path to install file>/FlytOSv0.x-y.deb 		#fill in the v0.x-y with the correct version number.



.. _ROS - Indigo: http://wiki.ros.org/indigo/Installation/Ubuntu
.. _FlytOS Download: http://flytbase.com/flytos/
.. _Pixhawk: https://pixhawk.org/choice
.. _ODROID-XU4: http://www.hardkernel.com/main/products/prdt_info.php