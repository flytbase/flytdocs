Recent Updates
===============

We improve the FlytBase platform continually by releasing new features, removing bugs and updating documentation. Here's 
a list of changes so far. 

**July 2017 - FlytOS Update 1.41 Change log**

**Software Updates**

* Added support for Intel Joule
* FlytOS now autodetects serial port and the baudrate on which Pixhawk is connected. List of autodetectable 
  ports: http://docs.flytbase.com/docs/FlytOS/Debugging/FAQ.html#change-baudrate-or-portname
* Shifted SITL gcs_url from UDP to TCP 
* Configured mavros target_comp_id to 0 -> no need to set PX4 param MAV_COMP_ID to 50
* FlytOS runlog would now be logged at /flyt/logs/runlogs/flyt_runlogs.log. 
* No need to reboot after license activation.
* Added log retrieval from from FlytBase Cloud.
* Cloud remote client added, disabled by default.

**UI Updates**

* FlytConsole, message window now prints navigation API debug messages
* Added log view and download webapp options at http://localhost/logs

**Bug Fixes**

* FlytConsole GCS widget -> for APM waypoints, incoherent wp #1 and wp #2 when set by user
* FlytConsole -> calibration msgs fixes
* FixedWing -> PositionHold and PositionSetGlobal now respond correctly. Unsupported APIs: PositionSet and VelocitySet return   without sending any setpoint to drone.

**Other**

* Calling access_request API is now MUST if vehicle is not switched to OFFBOARD/GUIDED mode via RC or set_mode API.



