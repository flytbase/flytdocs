.. _FlytPOD_specifications:


FlytPOD Specifications
======================


FlytPOD Peripherals
-------------------


.. image:: /_static/Images/ioPanel.png
  	:align: center

.. image:: /_static/Images/sideviews.png
	:height: 330px
	:width: 1500px
	


Power Button
^^^^^^^^^^^^

Use the power button at the top left corner of the I/O pannel to turn off FlytPOD. Please be patient while the system shuts down. The RGB LED turns to amber color upon shutting down.

.. note:: It may take a few seconds for the system to shut down completely.
  
      


.. .. image:: /_static/Images/powerswitch.png
.. 		:align: center
.. 		:scale: 50%


Exteral Sensors and Payload Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2xSPI,2xI2C,1xUSART,1xCAN,LIDAR/SONAR,2xADC,2XGPIO. Connect external sensors, payloads through available interfaces.
 

.. .. image:: /_static/Images/external_sensors.png
.. 		:align: center
.. 		:scale: 30%


PWM Outut Port
^^^^^^^^^^^^^^

Connect ground, power and signal pins of the motors in the respective PWM output channels. 

.. .. image:: /_static/Images/pwm2.png
.. 		:align: center
.. 		:scale: 50%



RSSI
^^^^
Receiver signal strength.

RGB LED
^^^^^^^

The LED represents the vehicle state. 


.. .. image:: /_static/Images/rgbled.png
.. 		:align: center
.. 		:scale: 50%


Below are the various color patterns that the RGB LED exhibiits along with their meanings.

* Solid any color - Armed

* Breathing any color - Standby

* Blue - GPS not locked

* Green - GPS Locked

* Fast Blink & Red - Arming error

* Blink & Red - Other error


Programmable LEDs
^^^^^^^^^^^^^^^^^
LEDs 1 and 2 are available for users to programme.


Gimbal
^^^^^^

Dedicated 4 PWM output channels for your Gimbal.

Safety and Buzzer
^^^^^^^^^^^^^^^^^

External safety switch and buzzer switch.




RC Receiver Interface
^^^^^^^^^^^^^^^^^^^^^

PPM/8xPWM channels for RC Input. Connect the ground, power, and signal wires to the RC.




.. .. image:: /_static/Images/ppm2.png
.. 		:align: center
.. 		:scale: 50%

SBUS/SPEK
^^^^^^^^^
SBUS(fatuba).
For a Spektrum DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPKT/DSM port.

.. .. image:: /_static/Images/sbusspek1.png
.. 		:align: center
.. 		:scale: 50%




WiFi Status
^^^^^^^^^^^

System Health
^^^^^^^^^^^^^

Power Supply
^^^^^^^^^^^^



External GPS MAG Port
^^^^^^^^^^^^^^^^^^^^^
Connect upto two external GPS-MAG sensors for redundancy and accuracy.



Micro SD
^^^^^^^^
FlytOS Micro SD slot.



Power Input
^^^^^^^^^^^
5v to 4A input for FlytPOD.



VI Sensor IN
^^^^^^^^^^^^
Monitor battery status and issue low battery warnings , available flight time left.



Micro SD
^^^^^^^^
Onboard data logging.



2xUSB 3.0
^^^^^^^^^
Connect USB camera, 3G/4G dongle and other payloads.








Technical Specifications
^^^^^^^^^^^^^^^^^^^^^^^^

.. image:: /_static/Images/techspec.png
		:align: center
		


