.. _FlytPOD_specifications:




Connections and Expansion Ports
===============================

.. important:: This page is under active development.

Exapansion Panel 
----------------


.. image:: /_static/Images/iopannel.png
  	:align: center

.. image:: /_static/Images/sideviews.png
	:scale: 35%
	:align: center
	


1. Power Button
^^^^^^^^^^^^^^^

Pressing the power button for 3 sec turns off FlytPOD. The RGB LED turns to amber upon shutting down. After that you can remove power supply.

.. note:: Please be patient while the system shuts down. It may take a few seconds for the system to shut down completely.
  
      


.. .. image:: /_static/Images/powerswitch.png
.. 		:align: center
.. 		:scale: 50%


2. External Sensors / Payload Expansion port 2*17
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Below are the ports available for external sensors and payload interface.

Columns described From left to right. 
(Net: top_pin, bottom_pin : Description)


.. image:: /_static/Images/exsensors.jpg
		:align: center
		:scale: 90%

.. * 3V3, -          :   3.3 V output, Gnd from FlytPOD for external sensors.
.. * GP1, GP2        :   GPIO 1 and GPIO 2 on odroid GPIO 30 pin connector. Pin GPX1.2, GPX1.3   
.. * ADC1, ADC2      :   ADC input pins. (more info coming soon).
.. * 3V3, -          :   3.3 V output, Gnd from FlytPOD for external sensors.     
.. * SPI1:  MO, CS   :   Mosi and CSN pins on Odroid SPI1 Bus. Pin GPA2.7, GPA2.5     
.. * SPI1:  MI, CK   :   Miso and Clock pins on Odroid SPI1 Bus. Pin GPA2.6, GPA2.4
.. * I2C1:  CL, DA   :   SCL and SDA pins from Odroid I2C_1 bus. Pin GPB3.3, GPB3.2
.. * 3V3, -          :   3.3 V output, Gnd from FlytPOD for external sensors.     
.. * SPI2:  MO, CS   :   Mosi and CSN pins on reserved SPI bus.
.. * SPI2:  MI, CK   :   Miso and Clk pins on reserved SPI bus.
.. * I2C2:  CL, DA   :   SCL and SDA pins of I2C_expansion bus. For rangefinder, px4flow, mag, etc.
.. * +, -            :   UBEC output, Gnd from ESC. Available only if your ESC have UBEC. Do not mix this with 5v supply from flytpod.
.. * US, LI          :   Ultrasonic and Lidar pins. For connecting PWM based ultrasonic  
.. * CAN:   H, L     :   CAN high, CAN Low pins on internal CAN bus.
.. * UART:  RT, CT   :   RTSN and CTSN pins on Telemetry Port.
.. * UART:  RX, TX   :   Rx and Tx pins on Telemetry Port. (Mavlink accessible at Baud rate 57600)
.. * 5V, -           :   5V output, Gnd from Flytpod for external Sensors.
 

.. note:: In some beta kits the I2C1 and I2C2 pins were labeled wrong. These are the correct labels for all FlytPODs.



.. Note that: In some beta kits the I2C1 and I2C2 pins were labeled wrong. These are the correct labels for all flytpods.

To know how to use these interfaces contact us at ``admin@navstik.org``.


.. .. image:: /_static/Images/external_sensors.png
.. 		:align: center
.. 		:scale: 30%


3. PWM Output Port
^^^^^^^^^^^^^^^^^^

8 PWM output channels. Plug ESC signal pins in the respective PWM output channels.

.. .. image:: /_static/Images/pwm2.png
.. 		:align: center
.. 		:scale: 50%



4. RSSI
^^^^^^^
Receiver signal strength.

.. _RGB_LED:

5. RGB LED
^^^^^^^^^^
The RGB LED represents the vehicle state.


.. .. image:: /_static/Images/rgbled.png
.. 		:align: center
.. 		:scale: 50%


Below are the various color patterns that the RGB LED exhibits along with their meanings.

* Breathing Blue - Standby

* Breathing Green - Standby and GPS / Px4flow ready.

* Solid Blue - Armed and No GPS lock / Px4flow available. 

* Solid Green - Armed and GPS lock / Px4flow available.

* Breathing Red - Configuration Error

* Fast blink Red while Arming- Arming Error

* During Mode transition: Fast green Blink for a second: Successful
  
* During Mode transition: Fast Red Blink for a second: transition failed.

* Amber Breathing / Solid - Low battery warning
  
* Red Breathing / Solid - Critical battery warning 

* Breathing Purple - Fail safe

  

6. Programmable LEDs
^^^^^^^^^^^^^^^^^^^^
User-programmable LEDs.


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
Choose between PPM, PWM from RC configuration in FlytConsole.



.. .. image:: /_static/Images/ppm2.png
.. 		:align: center
.. 		:scale: 50%

SBUS/SPEKTRUM
"""""""""""""
SBUS(fatuba) connects to SBUS port and for a SPEKTRUM, DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPEK port.

.. .. image:: /_static/Images/sbusspek1.png
.. 		:align: center
.. 		:scale: 50%




10. WiFi Status LED
^^^^^^^^^^^^^^^^^^^
Solid : WiFi booting.
Random Blink: WiFi data transmission indicator. 

11. System Health LED
^^^^^^^^^^^^^^^^^^^^^
fast green blink: Autopilot firmware updating.

12. Power Supply LED
^^^^^^^^^^^^^^^^^^^^
Solid red: Supply working.


13. External GPS MAG Port
^^^^^^^^^^^^^^^^^^^^^^^^^
Connect up to two external GPS-MAG sensors for redundancy and accuracy.
GPS-MAG1 is the primary port. You need at least one GPS-MAG module for stable flight. 

14. Micro SD
^^^^^^^^^^^^
32 GB Micro SD card with FlytOS image.



15. Power Input
^^^^^^^^^^^^^^^
5V @ 4A input for FlytPOD.



16. VI Sensor Input 
^^^^^^^^^^^^^^^^^^^
Monitor battery status and issue low battery warnings, available flight time left.



17. Micro SD
^^^^^^^^^^^^
8 GB Micro SD card used for onboard data logging.



18. USB Port
^^^^^^^^^^^^
Connect USB camera, 3G/4G dongle and other payloads.






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

.. figure:: /_static/Images/pwm_op.png
 :align: center
 :scale: 50%
   
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

* PWM: RC receiver in PWM mode. Channel 1 to 8 on RC port act as 8xPWM input when param PWM_PPM_SEL = 0 which can be changed from FlytConsole.
  
.. figure:: /_static/Images/ppm_pwm.png
 :align: center
 :scale: 50%
 

 PPM and PWM RC Input Channels

* PPM: RC receiver in PPM mode. Channel 1 on RC port acts as PPM input when param PWM_PPM_SEL = 1 which can be changed from FlytConsole.
  

 
     
.. note:: By default PPM mode is enabled.

* SPEKTRUM: For a SPEKTRUM, DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPKT/DSM port.

* SBUS
  
.. figure:: /_static/Images/sbus_spek.png
 :align: center
 :scale: 50%

 SBUS and SPEKTRUM RC Input Ports
    
.. important:: It is recommended to use PPM/PWM for RC Input. For using SBUS/SPEK please contact us at ``admin@navstik.org``.


.. _GPS_Mag:


GPS-Magnetometer
^^^^^^^^^^^^^^^^

External GPS-MAG can be connected to FlytPOD through the connector provided on the side. Default port available for this is GPS-MAG 1. Use of a Standoff is recommended in order to avoid interference. Make sure to mount it in such a way that FlytPOD heading is aligned with the GPS-MAG board heading.

.. note:: * Of the two ports provided, GPS-MAG 1 must be used for connecting external GPS-MAG as GPS-MAG 2 is reserved for future       development.



.. _Power_Module:


Power Module
^^^^^^^^^^^^
Connect the power module to the appropriate ports in the FlytPOD as shown in the image. 



.. figure:: /_static/Images/PowerModule.png
	:align: center
	:scale: 30%
	
	PowerModule


Buzzer
^^^^^^
Lidarlite Laser Rangefinder
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Px4flow
^^^^^^^^
USB Camera
^^^^^^^^^^^
HDMI output
^^^^^^^^^^^^






.. _FlytConsole: https://flytpod:9090/flytconsole


   
.. _Fixed wings/Planes: https://pixhawk.org/platforms/planes/start


   
.. _VTOL: https://pixhawk.org/platforms/vtol/start

.. _Multicopters: https://pixhawk.org/platforms/multicopters/start



.. _FlytConsole widgets: http://docs.flytbase.com/docs/FlytConsole/About_FlytConsole.html




