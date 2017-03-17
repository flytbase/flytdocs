.. index:: api_list

.. _list-of-APIs:

FlytAPI - List
--------------

This document lists out all the available FlytAPIs.

.. caution:: This guide is under active development.


Get Namespace
^^^^^^^^^^^^^

All FlytAPIs begin with a fixed namespace. Use this API - :ref:`onboard<get_namespace_onboard>` / :ref:`REST<Arm_REST>` to find out its value. 


Navigation APIs
^^^^^^^^^^^^^^^

These APIs can be used to send navigational commands to the vehicle and access telemetry data from the vehicle.

Commands
""""""""

These are the list of available APIs for sending commands to the vehicle.

* Arm (:ref:`onboard<Arm_onboard>`) (:ref:`REST<Arm_REST>`)
* Disarm (:ref:`onboard<Disarm_onboard>`) (:ref:`REST<Disarm_REST>`)
* Takeoff (:ref:`onboard<TakeOff_onboard>`) (:ref:`REST<TakeOff_REST>`)
* Land (:ref:`onboard<Land_onboard>`) (:ref:`REST<Land_REST>`)
* Local Position Setpoint (:ref:`onboard<Position_Setpoint_onboard>`) (:ref:`REST<Position_Setpoint_REST>`)
* Global Position Setpoint (:ref:`REST<Global_Position_Setpoint_REST>`)
* Velocity Setpoint (:ref:`onboard<Velocity_Setpoint_onboard>`) (:ref:`REST<Velocity_Setpoint_REST>`)
* Attitude Setpoint (:ref:`onboard<Attitude_Setpoint_onboard>`) (:ref:`REST<Attitude_Setpoint_REST>`)
* Position Hold/Loiter/Hover (:ref:`onboard<Position_Hold_onboard>`) (:ref:`REST<Position_Hold_REST>`)
* Execute Onboard CPP/Python Script (:ref:`onboard<Exec_Script_onboard>`) (:ref:`REST<Exec_Script_REST>`)
* Set Home (:ref:`REST<Set_Home_REST>`)
* Waypoint Handling 

  - Set Waypoints (:ref:`REST<Set_Waypoints_REST>`)
  - Get Waypoints (:ref:`REST<Get_Waypoints_REST>`)
  - Clear Waypoints (:ref:`REST<Clear_Waypoints_REST>`)
  - Jump to a specific Waypoint
  - Pause Waypoints (:ref:`REST<Pause_Waypoints_REST>`)
  - Execute/Resume Waypoints (:ref:`REST<Execute_Waypoints_REST>`)
  - Set Current Waypoint (:ref:`REST<Set_Current_Waypoint_REST>`)

Access Telemetry Data
"""""""""""""""""""""

These are the list of available APIs for accessing telemetry data from the vehicle.

* Vehicle Attitude

  - Euler 
  - Quaternion (:ref:`REST<Attitude_Quat_REST>`)

* Vehicle Position

  - Local NED Frame (:ref:`REST<LPOS_REST>`)
  - Global LLA Frame 

* Raw IMU Sensor 
* Raw GPS 
* Raw RC Channels
* Vehicle State
* Battery Status
 

Parameter Handling APIs
^^^^^^^^^^^^^^^^^^^^^^^

These APIs help you in tweaking system parameters.

* Param Create (:ref:`REST<Param_create_REST>`)
* Param Set (:ref:`REST<Param_set_REST>`)
* Param Get (:ref:`REST<Param_get_REST>`)
* Param Get All (:ref:`REST<Param_get_all_REST>`)
* Param Delete (:ref:`REST<Param_delete_REST>`)
* Param Save (:ref:`REST<Param_save_REST>`)
* Param Load (:ref:`REST<Param_load_REST>`)



Setup APIs
^^^^^^^^^^

These APIs help you in setting up your vehicle.
This FlytAPI documentation is under construction!!!

* Sensor Calibration 
* ESC Calibration (:ref:`REST<Setup_esc_calibration>`)
* RC Calibration
* Actuator Testing (:ref:`REST<Setup_actuator_testing>`)
* Autopilot Reboot
* Module Calibration (:ref:`REST<Setup_module_calibration>`)

.. * is_authenticated
.. * is_pkg_activated

Vision APIs
^^^^^^^^^^^

These APIs provide image capture API and some image processing APIs.
This FlytAPI documentation is under construction!!!

* Video Streaming/Capture

  - List Video Streams (:ref:`REST<List_Stream_REST>`)
  - Start Video Stream (:ref:`REST<Start_Stream_REST>`)
  - Stop Video Stream (:ref:`REST<Stop_Stream_REST>`)
  - Capture/Snapshot (:ref:`REST<Capture_Stream_REST>`)

* Object Detection/Tracking

  - Select Detect/Track Mode 
  - Start/Stop Tracking Object  
  - Get Centroid of Object
  - Follow Object

.. * /global_namespace/capture_camera
.. * /global_namespace/capture_camera_stop

.. Cloud APIs
.. ^^^^^^^^^^

.. These APIs makes your vehicle connect to cloud.
.. This FlytAPI documentation is under construction!!!




















