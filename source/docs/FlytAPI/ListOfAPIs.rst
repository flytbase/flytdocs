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
* Global Position Setpoint
* Velocity Setpoint (:ref:`onboard<Velocity_Setpoint_onboard>`) (:ref:`REST<Velocity_Setpoint_REST>`)
* Attitude Setpoint (:ref:`onboard<Attitude_Setpoint_onboard>`) (:ref:`REST<Attitude_Setpoint_REST>`)
* Position Hold/Loiter/Hover (:ref:`onboard<Position_Hold_onboard>`) (:ref:`REST<Position_Hold_REST>`)
* Execute Onboard CPP/Python Script (:ref:`onboard<Exec_Script_onboard>`) (:ref:`REST<Exec_Script_REST>`)
* Waypoint Handling 

  - Send Waypoints
  - Get Waypoints 
  - Clear Waypoints
  - Jump to a specific Waypoint
  - Pause Waypoints
  - Execute/Resume Waypoints

Access Telemetry Data
"""""""""""""""""""""

These are the list of available APIs for accessing telemetry data from the vehicle.

* Vehicle Attitude

  - Euler 
  - Quaternion 

* Vehicle Position

  - Local NED Frame 
  - Global LLA Frame 

* Raw IMU Sensor 
* Raw GPS 
* Raw RC Channels
* Vehicle State
* Battery Status
 

Parameter Handling APIs
^^^^^^^^^^^^^^^^^^^^^^^

These APIs help you in tweaking system parameters.

* Param Create
* Param Set
* Param Get
* Param Get All
* Param Delete
* Param Save
* Param Load



Setup APIs
^^^^^^^^^^

These APIs help you in setting up your vehicle.
This FlytAPI documentation is under construction!!!

* Sensor Calibration
* ESC Calibration
* RC Calibration
* Actuator Testing
* Autopilot Reboot

.. * is_authenticated
.. * is_pkg_activated

Vision APIs
^^^^^^^^^^^

These APIs provide image capture API and some image processing APIs.
This FlytAPI documentation is under construction!!!

* List Video Streams
* Start/Stop Video Stream
* Capture Snapshot

.. * /global_namespace/capture_camera
.. * /global_namespace/capture_camera_stop

.. Cloud APIs
.. ^^^^^^^^^^

.. These APIs makes your vehicle connect to cloud.
.. This FlytAPI documentation is under construction!!!



.. .. warning:: fwffefefe

.. .. tip:: cqfeqe

.. .. note:: ccqeceqe

.. .. important:: cqecqecq

.. .. hint:: ecqcceqe

.. .. error:: cqcqecqecq

.. .. danger:: cqecqecqe

.. .. caution:: ceceqevqev

.. .. attention:: cqcqevcqe



















