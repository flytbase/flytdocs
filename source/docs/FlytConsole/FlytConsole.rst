.. _flytconsole widgets:

FlytConsole - Widgets
=====================

.. important:: This site is under active development.



.. 1. To launch FlytConsole enter this address http://"enter ip address here" :9090.

.. FlytConsole is a web application that gives you an interface to configure your drone with Flyt. 

.. _FlytConsole_launch:

Connect to FlytConsole
""""""""""""""""""""""

FlytPOD is shipped with WiFi set to Hotspot(AP mode) with WiFi SSID and password FlytPOD123. If the device running FlytOS is connected to your home network, open the link below in your browser to launch FlytConsole after connecting your personal system to the same network as the device running FlytOS.

* http://flytpod/flytconsole

.. * https://flytpod/flytconsole




.. important:: In case the above URLs do not work replace ``flytpod`` with ``FlytPOD's IP address``.

.. The various components included in FlytConsole are as follows:

Dashboard
"""""""""

Upon launch you are greeted by the Dashboard. The Dashboard displays the Connection status, Battery status, GPS status, Frame type and RC Mode.


.. figure:: /_static/Images/DashboardFc.png
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


.. figure:: /_static/Images/FrameSelect_new.png
	:align: center
	:scale: 50 %
	
	Frame Select displaying different airframes


Frame Select allows you to select the airframe-type of your drone. You are provided with several predefined options of multi-copter and fixed wing configurations. These configurations are further subdivided based on the make of the drone.

Depending upon the actual frame of your drone, select the airframe and click on **Save and Reboot**.



.. _Motor_config:

Calibration
"""""""""""

This widget shows you options to calibrate your sensors, ESCs and  RC, test your motors and configure RC modes.

.. .. note:: Motor Configuration widget is compatible with only FlytPOD.



.. Motor Configuration lets you calibrate the ESCs and test the motors attached to your drone. 

.. figure:: /_static/Images/Calibration.png
	:align: center
	:scale: 50 %
	
	Calibration


.. _ESC_calibration:

ESC Calibration
+++++++++++++++




   
.. .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

ESC Calibration requires the following fields to be filled:

      
      

1. Min PWM Value
2. Max PWM Value
3. Number of Actuators
         
The Min and the Max PWM values set the range of the expected values from FlytPOD/PRO to the ESCs. Any value received from the RC beyond this range is converted to the min or max value. Number of actuators is the number of motors depending upon the airframe selected by you in Frame Select. FlytConsole consists of some predefined default values that can be changed. 

.. figure:: /_static/Images/escStage0.png
	:align: center
	:scale: 50 %
	
	Min PWM values, Max PWM Values and Number of Actuators for ESC Calibration

Once you have set the ``Min PWM values , Max PWM values and Number of Actuators`` click on **Start Calibration**. You will see a message saying ``Calibration started``. This marks the start of Stage 1 of ESC Calibration. Disconnect the power from the ESCs and click on **Next**. 

.. figure:: /_static/Images/escStage1.png
	:align: center
	:scale: 50 %

	Stage 1 

Stage 2 involves setting the time duration(in seconds) for the PWM high time in stage 3. After this connect the power to the ESCs and click on **Next**. 

.. figure:: /_static/Images/escStage2.png
	:align: center
	:scale: 50 %

	Stage 2

.. figure:: /_static/Images/escStage3.png
	:align: center
	:scale: 50 %

	Stage 3

After the time out the ESCs will automatically receive low PWM value. This is stage 3.You can enter this stage manually by disabling the Automatic PWM high time in seconds and click on **Next**.

Stage 4 marks the end of ESC Calibration. Click on **Finish**.  

.. figure:: /_static/Images/escStage4.png
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

.. figure:: /_static/Images/Motor_test.png
	:align: center
	:scale: 50 %
	
	Motor Testing for the airframe selected

   

FlytConsole allows you to test if the motors are correctly connected. In Motor testing you can do this by clicking on the respective motor that you want to test. Once you click on the motor, it will start rotating and you can check whether the direction of rotation of the corresponding motor on your drone is correct or not.

.. important:: * You need to power the ESCs for this.
     				* In case your motor rotates in the incorrect direction, you can swap any two of the ESC cables going to the motor and make the motor rotate in the desired direction.
     				* If the incorrect motor is rotating, switch PWM output wires going to the ESCs from the controller to the right channel.
     				* If none of the motors rotate, check the connections again.
     					  

There is also a provision for setting the time of rotation for the motors.



.. _Calibration:


.. _Sensor_calibration:


Sensor Calibration
++++++++++++++++++


.. figure:: /_static/Images/SensorCalibration.png
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

.. figure:: /_static/Images/AccelCalibration.png
	:align: center
	:scale: 50 %

Hold the drone steady in all the six directions( x, -x, y, -y, z, -z) for sometime. You will be notified when the current orientation is detected and when calibration begins for that orientation. Keep steady till you are notified to change to a new direction.

.. figure:: /_static/Images/AccelCal1.png
	:align: center
	:scale: 50 %



**Gyroscope Calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Gyro Calibration** to begin.

.. figure:: /_static/Images/GyroCalibration.png
	:align: center
	:scale: 50 %

Keep the drone steady without movement in a single state till the calibration ends. You will be notified when the calibration ends.

.. figure:: /_static/Images/Gyro.png
	:align: center
	:scale: 50 %

**Magnetometer Calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Mag Calibration** to begin.

.. figure:: /_static/Images/MagCalibration.png
	:align: center
	:scale: 50 %


You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not the same as that of your drone, update ``AUTOPILOT ORIENTATION`` parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update ``EXT MAG ROTATION`` parameter.
This is similar to Accelerometer Calibration with an additional step of rotating the drone in vertical axis in every orientation
thereby covering all six directions.

.. figure:: /_static/Images/MagCalib1.png
	:align: center
	:scale: 50 %

**Level calibration**

Set the ``AUTOPILOT ORIENTATION`` if the orientation of the frame and FlytPOD are different. Click on **Start Level calibration** to begin.

.. figure:: /_static/Images/LevelCalibration.png
	:align: center
	:scale: 50 %

Keep the drone steady in flat position on a leveled surface on the floor.

.. figure:: /_static/Images/Gyro.png
	:align: center
	:scale: 50 %



.. _RC_calibration:
   

RC Calibration
++++++++++++++
      
.. figure:: /_static/Images/Rcparamfc.png
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

RC Mode Settings
++++++++++++++++

Map the RC mode switch to a three way switch channel and manual override to a two way switch channel and set their thresholds.
	
	
.. important:: * Flyt can be used without RC, but we recommend having an emergency RC pilot ready in case something goes wrong.
					* You need a minimum six channel radio to use with Flyt.
					* Four channels for roll, pitch, yaw and throttle.
					* A three way switch for testing with RC modes.
					* A two way switch for Manual override.
					* A two way optional switch for Return to Launch mode.
					* Please follow the instructions in FlytConsole. 
   				



.. figure:: /_static/Images/RcMode.png
	:align: center
	:scale: 50 %
	
	Threshold Setters     

.. 8. Select the type of receiver if you cannot see the data for RC.
      
.. 9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)	



.. _Gain_tuning:

Gain Tuning
"""""""""""

.. Parameter manager consists of Gain tuning and Advanced settings.


These are the gains that are mostly used and are required to be tuned depending upon the stability of the drone's autopilot.

.. figure:: /_static/Images/Gains.png
	:align: center
	:scale: 50 %
	
	Gain Tuning

The outer loop of orientation is controlled by the following parameters:

* Roll control (MC_ROLL_P)
* Pitch control (MC_PITCH_P)
* Yaw control (MC_YAW_P)
  
Inner loop of orientation had the following PID controllers: 

* Roll rate control (MC_ROLLRATE_P, MC_ROLLRATE_I, MC_ROLLRATE_D)
* Pitch rate control (MC_PITCHRATE_P, MC_PITCHRATE_I, MC_PITCHRATE_D)
* Yaw rate control (MC_YAWRATE_P, MC_YAWRATE_I, MC_YAWRATE_D)

Begin with MC gain tuning. Once your drone is capable of stable manual flight, you can move on to MPC gain tuning to accomplish more accurate altitude and position control.

.. note:: The following instructions stand for symmetric drones. If the drone is asymmetric then pitch and roll have to be tuned differently.


MC gains
++++++++

**Parameters: MC_ROLLRATE_P, MC_PITCHRATE_P - P Gains**

For a symmetrical drone the Pitch and Roll values can be same, if the drone is sluggish increase the P gain until it starts oscillating. If the P gain is too high there will be oscillations in that axis, so reduce it until it disappears.


**Parameters: MC_ROLLRATE_D, MC_PITCHRATE_D - D Gains**

After RATE_P tuning  there will be oscillations. Increase the RATE_D until the oscillations disappears. In case the RATE_D is too high the oscillations might still be there. In that case reduce RATE_D slightly.

**Parameters: MC_PITCH_P, MC_ROLL_P**

If there are oscillations tune down P. Increase P if the copter is sluggish.

**Parameters: MC_ROLLRATE_I, MC_PITCHRATE_I - I Gains**

If the roll and pitch rates never reach the setpoint but have an offset, add MC_ROLLRATE_I and MC_PITCHRATE_I gains, starting at 5-10% of the MC_ROLLRATE_P gain value.

**Parameters: MC_YAWRATE_P - Yaw Rate**

This parameter is not critical and can be tuned in flight, in the worst case scenario the yaw response will be sluggish or too fast. Play with FF parameter to get comfortable response.

**Parameters: MC_YAW_P - Yaw Angle**

Rotate it around yaw, and observe the response. It should go slowly back to the initial heading. If it oscillates, tune down P. Once the control response is slow but correct, increase P until the response is firm, but it does not oscillate. 

**Parameters: MC_YAW_FF - Feed forward tuning**

Feed forward weight for manual yaw control. 0 will give slow response and no overshot, 1 - fast response and big overshot.

**Parameters:MC_Pitch TC**

Decrease to make pitch control faster and accurate. Increase the value if its twitchy.

**Parameters: MC_Roll TC**

Decrease to make roll control faster and accurate. Increase the value if its twitchy.

**Parameters: MC_THR_HOVER**

Adjust the throttle to hover the copter in the mid-air. Decrease this value if the hover position is less than the throttle center. Increase the value if the hover is more than throttle center.


After your drone is flying properly in manual mode without oscillations, you can start tuning the MPC gains.

MPC gains
+++++++++

**Parameters: MPC_XY_FF**

Reduce the value to make position control smoother and less twitchy. Increase it for more accurate and aggressive position control.

**Parameters: MPC_Z_FF**

Reduce the value to make altitude control smoother and less twitchy. Increase it for more accurate and aggressive altitude control.

To learn more about gain tuning click `here <http://px4.io/docs/multicopter-pid-tuning-guide/>`_.

Click here to see the complete parameter `list <https://pixhawk.org/firmware/parameters>`_.


Parameter Manager
"""""""""""""""""

These are all parameters used throughout FlytOS. These can be changed if at all they need to be changed.

.. figure:: /_static/Images/Parameters.png
	:align: center
	:scale: 50 %
	
	Parameter Manager  



Once this is done, save the parameters.



WiFi Setup
""""""""""

Please follow the steps given :ref:`here<flytpod router setup>` for WiFi setup for FlytPOD/PRO.

Fail Safe
"""""""""

Fail Safe allows you to assign certain Failsafe actions to be performed by the drone during critical situations viz. Low battery, RC loss, Datalink loss, Geofence, Return Home settings and Land settings.

.. figure:: /_static/Images/Failsafe.png
	:align: center
	:scale: 50 %
	
	Fail Safe 

Video
"""""

Video displays the live stream of video directly being captured by the camera on the drone.

.. figure:: /_static/Images/Video.png
	:align: center
	:scale: 50 %
	
	Video

GCS
"""

After completing all the above mentioned settings you are now ready to fly and test the basic navigation capabilities provided by the GCS.
   

.. figure:: /_static/Images/GCSfc.png
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
3. HOVER - makes the drone hover at its current location.




**Flyt Inspector**

Flyt Inspector streams live data from the drone.


.. .. figure:: /_static/Images/flightInspector.png
.. 	:align: center
.. 	:scale: 50 %
	
.. 	Flight Inspector  


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

.. .. |click_here|

.. .. |click_here| raw:: html

..    <a href="flytpod:9090/flytconsole" target="_blank">click here</a>
