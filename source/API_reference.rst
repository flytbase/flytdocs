.. index:: api

.. _api_reference:

API Reference
=============

.. _list-of-APIs:

Navigation APIs
---------------

These APIs can be used to send navigational commands to the vehicle and access telemetry data from the vehicle.

COMMANDS
^^^^^^^^
These are the list of available APIs for sending commands to the vehicle.


Basic
"""""
* `Arm`_
* Disarm
* Takeoff
* Land


Intermediary
""""""""""""
* Position Hold/Loiter/Hover
* Position Setpoint
* Velocity Setpoint
* Waypoints
* testing

  - sample1
      
#. cvcequvyqcu
#. cweahcehwacbw
#. cjha  chjwcjhawecw

   #) vweawvwav
   vsvhereverhvhevraev
   Follow the order below to modify the form.  
   Later parts may not be visible until you do the previous parts.  The 
   image shows the final form as filled out by Dr. Harrington.

   - csacvwvawv
        
1. cvwjhvacvwh
2. cjhhawvjwj
3. cajwvecwv

   a) 

   a) 

Advanced
""""""""
* Attitude Setpoint
* Execute Onboard CPP/Python Script
* User mode name set - deprecated 



ACCESS TELEMETRY DATA
^^^^^^^^^^^^^^^^^^^^^
These are the list of available APIs for accessing telemetry data from the vehicle.

Basic
"""""
* Attitude

    - Euler
    - Quaternion
* Position

    - Local NED Frame
    - Global LLA Frame

Intermediary
""""""""""""
* Vehicle Status
* 
  
Advanced
""""""""
* Battery Status
* 

Parameter Handling APIs
-----------------------

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

`link_variable_name`_ 

.. _link_variable_name: http://


    .. - Send List
    .. - Get List 
    .. - Clear List
    .. - Jump to specific waypoint number
    .. - Pause
    .. - Execute/Resume
    
