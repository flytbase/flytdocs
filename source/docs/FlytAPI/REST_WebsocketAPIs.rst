.. index:: api

.. _REST_websocket_api_reference:

FlytAPI - REST/Websocket
========================

FlytAPIs have been extended from ROS to REST and Websocket. This document describes all the available REST/Websocket FlytAPIs in details.

.. caution:: This guide is under active development.

----

Navigation APIs
---------------

These APIs allows you to have navigational control over your vehicle, and also provides vehicle telemetry data for further processing.


Namespace
^^^^^^^^^

This namespace is a part of the url for all other rest calls and websocket connection. This has to be the first rest call before any other rest call or web socket connection.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/get_global_namespace                                                                               |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | |     param_info:{                                                                                                   |
|                              | |         param_value: [String]                                                                                      |
|                              | |     }                                                                                                              |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and returns namespace                                                            |
|                              | | param_info: the namespace value                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |          $.ajax({                                                                                                    |
|                              |          type: "POST",                                                                                               |
|                              |          dataType: "json",                                                                                           |
|                              |          data: JSON.stringify(msgdata),                                                                              |
|                              |          url: "http://<ip>/ros/get_global_namespace",                                                                |
|                              |          success: function(data){                                                                                    |
|                              |              console.log(data);                                                                                      |
|                              |          }                                                                                                           |
|                              |      });                                                                                                             |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Arm_REST:

Arm
^^^

Arming the drone means you are ready to fly. In this mode the controller outputs are passed to the mixer.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/arm                                                                         |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and system arms.                                                                 |
|                              | | false: command rejected by system and system remains disarmed.                                                     |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |            type: "POST",                                                                                             |
|                              |            dataType: "json",                                                                                         |
|                              |            data: JSON.stringify(msgdata),                                                                            |
|                              |            url: "http://<ip>/ros/<namespace>/navigation/arm",                                                        |
|                              |            success: function(data){                                                                                  |
|                              |                console.log(data);                                                                                    |
|                              |            }                                                                                                         |
|                              |        });                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Disarm_REST:

Disarm
^^^^^^

Disarming the drone means you have finished flying and the drone can be handled and safe to approach. In disarmed state the drone does not react to any RC inputs given or mission execution commands.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/disarm                                                                      |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and system disarms.                                                              |
|                              | | false: command rejected by system and system remains armed.                                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/disarm",                                                      |
|                              |           success: function(data){                                                                                   |
|                              |               console.log(data);                                                                                     |
|                              |           }                                                                                                          |
|                              |       });                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _TakeOff_REST:

Takeoff
^^^^^^^

Takeoff command arms the drone and the drone hovers at a given height. Height is provided as a parameter to this API call.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/take_off                                                                    |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {                                                                                                                  |
|                              | |     takeoff_alt : [numeric : float]                                                                                |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example:                                                                                                           |
|                              | | msgdata={                                                                                                          |
|                              | |     takeoff_alt : 3.00                                                                                             |
|                              | | }                                                                                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone takes off.                                                         |
|                              | | false: command rejected by system and system remains as it is.                                                     |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       var msgdata={};                                                                                                |
|                              |       msgdata["takeoff_alt"]=4.00;                                                                                   |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/take_off",                                                    |
|                              |           success: function(data){                                                                                   |
|                              |               console.log(data);                                                                                     |
|                              |           }                                                                                                          |
|                              |       });                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Land_REST:

Land
^^^^

Land command brings th e drone down to the specified local coordinated. This does not disarm the system.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/land                                                                        |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone lands.                                                             |
|                              | | false: command rejected by system and system continues with current mission.                                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/land",                                                        |
|                              |           success: function(data){                                                                                   |
|                              |               console.log(data);                                                                                     |
|                              |           }                                                                                                          |
|                              |       });                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


----

.. _Position_Hold_REST:

Position hold
^^^^^^^^^^^^^^^

This command commands the vehicle to hover at the current location. It overrides any previous mission being carried out and starts hovering.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/position_hold                                                               |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone hovering at a location.                                            |
|                              | | false: command rejected by system and system continues with current mission.                                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/position_hold",                                               |
|                              |           success: function(data){                                                                                   |
|                              |               console.log(data);                                                                                     |
|                              |           }                                                                                                          |
|                              |       });                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Position_Setpoint_REST:

Position Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to go to a specified location and hover. It overrides any previous mission being carried out and starts hovering.

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/position_set                                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                                                    |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                                                          |
|                              | |     fetched from get namespace rest call.                                                                                                                     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                                                      |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                                                     |
|                              | | {                                                                                                                                                             |
|                              | |     twist:{                                                                                                                                                   |
|                              | |         twist:{                                                                                                                                               |
|                              | |             linear:{                                                                                                                                          |
|                              | |                 x: [numeric : float],                                                                                                                         |
|                              | |                 y: [numeric : float],                                                                                                                         |
|                              | |                 z: [numeric : float]                                                                                                                          |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z: [numeric : float]                                                                                                                          |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance:  [numeric : float],                                                                                                                            |
|                              | |     async:      [boolean],                                                                                                                                    |
|                              | |     relative:   [boolean],                                                                                                                                    |
|                              | |     yaw_valid : [boolean],                                                                                                                                    |
|                              | |     body_frame : [boolean]                                                                                                                                    |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | {                                                                                                                                                             |
|                              | |     twist:{                                                                                                                                                   |
|                              | |         twist:{                                                                                                                                               |
|                              | |             linear:{                                                                                                                                          |
|                              | |                 x: 2.00,                                                                                                                                      |
|                              | |                 y: 3.00,                                                                                                                                      |
|                              | |                 z: -1.00                                                                                                                                      |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z : 1.0                                                                                                                                       |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance: 2.00,                                                                                                                                          |
|                              | |     async: true,                                                                                                                                              |
|                              | |     relative: false,                                                                                                                                          |
|                              | |     yaw_valid: true,                                                                                                                                          |
|                              | |     body_frame : false                                                                                                                                        |
|                              | | }                                                                                                                                                             |
|                              | | linear: x ,y,z : xyz local position coordinates with respect to NED                                                                                           |
|                              | | angular: z  : used for heading when yaw_valid set to true                                                                                                     |
|                              | | tolerance: The radial value within which the setpoint is considered reached                                                                                   |
|                              | | relative: Decides whether the given xyz coordinates are supposed to be taken relative to the current location                                                 |
|                              | |     or relative to origin.                                                                                                                                    |
|                              | | yaw_valid: Decides whether to use angular: z value for deciding the setpoint heading or just use default heading.                                             |
|                              | | body_frame: Decides whether to apply the setpoints with respect to NED frame (false) or with respect to body frame (true).                                    |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                                                     |
| RESPONSE                     | | Content: {                                                                                                                                                    | 
|                              | |     success : true / false,                                                                                                                                   |
|                              | | }                                                                                                                                                             |
|                              | | true:  command accepted by system and the drone starts to move towards the defined location.                                                                  |
|                              | | false: command rejected by system and system continues with existing mission.                                                                                 |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                                                         |
| CALL                         |                                                                                                                                                                 |
|                              |       var  msgdata={};                                                                                                                                          |
|                              |       msgdata["twist"]={};                                                                                                                                      |
|                              |       msgdata.twist["twist"]={};                                                                                                                                |
|                              |       masdata.twist.twist["linear"]={};                                                                                                                         |
|                              |       msgdata.twist.twist.linear["x"]=2.00;                                                                                                                     |
|                              |       msgdata.twist.twist.linear["y"]=3.00;                                                                                                                     |
|                              |       msgdata.twist.twist.linear["z"]=-1.00;                                                                                                                    |
|                              |       msgdata.twist.twist["angular"]={};                                                                                                                        |
|                              |       msgdata.twist.twist.angular["z"]=1.00;                                                                                                                    |
|                              |       msgdata["tolerance"]=2.00;                                                                                                                                |
|                              |       msgdata["async"]=true;                                                                                                                                    |
|                              |       msgdata["relative"]=false;                                                                                                                                |
|                              |       msgdata["yaw_valid"]=true;                                                                                                                                |
|                              |       msgdata["body_frame"]=false;                                                                                                                              |
|                              |                                                                                                                                                                 |
|                              |       $.ajax({                                                                                                                                                  |
|                              |           type: "POST",                                                                                                                                         |
|                              |           dataType: "json",                                                                                                                                     |
|                              |           data: JSON.stringify(msgdata),                                                                                                                        |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/position_set",                                                                                           |
|                              |           success: function(data){                                                                                                                              |
|                              |                  console.log(data);                                                                                                                             |
|                              |           }                                                                                                                                                     |
|                              |       };                                                                                                                                                        |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Velocity_Setpoint_REST:

Velocity Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to attain a specified velocity in the specified direction. It overrides any previous mission being carried out.

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/velocity_set                                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                                                    |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                                                          |
|                              | |     fetched from get namespace rest call.                                                                                                                     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                                                      |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                                                     |
|                              | | {                                                                                                                                                             |
|                              | |     twist:{                                                                                                                                                   |
|                              | |         twist:{                                                                                                                                               |
|                              | |             linear:{                                                                                                                                          |
|                              | |                 x: [numeric : float],                                                                                                                         |
|                              | |                 y: [numeric : float],                                                                                                                         |
|                              | |                 z: [numeric : float]                                                                                                                          |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z: [numeric : float]                                                                                                                          |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance:  [numeric : float],                                                                                                                            |
|                              | |     async:      [boolean],                                                                                                                                    |
|                              | |     relative:   [boolean],                                                                                                                                    |
|                              | |     yaw_rate_valid : [boolean],                                                                                                                               |
|                              | |     body_frame :[boolean]                                                                                                                                     |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | {                                                                                                                                                             |
|                              | |     twist:{                                                                                                                                                   |
|                              | |         twist:{                                                                                                                                               |
|                              | |             linear:{                                                                                                                                          |
|                              | |                 x: 2.00,                                                                                                                                      |
|                              | |                 y: 3.00,                                                                                                                                      |
|                              | |                 z: -1.00                                                                                                                                      |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z : 1.0                                                                                                                                       |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance: 2.00,                                                                                                                                          |
|                              | |     async: true,                                                                                                                                              |
|                              | |     relative: false,                                                                                                                                          |
|                              | |     yaw_rate_valid: true,                                                                                                                                     |
|                              | |     body_frame :false                                                                                                                                         |
|                              | | }                                                                                                                                                             |
|                              | | linear: x,y,z : xyz velocity setpoints with respect to NED                                                                                                    |
|                              | | angular: z  : used for heading change velocity when yaw_valid set to true                                                                                     |
|                              | | tolerance: The range with respect to set velocity, within which the setpoint is considered reached                                                            |
|                              | | relative: Decides whether the given xyz velocity setpoints are supposed to be taken relative to the current velocity .                                        |
|                              | | yaw_rate_valid: Decides whether to use angular: z value for deciding the heading change velocity or just use default heading.                                 |
|                              | | body_frame: Decides whether to apply the setpoints with respect to NED frame (false) or with respect to body frame (true).                                    |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                                                     |
| RESPONSE                     | | Content: {                                                                                                                                                    |
|                              | |     success : true / false,                                                                                                                                   |
|                              | | }                                                                                                                                                             |
|                              | | true:  command accepted by system and the drone starts to move to to attain the set velocity.                                                                 |
|                              | | false: command rejected by system and system continues with existing mission.                                                                                 |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                                                         |
| CALL                         |                                                                                                                                                                 |
|                              |       var  msgdata={};                                                                                                                                          |
|                              |       msgdata["twist"]={};                                                                                                                                      |
|                              |       msgdata.twist["twist"]={};                                                                                                                                |
|                              |       masdata.twist.twist["linear"]={};                                                                                                                         |
|                              |       msgdata.twist.twist.linear["x"]=2.00;                                                                                                                     |
|                              |       msgdata.twist.twist.linear["y"]=3.00;                                                                                                                     |
|                              |       msgdata.twist.twist.linear["z"]=-1.00;                                                                                                                    |
|                              |       msgdata.twist.twist["angular"]={};                                                                                                                        |
|                              |       msgdata.twist.twist.angular["z"]=1.00;                                                                                                                    |
|                              |       msgdata["tolerance"]=2.00;                                                                                                                                |
|                              |       msgdata["async"]=true;                                                                                                                                    |
|                              |       msgdata["relative"]=false;                                                                                                                                |
|                              |       msgdata["yaw_rate_valid"]=true;                                                                                                                           |
|                              |       msgdata["body_frame"]=false;                                                                                                                              |
|                              |                                                                                                                                                                 |
|                              |       $.ajax({                                                                                                                                                  |
|                              |              type: "POST",                                                                                                                                      |
|                              |              dataType: "json",                                                                                                                                  |
|                              |              data: JSON.stringify(msgdata),                                                                                                                     |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/velocity_set",                                                                                        |
|                              |              success: function(data){                                                                                                                           |
|                              |                  console.log(data);                                                                                                                             |
|                              |              }                                                                                                                                                  |
|                              |       )};                                                                                                                                                       |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Attitude_Setpoint_REST:

Attitude Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to attain a specified attitude. It overrides any previous mission being carried out.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/attitude_set                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {                                                                                                                  |
|                              | |     twist:{                                                                                                        |
|                              | |         twist:{                                                                                                    |
|                              | |             angular:{                                                                                              |
|                              | |                 x: [numeric : float],                                                                              |
|                              | |                 y: [numeric : float],                                                                              |
|                              | |                 z: [numeric : float]                                                                               |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     thrust:  [numeric : float]                                                                                     |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example                                                                                                            |
|                              | |                                                                                                                    |
|                              | | {                                                                                                                  |
|                              | |     twist:{                                                                                                        |
|                              | |         twist:{                                                                                                    |
|                              | |             angular:{                                                                                              |
|                              | |                 x: 2.00,                                                                                           |
|                              | |                 y: 3.00,                                                                                           |
|                              | |                 z: -1.00                                                                                           |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     thrust: 600.00                                                                                                 |
|                              | | }                                                                                                                  |
|                              | | angular: x,y,z : roll, pitch, yaw values for attitude setpoint.                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone starts to move to to attain the given velocity.                    |
|                              | | false: command rejected by system and system continues with existing mission.                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       var  msgdata={};                                                                                               |
|                              |       msgdata["twist"]={};                                                                                           |
|                              |       msgdata.twist["twist"]={};                                                                                     |
|                              |       masdata.twist.twist["angular"]={};                                                                             |
|                              |       msgdata.twist.twist.angular["x"]=2.00;                                                                         |
|                              |       msgdata.twist.twist.angular["y"]=3.00;                                                                         |
|                              |       msgdata.twist.twist.angular["z"]=-1.00;                                                                        |
|                              |       msgdata["thrust"]=600.00;                                                                                      |
|                              |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |              type: "POST",                                                                                           |
|                              |              dataType: "json",                                                                                       |
|                              |              data: JSON.stringify(msgdata),                                                                          |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/attitude_set",                                             |
|                              |              success: function(data){                                                                                |
|                              |                  console.log(data);                                                                                  |
|                              |              }                                                                                                       |
|                              |        )};                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Exec_Script_REST:

Execute Script
^^^^^^^^^^^^^^

This command commands the vehicle to perform a predefined or user defined scripts when called with specific app name and its respective parameters. It overrides any previous mission being carried out.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/exec_script                                                                 |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {                                                                                                                  |
|                              | |     app_name: [String],                                                                                            |
|                              | |     arguments: [String]                                                                                            |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example                                                                                                            |
|                              | |                                                                                                                    |
|                              | | {                                                                                                                  |
|                              | |     app_name: "app12",                                                                                             |
|                              | |     arguments: "2 45 4 run"                                                                                        |
|                              | | }                                                                                                                  |
|                              | | app_name: The name of the script to be executed.                                                                   |
|                              | | arguments: List of arguments required by the script sent in a single string seperated by spaces.                   |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone starts executing the script.                                       |
|                              | | false: command rejected by system and system continues with existing mission.                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       var  msgdata={};                                                                                               |
|                              |       msgdata["app_name"]= "app12";                                                                                  |
|                              |       msgdata["arguments"]= "2 45 4 run";                                                                            |
|                              |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |              type: "POST",                                                                                           |
|                              |              dataType: "json",                                                                                       |
|                              |              data: JSON.stringify(msgdata),                                                                          |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/exec_script",                                              |
|                              |              success: function(data){                                                                                |
|                              |                  console.log(data);                                                                                  |
|                              |              }                                                                                                       |
|                              |       )};                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Get Waypoints
^^^^^^^^^^^^^^

This command gets the current waypoint mission set on the autopilot.

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_get                                                                              |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                       |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
|                              | | Example                                                                                                                          |
|                              | | {}                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     success : [Bool],                                                                                                            |
|                              | |     wp_recieved : [Int],                                                                                                         |
|                              | |     waypoints: [{                                                                                                                |
|                              | |          frame : [Int] 0/1/2/3/4,                                                                                                |
|                              | |          command : [Int] 16/17/18/19/20/21/22,                                                                                   |
|                              | |          is_current : [Bool],                                                                                                    |
|                              | |          autocontinue : [Bool],                                                                                                  |
|                              | |          param1 : [Float],                                                                                                       |
|                              | |          param2 : [Float],                                                                                                       |
|                              | |          param3 : [Float],                                                                                                       |
|                              | |          param4 : [Float],                                                                                                       |
|                              | |          x_lat : [Float],                                                                                                        |
|                              | |          y_long : [Float],                                                                                                       |
|                              | |          z_alt : [Float],                                                                                                        |
|                              | |      },{},{}...  ]                                                                                                               |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
|                              | | wp_recieved: Number of waypoints sent from the autopilot.                                                                        |
|                              | | frame: 0:GLobal, 1:local NED, 2:Mission, 3:global relative alt(recommended), 4:local ENU.                                        |
|                              | | command: 16:waypoint(recommended), 17:loiter, 18:loiter turns, 19: loiter time, 20: return to launch, 21: take-off, 22:land.     |
|                              | | is_current: true:to set the starting point of the mission(true for the first waypoint).                                          |
|                              | | autocontinue: true:continues on to the next waypoint once the current waypoint is reached(recommended).                          |
|                              | | param1: Time in seconds to stay at the waypoint.                                                                                 |
|                              | | param2: Error radius around waypoint to consider it to be reached.                                                               |
|                              | | param3: Orbit raidius and direction of orbit around waypoint (for fixed wing).                                                   |
|                              | | param4: yaw angle in degrees to have at the waypoint.                                                                            |
|                              | | x_lat: latitude in degrees.                                                                                                      |
|                              | | y_long: longitude in degrees.                                                                                                    |
|                              | | z_alt: altitude at the waypoint.                                                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                            |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_get",                                                           |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Will be made available in the next version of FlytSim and works for current version of FlytOS.                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Set Waypoints
^^^^^^^^^^^^^^

This command gets the current waypoint mission set on the autopilot.

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_set                                                                              |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                       |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | [{                                                                                                                               |
|                              | |          frame : [Int] 0/1/2/3/4,                                                                                                |
|                              | |          command : [Int] 16/17/18/19/20/21/22,                                                                                   |
|                              | |          is_current : [Bool],                                                                                                    |
|                              | |          autocontinue : [Bool],                                                                                                  |
|                              | |          param1 : [Float],                                                                                                       |
|                              | |          param2 : [Float],                                                                                                       |
|                              | |          param3 : [Float],                                                                                                       |
|                              | |          param4 : [Float],                                                                                                       |
|                              | |          x_lat : [Float],                                                                                                        |
|                              | |          y_long : [Float],                                                                                                       |
|                              | |          z_alt : [Float],                                                                                                        |
|                              | |      },{},{}...  ]                                                                                                               |
|                              | | }                                                                                                                                |
|                              | |                                                                                                                                  |
|                              | | Example                                                                                                                          |
|                              | | [{                                                                                                                               |
|                              | |          frame : 3,                                                                                                              |
|                              | |          command : 16,                                                                                                           |
|                              | |          is_current : false,                                                                                                     |
|                              | |          autocontinue : true,                                                                                                    |
|                              | |          param1 : 0,                                                                                                             |
|                              | |          param2 : 1,                                                                                                             |
|                              | |          param3 : 0,                                                                                                             |
|                              | |          param4 : 0,                                                                                                             |
|                              | |          x_lat : 70.0235,                                                                                                        |
|                              | |          y_long : 18.2546,                                                                                                       |
|                              | |          z_alt : 5,                                                                                                              |
|                              | |      },{},{}...  ]                                                                                                               |
|                              | | }                                                                                                                                |
|                              | | frame: 0:GLobal, 1:local NED, 2:Mission, 3:global relative alt(recommended), 4:local ENU.                                        |
|                              | | command: 16:waypoint(recommended), 17:loiter, 18:loiter turns, 19: loiter time, 20: return to launch, 21: take-off, 22:land.     |
|                              | | is_current: true:to set the starting point of the mission(true for the first waypoint).                                          |
|                              | | autocontinue: true:continues on to the next waypoint once the current waypoint is reached(recommended).                          |
|                              | | param1: Time in seconds to stay at the waypoint.                                                                                 |
|                              | | param2: Error radius around waypoint to consider it to be reached.                                                               |
|                              | | param3: Orbit raidius and direction of orbit around waypoint (for fixed wing).                                                   |
|                              | | param4: yaw angle in degrees to have at the waypoint.                                                                            |
|                              | | x_lat: latitude in degrees.                                                                                                      |
|                              | | y_long: longitude in degrees.                                                                                                    |
|                              | | z_alt: altitude at the waypoint.                                                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     success : [Bool],                                                                                                            |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                            |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata=[];                                                                                                             |
|                              |       msgdata[1]={};                                                                                                               |
|                              |       msgdata[1]["frame"]=3;                                                                                                       |
|                              |       msgdata[1]["command"]= 16;                                                                                                   |
|                              |       msgdata[1]["is_current"]= false;                                                                                             |
|                              |       msgdata[1]["autocontinue"]= true;                                                                                            |
|                              |       msgdata[1]["param1"]= 0;                                                                                                     |
|                              |       msgdata[1]["param2"]= 1;                                                                                                     |
|                              |       msgdata[1]["param3"]= 0;                                                                                                     |
|                              |       msgdata[1]["param4"]= 0;                                                                                                     |
|                              |       msgdata[1]["x_lat"]= 73.2154;                                                                                                |
|                              |       msgdata[1]["y_long"]= 18.5472;                                                                                               |
|                              |       msgdata[1]["z_lat"]= 5;                                                                                                      |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_set",                                                           |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Will be made available in the next version of FlytSim and works for current version of FlytOS.                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Execute Waypoints
^^^^^^^^^^^^^^^^^

This command tells the autopilot to start executing the mission already set. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_execute                                                                          |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                       |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     success : [Bool],                                                                                                            |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                            |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_execute",                                                       |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Will be made available in the next version of FlytSim and works for current version of FlytOS.                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Clear Waypoints
^^^^^^^^^^^^^^^

This command clears the previously set mission. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_clear                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                       |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     success : [Bool],                                                                                                            |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                            |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_clear",                                                         |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Will be made available in the next version of FlytSim and works for current version of FlytOS.                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Pause Waypoints
^^^^^^^^^^^^^^^

This command tells the autopilot to pause the execution of a waypoint mission and hold its current position and can be resumed on execute-waypoint rest call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_pause                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                       |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     success : [Bool],                                                                                                            |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                                            |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_pause",                                                         |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Will be made available in the next version of FlytSim and works for current version of FlytOS.                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Video Streaming APIs
---------------------

List Video Streams
^^^^^^^^^^^^^^^^^^^

This command gets the list of video streams available from the FlytOS.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/list_streams                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:8080                                                                                         |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content type: application/JSON                                                                                     |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |             stream1:<link to stream1> ,                                                                            |
|                              | |             stream2:<link to stream2> ,                                                                            |
|                              | |             stream3:<link to stream3> ,                                                                            |
|                              | |                    .                                                                                               |
|                              | |                    .                                                                                               |
|                              | |             }                                                                                                      |
|                              | | }                                                                                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/list_streams",                                                                       |
|                              |           success: function(data){                                                                                   |
|                              |                  console.log(data);                                                                                  |
|                              |           }                                                                                                          |
|                              |       )};                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Start video stream
^^^^^^^^^^^^^^^^^^^

This command gets you the video stream for the particular link.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/stream?topic=<topic name>                                                                              |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:8080                                                                                         |
|                              | | <topic name>: name of the topic of the particular stream                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Query string                                                                                                       |
|                              | |  width:                                                                                                            |
|                              | |  height:                                                                                                           |
|                              | |  quality:                                                                                                          |
|                              | |  quality:                                                                                                          |
|                              | |  rate: 1|2|3....                                                                                                   |
|                              | |                                                                                                                    |
|                              | |  rate:1 will send out every frame, 2 will send out every second frame, 3 every third and so on..                   |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |      <img src=URL />                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Stop video stream
^^^^^^^^^^^^^^^^^^^

This command stops the video stream for the particular link to your ip.


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | In HTML setting the src="" of the <img> tag should stop the  streaming                                             |
|                              | | or PLace the <img> tag in a <div> and set the div-html="" deleting the <img> tag completely.                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Snapshot
^^^^^^^^^

This command gets you a latest snapshot of the specified video streaming topic.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/snapshot?topic=<topic name>                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:8080                                                                                         |
|                              | | <topic name>: name of the topic of the particular stream                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Query string                                                                                                       |
|                              | |  width:                                                                                                            |
|                              | |  height:                                                                                                           |
|                              | |  quality:                                                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |      <img src=URL />                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
|                              | | To get new images everytime make sure you add a system time as variables to the link because if the actual link    |
|                              | | doesnt change the browser gets the old image from cache instead of querying from the server.                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Telemetry APIs
---------------

Websocket Initializations
^^^^^^^^^^^^^^^^^^^^^^^^^

Websocket needs to be initialized once in every session. It requires additional libraries: event.emitter.js and roslib.js to be included in case of web based client.

Socket
""""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | ws://<ip>/websocket                                                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: python                                                                                              |
| CALL                         |                                                                                                                      |
|                              |       var  ros= new ROSLIB.Ros({                                                                                     |
|                              |            url : 'ws://<ip>/websocket'                                                                               |
|                              |       });                                                                                                            |
|                              |                                                                                                                      |
|                              |       ros.on('connection', function() {                                                                              |
|                              |           console.log('Connected to websocket server.');                                                             |
|                              |       });                                                                                                            |
|                              |                                                                                                                      |
|                              |       ros.on('error', function() {                                                                                   |
|                              |           console.log('Error connecting to websocket server.', error);                                               |
|                              |       });                                                                                                            |
|                              |                                                                                                                      |
|                              |       ros.on('close', function() {                                                                                   |
|                              |           console.log('Connection to websocket server closed.');                                                     |
|                              |       });                                                                                                            |
|                              |                                                                                                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

.. _Attitude_Quat_REST:


Attitude data
^^^^^^^^^^^^^

Fetches real time attitude data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: python                                                                                                                                          |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerImu = new ROSLIB.Topic({                                                                                                                       |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/imu/data',                                                                                                                 |
|                              |           messageType : 'sensor_msgs/Imu',                                                                                                                       |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |       });                                                                                                                                                        |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |   .. code-block:: python                                                                                                                                         |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       listenerImu.subscribe(function(message) {                                                                                                                  |
|                              |           console.log(message.orientation.x);                                                                                                                    |
|                              |           console.log(message.orientation.y);                                                                                                                    |
|                              |           console.log(message.orientation.z);                                                                                                                    |
|                              |           console.log(message.orientation.w);                                                                                                                    |
|                              |           console.log(message.angular_velocity.x);                                                                                                               |
|                              |           console.log(message.angular_velocity.y);                                                                                                               |
|                              |           console.log(message.angular_velocity.z);                                                                                                               |
|                              |           console.log(message.linear_acceleration.x);                                                                                                            |
|                              |           console.log(message.linear_acceleration.y);                                                                                                            |
|                              |           console.log(message.linear_acceleration.z);                                                                                                            |
|                              |       });                                                                                                                                                        |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required attitude data.                                                             |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. _LPOS_REST:

Local Position data
^^^^^^^^^^^^^^^^^^^

Fetches real time local position data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: python                                                                                                                                          |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerLocalPosition = new ROSLIB.Topic({                                                                                                             |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/local_position/local',                                                                                                     |
|                              |           messageType : 'geometry_msgs/TwistStamped',                                                                                                            |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |       });                                                                                                                                                        |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: python                                                                                                                                          |
| SAMPLE                       |                                                                                                                                                                  |
|                              |      listenerImu.subscribe(function(message) {                                                                                                                   |
|                              |          console.log(message.twist.linear.x);                                                                                                                    |
|                              |          console.log(message.twist.linear.y);                                                                                                                    |
|                              |          console.log(message.twist.linear.z);                                                                                                                    |
|                              |          console.log(message.twist.angular.x);                                                                                                                   |
|                              |          console.log(message.twist.angular.y);                                                                                                                   |
|                              |          console.log(message.twist.angular.z);                                                                                                                   |
|                              |      });                                                                                                                                                         |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required local position data.                                                       |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

