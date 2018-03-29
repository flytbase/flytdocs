Recent Updates
==============

We improve the FlytBase platform continually by releasing new features, removing bugs and updating documentation. 

Version 1.5-6
#############

*Released on 28th March, 2018*

**Key Updates**

* Releasing official support for DJI Drones. With this release, FlytOS can seemlessly communicate with either PX4/APM/DJI devices connected via a serial port, as long as the corresponding autopilots are configured correctly. `Click here <https://docs.google.com/document/d/1Q6vTM6LQ1jh-kpcCmUbdifHaNtjmWGDCPsxUa10ay3o/edit>`_ to setup FlytOS for DJI devices.

	* Extends these Navigation APIs for DJI:

	  * TakeOff
	  * Land
	  * Local Position Setpoint
	  * Global Position Setpoint
	  * Waypoint Get/Set/Clear/Pause/Execute
	  * Position Hold
	  * RTL

	* Also, extending these Telemetry APIs:

	  * Attitude (Euler/Quaternion)
	  * Local Position
	  * Global Position
	  * Battery Status
	  * RC Data
	  * Vehicle State

* Updated DJI OSDK to 3.6 from 3.3 from https://github.com/dji-sdk/Onboard-SDK
* Updated PX4 SITL from https://github.com/PX4/sitl_gazebo. Improvement in vehicle stability observed. Performance significantly improved in low compute power devices.

**UI updates: FlytConsole**

* DJI Encryption key and APP ID must now be fed to FlytOS via FlytConsole's settings page.
* Improved Video streaming widget. Now video starts as soon as you open the widget. Also, fixed drop down issue where it used to show one entry even when no camera was detected.
* AutoPilot (APM/PX4/DJI) identification in top bar changed from logo to text.
* Fixed incorrect 'unsupported' message in few widgets.
* Removed few widgets which ONLY catered to FlytPOD.
* Motor Testing widget made available for APM.

**Bug Fixes**

* Skipping ttySx port during FlytOS bootup while searching serial port for autopilot, significantly improves startup time.
* Disabled feature to send drone to offboard mode whenever it is in disarmed state.

**Minor Updates**

* Increased data subscription rate for POSITION and EXTRA1 to 40Hz for APM
* Added support for a custom launch file for developers. Users can create user.launch file beside core_api_autopilot.launch and add their custom ros nodes. This file won't be overwritten by auto-update.

Version 1.5-5
#############

*Released on 25th January, 2018*

**Key Updates**

* added RPi camera video streaming API via FlytCloud 
* released FlytOS beta version for DJI

**Bug Fixes**

* FlytOS during boot up on NvidiaTX1, would freeze its UI
* position_set_global API for APM sometimes sent drone to incorrect location
* position_set_global API would return success=true even if command terminated due to timeout
* FlytOS during boot up would delete saved values of user created params in few cases
* exec_script API when used to trigger complicated python script would fail sometimes
* FlytOS would not allow RC to switch over from OFFBOARD mode for PX4 in some cases

**Minor Updates**

* FlytSim now runs latest arducopter SITL firmware (v3.5.4)
* FlytOS now also checks newer FLTMODE feature of PX4, to verify API (OFFBOARD mode) switch position of RC
* Navigation APIs now detect valid position data even if position sensors other than GPS are used. Only for PX4
* added support for maxbotix MB1242 (I2C) sensors, allowing obstacle avoidance for APM
* added support for JeVois cameras (upto 2 camera supported) and enabled its ARTag detection API
* running stop_flytOS.sh script now prints relevant info, as opposed previously

Version 1.5-4
#############

*Released on 9th November, 2017*

**Key Updates**

* added support for DJI Guidance
* added video streaming option for RPi Camera using raspicam. Use FlytPilot android app, to view the stream

**Minor Updates**

* added radio_status API. This API provides RSSI information and is useful if FlytOS is connected to Autopilot via a telemetry device
* added polygon geofence_set/get API for APM
* In take_off API, minimum takeoff_alt accepted reduced to 1.5m from 3m
* Runlog utility now stores previous logs (limited upto last 10 logs)
    

Version 1.5-3
#############

*Released on 14th October, 2017*

**UI update**

* Vehicle mode 'LOITER' now supported in FlytConsole's 'mode indicator'

**Bug Fix**

* waypoint_achieved counter did not reset if waypoint_clear API is called
  
**Minor Updates**

* added access_request API and set_mode API to list of allowed REST APIs
* Runlog now stores one previous log along with current log
* improved debug messages of demoapp1 (cpp demo script)

Version 1.5-2
#############

*Released on 21st September, 2017*

**Bug Fixes**

* FlytOS autoupdate bug fix for FlytPOD
* FlytConsole bug fix for FlytPOD specific widgets

Version 1.5-0
#############

*Released on 7th September, 2017*

**Key Updates**

* Update in licensing scheme now allows FlytOS to run across all devices which support Ubuntu 16.04

**Bug Fixes**

* Navigation APIs - position_set and velocity_set with body_frame flag set to true behaved incorrectly
* Sometimes vehicle would yaw if position_hold API is called after velocity_set API

Version 1.4-2
#############

*Released on 2nd August, 2017*

**Key Updates**

* FlytSim APM now simulates APM-3.5.0.
  
**UI Updates**

* FlytConsole and Welcome page updated to indicate FlytOS Commercial License.
  
**Bug Fixes**

* Significantly improved FlytSim PX4 Gazebo vehicle stability.
* Fixed FlytOS autorestart on boot up issue.

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

