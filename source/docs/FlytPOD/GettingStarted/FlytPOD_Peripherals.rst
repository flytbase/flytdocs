.. _FlytPOD_specifications:




FlytPOD - Peripherals
=====================

.. important:: This page is under active development.

Hardware Specifications
-----------------------


.. image:: /_static/Images/iopannel.png
  	:align: center

.. image:: /_static/Images/sideviews.png
	:scale: 35%
	


1. Power Button
^^^^^^^^^^^^^^^

Press the power button at the top left corner of the I/O panel to turn off FlytPOD. The RGB LED turns to amber upon shutting down.

.. note:: Please be patient while the system shuts down. It may take a few seconds for the system to shut down completely.
  
      


.. .. image:: /_static/Images/powerswitch.png
.. 		:align: center
.. 		:scale: 50%


2. External Sensors and Payload Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Below are the ports available for external sensors and payload interface.


* 2xSPI
* 2xI2C
* 1xUSART
* 1xCAN
* LiDAR/SONAR
* 2xADC
* 2XGPIO  
  


To know how to use these interfaces contact us at ``admin@navstik.org``.

.. .. image:: /_static/Images/external_sensors.png
.. 		:align: center
.. 		:scale: 30%


3. PWM Output Port
^^^^^^^^^^^^^^^^^^

Connect ground, power and signal pins of the motors in the respective PWM output channels. 

.. .. image:: /_static/Images/pwm2.png
.. 		:align: center
.. 		:scale: 50%



4. RSSI
^^^^^^^
Receiver signal strength.


5. RGB LED
^^^^^^^^^^
The RGB LED represents the vehicle state.


.. .. image:: /_static/Images/rgbled.png
.. 		:align: center
.. 		:scale: 50%


Below are the various color patterns that the RGB LED exhibits along with their meanings.

* Solid any color - Armed

* Breathing any color - Standby

* Blue - GPS not locked

* Green - GPS Locked

* Fast Blink & Red - Arming error

* Blink & Red - Other error


6. Programmable LEDs
^^^^^^^^^^^^^^^^^^^^
LEDs are available are user-programmable.


7. Gimbal
^^^^^^^^^
Dedicated 4 PWM output channels for your Gimbal.


8. Safety and Buzzer
^^^^^^^^^^^^^^^^^^^^
External safety switch and buzzer. (Safety switch has not yet been configured).


9. RC Receiver Interface
^^^^^^^^^^^^^^^^^^^^^^^^

PPM/PWM Channels
""""""""""""""""
PPM/8xPWM channels for RC Input. Connect the ground, power, and signal wires to the RC.




.. .. image:: /_static/Images/ppm2.png
.. 		:align: center
.. 		:scale: 50%

SBUS/SPEKTRUM
"""""""""""""
SBUS(fatuba) connects to SBUS port and for a Spektrum DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPEK port.

.. .. image:: /_static/Images/sbusspek1.png
.. 		:align: center
.. 		:scale: 50%




10. WiFi Status
^^^^^^^^^^^^^^^

11. System Health
^^^^^^^^^^^^^^^^^

12. Power Supply
^^^^^^^^^^^^^^^^



13. External GPS MAG Port
^^^^^^^^^^^^^^^^^^^^^^^^^
Connect up to two external GPS-MAG sensors for redundancy and accuracy.



14. Micro SD
^^^^^^^^^^^^
32 GB Micro SD card which consists the FlytOS image.



15. Power Input
^^^^^^^^^^^^^^^
5V/4A input for FlytPOD.



16. VI Sensor
^^^^^^^^^^^^^
Monitor battery status and issue low battery warnings, available flight time left.



17. Micro SD
^^^^^^^^^^^^
8 GB Micro SD card used for onboard data logging.



18. USB Port
^^^^^^^^^^^^
Connect USB camera, 3G/4G dongle and other payloads.


Technical Specifications
------------------------

.. image:: /_static/Images/techspec.png
 :align: center
		


