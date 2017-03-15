.. _First_Principles:

Essentials
==================================

Below are important guidelines that the on-field operations team should be aware of.

1. To arm the vehicle from RC: **throttle down + yaw right**

2. To disarm the vehicle from RC: **throttle down + yaw left**

3. Autopilot will reject RC-POSCTL mode if position lock is not available. RGB led turns green when position lock is available.

4. Before switching to ``OFFBOARD/API`` mode make sure you have position lock. Autopilot can switch to OFFBOARD/API mode even if GPS Fix is not available, but then vehicle may drift away.

5. In ``RC-Manual``, ``RC-ALTCTL`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle. In OFFBOARD / API | POSCTL mode RC sticks will not work.

6. After switching to OFFBOARD/API mode, FlytOS takes control of the vehicle and holds position until any app tries to take control of the vehicle.

7. Offboard switch on RC is the emergency switch. Flip it to enable RC control.

8. When vehicle is in offboard mode keep the Position switch in POSHOLD position, both sticks at the center. So that when vehicle is switched back to RC mode from Offboard mode vehicle will enter RC-POSCTL mode. If this care is not taken then vehicle may enter in RC-MANUAL mode and depending on throttle stick will suddenly dive or soar up.

9. To execute waypoint mission using FlytConsole you have to switch to OFFBOARD/API mode. To execute waypoint mission using qgroundcontrol you need to switch to AUTO-Mission. (Configure a separate switch for AUTO-Mission mode from rc-calibration page)

10. Automatic Takeoff and Land parameters need to be configured according to frame, weight, motor configuration and performance requirements.

11. Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) will automatically arm the vehicle. Keep the drone in OFFBOARD/API mode before executing takeoff command.
