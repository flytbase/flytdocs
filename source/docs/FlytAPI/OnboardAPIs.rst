.. index:: api

.. _onboard_api_reference:

FlytAPI - Onboard
=================


.. caution:: This guide is under active development.

FlytAPIs have been extended from ROS to CPP, Python, REST and Websocket. This document describes all the available onboard(ROS/CPP/Python) FlytAPIs in details.

.. important:: All ROS-based FlytAPIs begin with a fixed namespace. Use :ref:`Get Namespace<get_namespace_onboard>` to find out its value. One must replace <namespace> in all the following APIs with the previously obtained value.

----

.. _get_namespace_onboard:

Get Namespace
-------------

This API returns the namespace under which FlytOS is running. By default, namespace is set to ``flytpod`` for FlytOS and ``flytsim`` for FlytSim. This API is only available in ROS as CPP/Python APIs do not need this information.

*Service Name:* /get_global_namespace

*Service Type:* core_api/ParamGetGlobalNamespace, below is its description

.. literalinclude:: include/param/ParamGetGlobalNamespace.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /get_global_namespace
    #the value of namespace is returned in 'param_value'

----


Navigation APIs
---------------

These APIs allows you to have navigational control over your vehicle, and also provides vehicle telemetry data for further processing.

.. _Arm_onboard:

**Arm**
^^^^^^^

.. danger:: This command might turn on the motors if their ESCs are powered up.

This API arms the vehicle, passes controller outputs to the mixer. Usage of :ref:`Takeoff<TakeOff_onboard>` is preferred.


ROS
"""

*Service Name:* /<namespace>/navigation/arm

*Service Type:* core_api/Arm, below is its description

.. literalinclude:: include/navigation/Arm.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /<namespace>/navigation/arm {}

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

----


.. _Disarm_onboard:

**Disarm**
^^^^^^^^^^

This API disarms the vehicle, disconnects controller outputs from the mixer.

ROS
"""

*Service Name:* /<namespace>/navigation/disarm

*Service Type:* core_api/Disarm, below is its description

.. literalinclude:: include/navigation/Disarm.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /<namespace>/navigation/disarm {}

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

----

.. _TakeOff_onboard:

**TakeOff**
^^^^^^^^^^^

This API arms the vehicle(if it is disarmed) and sends takeoff command to the autopilot. The API accepts *takeoff_alt* argument, which specifies the TakeOff height in meters above the current position. It must always be a positive quantity. 

.. note:: This API runs in synchronous mode, which means the API call won't return unless either the provided `takeoff_alt` is achieved or timeout(30secs) called.

ROS
"""

*Service Name:* /<namespace>/navigation/take_off

*Service Type:* core_api/TakeOff, below is its description

.. literalinclude:: include/navigation/TakeOff.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /<namespace>/navigation/take_off "takeoff_alt: 3.0"

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

----


.. _Land_onboard:

**Land**
^^^^^^^^

This API sends land command to the autopilot. Currently, you cannot send arbitrary position coordinates to land on, the vehicle considers its current local position at the time of triggering this command as its landing coordinates.

.. note:: This API runs in asynchronous mode, which means the API call would return as soon as landing command has been sent to the autopilot, irrespective of whether the vehicle has landed or not.

ROS
"""

*Service Name:* /<namespace>/navigation/land

*Service Type:* core_api/Land, below is its description

.. literalinclude:: include/navigation/Land.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash

    rosservice call /<namespace>/navigation/land "async: false"

CPP
"""

.. cpp:function:: int Navigation::land(bool async = true)
	 
   :param async: If true, asynchronous mode is set
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.land(true);

Python
""""""
 
.. py:function:: navigation.land(self, async=True)
		
   :param async: If true, asynchronous mode is set
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.land(True)

----

.. _Position_Setpoint_onboard:

**Position Setpoint**
^^^^^^^^^^^^^^^^^^^^^

This API sends position setpoint command to the autopilot. Additionally, you can send yaw setpoint (*yaw_valid flag must be set true*) to the vehicle as well. Some abstract features have been added, such as tolerance/acceptance-radius, synchronous/asynchronous mode, sending setpoints relative to current position (*relative flag must be set true*), sending setpoints relative to current body frame (*body_frame flag must be set true*). 

.. note:: You can either set ``body_frame`` or ``relative`` flag. If both are set, ``body_frame`` takes precedence.

.. tip:: Asynchronous mode - The API call would return as soon as the command has been sent to the autopilot, irrespective of whether the vehicle has reached the given setpoint or not.

.. tip:: Synchronous mode - The API call would wait for the function to return, which happens when either the position setpoint is reached or timeout=30secs is over.

ROS
"""

*Service Name:* /<namespace>/navigation/position_set

*Service Type:* core_api/PositionSet, below is its description

.. literalinclude:: include/navigation/PositionSet.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /<namespace>/navigation/position_set "twist:
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
    body_frame: false"

    #sends (x,y,z)=(1.0,3.5,-5.0)(m), yaw=0.12rad, relative=false, async=false, yaw_valid=true, body_frame=false
    #default value of tolerance=1.0m if left at 0    

CPP
"""

.. cpp:function:: int Navigation::position_set(float x, float y, float z, float yaw=0, float tolerance=0, bool relative=false, bool async=false, bool yaw_valid=false, bool body_frame=false)

   :param x,y,z: Position Setpoint in NED-Frame (in body-frame if body_frame=true)
   :param yaw: Yaw Setpoint in radians
   :param yaw_valid: Must be set to true, if yaw setpoint is provided
   :param tolerance: Acceptance radius in meters, default value=1.0m
   :param relative: If true, position setpoints relative to current position is sent
   :param async: If true, asynchronous mode is set
   :param body_frame: If true, position setpoints are relative with respect to body frame
   :return: For async=true, returns 0 if the command is successfully sent to the vehicle, else returns 1. For async=false, returns 0 if the vehicle reaches given setpoint before timeout=30secs, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true, false);
    #sends (x,y,z)=(1.0,3.5,-5.0)(m), yaw=0.12rad, tolerance=5.0m, relative=false, async=false, yaw_valid=true, body_frame=false

Python
""""""
 
.. py:function:: navigation.position_set(self, x, y, z, yaw=0.0, tolerance=0.0, relative=False, async=False, yaw_valid=False, body_frame=False)
    
   :param float x,y,z: Position Setpoint in NED-Frame (in body-frame if body_frame=true)
   :param float yaw_setpoint: Yaw Setpoint in radians
   :param bool yaw_valid: Must be set to true, if yaw setpoint is provided
   :param float tolerance: Acceptance radius in meters, default value=1.0m
   :param bool relative: If true, position setpoints relative to current position is sent
   :param bool async: If true, asynchronous mode is set
   :param body_frame: If true, position setpoints are relative with respect to body frame
   :return: 0 if the land command is successfully sent to the vehicle, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.position_set(1.0, 3.5, -5.0, 0.12, 5.0, false, false, true, false)
    #sends (x,y,z)=(1.0,3.5,-5.0)(m), yaw=0.12rad, tolerance=5.0m, relative=false, async=false, yaw_valid=true, body_frame=false

----

.. _Velocity_Setpoint_onboard:

**Velocity Setpoint**
^^^^^^^^^^^^^^^^^^^^^

This API sends velocity setpoint command to the autopilot. Additionally, you can send yaw_rate setpoint (*yaw_rate_valid flag must be set true*) to the vehicle as well. Some abstract features have been added, such as tolerance/acceptance-radius, synchronous/asynchronous mode, sending setpoints relative to current velocity (*relative flag must be set true*), sending setpoints relative to current body frame (*body_frame flag must be set true*). 

.. note:: You can either set ``body_frame`` or ``relative`` flag. If both are set, ``body_frame`` takes precedence.

.. tip:: Asynchronous mode - The API call would return as soon as the command has been sent to the autopilot, irrespective of whether the vehicle has reached the given setpoint or not.

.. tip:: Synchronous mode - The API call would wait for the function to return, which happens when either the velocity setpoint is reached or timeout=30secs is over.

ROS
"""

*Service Name:* /<namespace>/navigation/velocity_set

*Service Type:* core_api/VelocitySet, below is its description

.. literalinclude:: include/navigation/VelocitySet.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /<namespace>/navigation/velocity_set "twist:
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
    yaw_rate_valid: true
    body_frame: false"                   

    #sends (vx,vy,vz)=(0.5,0.2,-0.1)(m/s), yaw_rate=0.1rad/s,  relative=false, async=false, yaw_rate_valid=true, body_frame=false
    #default value of tolerance=1.0m/s if left at 0

CPP
"""

.. cpp:function:: int Navigation::velocity_set(float vx, float vy, float vz, float yaw_rate=0, float tolerance=0, bool relative=false, bool async=false, bool yaw_rate_valid=false, bool body_frame=false)

   :param vx,vy,vz: Velocity Setpoint in NED-Frame (in body-frame if body_frame=true)
   :param yaw_rate: Yaw_rate Setpoint in radians/sec
   :param yaw_rate_valid: Must be set to true, if yaw_rate setpoint is provided
   :param tolerance: Acceptance radius in meters/s, default value=1.0m/s
   :param relative: If true, velocity setpoints relative to current position is sent
   :param async: If true, asynchronous mode is set
   :param body_frame: If true, velocity setpoints are with respect to body frame
   :return: For async=true, returns 0 if the command is successfully sent to the vehicle, else returns 1. For async=false, returns 0 if the vehicle reaches given setpoint before timeout=30secs, else returns 1.

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.velocity_set(1.0, 0.5, -1.0, 0.12, 0.5, false, false, true, false);
    #sends (vx,vy,vz)=(1.0,0.5,-1.0)(m/s), yaw_rate=0.12rad/s, tolerance=0.5m/s, relative=false, async=false, yaw_rate_valid=true, body_frame=false

Python
""""""
 
.. py:function:: navigation.velocity_set(self, vx, vy, vz, yaw_rate=0.0, tolerance=0.0, relative=False, async=False, yaw_rate_valid=False, body_frame=False)
    
   :param vx,vy,vz: Velocity Setpoint in NED-Frame (in body-frame if body_frame=true)
   :param yaw_rate: Yaw_rate Setpoint in radians/sec
   :param yaw_rate_valid: Must be set to true, if yaw_rate setpoint is provided
   :param tolerance: Acceptance radius in meters/s, default value=1.0m/s
   :param relative: If true, velocity setpoints relative to current position is sent
   :param async: If true, asynchronous mode is set
   :param body_frame: If true, velocity setpoints are with respect to body frame
   :return: For async=true, returns 0 if the command is successfully sent to the vehicle, else returns 1. For async=false, returns 0 if the vehicle reaches given setpoint before timeout=30secs, else returns 1.

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.velocity_set(1.0, 0.5, -1.0, 0.12, 0.5, false, false, true, false)
    #sends (vx,vy,vz)=(1.0,0.5,-1.0)(m/s), yaw_rate=0.12rad/s, tolerance=0.5m/s, relative=false, async=false, yaw_rate_valid=true, body_frame=false

----

.. _Attitude_Setpoint_onboard:

**Attitude Setpoint**
^^^^^^^^^^^^^^^^^^^^^

.. caution:: This is an advanced API and must be used iff its absolutely necessary. Incorrect use will destabilize the vehicle.

This API sends attitude setpoint command to the autopilot. You must send roll, pitch, yaw and thrust setpoints at regular intervals to keep the vehicle stable.


ROS
"""

*Service Name:* /<namespace>/navigation/attitude_set

*Service Type:* core_api/AttitudeSet, below is its description

.. literalinclude:: include/navigation/AttitudeSet.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /<namespace>/navigation/attitude_set "pose:
      header:
        seq: 0
        stamp:
          secs: 0
          nsecs: 0
        frame_id: ''
      twist:
        linear:
          x: 0.0
          y: 0.0
          z: 0.0
        angular:
          x: 0.0
          y: 0.0
          z: 0.3
    thrust: 650.0"                  

    #sends (roll,pitch,yaw)=(0.0,0.0,0.3)(rad), thrust = 650 (N)

CPP
"""

.. cpp:function:: int Navigation::attitude_set(float roll, float pitch, float yaw, float thrust)

   :param roll,pitch,yaw: Attitude Setpoints in radians
   :param thrust: Thrust Setpoint in Newtons
   :return: returns 1 if the command is successfully sent to the vehicle

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.attitude_set(0.0, 0.0, -0.8, 660);
    #sends (roll,pitch,yaw)=(0.0,0.0,0.8)(rad), thrust=660N

Python
""""""
 
.. py:function:: navigation.attitude_set(self, roll, pitch, yaw, thrust)
    
   :param roll,pitch,yaw: Attitude Setpoints in radians
   :param thrust: Thrust Setpoint in Newtons
   :return: returns 1 if the command is successfully sent to the vehicle

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.attitude_set(0.0, 0.0, -0.8, 660)
    #sends (roll,pitch,yaw)=(0.0,0.0,0.8)(rad), thrust=660N


----

.. _Position_Hold_onboard:

**Position Hold/Loiter/Hover**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This API sends current position of vehicle as position setpoint. 


ROS
"""

*Service Name:* /<namespace>/navigation/position_hold

*Service Type:* core_api/PositionHold, below is its description

.. literalinclude:: include/navigation/PositionHold.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /<namespace>/navigation/position_hold "{}"                  


CPP
"""

.. cpp:function:: int Navigation::position_hold()

   :return: returns 1 if the command is successfully sent to the vehicle

*Usage:*

.. code-block:: CPP

    #include <core_script_bridge/navigation_bridge.h>

    Navigation nav;
    nav.position_hold();

Python
""""""
 
.. py:function:: navigation.position_hold(self)
    
   :return: returns 1 if the command is successfully sent to the vehicle

*Usage:*

.. code-block:: Python

    from flyt_python import api
    nav = api.navigation() 
    nav.position_hold()

----

.. _Exec_Script_onboard:

**Execute Onboard CPP/Python Script**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This API triggers execution of CPP/Python onboard scripts which are available in the FlytOS install space (/flyt/flytapps/onboard/install)


ROS
"""

*Service Name:* /<namespace>/navigation/exec_script

*Service Type:* core_api/ExecScript, below is its description

.. literalinclude:: include/navigation/ExecScript.srv
   :language: xml
   :tab-width: 2

*Usage:*

.. code-block:: bash
    
    rosservice call /<namespace>/navigation/exec_script "{}"                  


CPP
"""

No CPP API is available for execution of onboard scripts.

Python
""""""

No Python API is available for execution of onboard scripts.

----


.. _Waypoint_Handling_onboard:

**Waypoint Handling**
^^^^^^^^^^^^^^^^^^^^^

For waypoint handling following FlytAPIs have been made available.


.. ROS
.. """

.. *Service Name:* /<namespace>/navigation/position_hold

.. *Service Type:* core_api/PositionHold, below is its description

.. .. literalinclude:: include/navigation/PositionHold.srv
..    :language: xml
..    :tab-width: 2

.. *Usage:*

.. .. code-block:: bash
    
..     rosservice call /<namespace>/navigation/position_hold "{}"                  


.. CPP
.. """

.. .. cpp:function:: int Navigation::position_hold()

..    :return: returns 1 if the command is successfully sent to the vehicle

.. *Usage:*

.. .. code-block:: CPP

..     #include <core_script_bridge/navigation_bridge.h>

..     Navigation nav;
..     nav.position_hold();

.. Python
.. """"""
 
.. .. py:function:: navigation.position_hold(self)
    
..    :return: returns 1 if the command is successfully sent to the vehicle

.. *Usage:*

.. .. code-block:: Python

..     from flyt_python import api
..     nav = api.navigation() 
..     nav.position_hold()




.. rostopic echo /<namespace>/mavros/imu/data
.. rostopic echo /<namespace>/mavros/imu/data_euler
.. rostopic echo /<namespace>/mavros/local_position/local
.. rostopic echo /<namespace>/mavros/global_position/global





