.. Getting Started with Flyt
.. -------------------------


.. Introduction
.. ============

.. FlytPOD
.. ^^^^^^^

.. Acts as the brain which controls your drone. The device consists of flight computer, navigation sensors and communication system.

.. FlytOS
.. ^^^^^^

.. Flyt Operating System. Lets you build apps that can control your drone through a set of APIs in REST, CPP and Python.

.. FlytConsole
.. ^^^^^^^^^^^

.. Web application for configuring your drone with Flyt. It also provides basic GCS.

.. Flytkit Contents
.. ================

.. The contents of FlytKit include: 

.. * FlytPOD
.. * MicroSD (8 GB) for data-logging
.. * MicroSD (32 GB) preloaded with FlytOS v1.0.1
.. * 2x WiFi antenna
.. * External GPS-MAG module
.. * Power board
.. * Power wall adapter


FlytPOD - Setup
===============


.. important:: This guide is under active development.





Onboard Router Configuration
----------------------------

.. .. note:: Initial personalization is optional but we recommended you do this the first time you use the device. Drone is not necessary for this part of the setup.

1. Power up the device using the provided wall adapter or battery.

2. Next you will have to connect to the FlytPOD_wifi network using the password FlytPOD123. By default, the onboard router is configured in AP mode. To reconfigure it in client mode, follow :ref:`this<configuring wifi module in client mode>` documentation.

3. Before proceeding to the steps for Drone integration shut down FlytPOD by pressing its power switch as shown in the image and remove 		the power cable.

.. .. image:: /_static/Images/pic1.png





Integrating FlytPOD with the airframe
-------------------------------------

Mounting and Orientation
^^^^^^^^^^^^^^^^^^^^^^^^






.. warning:: Make sure neither your Drone nor the FlytPOD are powered before you proceed.

* **Drone and FlytPOD Orientation**

FlytPOD should be mounted in such a way that the front of the FlytPOD is aligned with the heading of the drone.

.. tip:: You can choose to mount the FlytPOD in a different direction. For this, change the Autopilot Orientation in the Sensor calbration tab in FlytConsole.


.. figure:: /_static/Images/xyz.png
	:align: center
	:scale: 50 %
	
	FlytPOD Orientation 


* **Mount points**

You can use M3 screws for mounting the FlytPOD onto the Drone. Image shows the mount holes available.

.. figure:: /_static/Images/mount_holes.png
	:align: center
	:scale: 50 %
	 
	Mount Holes for mounting FlytPOD onto the drone


Motor Connections
^^^^^^^^^^^^^^^^^



Multicopters
++++++++++++

 
According to your platform connect upto 8 motors (ESCs) to the PWM output channel. Following image shows the motors numbered on various platforms according to their position. Plugin the Signal cable from the corresponding ESC in exactly the same PWM output channel. e.g. Motor 3 on your platform should be connected to PWM out 3 channel.

Click `here <http://pixhawk.org/platforms/multicopters/start>`_ for more information on Multicopters.



.. image:: /_static/Images/quad.png
		:height: 450px
		:width: 900px
		:align: center

		

	

.. image:: /_static/Images/hex.png
		:height: 450px
		:width: 900px
		:align: center

		

	

.. image:: /_static/Images/oct.png
		:height: 450px
		:width: 900px
		:align: center








Fixed Wing
++++++++++

Click `here <https://pixhawk.org/platforms/planes/start>`_ for more information on Fixed Wing.





VTOL
++++

Click `here <https://pixhawk.org/platforms/vtol/start>`_ for more information on VTOL.





.. .. _click here: https://pixhawk.org/platforms/vtol/start


External GPS-MAG Mounting
^^^^^^^^^^^^^^^^^^^^^^^^^
 



External GPS-MAG can be connected to FlytPOD through the connector provided on the side. Port availble for this is GPS-MAG 1. Use of a Standoff is recommended in order to avoid interference. Make sure to mount it in such a way that drone heading and GPS-MAG board heading match.

.. note:: * Of the two ports provided, GPS-MAG 1 must be used for connecting external GPS-MAG as GPS-MAG 2 is reserved for future       development
          * If you want to place GPS-MAG board on your drone in any other fashion than shown in above diagram then you’ll have to follow extra steps during sensor calibration in flytconsole.




Connecting VI Sensor
^^^^^^^^^^^^^^^^^^^^



As shown in image You need to Connect Battery to the connector labelled ‘Power IN’, ESC’s to the ‘ESC out’, Flytpod to the ‘flytpod power and ‘VI Sens’ to the slot on flytpod for VI sensor.


.. figure:: /_static/Images/PowerModule.png
	:height: 500px
	:width: 700px
	:align: center
	
	PowerModule


RC receiver
^^^^^^^^^^^

RC receiver is powered through ESC output only. (If your ESC does not give 5V output then make sure to power RC receiver separately).


a. PPM: RC receiver in PPM mode. Channel 1 on RC port acts as PPM input when param PWM_PPM_SEL = 1 which can be changed from FlytConsole.
      
   .. note:: By default PPM mode is enabled.
  

b. PWM: RC receiver in PWM mode. Channel 1 to 8 on RC port act as 8xPWM input when param PWM_PPM_SEL = 0 which can be changed from FlytConsole.
   
c. SPEK

d. SBUS
      
   .. warning:: Before you power up your device make sure no props are attached to the motors.
      
   
   


Configuring FlytPOD with FlytConsole
------------------------------------


In the above steps we saw how to configure the Onboard Router and how to integrate FlytPOD to your drone. After finishing the hardware configurations, you can now move on to FlytConsole.

To learn more about FlytConsole, look at the `FlytConsole documentation`_.

.. intro and link to about FlytConsole

Following are the steps to configure FlytPOD with FlytConsole:

1. To launch FlytConsole go to this address ``http://<enter FlytPOD's ip address>:9090/flytconsole``.


   .. .. note:: Before you select your frame make sure the ESC is not connected to the supply.

   .. note:: Before you proceed check your connection status in FlytConsole. 
  
    

2. Once in FlytConsole, go to Frame Select in the left side bar. Depending upon the actual frame of your drone, select the frame and click on Save and Reboot. 
   
   .. After this FlytPOD will reboot (FlytConsole will continue working).

   

3. Next go to Motor Config. Here you will be calibrating the ESCs and testing the motors.

   .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

   a) **ESC Calibration**
      
      .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
      					* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
      					
      
      

      Use of default min, max and number of actuators is recommended. Click on Start Calibration after completing the settings.
      After ESC Calibration, the next thing to be done is Motor Testing.

      
   b) **Motor Testing**
      
     

      .. note:: You need to power the ESCs for this.
          

      You can test the direction of rotation and order of the motors here.
      Every adjacent motor to current one should rotate in the opposite direction.

      To test this click on the motors shown on FlytConsole and see if your motors rotate in the correct direction.

      .. note:: In case your motors rotate in the incorrect direction, you can swap the ESC cables and make the motors rotate in the desired direction.

      .. Please follow the instructions given on FlytConsole to know more about motor testing.
      
4. After motor configuration its now time to calibrate your Sensors and RC.

   a) **Sensor Calibration**
   
      Sensor calibration is of utmost importance before you fly the drone. You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not the same as that of your vehicle, update AUTOPILOT_ORIENTATION parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update EXT_MAG_ROTATION parameter.
      Please follow the steps given in FlytConsole. The other sensors to be calibrated for correct attitude are given below:

      1. Accelerometer Calibration
      2. Gyroscope Calibration
      3. Magnetometer Calibration
      4. Level Calibration
         
      Click on Save and Reboot once you finish Sensor Calibration.
      
      Once the sensors are calibrated you can move on to RC Calibration.
      
   b) **RC Calibration**
      
      .. important:: Flyt can be used without RC, but we recommend having an emergency RC pilot ready in case something goes wrong.
      
      
      Following are the prerequisites for RC Calibration:
    
      1. You need a minimum six channel radio to use with Flyt.
      2. Four channels for roll, pitch, yaw and throttle.
      3. A three way switch for testing with RC modes.
      4. A two way switch for Manual override.
      5. A two way optional switch for Return to Launch mode.
      6. Please follow instructions in FlytConsole.
         
      Reboot the autopilot after this by clicking on Save and Reboot.

      .. 7. Select the type of receiver if you cannot see the data for RC.
      
      .. 9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)

      .. gains part	
		
.. 6. With the above settings done, you now have to reboot the autopilot.

5. After Sensor and RC calibration, Gains have to be tuned to control the autopilot attitude and position control. You can choose to use the default settings for Gains tuning.

6. Now you are ready to fly.
7. It is recommended to use the RC when testing for the first time.
8. If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
9. Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
    
.. warning:: Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.

.. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Calibration and Parameter settings.



.. |click_here| raw:: html

   <a href="flytpod:9090/flytconsole" target="_blank">click here</a>





	


|br|








.. _FlytConsole: https://flytpod:9090/flytconsole


   
.. _Fixed wings/Planes: https://pixhawk.org/platforms/planes/start


   
.. _VTOL: https://pixhawk.org/platforms/vtol/start

.. _Multicopters: https://pixhawk.org/platforms/multicopters/start



.. _FlytConsole documentation: http://docs.flytbase.com/docs/FlytPOD/GettingStarted/About_FlytConsole.html






.. |br| raw:: html

   <br />
   
   