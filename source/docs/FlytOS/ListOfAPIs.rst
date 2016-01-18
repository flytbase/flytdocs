.. index:: api_list

.. _list-of-APIs:

List of APIs
------------

This document lists out all the available FlytAPIs.

Navigation APIs
^^^^^^^^^^^^^^^

These APIs can be used to send navigational commands to the vehicle and access telemetry data from the vehicle.

Commands
""""""""

These are the list of available APIs for sending commands to the vehicle.

* Arm (:ref:`onboard<Arm_onboard>`) (:ref:`REST<Arm_REST>`)
* Disarm
* Takeoff
* Land
* Position Hold/Loiter/Hover
* Position Setpoint
* Velocity Setpoint
* Attitude Setpoint
* Waypoint Handling

  - Send List
  - Get List 
  - Clear List
  - Jump to specific waypoint number
  - Pause
  - Execute/Resume               

* Execute Onboard CPP/Python Script


Access Telemetry Data
"""""""""""""""""""""

These are the list of available APIs for accessing telemetry data from the vehicle.

* Attitude

  - Euler
  - Quaternion

* Position

  - Local NED Frame
  - Global LLA Frame

.. * Vehicle Status

.. * Battery Status
 

Parameter Handling APIs
^^^^^^^^^^^^^^^^^^^^^^^

These APIs help you in tweaking system parameters.
This FlytAPI documentation is under construction!!!

.. * /get_global_namespace
.. * /global_namespace/param/param_create
.. * /global_namespace/param/param_delete
.. * /global_namespace/param/param_get
.. * /global_namespace/param/param_get_all
.. * /global_namespace/param/param_reset
.. * /global_namespace/param/param_save
.. * /global_namespace/param/param_load
.. * /global_namespace/param/param_set



Setup APIs
^^^^^^^^^^

These APIs help you in setting up your vehicle.
This FlytAPI documentation is under construction!!!

.. * /global_namespace/setup/actuator_testing
.. * /global_namespace/setup/autopilot_reboot
.. * /global_namespace/setup/esc_calibration
.. * /global_namespace/setup/is_authenticated
.. * /global_namespace/setup/is_pkg_activated
.. * /global_namespace/setup/module_calibration

Vision APIs
^^^^^^^^^^^

These APIs provide image capture API and some image processing APIs.
This FlytAPI documentation is under construction!!!

.. * /global_namespace/capture_camera
.. * /global_namespace/capture_camera_stop

Cloud APIs
^^^^^^^^^^

These APIs makes your vehicle connect to cloud.
This FlytAPI documentation is under construction!!!



.. .. warning:: fwffefefe

.. .. tip:: cqfeqe

.. .. note:: ccqeceqe

.. .. important:: cqecqecq

.. .. hint:: ecqcceqe

.. .. error:: cqcqecqecq

.. .. danger:: cqecqecqe

.. .. caution:: ceceqevqev

.. .. attention:: cqcqevcqe



















