.. _api_reference:

API Reference
=============

.. _list-of-APIs:

1. Navigation APIs
------------------

These APIs can be used to send navigational commands to the vehicle and access telemetry data from the vehicle.

1.1. COMMANDS
^^^^^^^^^^^^^
These are the list of available APIs for sending commands to the vehicle.


1.1.1. Basic
""""""""""""
* `Arm`_
* Disarm
* Takeoff
* Land


1.1.2. Intermediary
"""""""""""""""""""
* Position Hold/Loiter/Hover
* Position Setpoint
* Velocity Setpoint
* Waypoints

    - Send List
    - Get List 
    - Clear List
    - Jump to specific waypoint number
    - Pause
    - Execute/Resume
    

1.1.3. Advanced
"""""""""""""""
* Attitude Setpoint
* Execute Onboard CPP/Python Script
* User mode name set - deprecated 


1.2. ACCESS TELEMETRY DATA
^^^^^^^^^^^^^^^^^^^^^^^^^^
These are the list of available APIs for accessing telemetry data from the vehicle.

1.2.1. Basic
""""""""""""
* Attitude

    - Euler
    - Quaternion
* Position

    - Local NED Frame
    - Global LLA Frame

1.2.2. Intermediary
"""""""""""""""""""
* Vehicle Status
* 
  
1.2.3. Advanced
"""""""""""""""
* Battery Status
* 

2. Parameter Handling APIs
--------------------------

* /get_global_namespace
* /global_namespace/param/param_create
* /global_namespace/param/param_delete
* /global_namespace/param/param_get
* /global_namespace/param/param_get_all
* /global_namespace/param/param_reset
* /global_namespace/param/param_save
* /global_namespace/param/param_load
* /global_namespace/param/param_set



Setup APIs
----------

* /global_namespace/setup/actuator_testing
* /global_namespace/setup/autopilot_reboot
* /global_namespace/setup/esc_calibration
* /global_namespace/setup/is_authenticated
* /global_namespace/setup/is_pkg_activated
* /global_namespace/setup/module_calibration

Vision APIs
-----------

* /global_namespace/capture_camera
* /global_namespace/capture_camera_stop



Navigation APIs
---------------
.. _Arm:

* /global_namespace/navigation/arm
