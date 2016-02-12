
FlytConsole
===========



.. 1. To launch FlytConsole enter this address http://"enter ip address here" :9090.

FlytConsole is a web application that gives you an interface to cofigure your drone with Flyt. 

The various components included in FlytConsole are as follows:

DASHBOARD
"""""""""

Once FlytConsole launches you are greeted by the Dashboard. The Dashboard displays the Connection status, Battery,GPS and vehicle status, Frame type and other widgets that give you the current status of your drone.

.. .. note:: Before you select your frame make sure the ESC is not connected to the supply.

.. .. note:: Before you proceed make sure you are connected to FlytPOD.
  

CONFIGURATION
"""""""""""""

In Configuration you can select the frame-type of your drone. You are provided with several predefined options of multicopter and fixed wing configurations. These configurations are further subdivided based on the make of the drone.

Depending upon the actual frame of your drone ,select the frame and click apply. After this FlytPOD will reboot however,FlytConsole will continue working.



MOTOR CONFIGURATION
"""""""""""""""""""


In Motor Configuration you can calibrate the ESCs and test the motors.

ESC Calibration
+++++++++++++++


   
   .. .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

ESC Calibration requires the following fields to be filled:

      
      

1. Min PWM Value
2. Max PWM Value
3. Number of Actuators
         
The min and max PWM values basically are the expected values from the FlytPOD to the ESCs. If the expected values are different from the values set in the feilds above, the drone will behave differently. Number of actuators is the number of motors depending upon the frame selected by you in Configuration. FlytConsole consists of some predefined default values that can be changed. 

Once you have set the min, max and number of actuators, click on Start Calibration. You will see a message saying 'Calibration started'. This marks the start of Stage 1 of ESC Calibration. Disconnect the power from the ESCs and click on Next.  

As soon as the EScs are powered they recieive a high PWM value to get into the Calibration mode. This is stage 2. There is also a window to for time duration(in seconds). The ESCs will receive high PWM value for this time duration set by you. After the time out the ESCs will automatically receive low PWM value and thus stage 3 begins. You can also disable it so you can manually lower it down by clicking on next.

In stage 3 , wait for the timer to finish. You can enter this stage manually by unchecking the Automtic PWM high time in seconds.

Stage 4 marks the end of ESC Calibration. Click on Finish.  

   
.. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
     				* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
     				* Please follow the FlytConsole instructions.
     				* It is recommended that you use the default values for minimum and maximum PWM values and for the number of Actuators.
   
.. .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
..      				* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
..      				* Please follow the FlytConsole instructions.
..      				* It is recommended that you use the default values for minimum and maximum PWM values and for the number of Actuators.

   

   .. .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
   .. 					* Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
   .. 					* Please follow the FlytConsole instructions.
   .. 					* It is recommended that you use the default values for minimum and maximum PWM values and for the number of Actuators.
     
   

      

      .. After ESC Calibration, the next thing to be done is Motor Testing.

Motor Testing
+++++++++++++


   

FlytConsole allows you to test the direction of rotation of your motors on your drone. In Motor testing you can do this by clicking on the respective motor that you want to test. Once you click on the motor, it will start rotating and you can check whether the direction of rotation is corrct or not. Every adjacent motor to current one should rotate in the opposite direction. 

.. important:: * You need to power the ESCs for this.
     				* In case your motor rotates in the incorrect direction, you can swap any two of the ESC cables going to the motor and make the motor rotate in the desired direction.
     				* If the incorrect motor is rotating, switch PWM wires going to the ESCs from the controller to the right channel.
     				* If none of the motors rotate, check the connections again.
     					  

There is also a provision for setting the time of rotation for the motors.

CALIBRATION
"""""""""""

Sensor Calibration
++++++++++++++++++


   
Sensor calibration is of utmost before you fly the drone. You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not the same as that of your vehicle, update AUTOPILOT_ORIENTATION parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update EXT_MAG_ROTATION parameter.
   
Please follow the steps given in FlytConsole. The other sensors to be calibrated for correct attitude are given below:


   .. 1. Accelerometer Calibration 
   .. 2. Gyroscope Calibration
   .. 3. Magnetometer Calibration
   .. 4. Level Calibration

   ..  gjjjjj


**Accelerometer Calibration**
Hold the device steady in all the six directions( x, -x, y, -y, z, -z) for sometime. You will be notified when the current orientation is detected and calibration begins for that orientation. Keep steady till you are notified to change to a new direction.

**Gyroscaope Calibration**
Keep the device steady without movement in a single state till the calibration ends. You will be notified when the calibrtion ends.

**Magnetometer Calibration**
This is similar to Accelerometer Calibration with an additional step of rotating the system in vertical axis in every orientation thereby covering all six directions.

**Level calibration**
Keep the device steady in flat position on a levelled surface or the floor.

Parameters need to be saved and autopilot is to be rebooted by clicking on the Reboot button.
   
   

RC Calibration
++++++++++++++
      

   
Connect the Throttle, Roll, Pitch and Yaw to the respective RC channels. Also, set the Threshold for two way manual override and three way RC mode switches and their channels.

Once you click on Start you are told to lower the throttle switch all the way down and reset all the transmitter trims to center. After this click on Next.

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

Once this is done map RC modes to three way switch channel and manual override to a switch channel in lower half of the page and set their thresholds.
	
	
.. important:: * Flyt can be used without RC, but we recommend having an emergency RC pilot ready in case something goes wrong.
					* You need a minimum six channel radio to use with Flyt.
					* Four channels for roll, pitch, yaw and throttle.
					* A three way switch for testing with RC modes.
					* A two way switch for Manual override.
					* A two way optional switch for Return to Launch mode.
					* Please follow instructions in FlytConsole. 
   				

Autopilot has to be rebooted after this.
   

.. 8. Select the type of receiver if you cannot see the data for RC.
      
.. 9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)	

GAINS TUNING
""""""""""""

Gains tuning page consists of basic and advanced settings.

**Basic**
These are the mostly used gains that require to be tuned depending upon the attitude control response of the autopilot.

**Advanced**
All parameters used throughout the the FlytOS. These can be changed if at all they need to be changed.

Once done you need to save the parameters.



GCS
"""
 
After completing all the above mentioned settings you are now ready to fly and test the basic navigation capabilities provided by the GCS app.
   

The functionality of GCS can be divided into three parts:

**Set the mission for your drone:**
Get Waypoints - shows you the current mission.
Set waypoints - allows you to set a new list of waypoints for your drone.
Clear mission will clear the waypoints.
Execute will make the drone execute the set mission.
Pause will make the drone hover in its current position and not proceed until the mission is executed/resumed again.




**Basic Functions for commanding the drone:**
TAKE OFF : Arms the drone and makes it hover at a defined height.
LAND : Commands the drone to land.
DISARM : Disarms the drone.
HOVER : Mixer output is passed to the ESCs.
   
   
   





**Flyt Inspector:**
Flyt Inspector streams live data from the drone. Following data is streamed from the drone:
Battery: gives the voltage and current consumed by the FlytPOD.
GPS: gives the current latitude , longitude and altitude of the drone.
IMU: gives the current attitude with respect to NED.
Local Position: gives the position of the drone with respect to the home position.
HUD: https://en.wikipedia.org/wiki/Head-up_display

.. ( have to google it).

MAG: 3 axis magnetometer provides the magnetic field along all three axes.
RC IN: gives the input value received by FlytPOD because of RC.




You are now ready to fly.


.. It is recommended to use the RC when testing for the first time.
.. If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
.. Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
    
    .. warning:: Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.

.. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Calibration and Parameter settings.



.. |click_here| raw:: html

   <a href="flytpod:9090/flytconsole" target="_blank">click here</a>
