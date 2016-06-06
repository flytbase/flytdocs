.. _flytconsole widgets:

FlytConsole - Widgets
=====================

.. important:: This site is under active development.



.. 1. To launch FlytConsole enter this address http://"enter ip address here" :9090.

.. FlytConsole is a web application that gives you an interface to configure your drone with Flyt. 

.. _FlytConsole_launch:

Connect to FlytConsole
""""""""""""""""""""""

Factory default mode of FlytPOD is access point mode(AP Mode) in which case connect to ``flytpod_wifi`` network the default password for which is ``FlytPOD123``. However if you have reconfigured the router in client mode then connect to your home wifi network.

If you are in client mode flytpod_wifi will cease to exist.


Go to ``http://flytpod:9090/flytconsole`` on your web browser to launch FlytConsole. 


.. important:: In case the above URL does not work replace ``flytpod`` with ``FlytPOD's IP address``.

.. The various components included in FlytConsole are as follows:

Dashboard
"""""""""

Upon launch you are greeted by the Dashboard. The Dashboard displays the Connection status, Battery monitor, GPS status, Frame type and other widgets that give you the current status of your drone.


.. figure:: /_static/Images/Dashboard.png
	:align: center 
	:scale: 50 %
	
	Dashboard displaying the various Widgets

.. .. note:: Before you select your frame make sure the ESC is not connected to the supply.

.. .. note:: Before you proceed make sure you are connected to FlytPOD.

.. .. figure:: /_static/Images/xyz.png
	:align: center
	:scale: 50 %
	
	FlytPOD Orientation   

.. _Frame_select:


Frame Select
""""""""""""


.. figure:: /_static/Images/frameSelect.png
	:align: center
	:scale: 50 %
	
	Frame Select displaying different airframes


Frame Select allows you to select the airframe-type of your drone. You are provided with several predefined options of multi-copter and fixed wing configurations. These configurations are further subdivided based on the make of the drone.

Depending upon the actual frame of your drone, select the airframe and click on **Save and Reboot** to reboot FlytOS.



.. _Motor_config:

Motor Configuration
"""""""""""""""""""


Motor Configuration lets you calibrate the ESCs and test the motors attached to your drone.

.. _ESC_calibration:

ESC Calibration
+++++++++++++++




   
.. .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

ESC Calibration requires the following fields to be filled:

      
      

1. Min PWM Value
2. Max PWM Value
3. Number of Actuators
         
The min and max PWM values are the expected values from the FlytPOD to the ESCs. If the expected values are different from the values set in the fields above, the drone will behave differently. Number of actuators is the number of motors depending upon the airframe selected by you in Frame Select. FlytConsole consists of some predefined default values that can be changed. 

.. figure:: /_static/Images/escCalibration.png
	:align: center
	:scale: 50 %
	
	Min PWM values, Max PWM Values and Number of Actuators for ESC Calibration

Once you have set the ``Min PWM values , Max PWM values and Number of Actuators`` click on **Start Calibration**. You will see a message saying ``Calibration started``. This marks the start of Stage 1 of ESC Calibration. Disconnect the power from the ESCs and click on **Next**. 

.. figure:: /_static/Images/stage1esc.png
	:align: center
	:scale: 50 %

	Stage 1 

Stage 2 involves setting the time duration(in seconds) for the PWM high time in stage 3. After this connect the power to the ESCs and click on **Next**. 

.. figure:: /_static/Images/stage2esc.png
	:align: center
	:scale: 50 %

After the time out the ESCs will automatically receive low PWM value. This is stage 3.You can enter this stage manually by disabling the Automatic PWM high time in seconds and click on **Next**.

Stage 4 marks the end of ESC Calibration. Click on **Finish**.  

.. figure:: /_static/Images/stage3esc.png
	:align: center
	:scale: 50 %



   
.. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
     				* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
     				* It is recommended that you use the default values for minimum and maximum PWM values and the default number of Actuators.

.. .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
..      				* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
..      				* Please follow the FlytConsole instructions.
..      				* It is recommended that you use the default values for minimum and maximum PWM values and for the number of Actuators.

   

   .. .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
   .. 					* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
   .. 					* Please follow the FlytConsole instructions.
   .. 					* It is recommended that you use the default values for minimum and maximum PWM values and for the number of Actuators.
     
   

      

      .. After ESC Calibration, the next thing to be done is Motor Testing.

.. _Motor_test:

Motor Testing
+++++++++++++

.. figure:: /_static/Images/motorTesting.png
	:align: center
	:scale: 50 %
	
	Motor Testing for the airframe selected

   

FlytConsole allows you to test the direction of rotation of your motors attached to your drone. In Motor testing you can do this by clicking on the respective motor that you want to test. Once you click on the motor, it will start rotating and you can check whether the direction of rotation of the corresponding motor on your drone is correct or not.

.. important:: * You need to power the ESCs for this.
     				* In case your motor rotates in the incorrect direction, you can swap any two of the ESC cables going to the motor and make the motor rotate in the desired direction.
     				* If the incorrect motor is rotating, switch PWM output wires going to the ESCs from the controller to the right channel.
     				* If none of the motors rotate, check the connections again.
     					  

There is also a provision for setting the time of rotation for the motors.



.. _Calibration:

Calibration
"""""""""""

.. _Sensor_calibration:


Sensor Calibration
++++++++++++++++++


.. figure:: /_static/Images/sensorCalibration.png
	:align: center
	:scale: 50 %
	
	Sensor Calibration comprising of Accel, Gyro, Mag and Level Calibration  

   


Sensor calibration is of utmost importance before you fly your drone. The sensors to be calibrated for correct attitude are given below:


.. 1. Accelerometer Calibration 
.. 2. Gyroscope Calibration
.. 3. Magnetometer Calibration
.. 4. Level Calibration

..  gjjjjj


**Accelerometer Calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Accel Calibration** to begin.

.. figure:: /_static/Images/accelcalib.png
	:align: center
	:scale: 50 %

Hold the drone steady in all the six directions( x, -x, y, -y, z, -z) for sometime. You will be notified when the current orientation is detected and when calibration begins for that orientation. Keep steady till you are notified to change to a new direction.

.. figure:: /_static/Images/accelcalib1.png
	:align: center
	:scale: 50 %



**Gyroscope Calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Gyro Calibration** to begin.

.. figure:: /_static/Images/gyrocalib.png
	:align: center
	:scale: 50 %

Keep the drone steady without movement in a single state till the calibration ends. You will be notified when the calibration ends.

.. figure:: /_static/Images/gyrocalib1.png
	:align: center
	:scale: 50 %

**Magnetometer Calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Mag Calibration** to begin.

.. figure:: /_static/Images/magcalib.png
	:align: center
	:scale: 50 %


You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not the same as that of your drone, update ``AUTOPILOT ORIENTATION`` parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update ``EXT MAG ROTATION`` parameter.
This is similar to Accelerometer Calibration with an additional step of rotating the drone in vertical axis in every orientation
thereby covering all six directions.

.. figure:: /_static/Images/magcalib1.png
	:align: center
	:scale: 50 %

**Level calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Level calibration** to begin.

.. figure:: /_static/Images/levelcalib.png
	:align: center
	:scale: 50 %

Keep the drone steady in flat position on a leveled surface on the floor.

.. figure:: /_static/Images/levelcalib1.png
	:align: center
	:scale: 50 %

Save the parameters and reboot the autopilot by clicking on **Reboot**.



.. _RC_calibration:
   

RC Calibration
++++++++++++++
      
.. figure:: /_static/Images/rcCalibration.png
	:align: center
	:scale: 50 %
	
	Radio Controller Calibration

   
Connect the Throttle, Roll, Pitch and Yaw to the respective RC channels. Also, set the Threshold for two way manual override and three way RC mode switches and their channels.

Once you click on **Start** you are told to lower the throttle switch all the way down and reset all the transmitter trims to center. After this click on **Next**.


Following is a list of pin positions for the next few steps:

* Throttle up position
* Throttle down position
* Yaw right position
* Yaw left position
* Pitch up position
* Pitch down position
* Pitch brought to center
* Switches min and max values
* Switch/Pot/Pin for flags
* Flag up position
    


.. note:: Hold in these positions for a few seconds till you get a message feedback.

Once this is done map RC modes to three way switch channel and manual override to a switch channel in the lower half of the page and set their thresholds.
	
	
.. important:: * Flyt can be used without RC, but we recommend having an emergency RC pilot ready in case something goes wrong.
					* You need a minimum six channel radio to use with Flyt.
					* Four channels for roll, pitch, yaw and throttle.
					* A three way switch for testing with RC modes.
					* A two way switch for Manual override.
					* A two way optional switch for Return to Launch mode.
					* Please follow the instructions in FlytConsole. 
   				



.. figure:: /_static/Images/rcCalibration2.png
	:align: center
	:scale: 50 %
	
	Threshold Setters     

.. 8. Select the type of receiver if you cannot see the data for RC.
      
.. 9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)	



.. _Gain_tuning:

Parameter Manager
"""""""""""""""""

Parameter manager consists of Gain tuning and Advanced settings.


**Basic**

These are the gains that are mostly used and require to be tuned depending upon the attitude control response of the autopilot.


.. figure:: /_static/Images/gainsBasic.png
	:align: center
	:scale: 50 %
	
	Basic Gain Tuning  



**Advanced**

These are all parameters used throughout FlytOS. These can be changed if at all they need to be changed.

.. figure:: /_static/Images/gainsAdvanced.png
	:align: center
	:scale: 50 %
	
	Advanced Settings  



Once this is done, save the parameters.



GCS
"""

After completing all the above mentioned settings you are now ready to fly and test the basic navigation capabilities provided by the GCS.
   

.. figure:: /_static/Images/gcs.png
	:align: center
	:scale: 50 %
	
	Basic navigation through GCS 


The functionality of GCS can be divided into three parts:



**Set mission for your drone**

1. Get Waypoints - shows you the current mission.
2. Set Waypoints - allows you to set a new list of waypoints for your drone.
3. Clear - will clear the waypoints.
4. Execute - will make the drone execute the set mission.
5. Pause - will make the drone hover in its current position and not proceed until the mission is executed/resumed again.




**Basic Functions for commanding the drone**

1. TAKE OFF - arms the drone and makes it hover at a height.
2. LAND - commands the drone to land.
3. DISARM - disarms the drone.
4. HOVER - makes the drone hover at its current location.




**Flyt Inspector**

Flyt Inspector streams live data from the drone.


.. figure:: /_static/Images/flightInspector.png
	:align: center
	:scale: 50 %
	
	Flight Inspector  


Following data is streamed from the drone:

1. Battery - gives the voltage and current consumed by the FlytPOD.
2. GPS - gives the current latitude, longitude and altitude of the drone.
3. IMU - gives the current attitude with respect to NED.
4. Local Position - gives the position of the drone with respect to the home position.
5. RC IN - gives the input value received by FlytPOD because of RC.

You have now finished configuration. Please go through the :ref:`First principles of flying<First_Principles>` and :ref:`First flight with FlytPOD<First_Flight>` sections before you proceed with flying your drone and make sure you understand all the :ref:`Safety guidelines<Safety_Guidelines>`.


.. It is recommended to use the RC when testing for the first time.
.. If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
.. Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
    
    .. warning:: Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.

.. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Calibration and Parameter settings.

.. |click_here|

.. .. |click_here| raw:: html

..    <a href="flytpod:9090/flytconsole" target="_blank">click here</a>
