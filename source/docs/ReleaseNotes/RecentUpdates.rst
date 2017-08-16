Recent Updates
==============

We improve the FlytBase platform continually by releasing new features, removing bugs and updating documentation. 


Version 1.4-2
#############

*Released on 2nd August, 2017*

**Key Updates**

* FlytSim APM now simulates APM-3.5.0.
  
**UI Updates**

* FlytConsole and Welcome page updated to indicate FlytOS Commercial License.
  
**Bug Fixes**

* Significantly improved FlytSim PX4 Gazebo vehicle stability.
* Fixed FLytOS autorestart on boot up issue.

**Minor Updates**

* Reduced message rate of 'inefficient baud rate', when baudrate apart from 921600 is used to communicate with autopilot.


Version 1.4-1
#############

*Released on 14th July, 2017*

**Key Updates**

* Added autopilot log download option in my.flytbase portal.
* Added remote client for FlytBase Cloud. It is disabled by default.
* Added support for Intel Joule.
* FlytOS now autodetects serial port and the baudrate on which Autopilot is connected. List of autodetectable 
  ports is `here <http://docs.flytbase.com/docs/FlytOS/Debugging/FAQ.html#change-baudrate-or-portname/>`_.

**UI Updates**

* FlytConsole, message window now prints navigation API debug messages.
* New webapp added for autopilot, startup and runlog View and Download at http://ip-of-your-device/logs.

**Bug Fixes**

* FlytConsole GCS widget -> for APM waypoints, incoherent wp #1 and wp #2 when set by user.
* FlytConsole -> calibration msgs fixes.
* FixedWing -> PositionHold and PositionSetGlobal now respond correctly. Unsupported APIs: PositionSet and VelocitySet return   without sending any setpoint to drone.

**Minor Updates**

* Calling access_request API is now MUST if vehicle is not switched to OFFBOARD/GUIDED mode via RC or set_mode API.
* Shifted SITL gcs_url from UDP to TCP. 
* Configured mavros target_comp_id to 0 -> no need to set PX4 param MAV_COMP_ID to 50.
* FlytOS runlog would now be logged at /flyt/logs/runlogs/flyt_runlogs.log. 
* No need to reboot after license activation.
* Added new device ID for Intel Edison.
* Changed logger level to debug for clock skew message.

Version 1.3-1
#############

*Released on 7th June, 2017*

**Key Updates**

* FlytSim-docker official release - comes with configurable PX4 and APM support.
* FlytSim: APM SITL being light weight is now default. To change it to PX4, go to FlytSim config page.
* Object Tracking module: Start/Stop through web app (FollowMe).
* Added flytsim.cfg, a config file for users to select sim attributes such as autopilot type, camera, gui, world(environment).

**UI Updates**

* FlytConsole has been rebranded to maintain uniformity with the other FlytBase features.
* Message window now includes Nav messages as well.
* Added progress bar and calibration status message in FlytConsole.

**Bug Fixes**

* waypoint_execute, now resumes from last covered waypoint.
* Increased default tolerance of position_set and position_set_global from 1.0 to 2.0
* FlytFollowMe restful may crash if multiple processes are binded to port 80.
*	FlytFollowMe, GPS state was mis-represented.
*	Ros-kinetic-opencv3 update issue resolved.(You will need to update ros-kinetic-opencv3 ros-kinetic-cv-bridge ros-kinetic-compressed-image-transport).
* Fixed autoupdate getting stuck during the update.
* Removed init.d script warning.

**Minor Updates**

* FlytFollowMe: updated url from /flytfollowme to /followme.
* ALL APIs now respond with relevant messages.
* Super simplification of api message structure of position_set, velocity_set, position_set_global.
* Changed various ros messages log level.
* Added few missing rostopics and rosservices from list of apis available for rest and websocket.
* Added FlytSim config section.
* Enabled motor testing widget for APM.


Version 1.2-1
#############

*Released on 21st April, 2017*

**Key Updates**

* APM beta release
* Waypoint set creating takeoff wp if not set.
* Setting MIS_TAKEOFF_ALT when takeoff command is sent.

**Bug Fixes**

* Fixed a bug causing GPS lock in FlytConsole.

**Minor Updates**

* Added wlx and eno to recognised network interfaces.


Version 1.1-1
#############

*Released on 22nd March, 2017*

**Key Updates**

* Official launch of FlytSim.
* Gimbal API added for both Autopilot and FlytPOD, with FlytPOD getting gimbal pwm signal in its dedicated port.
* FlytPOD now has fixed IP in AP mode.

Version 1.1-0
#############

*Released on 1st March, 2017*

**Bug Fixes**

* Added new features and minor bugfixes in CPP API.
* Added new features and minor bugfixes in FlytConsole.

**Minor Updates**

* Updated Config file.
* Major improvements for Parameter handling in Param API.

Version 1.0-5
#############

*Released on 21st Feb, 2017*

**Key Updates**

* Reduced bandwith usage for webapp.
* Enhaced update management.
* Support added for more sigle board computers.
* Parameter caching enabled.

Version 1.0-0
#############

*Released on 1st Feb, 2017*

* Official FlytOS release

Version 0.7-9
#############

*Released on 23rd Jan, 2017*

* Feature addition: Mavros updated to use MAVLink 2.0.
* Feature addition: added APIs for controlling USER LEDs, GPIOs.
* Feature addition: added APIs for fetching data from ADCs.

**Bug Fixes**

* You can now Arm the drone after the takeoff command is accepted.
* Launch sequence of mavros delayed until the param save is completed.

