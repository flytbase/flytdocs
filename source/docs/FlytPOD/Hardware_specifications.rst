.. _FlytPOD_specifications:

Connections and Expansion Ports
===============================

.. important:: This page is under active development.

.. note:: The following document is applicable for both FlytPOD and FlytPOD PRO

 



Expansion Panel
---------------


.. image:: /_static/Images/iopannel.jpg
  	:align: center

.. .. image:: /_static/Images/sideviews.jpg
.. 	:scale: 35%
.. 	:align: center
	
.. image:: /_static/Images/FPsideviews.png
	:align: center


1. Power Button
^^^^^^^^^^^^^^^

Gently pressing the power button turns off the FlytPOD. The RGB LED turns to amber upon shutting down. After that you can remove the power supply. You can switch on FlytPOD again by pressing the Power button for 1 second.

.. note:: Please be patient while the system shuts down. It may take a few seconds for the system to shut down completely.
  
      


.. .. image:: /_static/Images/powerswitch.png
.. 		:align: center
.. 		:scale: 50%


2. External Sensors / Payload Expansion port 2*17
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Below are the ports available for external sensors and payload interface.

.. Columns described From left to right. 
.. (Net: top_pin, bottom_pin : Description)


.. image:: /_static/Images/exsensors.jpg
		:align: center
		:scale: 80%

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

8 PWM output channels. Plug ESC signal pins in the respective PWM output channels. Learn more :ref:`here.<PWM_Output>`

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

* Breathing Blue							- Standby

* Breathing Green                  - Standby and GPS / Px4flow ready
  
* Breathing Red                    - Configuration Error

* Solid Blue                       - Armed and No GPS lock / Px4flow quality poor 

* Solid Green                      - Armed and GPS lock / Px4flow available

* Fast blink Red while Arming      - Arming Error

* During vehicle mode transition   - Successful
  (Fast green Blink for a second) 
  
* During vehicle mode transition   - Transition failed
  (Fast Red Blink for a second)   

* Amber Breathing / Solid          - Low battery warning
  
* Red Breathing / Solid            - Critical battery warning 

* Breathing Purple                 - Fail safe

* Breathing Amber                  - Vehicle shutdown/lockdown

6. Programmable LEDs
^^^^^^^^^^^^^^^^^^^^

The LEDs on the right of the IO panel marked 1, 2 and R are User-programmable LEDs. Learn more :ref:`here.<list-of-APIs>`


7. Gimbal
^^^^^^^^^

FlytPOD provides a dedicated 4 PWM output channels for your Gimbal. Learn more :ref:`here.<list-of-APIs>`


8. Safety and Buzzer
^^^^^^^^^^^^^^^^^^^^

FlytPOD provides an external safety switch and buzzer ports. Safety switch has been disabled by default. To enable this feature, set ``CBRK_IO_SAFETY`` parameter in FlytConsole to 0 from its :ref:`Parameter Manager<Gain_tuning>` widget. 


9. RC Receiver Interface
^^^^^^^^^^^^^^^^^^^^^^^^

PPM/PWM Channels
""""""""""""""""
FlytPOD provides PPM/8xPWM channels for RC Input. Connect the ground, power, and signal wires to the RC.
Choose between PPM, PWM from RC configuration in FlytConsole. Read more :ref:`here.<RC_Receiver>`



.. .. image:: /_static/Images/ppm2.png
.. 		:align: center
.. 		:scale: 50%

SBUS/SPEKTRUM
"""""""""""""
SBUS(futaba) connects to SBUS port and for a SPEKTRUM, DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPEK port.

.. .. image:: /_static/Images/sbusspek1.png
.. 		:align: center
.. 		:scale: 50%




10. WiFi Status LED
^^^^^^^^^^^^^^^^^^^
Below are the various color patterns that the WiFi Status LED exhibits along with their meanings.


* Solid        - WiFi booting.
* Random Blink - WiFi data transmission indicator. 
* No blink     - Error state. Click here to know what to do.
  
11. WiFi Switch
^^^^^^^^^^^^^^^
The WiFi Reset Switch is available on top of the FlytPOD as shown in the image below.
  
12. System Health LED
^^^^^^^^^^^^^^^^^^^^^

The System Health LED indicates the Autopilot status.

* Fast Green blink / Solid Green - Autopilot firmware updating

13. Power Supply LED
^^^^^^^^^^^^^^^^^^^^
The System Health LED exhibits only the following colour.

* Solid red - Supply working.


14. External GPS MAG Port
^^^^^^^^^^^^^^^^^^^^^^^^^

The following ports are available with FlytPOD and FlytPOD PRO.

* FlytPOD - GPS-MAG 1

* FlytPOD PRO - GPS-MAG 1 (primary port), GPS-MAG 2

You must attach the provided GPS-MAG module to these ports for stable flight. Read more :ref:`here.<GPS_Mag>`

.. .. attention:: FlytPOD PRO comes with two GPS-MAG ports thus allowing you to connect upto two external GPS-MAG sensors. 

15. VI Sensor Input
^^^^^^^^^^^^^^^^^^^
The VI sensor output of `power module`_ must be connected to this port. This would enable FlytPOD to monitor battery status and issue low battery warnings.

16. Power Input
^^^^^^^^^^^^^^^
Power input gives 5V at 4A power for FlytPOD.


17. Micro SD/eMMC
^^^^^^^^^^^^^^^^^
The following are available with FlytpOD and FlytPOD PRO 

* FlytPOD - 32 GB Micro SD card with FlytOS image

* FlytPOD PRO - 32 GB eMMC card with FlytOS image


18. Micro SD
^^^^^^^^^^^^
FlytPOD and FlytPOD PRO both have an 8 GB Micro SD card used for autopilot data logging and data storage.


19. USB Port
^^^^^^^^^^^^
FlytPOD provides a USB port that can connect USB camera, 3G/4G dongle and other payloads.






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

* SPEKTRUM: For a SPEKTRUM, DSM, DSM2, or DSM-X Satellite RC receiver, connect to the SPEK port.

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
  
* FlytPOD PRO - FlytPOD PRO comes with GPS-MAG 1 as it's primary port and GPS-MAG 2. Upto two GPS-MAG sensors can e connected. This offers a fail safe mechanism for reliable navigation.

.. Default port available for this is GPS-MAG 1 in FlytPOD. Use of a Standoff is recommended in order to avoid interference. Make sure to mount it in such a way that FlytPOD heading is aligned with the GPS-MAG board heading.

.. .. attention:: FlytPOD PRO comes with two GPS-MAG ports. This offers a fail safe mechanism for reliable navigation.

 .. .. note:: * Of the two ports provided, GPS-MAG 1 must be used for connecting external GPS-MAG as GPS-MAG 2 is reserved for future development.

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

.. note:: Set the parameter SENS_EN_LL40LS to 1.



.. * I2C Bus
  
..   Connect LiDAR-lite I2C wires to I2C-2 port as shown below.



.. .. figure:: /_static/Images/lidar2.jpg
.. 	:align: center
.. 	:scale: 12%
	
.. 	I2C Pins


Telemetry
^^^^^^^^^

Connect your Telemetry module to the Telemetry port(Rx and Tx) as shown below for QGroundControl. MAVLink available at baud rate 57600.

.. figure:: /_static/Images/lidar3.jpg
	:align: center
	:scale: 12%
	
	Telemetry pins









.. Buzzer
.. ^^^^^^
.. Px4FLOW
.. ^^^^^^^
.. USB Camera
.. ^^^^^^^^^^^
.. HDMI output
.. ^^^^^^^^^^^^






.. _FlytConsole: https://flytpod:9090/flytconsole


   
.. _Fixed wings/Planes: https://pixhawk.org/platforms/planes/start


   
.. _VTOL: https://pixhawk.org/platforms/vtol/start

.. _Multicopters: https://pixhawk.org/platforms/multicopters/start



.. _FlytConsole widgets: http://docs.flytbase.com/docs/FlytConsole/About_FlytConsole.html




