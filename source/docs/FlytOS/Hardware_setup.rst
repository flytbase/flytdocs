.. _hardware_setup:

Hardware Setup
==============

Once you are through with :ref:`flashing FlytOS Linux Image<FlytOS_linux_image>` and :ref:`installing FlytOS debian package<installing_flytos>`, you should go ahead with configuring Pixhawk with your Flight Computer.

FlytPOD/PRO
-----------

FlytPOD comes in two variants - FlytPOD and FlytPOD PRO. Both of them have an inbuilt autopilot and you shall not have to go through this guide. See the detailed steps for getting started with FlytPOD/PRO :ref:`here<about_flytpod_pro>`.

ODROID-XU4
----------

Telemetry Connection
""""""""""""""""""""

FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk’s Telemetry port to ODROID-XU4. 

1. **[Recommended]** Connect Pixhawk's Telem2 port to ODROID UART0 port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0(RX) and GPA0.1(TX) have been used as serial port UART0.
2. Connect Pixhawk's micro-USB to the USB port of ODROID.
3. Connect Pixhawk's Telem2 port to the USB port of ODROID using UART-USB converter.
   

.. FlytConsole comes pre-packaged in FlytOS (a web-based drone configuration utility). To enable access to vehicle, WiFi-dongle must be installed onboard the ODROID-XU4.

Below is a hardware setup youtube video for Pixhawk + ODROID-XU4 covering all the necessary information.

|br|

..  youtube:: B40pE02bjJI
    :aspect: 16:9
    :width: 80%

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on ODROID-XU4 and Pixhawk.


Raspberry PI 3
--------------

**Company name:** Raspberry Pi foundation 

**Available at:** http://uk.rs-online.com/web/b/raspberry-pi

**For more information:** https://www.raspberrypi.org

Tech specs
""""""""""

* 1.2GHz 64-bit quad-core ARMv8 CPU
* 802.11n Wireless LAN
* 1GB RAM
* 4 USB ports
* Full HDMI port
* Ethernet port
* Micro SD card slot 
* VideoCore IV 3D graphics core

WiFi Access Point
"""""""""""""""""

Insert the SD Card with pre-flashed :ref:`FlytOS Linux Image<FlytOS_linux_image>` in your Raspberry Pi 3 and apply power to boot it. On boot up a WiFi access point is created on the device with following credentials:

ssid:       FlytPOD_wifi

Password:   FlytPOD123

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://10.42.0.1/flytconsole


Telemetry Connection
""""""""""""""""""""

Connect the UART RX and TX pins of your Raspberry Pi 3 to the TELEM2 Tx and Rx pins of your Pixhawk as shown below. Click `here <https://pixhawk.org/modules/pixhawk>`_ for more details on Pixhawk.

.. figure:: /_static/Images/RaspPinout.png
	:align: center 
	:scale: 60 %
	
	Connection between Raspberry Pi 3’s GPIO and Pixhawk’s TELEM 2

.. figure:: /_static/Images/Pinout_PX_Rasp.png
	:align: center 
	:scale: 75 %

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.

Nvidia Jetson TX1
-----------------

Telemetry Connection
""""""""""""""""""""

Connect the Pixhawk autopilot board’s TELEM2 port to TX1’s UART1 port . If you are using the TX1 developer kit carrier board , then the UART1 can be found on the J17 connector. Visit `this link <https://developer.nvidia.com/embedded/dlc/jetson-tx1-developer-kit-carrier-board-spec>`_ (Page 28 Section 3.7) to view the pinout of TX1's J17 connector.

.. figure:: /_static/Images/Tx1_Connection.png
	:align: center 
	:scale: 80 %
	
	Connection between TX1 developer kit's J17 connector and Pixhawk’s TELEM 2

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Nvidia TX1 and Pixhawk.

Intel Edison
------------

WiFi Access Point
"""""""""""""""""

After flashing :ref:`FlytOS Linux Image<FlytOS_linux_image>` in your Intel Edison, WiFi access point is created on the device on system startup with following credentials:

ssid:       edison_wifi

Password:   FlytPOD123

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://192.168.42.1/flytconsole



Telemetry Connection
""""""""""""""""""""

FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk’s Telemetry port to Intel Edison. 

1. **[Recommended]** Connect Pixhawk's Telem2 port to Edison's UART port(ttyMFD1) using J18/13(RX) and J19/8(TX) (refer page-7 of `edison hardware guide <http://download.intel.com/support/edison/sb/edisonbreakout_hg_331190006.pdf>`_ for connections). If you are using Pixhawk2.1, this connection is already made available.
2. Connect Pixhawk's micro-USB to the USB port of Edison.
3. Connect Pixhawk's Telem2 port to the USB port of Edison using UART-USB converter.


.. figure:: /_static/Images/edison_pixhawk.jpg
	:align: center 
	:scale: 100 %
	
	Connection between Edison's ttyMFD1 uart port and Pixhawk’s TELEM 2

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Edison and Pixhawk.


.. |br| raw:: html

   <br />