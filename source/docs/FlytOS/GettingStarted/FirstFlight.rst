.. _first_flight_main:

First Flight
================


We are ready for flight testing the vehicle with FlytOS. Follow the instructions provided in next sections.


Essentials
^^^^^^^^^^^^

Below are important guidelines that the on-field operations team should be aware of.

1. To arm the vehicle from RC: **throttle down + yaw right**

2. To disarm the vehicle from RC: **throttle down + yaw left**

3. Autopilot will reject RC-POSCTL mode if position lock is not available. RGB led turns green when position lock is available.

4. Before switching to ``OFFBOARD/API`` mode make sure you have position lock. Autopilot can switch to OFFBOARD/API mode even if GPS Fix is not available, but then the vehicle may drift away.

5. In ``RC-Manual``, ``RC-ALTCTL`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle. In OFFBOARD / API | POSCTL mode RC sticks will not work.

6. After switching to OFFBOARD/API mode, FlytOS takes control of the vehicle and holds position until any other app tries to take control of the vehicle.

7. Offboard switch on RC is the emergency switch. Flip it to enable RC control.

8. When vehicle is in offboard mode keep the Position switch in RC-POSCTL position, both sticks at the center. So that when vehicle is switched back to RC mode from Offboard mode, vehicle will enter RC-POSCTL mode. If this precaution is not taken, then the vehicle may enter in RC-MANUAL mode and depending on throttle stick will suddenly dive or soar up.

9. To execute waypoint mission using FlytConsole, you have to switch to OFFBOARD/API mode. To execute waypoint mission using qgroundcontrol you need to switch to AUTO-Mission. (Configure a separate switch for AUTO-Mission mode from rc-calibration page)

10. Automatic Takeoff and Land parameters need to be configured according to the frame, weight, motor configuration and performance requirements.

11. Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) will automatically arm the vehicle. Keep the drone in OFFBOARD/API mode before executing takeoff command.



Safety Guidelines
^^^^^^^^^^^^^^^^^

* Please go through the essentials given above before you proceed. The on-field operations team should be aware of them.
* Most of the operations with FlytOS are fully or semi autonomous. Offboard switch is the Manual Override. Always have a dedicated manual pilot ready to take control in case of emergencies.
* Before switching to offboard mode it is always a good practice to check if manual and position hold modes are working.
* SBC connected to mobile phone WiFi hotspot may not give long range. Use powerful WiFi ground routers with high gain antennas for long range operations. You can also use radio telemetry modules for long range.
* Always use external GPS-MAG module for stable yaw performance. Internal compass suffers a lot of interference.
* FlytOS comes with automatic update functionality. We keep pushing a lot of security and new feature updates. FlytOS will download and install updates when device is connected to internet. It is good practice to connect your drone to internet once a week at least.
* Please follow rules and regulations laid down by your local authority.


Basic Flight
^^^^^^^^^^^^^

1. Read all safety guidelines given above.

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.

2. It is important to make sure that autopilot is configured properly for RC | POSCTL mode.
3. Skip to step 4 if RC | POSCTL mode is already configured and tested:

   a. Keep vehicle in MANUAL mode
   b. Wait for the RGB led to turn green.
   c. Arm the vehicle and takeoff manually.
   d. If vehicle is not stabilized refer to gain tuning section `here <http://px4.io/docs/multicopter-pid-tuning-guide/>`_.
   e. Switch to RC | POSCTL mode using RC switch. Without LIDAR or SONAR the height might drift within a meter.
   f. In this mode, throttle and roll/pitch stick should be at the center to hold drone at current location.

4. Prepare for Offboard mode:

   a. RGB LED should be green for this mode to work.
   b. Offboard / API switch on RC is used to switch API control ON or OFF. In case of emergency during offboard mode, flip   this switch to take back RC control.

5. While in RC | POSCTL mode, flip the RC offboard switch to enter into OFFBOARD / API-POSCTL mode.
6. Vehicle should hover at the same location. RC sticks will not work in this mode. Just to make sure that it is indeed offboard mode try giving some control actions from RC e.g. roll. If vehicle doesn't react to these commands then FlytOS is controling the drone.
7. Now you can flip the switch to take back RC control and land it.


Test FlytOS
^^^^^^^^^^^^

Make sure that you have successfully tested Offboard mode with FlytOS.

Next step is to test a web/mobile app built on top of FlytOS APIs.

1. Download Flyt Joystick android app from `here <https://flyt.blob.core.windows.net/flytos/downloads/apk/Flyt-Joystick.apk>`_ .
2. Alternatively you can use joystick web app on your laptop. Download Flyt Joystick web app on your laptop from `here <https://minhaskamal.github.io/DownGit/#/home?url=https:%2F%2Fgithub.com%2Fflytbase%2Fflytsamples%2Ftree%2Fmaster%2FWebApps%2FFlyt_Joystick>`_ . Enter into the directory and open index.html into browser.
3. Connect your mobile / laptop to same wifi network that your companion computer / FlytPOD is connected to.


.. image:: /_static/Images/app-login-screen.png
  :align: center

4. Enter IP address of the companion computer / FlytPOD in the app and click connect.
5. Manually arm the drone and takeoff. Switch to RC-POSCTL mode. Make sure that drone is holding its position.
6. Switch to OFFBOARD/API-POSCTL mode using the offboard switch on RC.
7. Now, the Joystik app should have the control. Try moving the drone using app.


.. image:: /_static/Images/app-screen.png
  :align: center

8. The left joystick gives the drone commands to move up, down, turn-left and turn-right.
9. The right joystick gives the drone commands to move front, back, left and right.
10. All the commands are given with respect to the drone(front = direction of the nose/front of the drone).
11. If everything goes right then press land button on app.
12. If auto landing worked well then keep the drone on ground, disarmed and switch to OFFBOARD/ API-POSCTL.
13. This time take-off with app and move the drone around and then land.
14. If you are here then you have succefully integrated FlytOS with your drone.
15. Welcome onboard! Go ahead and check out some cool built in apps for your drone.
