
FlytConsole
===========



1. To launch FlytConsole `click here`_.  
2. Once FlytConsole launches you are greeted by the Dashboard. The Dashboard displays the Battery, GPS, namespace and other widgets that give you the current status of your drone.

   .. note:: Before you select your frame make sure the ESC is not connected to the supply.
  

3. To begin configuring your drone, first go to Config. Here you have to select the frame-type of your drone. You are provided with several predefined options of drone configurations. These configurations are further subdivided based on the make of the drone. Depending upon the actual frame of your drone ,select the frame and click apply. After this FlytPOD will reboot( FlytConsole will work).

   

4. Next go to Motor Config. Here you will be calibrating the ESCs and testing the motors.

   .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

   a) **ESC Calibration:**

      1. Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it.
      2. Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.
      3. Please follow the FlytConsole instructions.
      4. We recommend using default min, max and actuator number.

      After ESC Calibration, the next thing to be done is Motor Testing.

      
   b) **Motor Testing:**
      
     

      .. note:: You need to power the ESCs for this.
      

      You can test the direction of rotation and order of the motors here.
      Every adjacent motor to current one should rotate in the opposite direction.

      To test this click on the motors shown in the image given on FlytConsole and see whether your motors rotate in the correct direction.

      .. note:: In case your motors rotate in the incorrect direction, you can swap the ESC cables and make the motors rotate in the desired direction.
      
5. Time to calibrate your Sensors and RC

   a) **Sensor Calibration:**
   
      Sensor calibration is a must before you fly the drone. You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not same as that of your vehicle, update AUTOPILOT_ORIENTATION parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update EXT_MAG_ROTATION parameter.
      Please follow the steps given in FlytConsole. List of calibrations to be done is given below.

      1. Accelerometer Calibration
      2. Gyroscope Calibration
      3. Magnetometer Calibration
      
      Once the sensors are calibrated you can move on to RC Calibration.
      
   b) **RC Calibration:**

      1. Flyt can be used without RC, but we recommend having an emergency RC pilot ready in case something goes wrong.
      2. You need a minimum six channel radio to use with Flyt.
      3. Four channels for roll, pitch, yaw and throttle.
      4. A three way switch for testing with RC modes.
      5. A two way switch for Manual override.
      6. A two way optional switch for Return to Launch mode.
      7. Please follow instructions in FlytConsole.
      8. Select the type of receiver if you cannot see the data for RC.
      
      .. 9. To read the description of modes and state machine go to (link to internal details page in docs.flytbase.com)	
		
6. With the above settings done, reboot the autopilot.
7. Now you are ready to fly.
8. It is recommended to use the RC when testing for the first time.
9. If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
10. Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
    
    .. warning:: Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.

.. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Calibration and Parameter settings.






.. _click here: flytpod:9090/flytconsole
