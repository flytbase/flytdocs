.. _FlytPOD_specifications:

Connections and Expansion Ports
===============================

.. important:: This page is under active development.

.. note:: The following document is applicable for both FlytPOD and FlytPOD PRO


Expansion Panel
---------------


.. image:: /_static/Images/iopannel.jpg
   :align: center
	
.. image:: /_static/Images/FPsideviews.png
	:align: center

.. note:: Notations/symbols on your FlytPOD may vary from the given image, but the pin functions remain same, please match physical location with above image in such case.

1. Power Button
^^^^^^^^^^^^^^^

Gently pressing the power button turns off the FlytPOD. The RGB LED turns to amber upon shutting down. After that you can remove the power supply. You can switch on FlytPOD again by pressing the Power button and holding for about 1 second.

.. note:: Please be patient while the system shuts down. It may take a few seconds for the system to shut down completely.
  

2. External Sensors / Payload Expansion port 2*17
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Below are the ports available for external sensors and payload interface.

.. image:: /_static/Images/exsensors.jpg
		:align: center
		:scale: 80%

.. note:: In some beta kits the I2C1 and I2C2 pins were labeled wrong. These are the correct labels for all FlytPODs.


3. PWM Output Port
^^^^^^^^^^^^^^^^^^

8 PWM output channels. Plug ESC signal pins in the respective PWM output channels. Learn more :ref:`here.<PWM_Output>`


4. RSSI
^^^^^^^
Receiver signal strength input pin.

.. _RGB_LED:

5. RGB LED
^^^^^^^^^^
The RGB LED represents the vehicle state. Below is a list of various color patterns along with the associated message/status. 

* Red Blink                    		 - Configuration Error
* Red FastBlink while Arming       - Arming Error
* Blue Breathing 									 - Standby, NO-GPS lock, ready to arm
* Blue Solid                       - Armed and No GPS lock / Px4flow poor quality 
* Green Breathing                  - Standby and GPS / Px4flow ready, ready to arm
* Green Solid                      - Armed and GPS lock / Px4flow available
* Amber Breathing                  - Vehicle shutdown/lockdown mode

During vehicle mode transition

* Green FastBlink for a second   			- Successful 
* Red FastBlink for a second   				- Transition failed
  
Battery warnings

* Amber Breathing / Solid          - Low battery warning
* Red Breathing / Solid            - Critical battery warning

Failsafe Mode Trigger

* Purple Breathing                 - Vehicle in Fail safe mode


6. Programmable LEDs
^^^^^^^^^^^^^^^^^^^^

The LEDs on the right side of the IO panel, marked 1 and 2 are User-programmable LEDs. To control these LEDs via FlytAPIs, click `here. <http://api.flytbase.com>`_


7. Gimbal
^^^^^^^^^

FlytPOD provides a dedicated 4 PWM output channels for your Gimbal with pins marked as 1, 2 and 3 are Roll, Pitch and Yaw respectively. To control your gimbal using FlytAPIs, click `here <http://api.flytbase.com>`_.


8. Safety and Buzzer
^^^^^^^^^^^^^^^^^^^^

FlytPOD provides an external safety switch and buzzer ports. Safety switch has been disabled by default. To enable this feature, set ``CBRK_IO_SAFETY`` parameter in FlytConsole to 0 from its :ref:`Parameter Manager<Gain_tuning>` widget. 


9. RC Receiver Interface
^^^^^^^^^^^^^^^^^^^^^^^^

PPM/PWM Channels
""""""""""""""""
FlytPOD provides PPM/8xPWM channels for RC Input. Connect the ground, power, and signal wires to the RC.
Choose between PPM, PWM from RC configuration in FlytConsole. Read more :ref:`here.<RC_Receiver>`


SBUS
""""
Connect your SBUS receiver to RX pin of SBUS port.


10. WiFi Status LED
^^^^^^^^^^^^^^^^^^^
Below are the various color patterns that the WiFi Status LED exhibits along with their meanings.


* Solid        - WiFi booting.
* Random Blink - WiFi data transmission indicator. 
  
The WiFi Power off Switch is available on top of the FlytPOD, in case you want to use the ethernet port.
  
11. System Health LED
^^^^^^^^^^^^^^^^^^^^^

The System Health LED indicates the Autopilot Health status.

* Green FastBlink - Autopilot Configuration Error
* Green Blink at 1 Hz - Autopilot Ready to Arm

In case of Autopilot firmware upgrade in progress, (marked by RGBled status either being solid green or blank), helath led shows either Green FastBlink or Solid.

12. Power Supply LED
^^^^^^^^^^^^^^^^^^^^
The System Health LED exhibits only the following colour.

* Solid red - Supply working.


13. External GPS MAG Port
^^^^^^^^^^^^^^^^^^^^^^^^^

The following ports are available with FlytPOD and FlytPOD PRO.

* FlytPOD - GPS-MAG 1
* FlytPOD PRO - GPS-MAG 1 (primary port), GPS-MAG 2 (secondary/backup port)

You must attach the provided GPS-MAG module to these ports for stable flight. Read more :ref:`here.<GPS_Mag>`

14. VI Sensor Input
^^^^^^^^^^^^^^^^^^^
The VI sensor plug of `power module`_ must be connected to this port. This would enable FlytPOD to monitor battery status and issue low battery warnings. It also provides a 5V, 2A power input pin which is highest priority input source for autopilot. 

15. Power Input
^^^^^^^^^^^^^^^
Power input for FlytPOD, ratings: 5V, 4A, second highest priority power input for autopilot. Odroid SBC requires this power input all the time. Autopilot and WiFi can run safely on other two power inputs as well when this plug is not connected.


16. FlytOS Micro SD/eMMC
^^^^^^^^^^^^^^^^^^^^^^^^
In case of FlytPOD this slot hosts 32 GB Micro SD card with FlytOS image. Without this card, FlytPOD will not boot.
FlytPOD PRO has internal 32 GB eMMC card running FlytOS, so this slot can be used for extra micro SD card.


17. Flight log Micro SD
^^^^^^^^^^^^^^^^^^^^^^^
FlytPOD and FlytPOD PRO both have an 8 GB Micro SD card used for autopilot data logging and data storage.


18. USB Port
^^^^^^^^^^^^
FlytPOD provides 2 x high speed USB 3.0 ports, to connect USB camera, 3G/4G dongle and other payloads.


Peripherals
-----------


.. GPS-magnetometer
.. px4flow
.. lidarlite laser rangefinder
.. ultrasonic HCSR04
.. Air speed sensor
.. Buzzer
.. safety switch
.. power module
.. Gimbal
.. RC
.. Servo/pwm output
.. USB camera
.. Ground Router
.. Telemetry radio
.. HDMI output




.. _PWM_Output:

Servo Output / PWM output
^^^^^^^^^^^^^^^^^^^^^^^^^

According to your platform connect up to 8 motors (ESCs) to the PWM output channel. 

.. figure:: /_static/Images/statusLEDs.jpg
 :align: center
 :scale: 12%
   
 PWM Channel
   

Multicopters
""""""""""""

Following image shows the motors numbered on various platforms according to their position. Plug-in the signal cable from the corresponding ESC in exactly the same PWM output channel. e.g. Motor 3 on your platform should be connected to PWM out 3 channel.

Click `here <http://pixhawk.org/platforms/multicopters/start>`_ for more information on Multicopters.



.. image:: /_static/Images/frames.jpg
		:align: center
		:scale: 30%


Fixed Wing
""""""""""

Click `here <https://pixhawk.org/platforms/planes/start>`_ for information on Fixed Wing.


VTOL
""""

Click `here <https://pixhawk.org/platforms/vtol/start>`_ for information on VTOL.


.. _RC_Receiver:

Radio Receiver
^^^^^^^^^^^^^^

* PWM: RC receiver in PWM mode. Channel 1 to 8 on RC port act as 8xPWM input.
  
.. figure:: /_static/Images/ppm_pwm.jpg
 :align: center
 :scale: 50%
 

 PPM and PWM RC Input Channels

* PPM: RC receiver in PPM mode. Channel 1 on RC port acts as PPM input.
     
.. .. note:: By default PPM mode is enabled.

* SPEKTRUM: (Currently not supported on FlytPOD/PRO) For a SPEKTRUM, DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPEK port.

* SBUS: Connect SBUS receiver to the SBUS port.
  
.. figure:: /_static/Images/sbus_spek.jpg
 :align: center
 :scale: 50%

 SBUS and SPEKTRUM RC Input Ports
    
.. .. important:: It is recommended to use PPM/PWM for RC Input. For using SBUS/SPEK please contact us at ``admin@navstik.org``.


.. _GPS_Mag:


GPS-Magnetometer
^^^^^^^^^^^^^^^^

External GPS-MAG can be connected to FlytPOD through the connector provided on the side.

* FlytPOD - FlytPOD comes with GPS-MAG 1 port. GPS-MAG sensor can be connected to this port to achieve a stable flight.
* FlytPOD PRO - FlytPOD PRO comes with GPS-MAG 1 as it's primary port and GPS-MAG 2. Upto two GPS-MAG sensors can be connected. This offers a fail safe mechanism for reliable navigation.

.. figure:: /_static/Images/Gpsmag.png
 :align: center
 :scale: 65%
 
 External GPS-MAG ports 


.. _Power_Module:


Power Module
^^^^^^^^^^^^
Connect the power module to the appropriate ports in the FlytPOD as shown in the image. 

.. figure:: /_static/Images/PowerModule.jpg
	:align: center
	:scale: 30%
	
	PowerModule



LiDAR-Lite V2 Laser Rangefinder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Below are two methods for connecting LiDAR-lite to FlytPOD.

* PWM Input
  
  Please follow the table below to make the required connections.

.. image:: /_static/Images/lidarpinstable.jpg
  	:align: center
  	:scale: 80%

.. figure:: /_static/Images/lidar1.jpg
	:align: center
	:scale: 12%
	
	LiDAR Pins

.. note:: Set the parameter SENS_EN_LL40LS to 1. (For LIDARLiteV2, no need to connect reset pin)


Telemetry
^^^^^^^^^

Connect your Telemetry module to the Telemetry port(Rx and Tx) as shown below for QGroundControl. MAVLink available at baud rate 57600.

.. figure:: /_static/Images/lidar3.jpg
	:align: center
	:scale: 12%
	
	Telemetry pins


.. _FlytConsole: https://flytpod/flytconsole   
.. _Fixed wings/Planes: https://pixhawk.org/platforms/planes/start
.. _VTOL: https://pixhawk.org/platforms/vtol/start
.. _Multicopters: https://pixhawk.org/platforms/multicopters/start
.. _FlytConsole widgets: http://docs.flytbase.com/docs/FlytConsole/About_FlytConsole.html
