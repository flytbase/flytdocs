Getting Started with Flyt
-------------------------


Introduction
============

FlytPOD
^^^^^^^

Acts as the brain which controls your drone. The device consists of flight computer, navigation sensors and communication system.

FlytOS
^^^^^^

Flyt Operating System. Lets you build apps that can control your drone through a set of APIs in REST, CPP and Python.

FlytConsole
^^^^^^^^^^^

Web application for configuring your drone with Flyt. It also provides basic GCS.

Flytkit Contents
================

The contents of FlytKit include: 

* FlytPOD
* MicroSD (Size to be decided) for logging
* MicroSD (32 GB) preloaded with FlytOS v1.0.1
* 2x WiFi antenna
* External GPS-MAG module
* Power board
* Power wall adapter



One Time Setup
==============


.. note:: Initial personalization is optional but we recommended you do this the first time you use the device. Drone is not necessary for this part of the setup.






1. Power up the device using the wall adapter or battery. Wall adapter is provided along with the kit.
   
   .. warning:: Please check Input power ratings on adapter before plugging into it.





2. Next you will have to connext to the FlytPOD wifi network using the FlytPOD default password. It may take a few seconds for the FlytPOD network to appear.

3. Once connected, go to `FlytConsole`_.
   
   .. warning:: If for some reason the above link does not work, try replacing "flytpod" with FlytPOD's IP.




4. Login using default credentials. username, password 

5. You can personalize your FlytPOD by setting up the Namespace, Timezone, Wifi SSID and Wifi Password. For advanced settings go to advanced wifi setup.(tutorial) 

6. Before proceeding to the steps for Drone integration shut down FlytPOD by pressing its power switch as shown in the image and remove 		the power cable.


Flyting your Drone
==================

.. warning:: Make sure neither your Drone nor the FlytPOD are powered before you proceed.




Mounting and Orientation
^^^^^^^^^^^^^^^^^^^^^^^^



* **Drone and FlytPOD Orientation:**

Make sure to mount FyltPOD on the Drone in such a way that the head of the FlytPOD is aligned with the heading of the drone. Following images show various types of platforms with possible heading information.

.. tip:: You can decide to give the drone a different heading. For this change the orientation parameter in the calbration tab in FlytConsole.


* **Mount points:**

You can use M3 screws for mounting the FlytPOD onto the Drone. Image shows the mount holes available.


Platform specific
^^^^^^^^^^^^^^^^^

* Multicopters
""""""""""""""

#. **According to your platform connect upto 8 motors (ESCs) to the PWM output channel:**                                     
	   Following image shows the motors numbered on various platforms according to their position. Plugin the Signal cable from the corresponding ESC in exactly the same PWM output channel. e.g. Motor 3 on your platform should be connected to PWM out 3 channel.

	   
	   
	   


#. **Ext GPS-MAG mounting / orientation and connections:**
	   External GPS-MAG can be connected to FlytPOD through the connector provided on the side. Default port to be used is GPS-MAG 1. Use of a Standoff is recommended in order to avoid interference. Make sure to mount it in such a way that drone heading and GPS-MAG board heading match.

	   .. note:: If you want to place GPS-MAG board on your drone in any other fashion than shown in above diagram then you’ll have to follow extra steps during sensor calibration in flytconsole.

.. image:: /_static/Images/Picture3.png
	:height: 400px
	:width: 600px
	:align: center



.. image:: /_static/Images/Picture4.png
	:height: 450px
	:width: 470px
	:align: center
	   
#. **Connecting VI sensor, Power board:**
	   As shown in image You need to Connect Battery to the connector labelled ‘Power IN’(Not Now), ESC’s to the ‘ESC out’, Flytpod to the ‘flytpod power and ‘VI Sens’ to the slot on flytpod for VI sensor.


.. image:: /_static/Images/esc3.png
	:height: 500px
	:width: 700px
	:align: center




#. **RC receiver:**
	   RC receiver is powered through ESC output only. (if your ESC doest not give 5V output then make sure to power receiver separately).

	   a. PPM : PPM input from RC receiver. Channel 1 on RC port acts as PPM input when param PWM_PPM_SEL = 1 which can be changed from   flytconsole.
	      
	      .. note:: By default PPM mode is enabled.


	   b. PWM: 8x PWM channels available for connection to RC.Channel 1 to 8 on RC port act as PWM input when param PWM_PPM_SEL = 0. You can change this in FlytConsole.
	   c. SPEK:  Spektrum
	   d. SBUS:


	
.. warning:: Before you power up your device make sure no props are attached to the motors.



* Fixed Wing
""""""""""""

.. image:: /_static/Images/a.png
	:height: 300px
	:width: 300px
	:align: left

.. image:: /_static/Images/b.png
	:height: 250px
	:width: 250px
	:align: right

.. image:: /_static/Images/c.png
	:height: 350px
	:width: 300px
	:align: left

.. image:: /_static/Images/d.png
	:height: 300px
	:width: 350px
	:align: right

.. image:: /_static/Images/e.png
	:height: 300px
	:width: 300px
	:align: left

.. image:: /_static/Images/f.png
	:height: 300px
	:width: 300px
	:align: right

.. image:: /_static/Images/Picture7.png
	:height: 300px
	:width: 300px
	:align: center


For information regarding fixed wings/planes go to the following `link`_ 

* For more info on various platforms and Drone-building `click here`_ 



FlytPOD power/bring up
^^^^^^^^^^^^^^^^^^^^^^




* Power up FlytPOD using the the battery.
  

* Once FlytPOD is powered , check the following:
  

1.  Expected status: RGB LED Fast flashing red light
2.  Buzzer Beeps: ?



.. note:: In case the device behaves differently check out the forum link…(forum)


FlytConsole
^^^^^^^^^^^

1. To launch FlytConsole go to  https://flytpod:9090/flytconsole.
2. Once FlytConsole launches you are greeted by the Dashboard . The Dashboard displays the Wifi, Battery and GPS and other widgets that 	 give you the current status of your drone.
3. To begin configuring your drone, first go to config. Here you have to select the frame of your drone. You are provided with several		 pre defined options of drone configurations. These configurations are further subdivided based on the make of the drone. Depending 		 upon the actual frame of your drone ,pick the frame in FyltConsole and apply. After this FlytPOD will reboot( FlytConsole will work).

   .. note:: Before you select your frame make sure the ESC is not connected to the supply.



4. Next go to Motor Config. Here you will be calibrating the ESCs and testing the motors.

   .. warning:: Make sure no propellers are attached to the motors before you  proceed with ESC calibration.

   a) **ESC Calibration:**

      1. Not all ESC’s need range calibration. Please consult your esc user documentation before you do it.
      2. Also this is one time setup which is NOT required to be done again until you change one or more of your ESC’s.
      3. Please follow the flytconsole instructions.
      4. We recommend using default min, max and actuator no.

      
   b) **Motor Testing:**
      
      The next thing to be done is Motor testing.(You need to power ESCs for this.)
   
      You can test the direction of rotation and order of the motors here.
      ll the motors connected adjacent to one another must rotate in the opposite direction.

      To test this click on the motors shown in the image given on FlytConsole and see whether your motors rotate in the correct direction.

      .. note:: In case your motors rotate in the incorrect direction, you can swap the ESC cables and make the motors rotate in the desired direction.
      
5. Time to Calibrate your sensors and RC

   a) **Sensor Calibration:**
   
      Sensor calibration is a must before you fly the drone. You need to calibrate magnetometer everytime you change the flying field. If your autopilot orientation is not same as that of your vehicle, update AUTOPILOT_ORIETATION parameter accordingly. Similarly, If your external magnetometers’ orientation differ from FlytPOD, update EXT_MAG_ROTATION paramter.
      Please follow the steps given in FlytConsole. List of calibrations to be done.

      1. Accelerometer Calibration
      2. Gyroscope Calibration
      3. Magnetometer Calibration
      
      Once the sensors are calibrated you can move on to RC Calibration.
      
   b) **RC calib:**

      1. Flyt can be used without RC, but we recommend having a emergency RC pilot ready in case something goes wrong.
      2. You need minimum 6 channel radio to use with Flyt.
      3. 4 channels for roll, pitch, yaw,  throttle.
      4. A 3 way switch for testing with RC modes.
      5. A Two way switch for Manual override.
      6. A two way optional switch for Return to Launch mode.
      7. Please follow instructions in flytconsole.
      8. Select the type of receiver if you cannot see the data for RC.
      9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)	
		
6. With above things set, now gracefully reboot the +back to be ready to fly.
7. Now you are ready to fly.
8. It is recommended to use the RC when testing it for the first time.
9. If the RC is not connected, flytpod will go to API_Mode by default. Use API_mode switch to control drone from RC.
10. Before you arm the flytPOD make sure that the propeller position is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
11. Even if you  fly in API mode have a RC pilot ready to take control in case of emergency.
12. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Wifi and Calibration and Parameter settings.






.. _FlytConsole: https://flytpod:9090/flytconsole


   
.. _link: https://pixhawk.org/platforms/planes/start


   
.. _click here: https://pixhawk.org/platforms/multicopters/start






.. |br| raw:: html

   <br />
   
   