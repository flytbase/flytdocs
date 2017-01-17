.. _First_Principles:

First Principles: Flying with Flyt
==================================

Below are a few flying essentials that the on-field operations team should be aware of.

1. To arm the vehicle from RC: **throttle down + yaw right**

2. To disarm the vehicle from RC: **throttle down + yaw left**

3. FlytPOD will reject ``RC-POSCTL`` mode if GPS Fix is not available. 

4. Before switching to ``OFFBOARD/API`` mode make sure you have GPS Fix. FlytPOD can switch to OFFBOARD/API mode even if GPS Fix is not available, but then vehicle may drift away.

5. In ``RC-Manual``, ``RC-ALTCTL`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle.

6. After switching to OFFBOARD/API mode, FlytOS takes control of the vehicle and holds position until any app tries to take control of the vehicle. For Auto-mission with FlytPOD you have to switch to OFFBOARD/API mode. You don't need to configure separate switch for AUTO-Mission.

7. Automatic Takeoff and Land parameters need to be configured according to platform and performance requirements.

8. For automatic arm in Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) to work, FlytPOD has to be put in OFFBOARD/API mode.

9. FlytPOD can be powered through main power connector only. The Autopilot can be powered independently from the VI power and ESCs.

10. FlytPOD has 3 power rails marked as '5V', '3V3' and '+'. On IO panel, pins marked as '5V' and '3V3' output 5V and 3.3V and can be used to power payloads. Pins marked as '+' are powered through ESCs. 

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly.