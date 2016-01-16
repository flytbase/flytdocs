.. _flytsim tutorials:

FlytSim Tutorials
=================

Once you have installed **FlytSim**, you are ready to build your own apps and run it out on the simulation software.


Launch FlytSim
^^^^^^^^^^^^^^

To launch FlytSim, run this command in the terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS.sh --sitl

.. note:: For first time Gazebo users, Gazebo might take some time to launch. Be Patient!!!


The above command would launch ROS and Gazebo. A quadrotor model-Iris will be automatically spawned for you to start executing your app. You can use FlytAPIs in your command line to do some simple maneuvers. For ex.,

.. code-block:: bash

	#To make the vehicle take off at its spot, execute this command in your terminal. 
	$ rosservice call /flytpod/navigation/take_off "takeoff_alt: 2.0"
	#Take Off command is executed with relative bit set as true, 
	#hence the vehicle moves up in z-direction with takeoff_alt argument.

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

To kill this instance of FlytSim, run this command in your terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/kill_flytOS.sh --sitl

Execute built-in Demo Apps
^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytSim package comes with Demo apps which can be executed to do simple maneuvers. 

Demo App 1
----------

This demo app makes the robot takeoff, move in a square trajectory of side length 5m and land once the entire mission is over. The source file of this app is located at /Flyt/FlytApps/Onboard/src/App1 and its executable *app1* is at /Flyt/FlytApps/Onboard/install. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ ./Flyt/FlytApps/Onboard/install/app1 

Demo App 2
----------

.. note:: This demo requires Android Demo App 1 to send arguments.


This demo app makes the robot takeoff, move in a square trajectory of side length *provided as an argument to the script from Android demo app 1* and land once the entire mission is over. The source file of this app is located at /Flyt/FlytApps/Onboard/src/App2 and its executable *app2* is at /Flyt/FlytApps/Onboard/install. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ ./Flyt/FlytApps/Onboard/install/app2 



.. Create your own custom app
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^

.. To begin with one can download the above two demo apps from **github link**. Once downloaded follow the following steps to create your own app.
.. * Create a directory where you want to keep the source files of your apps::
.. 	mkdir <sitl_apps> 
.. * Create the directory inside *sitl_apps* for your first app::
.. 	mkdir <my_first_app>
.. * Copy CMakeLists.txt from the downloaded demo app 1, and paste it inside <my_first_app>.
.. * Create your own cpp file 
.. * Create a build directory to host all your build files::
.. 	mkdir <build>
.. * To install your app, so that your Android App could execute it, run this command sudo cmake -DCOMPONENT=Runtime -P cmake_install.cmake


.. Compile and Execute your own app
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * run cmake
.. * make
.. * your binary will be created
.. * launch FLytSim using <command>
.. * execute your own script from terminal


.. Edit or create your own custom models
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. .. note:: This section is for advanced users

.. * model urdf files are available in <this path>
.. * users could edit or create their own model files













