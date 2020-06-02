# First Flight

We are ready for flight testing the vehicle with FlytOS. Follow the instructions provided in next sections.

## Essentials

Below are important guidelines that the on-field operations team should be aware of.

* To arm the vehicle from RC: **throttle down + yaw right**
* To disarm the vehicle from RC: **throttle down + yaw left**
* Autopilot will reject RC-POSCTL mode if position lock is not available. RGB led turns green when position lock is available.
* Before switching to `OFFBOARD/API` mode make sure you have position lock. Autopilot can switch to OFF-BOARD/API mode even if GPS Fix is not available, but then the vehicle may drift away.
* In `RC-Manual`, `RC-ALTCTL` and `RC-POSCTL` modes, RC transmitter can control the vehicle. In OFF-BOARD / API \| POSCTL mode RC sticks will not work.
* After switching to OFF-BOARD/API mode, FlytOS takes control of the vehicle and holds position until any other app tries to take control of the vehicle.
* Off-board switch on RC is the emergency switch. Flip it to enable RC control.
* When vehicle is in off-board mode keep the Position switch in RC-POSCTL position, both sticks at the center. So that when vehicle is switched back to RC mode from Off-board mode, vehicle will enter RC-POSCTL mode. If this precaution is not taken, then the vehicle may enter in RC-MANUAL mode and depending on throttle stick will suddenly dive or soar up.
* To execute waypoint mission using FlytConsole, you have to switch to OFF-BOARD/API mode. To execute waypoint mission using qgroundcontrol you need to switch to AUTO-Mission. \(Configure a separate switch for AUTO-Mission mode from rc-calibration page\)
* Automatic Takeoff and Land parameters need to be configured according to the frame, weight, motor configuration and performance requirements.
* Takeoff command from FlytOS \(onboard scripts / mobile apps / FlytConsole\) will automatically arm the vehicle. Keep the drone in OFF-BOARD/API mode before executing takeoff command.

## Safety Guidelines

* Please go through the essentials given above before you proceed. The on-field operations team should be aware of them.
* Most of the operations with FlytOS are fully or semi autonomous. Off-board switch is the Manual Override. Always have a dedicated manual pilot ready to take control in case of emergencies.
* Before switching to off-board mode it is always a good practice to check if manual and position hold modes are working.
* SBC connected to mobile phone WiFi hotspot may not give long range. Use powerful WiFi ground routers with high gain antennas for long range operations. You can also use radio telemetry modules for long range.
* Always use external GPS-MAG module for stable yaw performance. Internal compass suffers a lot of interference.
* FlytOS comes with automatic update functionality. We keep pushing a lot of security and new feature updates. FlytOS will download and install updates when device is connected to internet. It is good practice to connect your drone to internet once a week at least.
* Please follow rules and regulations laid down by your local authority.

## Basic Flight

* Read all safety guidelines given above.

{% hint style="info" %}
Note:  In case you are using Pixhawk, check out the [pre-flight checklist](http://ardupilot.org/copter/docs/flying-arducopter.html) before you fly.
{% endhint %}

* It is important to make sure that autopilot is configured properly for RC \| POSCTL/LOITER mode.
* Skip to step 4 if RC \| POSCTL/LOITER mode is already configured and tested:
  * Keep vehicle in MANUAL mode
  * Wait for the RGB led to turn green.
  * Arm the vehicle and takeoff manually.
  * If vehicle is not stabilized refer to gain tuning section [here](http://px4.io/docs/multicopter-pid-tuning-guide/).
  * Switch to RC \| POSCTL/LOITER mode using RC switch. Without LIDAR or SONAR the height might drift within a meter.
  * In this mode, throttle and roll/pitch stick should be at the center to hold drone at current location.
* Prepare for Off-board mode:
  * RGB LED should be green for this mode to work.
  * Off-board / API switch on RC is used to switch API control ON or OFF. In case of emergency during off-board mode, flip this switch to take back RC control.
* While in RC \| POSCTL mode, flip the RC off-board switch to enter into OFF-BOARD / API-POSCTL mode.
* Vehicle should hover at the same location. RC sticks will not work in this mode. Just to make sure that it is indeed off-board mode try giving some control actions from RC e.g. roll. If vehicle doesn’t react to these commands then FlytOS is controlling the drone.
* Now you can flip the switch to take back RC control and land it.

