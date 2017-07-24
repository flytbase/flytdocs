Recent Updates
===============

We improve the FlytBase platform continually by releasing new features, removing bugs and updating documentation. 

July 2017
##########

FlytOS update version 1.41 changelog

**Key Updates**

* Added log retrieval from FlytBase Cloud.
* Added remote client for FlytBase Cloud. It is disabled by default.
* Added support for Intel Joule.
* FlytOS now autodetects serial port and the baudrate on which Autopilot is connected. List of autodetectable 
  ports is `here <http://docs.flytbase.com/docs/FlytOS/Debugging/FAQ.html#change-baudrate-or-portname/>`_.

**UI Updates**

* FlytConsole, message window now prints navigation API debug messages.
* Added log view and download webapp options at http://localhost/logs.

**Bug Fixes**

* FlytConsole GCS widget -> for APM waypoints, incoherent wp #1 and wp #2 when set by user.
* FlytConsole -> calibration msgs fixes.
* FixedWing -> PositionHold and PositionSetGlobal now respond correctly. Unsupported APIs: PositionSet and VelocitySet return   without sending any setpoint to drone.

**Other**

* Calling access_request API is now MUST if vehicle is not switched to OFFBOARD/GUIDED mode via RC or set_mode API.
* Shifted SITL gcs_url from UDP to TCP. 
* Configured mavros target_comp_id to 0 -> no need to set PX4 param MAV_COMP_ID to 50.
* FlytOS runlog would now be logged at /flyt/logs/runlogs/flyt_runlogs.log. 
* No need to reboot after license activation.

June 2017
##########

FlytOS update version 1.3 changelog

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

**Other**

* FlytFollowMe: updated url from /flytfollowme to /followme.
* ALL APIs now respond with relevant messages.
* Super simplification of api message structure of position_set, velocity_set, position_set_global.
* Changed various ros messages log level.
* Added few missing rostopics and rosservices from list of apis available for rest and websocket.
* Added FlytSim config section.
* Enabled motor testing widget for APM.


April 2017
###########

FlytOS update version 1.2 changelog.

**Key Updates**

* APM beta release
* Waypoint set creating takeoff wp if not set.
* Setting MIS_TAKEOFF_ALT when takeoff command is sent.

**Bug Fixes**

* Fixed a bug causing GPS lock in FlytConsole.

**Other**

* Added wlx and eno to recognised network interfaces.


March 2017
###########

FlytOS update version 1.1 changelog.

**Key Updates**

* Official launch of FlytSim.
* Gimbal API added for both Autopilot and FlytPOD, with FlytPOD getting gimbal pwm signal in its dedicated port.
* FlytPOD now has fixed IP in AP mode.

**Bug Fixes**

* Added new features and minor bugfixes in CPP API.
* Added new features and minor bugfixes in FlytConsole.

**Other**

* Updated Config file.

Feb 2017
#########

FlytOS update version 1.0 changelog.

**Key Updates**

* Official FlytOS release
* Feature addition: Mavros updated to use MAVLink 2.0.
* Feature addition: added APIs for controlling USER LEDs, GPIOs.
* Feature addition: added APIs for fetching data from ADCs.
* Added support for Raspberry Pi3.

**Bug Fixes**

* You can now Arm the drone after the takeoff command is accepted.
* Launch sequence of mavros delayed until the param save is completed.

**Other**

* Reduced bandwith usage for webapp.
* Enhaced update management.
* Support added for more sigle board computers.
* Parameter caching enabled.
