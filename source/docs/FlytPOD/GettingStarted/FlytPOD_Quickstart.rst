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


Getting Started
===============


.. important:: This guide is under active development.





1. Unboxing Flytkit
 
   The FlytKit Includes: 

   * FlytPOD
   * 2 x High Gain 6 dBm WiFi antenna
   * External GPS-MAG module
   * Power Module
   * Wall adapter
   * MicroSD (8 GB) for data-logging
   * MicroSD (32 GB) preloaded with FlytOS
   * FlytPOD flyer with default WiFi password.

   Make sure your FlytKit contains all the above mentioned components.

2. Configure / Protect FlytPOD WiFi:

   * Plug and tighten antennas on FlytPOD.
   * Power on FlytPOD using wall adapter. The RGB led should start breathing red. (Don't worry about it now.) 
   * On you laptop connect to the WiFi network ``FlytPOD_wifi`` with password provided in the flyer shipped with FlytKit.
   * In your laptop browser launch FlytConsole using URL: ``flytpod:9090/flytconsole``.
   * You can configure FlytPOD WiFi in hotspot or client mode. For automatic updates and Google maps to work, you need to connect FlytPOD  to your existing home/university WiFi network using client mode. 
   * Detailed instructions for WiFi setup are given here.
   * Power off FlytPOD by pressing the power button on the back panel for 3 secs. Within few seconds RGB LED should turn amber. 
 
   .. note:: Note that next time you start FlytPOD it will take some time for the RGB led to start up. This behavior will repeat every time you do a graceful shutdown as described above. 



.. ..insert power switch image here

3. Mount FlytPOD on airframe

   * Make sure neither ESCs nor the FlytPOD are powered before you proceed.

   * Drone and FlytPOD Orientation

     FlytPOD should be mounted in such a way that the front of the FlytPOD is aligned with the heading of the drone. The front of the FlytPOD is the x-axis as shown in the diagram below. 

   .. if in some other orientation then change autopilot orientation parameter.

   * Mount points

     You can use M3 screws for mounting the FlytPOD onto the Drone. Image below shows the mount holes available. 
     FlytPOD has internal vibration damping mechanism, still for better performance you can use dampening mounts.


   .. tip:: You can choose to mount the FlytPOD in a different direction. For this, change the Autopilot Orientation in the Sensor calibration tab in FlytConsole.


   .. figure:: /_static/Images/xyz_mountholes.jpg
	   :align: center
	   :scale: 30%
	
	
	
	   FlytPOD Orientation and Mount holes 

.. .. figure:: /_static/Images/xyz.png
.. 	:align: left
.. 	:scale: 50 %
	
.. 	FlytPOD Orientation 



.. .. figure:: /_static/Images/mount_holes.png
.. 	:align: right
.. 	:scale: 50 %
	 
.. 	Mount Holes for mounting FlytPOD onto the drone



4. Mount GPS-MAG, Power Module, Lidar, Camera, Px4flow, etc. Do not connect anything to FlytPOD yet.
5. Connect GPS-MAG as described :ref:`here<GPS_Mag>`.
6. Connect ESC / motor signal pins of your frame as described :ref:`here<PWM_Output>`.
7. Connect RC receiver as described :ref:`here<RC_Receiver>`.
8. Do not connect any extra sensors / payload yet.
9. Plug in power connector and VI sensor connector from power module into FlytPOD as described :ref:`here<Power_Module>`.
10. Do not connect power module to ESC input yet.

    .. important:: Remove propellers from all the motors.

    
    

.. .. important:: Remove all the propellers from the motors.




 

.. .. warning:: Remove all the propellers from the motors.

11. Make sure that you have removed all the propellers.

12. Make sure that you have not connected power module to ESC power input.

13. Connect Battery (10V to 28V) to the power module as described :ref:`here<Power_Module>`.

14. The FlytPOD should boot up now. The RGB LED might take time to turn blue or red if you had done graceful shutdown last time.

15. After a minute when blue WiFi LED starts blinking, connect to WiFi. If you have setup FlytPOD WiFi in client mode, then wait for the FlytPOD to connect to your router.

16. Open the FlytConsole in your laptop using URL: ``flytpod:9090/flytconsole``. 
    
    .. note:: If above URL does not work then there might be some issue with your router's DNS. Please refer to the :ref:`WiFi Section<FlytPOD router setup>` for troubleshooting.

17. In FlytConsole go to **Frame Select** section in the left side-menu.
 
18. Select appropriate frame and click on **Save and Reboot**.
 
19. FlytCosole will take few seconds to reconnect. WiFi network will not be disconnected during this reboot.
 
20. Once the 'connected' button on the top panel turns green, go to **Calibration** section in the left side-menu.

21. **Sensor Calibration**: Sensor calibration is of utmost importance before you fly the drone. You need to calibrate magnetometer every time you change the flying field. If your autopilot orientation is not the same as that of your vehicle, update **AUTOPILOT ORIENTATION** parameter accordingly. Similarly, if your external magnetometer's orientation differs from FlytPOD's heading, update **EXT MAG ROTATION** parameter.
    

    Please follow the steps given in FlytConsole. The sensors to be calibrated for correct attitude are given below:

    * Accelerometer Calibration
    * Gyroscope Calibration
    * Magnetometer Calibration
    * Level Calibration
     


    Click on **Save and Reboot** once you finish Sensor Calibration and are ready to move on to RC Calibration.

    Once the FlytPOD is connected back check the level in HUD on Dashboard of FlytConsole. Make sure that it is reflecting the level and rotations correctly.

    Click :ref:`here<Sensor_calibration>` to know more about Sensor Calibration.

22. After FlytConsole is reconnected, it's time to configure the motors.

    .. warning:: Make sure no propellers are attached to the motors before you proceed with ESC calibration.

23. The RGB LED should be breathing blue or green now. For more info on RGB LED patterns click :ref:`here<RGB_LED>`.
    If it is flashing red then check if you have properly connected GPS-MAG module.
24. Power on the ESCs through power module as described :ref:`here<Power_Module>`.
25. Generally your motors should play a tone, but don't worry if they do not.  
26. Next go to **Motor Config** in left side-menu. Here you will be calibrating the ESCs and testing the motors.
27. Select **ESC Calibration** in top menu.
      
    .. important:: * Not all ESC’s need range calibration. Please consult your ESC user documentation before you do it. 
      * Also this is a one-time setup which is NOT required to be done again until you change one or more of your ESC’s.



                     
      
      

    Use of default Min PWM value, Max PWM value and Number of actuators is recommended. Click on **Start Calibration** after completing the settings.


    Click :ref:`here<ESC_calibration>` to know more about ESC Calibration.

28. After finishing ESC Calibration gracefully shutdown the FlytPOD and remove the Battery.
29. Power the FlytPOD and ESCs back on before you move to the next steps. 
30. Select **Motor testing** in top-menu of FlytConsole's **Motor Config** page.
     
      
    .. warning:: No propellers please during setup!
    

    You can test the direction of rotation and order of the motors here. Click on the motors to make them rotate and check the direction of rotation of the corresponding motor on your vehicle.


    Click :ref:`here<Motor_test>` to know more about Motor testing.


    .. note:: In case your motors rotate in the incorrect direction, you can swap the ESC cables and make the motors rotate in the desired direction.

31. Select **RC Calibration** in left side-menu.

    .. .. warning:: Again, No props please, during setup!

32. Turn on your RC Transmitter. Check if the receiver is working.

    .. note:: PWM, PPM receiver are powered through ESC supply. If your RC is not getting powered then you should check ESC supply and whether your ESCs output 5V. In case your ESCs don't have BEC then power on the receiver using some other supply. Do not draw supply for RC receiver from 5V output of FlytPOD. 
      
    Following are the prerequisites for RC Calibration:
    
    * You need a minimum six channel radio to use with Flyt.
    * Four channels for roll, pitch, yaw and throttle.
    * A three way switch for testing with RC modes.
    * A two way switch for Manual override.
    * A two way optional switch for Return to Launch mode.
    * Please follow instructions in FlytConsole.
         
    Reboot the autopilot after this by clicking on **Save and Reboot**.

    .. warning::  If you find that motors start rotating after clicking 'Save and reboot' then immediately power off everything and report to us.  

    Click :ref:`here<RC_calibration>` to know more about RC Calibration.





33. After Sensor and RC calibration, Gains have to be tuned to control the autopilot attitude and position control. Click on **Gains Tuning**. You can choose to use the default settings for Gains tuning.
   
    Click :ref:`here<Gain_tuning>` to know more about Gain tuning.

34. Congratulations !!! You have successfully configured FlytPOD with your drone. You are now ready to fly.
35. At this stage the RGB LED should be breathing blue. Assuming that you have the props removed, try to ARM system and test radio commands. 
36. You can check if the response of pitch and roll commands is as desirable.
37. Now you can connect any additional sensors to FlytPOD.
38. Please go through the :ref:`First principles of flying<First_Principles>` and :ref:`First flight with FlytPOD<First_Flight>` sections before you proceed with flying your drone.
39. Make sure you understand all the :ref:`Safety guidelines<Safety_Guidelines>` before you fly.
 








.. .. _Points of Caution:

.. Points of Caution
.. -----------------

.. Please keep in mind the below mentioned points.

.. Before Power up
.. ^^^^^^^^^^^^^^^

.. **Make sure**


.. * Frame should be intact.
.. * Motors are tightly fixed and are facing upwards.
.. * All the propellers are in good shape (without cuts and deformations) and are tightly fixed.
.. * Motors are rotating smoothly.
.. * There are no loose wires.
.. * Radio and PWM connectors are solid and tight.
.. * Motors and propellers are orderly.
.. * Transmitter is switched on.
 


.. Before You Take-off
.. ^^^^^^^^^^^^^^^^^^^

.. **Make sure**

.. * Battery is charged.
.. * Low voltage alarm is set.
.. * Telemetry i working.
.. * Attitude is correct at ground level.
.. * All radio channels are clear.
.. * Parameters are correctly loaded.
  
.. **Do the following**

.. * Rotate UAV 360 degrees and check if Mag is correct.
.. * Arm motors and check if they are rotating in the correct direction.
.. * Take a small lift off and check if altitude is not drifting in GCS.
.. * While disarmed, check that mode switches are working.
.. * Hold UAV in hand, give 50% throttle and check for vibrations.


.. For Manual Flight
.. ^^^^^^^^^^^^^^^^^

.. **Do the following**


.. * Fix a mark or some clue for direction of the vehicle. It should be visible from far.
.. * Get the exact direction of geographical north (Mag reads magnetic north).
.. * Have a fellow give you details of attitude, location,heading during flight.
.. * Make sure you know operations of every mode.
.. * Take a good look at the surroundings. The area should be clear of buildings, trees, people and other obstacles.


.. .. * It is recommended to use the RC when testing for the first time.
.. .. * If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
.. .. * Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.

.. .. caution:: * It is recommended to use the RC while testing for the first time.
..              * If the RC is not connected, FlytPOD will go to API_Mode by default otherwise use API_mode switch to control drone using the RC.
..              * Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
..              * Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.




.. 7. It is recommended to use the RC when testing for the first time.
.. 8. If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
.. 9. Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.
    
.. .. warning:: Have a RC pilot ready to take control even if you are flying in API mode in case of emergency.

.. To know more about Using Flytconsole while flying your drone go to..(link) and learn how to get waypoints ,operate GCS ,Gain Tuning, 	 	Calibration and Parameter settings.
  .. important:: * It is recommended to use the RC when testing for the first time.
..                * If the RC is not connected, FlytPOD will go to API_Mode by default. Use API_mode switch to control drone from RC.
..                * Before you arm the FlytPOD make sure that the position of the propellers is correct i.e. anticlockwise and clockwise propellers are mounted on the right motors.


.. |click_here| raw:: html

   <a href="flytpod:9090/flytconsole" target="_blank">click here</a>





	


|br|








.. _FlytConsole: https://flytpod:9090/flytconsole


   
.. _Fixed wings/Planes: https://pixhawk.org/platforms/planes/start


   
.. _VTOL: https://pixhawk.org/platforms/vtol/start

.. _Multicopters: https://pixhawk.org/platforms/multicopters/start



.. _FlytConsole widgets: http://docs.flytbase.com/docs/FlytConsole/About_FlytConsole.html






.. |br| raw:: html

   <br />
   
   