.. _First_Principles:

First Principles: Flying with Flyt
==================================


1. To arm the vehicle from RC: **yaw right + throttle down**

2. To disarm the vehicle from RC: **yaw left + throttle down**

3. Vehicle can arm or disarm only in manual mode. Be careful when you are trying to disarm in any mode other than manual, it would not simply disarm until you switch to manual mode. 

4. FlytPOD will reject ``RC-POSCTL`` mode if GPS fix is not available. 

5. Before switching to ``OFFBOARD/API`` mode make sure you have GPS Fix. FlytPOD can switch to ``OFFBOARD/API`` mode even if GPS Fix is not available, but then vehicle may drift away. 

6. In RC-Manual, ``RC-AltCtl`` and ``RC-POSCTL`` modes, RC transmitter can control the vehicle.

7. After switching to OFFBOARD/API mode, FlytOS takes the control of vehicle and holds position until any apps try to control vehicle. For Auto-mission with FlytPOD you have to switch to OFFBOARD/API mode. You don't need to configure separate switch for AUTO-Mission.

8. Automatic Takeoff and Land parameters need to be configured according to platform and performance requirements.

9. For automatic arm in Takeoff command from FlytOS (onboard scripts / mobile apps / FlytConsole) to work, FlytPOD has to be put in OFFBOARD/API mode.

10. To know more about state machine drop a mail at srv@navstik.org

11. FlytPOD can be powered through main power connector only. ESC can not supply power to flytpod. However on back io panel pins marked with '+' are given for powering payloads with ESC 5V output. e.g. RC receiver, lidar, etc. 



