.. _launch flytsim:

FlytSim Basics
==============

Launch FlytSim
--------------

Once you have installed **FlytSim**, you are ready to build your own apps and run it out on the simulation software.
To launch FlytSim, run this command in the terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS.sh --sitl

.. note:: For first time Gazebo users, Gazebo might take some time to launch. Be Patient!!!


The above command would launch ROS and Gazebo. A quadrotor model-Iris will be automatically spawned for you to start executing your app. You can use FlytAPIs in your command line to do some simple maneuvers. For ex.,

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
	yaw_valid: false
	setpoint_type: 0"

.. caution:: Gazebo runs in ENU frame, hence the above setpoints given in NED Frame would be transformed to ENU Frame by Gazebo.

To know more about such commands, please refer to :ref:`FlytAPIs<api_reference>` for more details.	

Kill FlytSim
------------

To kill this instance of FlytSim, run this command in your terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/kill_flytOS.sh --sitl



