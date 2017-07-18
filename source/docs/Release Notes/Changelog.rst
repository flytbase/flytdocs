Recent Updates
===============
asd
We improve the FlytBase platform continually by releasing new features, removing bugs and updating documentation. Here's 
a list of changes for. 

**July 2017**

FlytOS Update 1.41 Change log

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



