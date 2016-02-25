.. _flytos basics:

FlytOS Basics
=============

.. _launch flytos:

Launch FlytOS
-------------

Once you have installed **FlytOS**, you are ready to build your own apps and test it out on the pixhawk.
To launch FlytOS, run this command in the terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS.sh 

If you get this error: ``Error: package 'core_api' not found``, source your bashrc.

You can use FlytAPIs in your command line to do some simple maneuvers. For example,

.. code-block:: bash

	#To make the vehicle take off at its spot, execute this command in your terminal. 
	$ rosservice call /flytpod/navigation/take_off "takeoff_alt: 2.0"

.. code-block:: bash

	#To send a position setpoint to the vehicle in NED frame, execute this command in your terminal.
	rosservice call /flytpod/navigation/position_set "twist:
	 header:
	   seq: 0
	   stamp: {secs: 0, nsecs: 0}
	   frame_id: ''
	 twist:
	   linear: {x: 3.0, y: 1.0, z: -2.0}
	   angular: {x: 0.0, y: 0.0, z: 0.0}
	tolerance: 0.0
	async: false
	relative: false
	body_frame: false
	yaw_valid: false"


To know more about such commands, please refer to :ref:`FlytAPIs<list-of-APIs>` for more details.	

Kill FlytOS
-----------

To kill this instance of FlytOS, run this command in your terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/kill_flytOS.sh 



