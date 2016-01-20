.. index:: api

.. _onboard_api_reference:

FlytAPI - onboard
=================


FlytAPIs have been extended from ROS to CPP, Python, REST and Websocket. This document describes all the available onboard(ROS/CPP/Python)FlytAPIs in details.

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

.. py:function:: navigation.arm()
		
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

.. py:function:: navigation.disarm()
		
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
 
.. py:function:: navigation.take_off(takeoff_alt = 5.0)
		
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
 
.. py:function:: navigation.land()
		
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.land()

.. _Position_Setpoint_onboard:

**Position Setpoint**
^^^^^^^^^^^^^^^^^^^^^

This API sends position setpoint command to the autopilot. Additionally, you can send yaw setpoint (*yaw_valid flag must be set true*) to the vehicle as well. Some abstract features have been added, such as tolerance/error-radius, synchronous/asynchronous mode, sending setpoints relative to current position (*relative flag must be set true*). 

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
        linear: {x: 5.0, y: 1.0, z: -2.0}
        angular: {x: 0.0, y: 0.0, z: 0.5}
    tolerance: 0.0
    async: false
    relative: false
    yaw_valid: true
    setpoint_type: 0"
    

CPP
"""

.. cpp:function:: int Navigation::position_set(float x, float y, float z, float yaw_setpoint, float tolerance, bool relative, bool async, bool yaw_valid)
   
   :param x,y,z: Position Setpoint in NED-Frame
   :param yaw_setpoint:  
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.land();

Python
""""""
 
.. py:function:: navigation.land()
    
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.land()


.. .. function:: format_exception(etype, value, tb[, limit=None])

..    Format the exception with a traceback.

..    :param etype: exception type
..    :param value: exception value
..    :param tb: traceback object
..    :param limit: maximum number of stack frames to show
..    :type limit: integer or None
..    :rtype: list of strings


.. rosservice call /flytsim/navigation/position_hold "{}"

.. rosservice call /flytsim/navigation/position_set "twist:
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
.. yaw_valid: false
.. setpoint_type: 0"

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

