.. index:: api

.. _onboard_api_reference:

FlytAPI - onboard
=================


FlytAPIs have been extended from ROS to CPP, Python, REST and Websocket. This document describes all the available onboard(ROS/CPP/Python) FlytAPIs in details.

.. caution:: This guide is under active development.


Navigation APIs
---------------

These APIs allows you to have navigational control over your vehicle, and also provides vehicle telemetry data for further processing.

.. _Arm_onboard:

**ARM**
^^^^^^^

.. danger:: This command might turn on the motors if their ESCs are powered up.

This API arms the vehicle, passes controller outputs to the mixer.

ROS
"""

*Service Name:* /flytsim/navigation/arm

*Service Type:* core_api/Arm, below is its description

.. literalinclude:: include/navigation/Arm.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /flytsim/navigation/arm {}

CPP
"""

.. cpp:function:: int Navigation::arm(void)
		
   :return: 0 if the vehicle gets ARMED, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    if(!nav.arm())
    	cout<<"System ARMED";
    else
    	cout<<"Failed to ARM system";

Python
""""""

.. py:function:: navigation.arm(self)
		
   :return: 0 if the vehicle gets ARMED, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.arm()

.. _Disarm_onboard:

**Disarm**
^^^^^^^^^^

This API disarms the vehicle, disconnects controller outputs from the mixer.

ROS
"""

*Service Name:* /flytsim/navigation/disarm

*Service Type:* core_api/Disarm, below is its description

.. literalinclude:: include/navigation/Disarm.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /flytsim/navigation/disarm {}

CPP
"""

.. cpp:function:: int Navigation::disarm(void)
		
   :return: 0 if the vehicle gets DISARMED, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    if(!nav.disarm())
    	cout<<"System DISARMED";
    else
    	cout<<"Failed to DISARM system";

Python
""""""

.. py:function:: navigation.disarm(self)
		
   :return: 0 if the vehicle gets DISARMED, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.disarm()


.. _TakeOff_onboard:

**TakeOff**
^^^^^^^^^^^

This API sends takeoff command to the autopilot. The API accepts *takeoff_alt* argument, which specifies the TakeOff height in meters above the current positon. It must always be a positive quantity.

.. note:: This API runs in synchronous mode, which means the API call won't return unless either the provided `takeoff_alt` is achieved or timeout(30secs) called.

ROS
"""

*Service Name:* /flytsim/navigation/take_off

*Service Type:* core_api/TakeOff, below is its description

.. literalinclude:: include/navigation/TakeOff.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /flytsim/navigation/take_off "takeoff_alt: 3.0"

CPP
"""

.. c:function:: int Navigation::take_off(float takeoff_alt = 5.0)
	 
   :param takeoff_alt: TakeOff Altitude in meters with default value of 5.0
   :return: 0 if the vehicle reaches takeoff_alt before timeout=30sec, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.take_off(3.0);

Python
""""""
 
.. py:function:: navigation.take_off(self, takeoff_alt = 5.0)
		
   :param takeoff_alt: TakeOff Altitude in meters with default value of 5.0
   :return: 0 if the vehicle reaches takeoff_alt before timeout=30sec, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.take_off(3.0)


.. _Land_onboard:

**Land**
^^^^^^^^

This API sends land command to the autopilot. Currently, you cannot send arbitrary position coordinates to land on, the vehicle considers its current local position at the time of triggering this command as its landing coordinates.

.. note:: This API runs in asynchronous mode, which means the API call would return as soon as landing command has been sent to the autopilot, irrespective of whether the vehicle has landed or not.

ROS
"""

*Service Name:* /flytsim/navigation/land

*Service Type:* core_api/Land, below is its description

.. literalinclude:: include/navigation/Land.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /flytsim/navigation/land "{}" 

CPP
"""

.. cpp:function:: int Navigation::land(void)
	 
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.land();

Python
""""""
 
.. py:function:: navigation.land(self)
		
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.land()

.. _Position_Setpoint_onboard:

**Position Setpoint**
^^^^^^^^^^^^^^^^^^^^^

This API sends position setpoint command to the autopilot. Additionally, you can send yaw setpoint (*yaw_valid flag must be set true*) to the vehicle as well. Some abstract features have been added, such as tolerance/acceptance-radius, synchronous/asynchronous mode, sending setpoints relative to current position (*relative flag must be set true*). 

.. tip:: Asynchronous mode - The API call would return as soon as the command has been sent to the autopilot, irrespective of whether the vehicle has reached the given setpoint or not.

.. tip:: Synchronous mode - The API call would wait for the function to return, which happens when either the position setpoint is reached or timeout=30secs is over.

ROS
"""

*Service Name:* /flytsim/navigation/position_set

*Service Type:* core_api/PositionSet, below is its description

.. literalinclude:: include/navigation/PositionSet.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /flytsim/navigation/position_set "twist:
      header:
        seq: 0
        stamp: {secs: 0, nsecs: 0}
        frame_id: ''
      twist:
        linear: {x: 1.0, y: 3.5, z: -5.0}
        angular: {x: 0.0, y: 0.0, z: 0.5}
    tolerance: 0.0
    async: false
    relative: false
    yaw_valid: true
    setpoint_type: 0"

    #sends (x,y,z)=(1.0,3.5,-5.0), yaw=0.12, tolerance=1.0m, relative=false, async=false, yaw_valid=true
    #default value of tolerance=1.0m if left at 0
    

CPP
"""

.. cpp:function:: int position_set(float x, float y, float z, float yaw_setpoint=0, float tolerance=0, bool relative=false, bool async=false, bool yaw_valid=false)
   
   :param x,y,z: Position Setpoint in NED-Frame
   :param yaw_setpoint: Yaw Setpoint in radians
   :param yaw_valid: Must be set to true, if yaw setpoint is provided
   :param tolerance: Acceptance radius in meters, default value=1.0m
   :param relative: If true, position setpoints relative to current position is sent
   :param async: If true, asynchronous mode is set
   :return: For async=true, returns 0 if the command is successfully sent to the vehicle, else returns 1. For async=false, returns 0 if the vehicle reaches given setpoint before timeout=30secs, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true);
    #sends (x,y,z)=(1.0,3.5,-5.0), yaw=0.12, tolerance=5.0m, relative=false, async=false, yaw_valid=true

Python
""""""
 
.. py:function:: navigation.position_set(self, x, y, z, yaw=0.0, tolerance=0.0, relative=False, async=False, yaw_valid=False)
    
   :param x,y,z: Position Setpoint in NED-Frame
   :param float yaw_setpoint: Yaw Setpoint in radians
   :param bool yaw_valid: Must be set to true, if yaw setpoint is provided
   :param float tolerance: Acceptance radius in meters, default value=1.0m
   :param bool relative: If true, position setpoints relative to current position is sent
   :param bool async: If true, asynchronous mode is set
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true);
    #sends (x,y,z)=(1.0,3.5,-5.0), yaw=0.12, tolerance=5.0m, relative=false, async=false, yaw_valid=true

.. _Velocity_Setpoint_onboard:

**Velocity Setpoint**
^^^^^^^^^^^^^^^^^^^^^

This API sends velocity setpoint command to the autopilot. Additionally, you can send yaw_rate setpoint (*yaw_rate_valid flag must be set true*) to the vehicle as well. Some abstract features have been added, such as tolerance/acceptance-radius, synchronous/asynchronous mode, sending setpoints relative to current velocity (*relative flag must be set true*). 

.. tip:: Asynchronous mode - The API call would return as soon as the command has been sent to the autopilot, irrespective of whether the vehicle has reached the given setpoint or not.

.. tip:: Synchronous mode - The API call would wait for the function to return, which happens when either the velocity setpoint is reached or timeout=30secs is over.

ROS
"""

*Service Name:* /flytsim/navigation/velocity_set

*Service Type:* core_api/VelocitySet, below is its description

.. literalinclude:: include/navigation/VelocitySet.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
		rosservice call /flytsim/navigation/velocity_set "twist:
		  header:
		    seq: 0
		    stamp: {secs: 0, nsecs: 0}
		    frame_id: ''
		  twist:
		    linear: {x: 0.5, y: 0.2, z: -0.1}
		    angular: {x: 0.0, y: 0.0, z: 0.1}
		tolerance: 0
		async: false
		relative: false
		yaw_rate_valid: true" 

    #sends (vx,vy,vz)=(0.5,0.2,-0.1), yaw_rate=0.1, tolerance=1.0m/s, relative=false, async=false, yaw_rate_valid=true
    #default value of tolerance=1.0m/s if left at 0

CPP
"""

.. cpp:function:: int position_set(float x, float y, float z, float yaw_setpoint=0, float tolerance=0, bool relative=false, bool async=false, bool yaw_valid=false)
   
   :param x,y,z: Position Setpoint in NED-Frame
   :param yaw_setpoint: Yaw Setpoint in radians
   :param yaw_valid: Must be set to true, if yaw setpoint is provided
   :param tolerance: Acceptance radius in meters
   :param relative: If true, position setpoints relative to current position is sent
   :param async: If true, asynchronous mode is set
   :return: For async=true, returns 0 if the command is successfully sent to the vehicle, else returns 1. For async=false, returns 0 if the vehicle reaches given setpoint before timeout=30secs, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true);
    #sends (x,y,z)=(1.0,3.5,-5.0), yaw=0.12, tolerance=5.0m, relative=false, async=false, yaw_valid=true

Python
""""""
 
.. py:function:: navigation.position_set(self, x, y, z, yaw=0.0, tolerance=0.0, relative=False, async=False, yaw_valid=False)
    
   :param x,y,z: Position Setpoint in NED-Frame
   :param float yaw_setpoint: Yaw Setpoint in radians
   :param bool yaw_valid: Must be set to true, if yaw setpoint is provided
   :param float tolerance: Acceptance radius in meters
   :param bool relative: If true, position setpoints relative to current position is sent
   :param bool async: If true, asynchronous mode is set
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true);
    #sends (x,y,z)=(1.0,3.5,-5.0), yaw=0.12, tolerance=5.0m, relative=false, async=false, yaw_valid=true

.. .. function:: format_exception(etype, value, tb[, limit=None])

..    Format the exception with a traceback.

..    :param etype: exception type
..    :param value: exception value
..    :param tb: traceback object
..    :param limit: maximum number of stack frames to show
..    :type limit: integer or None
..    :rtype: list of strings


.. rosservice call /flytsim/navigation/position_hold "{}"


.. rosservice call /flytsim/navigation/velocity_set "twist:
..   header:
..     seq: 0
..     stamp: {secs: 0, nsecs: 0}
..     frame_id: ''
..   twist:
..     linear: {x: 0.0, y: 0.0, z: 0.0}
..     angular: {x: 0.0, y: 0.0, z: 0.0}
.. tolerance: 0.0
.. async: false
.. relative: false
.. yaw_rate_valid: false" 

.. rosservice call /flytsim/navigation/attitude_set "pose:
..   header:
..     seq: 0
..     stamp:
..       secs: 0
..       nsecs: 0
..     frame_id: ''
..   twist:
..     linear:
..       x: 0.0
..       y: 0.0
..       z: 0.0
..     angular:
..       x: 0.0
..       y: 0.0
..       z: 0.0
.. thrust: 0.0"

.. rosservice call /flytsim/navigation/exec_script "app_name: ''
.. arguments: ''" 


.. rostopic echo /flytsim/mavros/imu/data
.. rostopic echo /flytsim/mavros/imu/data_euler
.. rostopic echo /flytsim/mavros/local_position/local
.. rostopic echo /flytsim/mavros/global_position/global




.. .. warning:: fwffefefe

.. .. tip:: cqfeqe

.. .. note:: ccqeceqe

.. .. important:: cqecqecq

.. .. hint:: ecqcceqe

.. .. error:: cqcqecqecq

.. .. danger:: cqecqecqe

.. .. caution:: ceceqevqev

.. .. attention:: cqcqevcqe

