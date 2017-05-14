
Beginner's Guide
================

.. _First_Flight:

First Flight
------------

1. General Instructions: We recommend getting Manual stabilize mode to work first. Then go for Position hold using GPS. Once you are sure about these basic manual modes then you can switch to FlytOS using offboard switch.

2. Manual Mode:

   a. This is basic stabilize mode.
   b. If RGB LED is breathing blue or green then you are good to go. Click :ref:`here<RGB_LED>` to know more about RGB LED patterns.
   c. Make sure you are following all safety guidelines given :ref:`here<Safety_guidelines>`.
   d. In case you are not sure about Gains, please have a look at this guide `here <http://px4.io/docs/multicopter-pid-tuning-guide/>`_.
   e. Once your basic gains are stable and vehicle is stabilizing well then go to ``Altctl Mode``. Height will be stabilized automatically. Without LIDAR or SONAR the height might drift within a meter.
   f. In ``altitude control mode`` throttle stick should be kept at middle to stay at current altitude.

3. Position hold:

   a. Position and height are stabilized in this mode.
   b. RGB LED should be green for this mode to work.
   c. In this mode throttle and roll/pitch stick should be at the center for staying at current location.

4. Offboard mode / Flying with FlytOS:

   a. Vehicle is autonomously controlled by FlytOS and will be given position, velocity commands according to running apps.
   b. RGB LED should be green for this mode to work.
   c. Make sure that Position control works before switching to offboard mode.
   d. Vehicle will start to hover at the same position after switching to offboard mode until you start using any other app.
   e. RC controller sticks will not work in this mode. Only offboard switch will work which should be kept handy for emergency situations.
   f. Try testing your first Flyt app :ref:`here<ready_to_use_apps>`.

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.

.. _First_Principles:

Essentials
----------

Below are a few important guidelines that the on-field operations team should be aware of.

1. To arm the vehicle from RC: **throttle down + yaw right**

2. To disarm the vehicle from RC: **throttle down + yaw left**

3. FlytPOD will reject ``RC-POSCTL`` mode if GPS Fix is not available.

4. Before switching to ``OFFBOARD/API`` mode make sure you have GPS Fix. FlytPOD can switch to OFFBOARD/API mode even if GPS Fix is not available, but then vehicle may drift away.

5. In ``RC-Manual``, ``RC-ALTCTL`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle.

6. After switching to OFFBOARD/API mode, FlytOS takes control of the vehicle and holds position until any app tries to take control of the vehicle. To execute waypoint mission using FlytConsole you have to switch to OFFBOARD/API mode. To execute waypoint mission using qgroundcontrol you need to switch to AUTO-Mission. (Configure a separate switch for AUTO-Mission mode from rc-calibration page)

7. Automatic Takeoff and Land parameters need to be configured according to frame, weight, motor configuration and performance requirements.

8. For automatic arm in Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) to work, FlytPOD has to be put in OFFBOARD/API mode.

9. FlytPOD has 3 power rails marked as '5V', '3V3' and '+'. On IO panel, pins are marked as '5V' and '3V3' output 5V and 3.3V and can be used to power payloads. Pins marked as '+' are powered through ESCs.

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.

.. First principles:

.. FlytPOD can be powered through main power connector only. ESC can not supply power to flytpod. However on back io panel pins marked with '+' are given for powering payloads with ESC 5V output. e.g. RC receiver, lidar, etc. 
 
.. _Safety_guidelines:  

Safety Guidelines
-----------------



.. 1 Read the first principles of flyt. The on-field operations team should be aware of them.
.. 2 Do not draw power from flytpod for any payload unless and until mentioned specifically in Peripherals.
.. 3 Most of the operations with Flyt are fully or semi autonomous. Offboard switch is the Manual Override. Always have a dedicated manual pilot ready to take control in case of emergency.
.. 4 Please follow rules and regulations laid down by your local authority.
.. 5 During flying it is always a good practise to check first, if manual and position hold modes are working, before your switch to offboard mode.
.. 6 Please dont try to dismantle the flytPOD. You might not be able to put the things back in order and might cause the vibration dampening mechanism to fail. 
.. 7 Flytpod connected to mobile phone hotspot may not give long range. Use powerful ground routers with high gain antennas for long range operations. If you want to use radio telemetry modules then check peripherals.
.. 8 Do not subject FlytPOD to water, dust, prolonged heat. 
.. 9 Always use external GPS-MAG module for stable yaw performance. Internal compass suffers a lot of interference.
.. 10 Always keep FlytPOD updated. We are adding lot of security and safety modules and will be continuously releasing updates.
.. 11 





* Please go through the :ref:`essentials<First_Principles>` of FlytPOD before you proceed. The on-field operations team should be aware of them.
* Most of the operations with FlytOS are fully or semi autonomous. Offboard switch is the Manual Override. Always have a dedicated manual pilot ready to take control in case of emergencies.
* Before switching to offboard mode it is always a good practice to check if manual and position hold modes are working.
* FlytPOD connected to mobile phone hotspot may not give long range. Use powerful ground routers with high gain antennas for long range operations. If you want to use radio telemetry modules then check the peripherals.
* Do not subject FlytPOD to water, dust or prolonged heat.
* Do not draw power from FlytPOD for any payload not mentioned specifically in the peripherals.
* Always use external GPS-MAG module for stable yaw performance. Internal compass suffers a lot of interference.
* Please do not try to dismantle the FlytPOD. You might not be able to reassemble the device in order and might cause the vibration dampening mechanism to fail.
* Always keep FlytPOD updated. We are adding lot of security and safety modules and will be continuously releasing updates.
* Please follow rules and regulations laid down by your local authority.

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.


