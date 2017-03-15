.. _First_Principles:

Using FlytPOD: Essentials
==================================

Below are a few important guidelines that the on-field operations team should be aware of.

1. To arm the vehicle from RC: **throttle down + yaw right**

2. To disarm the vehicle from RC: **throttle down + yaw left**

3. FlytPOD will reject ``RC-POSCTL`` mode if GPS Fix is not available.

4. Before switching to ``OFFBOARD/API`` mode make sure you have GPS Fix. FlytPOD can switch to OFFBOARD/API mode even if GPS Fix is not available, but then vehicle may drift away.

5. In ``RC-Manual``, ``RC-ALTCTL`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle.

6. After switching to OFFBOARD/API mode, FlytOS takes control of the vehicle and holds position until any app tries to take control of the vehicle. To execute waypoint mission using FlytConsole you have to switch to OFFBOARD/API mode. To esecute waypoint mission using qgroundcontrol you need to switch to AUTO-Mission. (Configure a separate switch for AUTO-Mission mode from rc-calibration page)

7. Automatic Takeoff and Land parameters need to be configured according to frame, weight, motor configuration and performance requirements.

8. For automatic arm in Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) to work, FlytPOD has to be put in OFFBOARD/API mode.

9. FlytPOD has 3 power rails marked as '5V', '3V3' and '+'. On IO panel, pins marked as '5V' and '3V3' output 5V and 3.3V and can be used to power payloads. Pins marked as '+' are powered through ESCs.

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.
