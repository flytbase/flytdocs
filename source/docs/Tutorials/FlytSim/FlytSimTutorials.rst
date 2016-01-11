.. _flytsim tutorials:

FlytSim Tutorials
=================

Once you have installed **FlytSim**, you are ready to build your own apps and run it out on the simulation software.


Launch FlytSim
^^^^^^^^^^^^^^

To launch FlytSim, run this command in the terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS.sh --sitl

The above command would launch ROS and Gazebo. A quadrotor model-Iris will be automatically spawned for you to start executing your app. You can simply use FlytAPIs in your command line to do some simple maneuvers. For ex.,

.. code-block:: bash

	#To make the vehicle take off at its spot, execute this command in your terminal. 
	$ rosservice call /flytpod/navigation/take_off "takeoff_alt: 2.0"

.. code-block:: bash

	#To send a position setpoint to the vehicle, execute this command in your terminal.
	$ rosservice call /flytpod/navigation/position_set "twist:
	header:
	seq: 0
	stamp: {secs: 0, nsecs: 0}
	frame_id: ''
	twist:
	linear: {x: 1.0, y: -1.0, z: -5.0}
	angular: {x: 0.0, y: 0.0, z: 0.5}
	tolerance: 0.5
	async: false
	relative: false
	yaw_valid: true
	setpoint_type: 0"

To know more about such commands, please refer to :ref:`FlytAPIs<api_reference>` for more details.	


Create your own custom app
^^^^^^^^^^^^^^^^^^^^^^^^^^

To begin with one can download 
* go to this directory
* include library in makefile or use available makefile
* write your code using FlytAPIs

vjebviuervuie https://flytpod:port/flytconsole kvaebrkbvaebvk.


Compile and Execute your own app
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* run cmake
* make
* your binary will be created
* launch FLytSim using <command>
* execute your own script from terminal


Edit or create your own custom models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: This section is for advanced users

* model urdf files are available in <this path>
* users could edit or create their own model files
