June 2017
##########

FlytOS update version 1.3 changelog
------------------------------------

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
