.. _flytos basics:

FlytOS - Basics
===============

.. _launch flytos:

Launch FlytOS
-------------

Once you have installed **FlytOS**, you are ready to build your own apps and test it out on the pixhawk. If you have installed FlytImage, FlytOS would be launched automatically at every system bootup. To prevent this behaviour, comment the following line in ``/etc/rc.local`` file. 

To launch FlytOS, run this command in the terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS.sh 

In case you are using APM on Pixhawk, launch FlytOS using the following script.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS_apm.sh 

.. important:: If you get this error: ``Error: package 'core_api' not found``, source your $HOME/.bashrc file.

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
	yaw_valid: false
	body_frame: false"


To know more about such commands, please refer to :ref:`FlytAPIs<list-of-APIs>` for more details.	

Kill FlytOS
-----------

To kill this instance of FlytOS, run this command in your terminal.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/kill_flytOS.sh 


Using QGCS/Mission Planner with FlytOS
--------------------------------------

First kill any running FlytOS instance.

.. code-block:: bash

	$ $(rospack find core_api)/scripts/kill_flytOS.sh 


To launch FlytOS with UDP bridge, replace <your-ip> and <your-port> with your local GCS system ip and port(use default 14550) in the following command.

$(rospack find core_api)/scripts/start_flytOS_withUDP.sh udp://0.0.0.0:14555@<your-ip>:<your-port> --checkudp 

For example, if FlytPOD's local ip is 192.168.1.5 and that of your system running GCS is 192.168.1.10 then following command will start mavlink on GCS system's port number 14550.




.. code-block:: bash

	$ $(rospack find core_api)/scripts/start_flytOS_withUDP.sh udp://0.0.0.0:14555@192.168.1.10:14550 --checkudp


To autostart GCS UDP bridge on every startup, edit /etc/rc.local file.


