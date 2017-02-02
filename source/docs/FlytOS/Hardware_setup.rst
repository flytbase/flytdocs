.. _hardware_setup:

Hardware Setup
==============

About FlytPOD and FlytPOD PRO
-----------------------------

FlytPOD comes in two variants - FlytPOD and FlytPOD PRO. See the detailed steps for getting started with FlytPOD/PRO :ref:`here<about_flytpod_pro>`.

Odroid-XU4 with Pixhawk
-----------------------

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


Raspberry PI 3 with Pixhawk
---------------------------

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

How to start the board
""""""""""""""""""""""

Connect the power cable to the power plug as shown below:

.. figure:: /_static/Images/Rasp3.png
	:align: center 
	:scale: 50 %
	
	Raspberry Pi 3


Insert the SD Card in your Raspberry Pi 3 and apply power to boot it. By default a WiFi access point is created on the Pi with following credentials:

ssid:       FlytPOD_wifi
Password:   FlytPOD123

Connect to the access point on another computer. Open the following link in your browser to view flytconsole:
10.42.0.1/flytconsole

1. Make the connections between Pixhawk’s TELEM 2 port and R pi 3’s GPIO port by following the connection table below. 
2. Connect the power cable to the power plug.
   
Connection table
""""""""""""""""

Connect the UART RX and TX pins of your Raspberry Pi 3 to the TELEM2 Tx and Rx pins of your Pixhawk as shown below. Click `here <https://pixhawk.org/modules/pixhawk>`_ for more details on Pixhawk.

.. figure:: /_static/Images/RaspPinout.png
	:align: center 
	:scale: 50 %
	
	Connection between Raspberry Pi 3’s GPIO and Pixhawk’s TELEM 2

.. figure:: /_static/Images/Pinout_PX_Rasp.png
	:align: center 
	:scale: 50 %

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_` guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.


.. |br| raw:: html

   <br />