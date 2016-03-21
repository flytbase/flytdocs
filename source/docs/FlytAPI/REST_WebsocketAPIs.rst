.. index:: api

.. _REST_websocket_api_reference:

FlytAPI - REST/Websocket
========================

FlytAPIs have been extended from ROS to REST and Websocket. This document describes all the available REST/Websocket FlytAPIs in details.

.. caution:: This guide is under active development.

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
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={}                                                                                                         |
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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/get_global_namespace",                                                                   |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

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
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={}                                                                                                         |
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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/<namespace>/navigation/arm",                                                             |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


.. _Disarm_REST:

Disarm
^^^^^^

Disarming the drone means you have finished flying and the drone can be handled and safe to approach. In disarmed state the drone does not react to any RC inputs given or mission execution commands.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/disarm                                                                                  |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={}                                                                                                         |
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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/<namespace>/navigation/disarm",                                                                      |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

.. _TakeOff_REST:

Takeoff
^^^^^^^

Takeoff command arms the drone and the drone hovers at a given height. Height is provided as a parameter to this API call.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/take_off                                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={                                                                                                          |
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
| SAMPLE                       | | var msgdata={};                                                                                                    |
| CALL                         | | msgdata["takeoff_alt"]=4.00;                                                                                       |
|                              | | $.ajax({                                                                                                           |
|                              | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/"+namespace+"/navigation/take_off",                                                      |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


.. _Land_REST:

Land
^^^^

Land command brings th e drone down to the specified local coordinated. This does not disarm the system.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/land                                                                                    |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={}                                                                                                         |
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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/navigation/land",                                                                        |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+



.. _Position_Hold_REST:

Hover
^^^^^

This command commands the vehicle to hover at the current location. It overrides any previous mission being carried out and starts hovering.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/position_hold                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={}                                                                                                         |
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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |     type: "POST",                                                                                                  |
|                              | |     dataType: "json",                                                                                              |
|                              | |     url: "http://<ip>/ros/navigation/position_hold",                                                               |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

.. _Position_Setpoint_REST:

Position Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to go to a specified location and hover. It overrides any previous mission being carried out and starts hovering.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/position_set                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={                                                                                                          |
|                              | |     twist:{                                                                                                        |
|                              | |         twist:{                                                                                                    |
|                              | |             linear:{                                                                                               |
|                              | |                 x: [numeric : float],                                                                              |
|                              | |                 y: [numeric : float],                                                                              |
|                              | |                 z: [numeric : float]                                                                               |
|                              | |             },                                                                                                     |
|                              | |             angular:{                                                                                              |
|                              | |                 z: [numeric : float]                                                                               |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     tolerance:  [numeric : float],                                                                                 |
|                              | |     async:      [boolean],                                                                                         |
|                              | |     relative:   [boolean],                                                                                         |
|                              | |     yaw_valid : [boolean]                                                                                          |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example                                                                                                            |
|                              | |                                                                                                                    |
|                              | | msgdata={                                                                                                          |
|                              | |     twist:{                                                                                                        |
|                              | |         twist:{                                                                                                    |
|                              | |             linear:{                                                                                               |
|                              | |                 x: 2.00,                                                                                           |
|                              | |                 y: 3.00,                                                                                           |
|                              | |                 z: -1.00                                                                                           |
|                              | |             },                                                                                                     |
|                              | |             angular:{                                                                                              |
|                              | |                 z : 1.0                                                                                            |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     tolerance: 2.00,                                                                                               |
|                              | |     async: true,                                                                                                   |
|                              | |     relative: false,                                                                                               |
|                              | |     yaw_valid: true                                                                                                |
|                              | | }                                                                                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : true / false,                                                                                        |
|                              | | }                                                                                                                  |
|                              | | true:  command accepted by system and the drone starts to move towards the defined location.                       |
|                              | | false: command rejected by system and system continues with existing mission.                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       | | var  msgdata={};                                                                                                   |
| CALL                         | | msgdata["twist"]={};                                                                                               |
|                              | | msgdata.twist["twist"]={};                                                                                         |
|                              | | masdata.twist.twist["linear"]={};                                                                                  |
|                              | | msgdata.twist.twist.linear["x"]=2.00;                                                                              |
|                              | | msgdata.twist.twist.linear["y"]=3.00;                                                                              |
|                              | | msgdata.twist.twist.linear["z"]=-1.00;                                                                             |
|                              | | msgdata.twist.twist["angular"]={};                                                                                 |
|                              | | msgdata.twist.twist.angular["z"]=1.00;                                                                             |
|                              | | msgdata["tolerance"]=2.00;                                                                                         |
|                              | | msgdata["async"]=true;                                                                                             |
|                              | | msgdata["relative"]=false;                                                                                         |
|                              | | msgdata["yaw_valid"]=true;                                                                                         |
|                              | |                                                                                                                    |
|                              | | $.ajax({                                                                                                           |
|                              | |        type: "GET",                                                                                                |
|                              | |        dataType: "json",                                                                                           |
|                              | |        data: JSON.stringify(msgdata),                                                                              |
|                              | |        url: "http://<ip>/ros/<namespace>/navigation/position_set",                                                 |
|                              | |        success: function(data){                                                                                    |
|                              | |                console.log(data);                                                                                  |
|                              | |        }                                                                                                           |
|                              | | )};                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | linear: x ,y,z : xyz local position coordinates with respect to NED                                                |
|                              | | angular: z  : used for heading when yaw_valid set to true                                                          |
|                              | | tolerance: The radial value within which the setpoint is considered reached                                        |
|                              | | relative: Decides whether the give xyz coordination are supposed to be taken relative to the current location      |
|                              | |     or relative to origin.                                                                                         |
|                              | | yaw_valid: Decides whether to use angular: z value for deciding the setpoint heading or just use default heading.  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


.. _Velocity_Setpoint_REST:

Velocity Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to attain a specified velocity in the specified direction. It overrides any previous mission being carried out.

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/velocity_set                                                                                                                       |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx:9090                                                                                                                                    |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                                                          |
|                              | |     fetched from get namespace rest call.                                                                                                                     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                                                      |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                                                                 |
|                              | | msgdata={                                                                                                                                                     |
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
|                              | |     yaw_valid : [boolean]                                                                                                                                     |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | msgdata={                                                                                                                                                     |
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
|                              | |     yaw_valid: true                                                                                                                                           |
|                              | | }                                                                                                                                                             |
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
| SAMPLE                       | | var  msgdata={};                                                                                                                                              |
| CALL                         | | msgdata["twist"]={};                                                                                                                                          |
|                              | | msgdata.twist["twist"]={};                                                                                                                                    |
|                              | | masdata.twist.twist["linear"]={};                                                                                                                             |
|                              | | msgdata.twist.twist.linear["x"]=2.00;                                                                                                                         |
|                              | | msgdata.twist.twist.linear["y"]=3.00;                                                                                                                         |
|                              | | msgdata.twist.twist.linear["z"]=-1.00;                                                                                                                        |
|                              | | msgdata.twist.twist["angular"]={};                                                                                                                            |
|                              | | msgdata.twist.twist.angular["z"]=1.00;                                                                                                                        |
|                              | | msgdata["tolerance"]=2.00;                                                                                                                                    |
|                              | | msgdata["async"]=true;                                                                                                                                        |
|                              | | msgdata["relative"]=false;                                                                                                                                    |
|                              | | msgdata["yaw_valid"]=true;                                                                                                                                    |
|                              | |                                                                                                                                                               |
|                              | | $.ajax({                                                                                                                                                      |
|                              | |        type: "GET",                                                                                                                                           |
|                              | |        dataType: "json",                                                                                                                                      |
|                              | |        data: JSON.stringify(msgdata),                                                                                                                         |
|                              | |        url: "http://<ip>/ros/<namespace>/navigation/velocity_set",                                                                                            |
|                              | |        success: function(data){                                                                                                                               |
|                              | |                console.log(data);                                                                                                                             |
|                              | |        }                                                                                                                                                      |
|                              | | )};                                                                                                                                                           |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | linear: x,y,z : xyz local position coordinates with respect to NED                                                                                            |
|                              | | angular: z  : used for heading when yaw_valid set to true                                                                                                     |
|                              | | tolerance: The range with respect to set velocity, within which the setpoint is considered reached                                                            |
|                              | | relative: Decides whether the given xyz coordination are supposed to be taken relative to the current location or relative to origin.                         |
|                              | | yaw_valid: Decides whether to use angular: z value for deciding the setpoint heading or just use default heading.                                             |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+


.. _Attitude_Setpoint_REST:

Attitude Setpoint
^^^^^^^^^^^^^^^^^

This command commands the vehicle to attain a specified attitude. It overrides any previous mission being carried out.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/attitude_set                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={                                                                                                          |
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
|                              | | msgdata={                                                                                                          |
|                              | |     twist:{                                                                                                        |
|                              | |         twist:{                                                                                                    |
|                              | |             linear:{                                                                                               |
|                              | |                 x: 2.00,                                                                                           |
|                              | |                 y: 3.00,                                                                                           |
|                              | |                 z: -1.00                                                                                           |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     thrust: 600.00                                                                                                 |
|                              | | }                                                                                                                  |
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
| SAMPLE                       | | var  msgdata={};                                                                                                   |
| CALL                         | | msgdata["twist"]={};                                                                                               |
|                              | | msgdata.twist["twist"]={};                                                                                         |
|                              | | masdata.twist.twist["angular"]={};                                                                                 |
|                              | | msgdata.twist.twist.angular["x"]=2.00;                                                                             |
|                              | | msgdata.twist.twist.angular["y"]=3.00;                                                                             |
|                              | | msgdata.twist.twist.angular["z"]=-1.00;                                                                            |
|                              | | msgdata["thrust"]=600.00;                                                                                          |
|                              | |                                                                                                                    |
|                              | | $.ajax({                                                                                                           |
|                              | |        type: "GET",                                                                                                |
|                              | |        dataType: "json",                                                                                           |
|                              | |        data: JSON.stringify(msgdata),                                                                              |
|                              | |        url: "http://<ip>/ros/<namespace>/navigation/attitude_set",                                                 |
|                              | |        success: function(data){                                                                                    |
|                              | |                console.log(data);                                                                                  |
|                              | |        }                                                                                                           |
|                              | | )};                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | angular: x,y,z : roll, pitch, yaw values for attitude setpoint.                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

.. _Exec_Script_REST:

Execute Script
^^^^^^^^^^^^^^

This command commands the vehicle to perform a predefined or user defined scripts when called with specific app name and its respective parameters. It overrides any previous mission being carried out.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/exec_script                                                                             |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:9090                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | data: JSON.stringify(msgdata)                                                                                      |
|                              | | msgdata={                                                                                                          |
|                              | |     app_name: [String],                                                                                            |
|                              | |     arguments: [String]                                                                                            |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example                                                                                                            |
|                              | |                                                                                                                    |
|                              | | msgdata={                                                                                                          |
|                              | |     app_name: "app12",                                                                                             |
|                              | |     arguments: "2 45 4 run"                                                                                        |
|                              | | }                                                                                                                  |
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
| SAMPLE                       | | var  msgdata={};                                                                                                   |
| CALL                         | | msgdata["app_name"]= "app12";                                                                                      |
|                              | | msgdata["arguments"]= "2 45 4 run";                                                                                |
|                              | |                                                                                                                    |
|                              | | $.ajax({                                                                                                           |
|                              | |        type: "GET",                                                                                                |
|                              | |        dataType: "json",                                                                                           |
|                              | |        data: JSON.stringify(msgdata),                                                                              |
|                              | |        url: "http://<ip>/ros/<namespace>/navigation/exec_script",                                                  |
|                              | |        success: function(data){                                                                                    |
|                              | |                console.log(data);                                                                                  |
|                              | |        }                                                                                                           |
|                              | | )};                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | app_name: The name of the script to be executed.                                                                   |
|                              | | arguments: List of arguments required by the script sent in a single string seperated by spaces.                   |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

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
| SAMPLE                       | | $.ajax({                                                                                                           |
| CALL                         | |        type: "GET",                                                                                                |
|                              | |        dataType: "json",                                                                                           |
|                              | |        data: JSON.stringify(msgdata),                                                                              |
|                              | |        url: "http://<ip>/ros/list_streams",                                                                        |
|                              | |        success: function(data){                                                                                    |
|                              | |                console.log(data);                                                                                  |
|                              | |        }                                                                                                           |
|                              | | )};                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


Stream video
^^^^^^^^^^^^^

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
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       | |                                                                                                                    |
| CALL                         | | <img src=URL />                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


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
| SAMPLE                       | | var  ros= new ROSLIB.Ros({                                                                                         |
| CALL                         | |     url : 'ws://<ip>/websocket'                                                                                    |
|                              | | });                                                                                                                |
|                              | |                                                                                                                    |
|                              | | ros.on('connection', function() {                                                                                  |
|                              | |     console.log('Connected to websocket server.');                                                                 |
|                              | |  });                                                                                                               |
|                              | |                                                                                                                    |
|                              | | ros.on('error', function() {                                                                                       |
|                              | |     console.log('Error connecting to websocket server.', error);                                                   |
|                              | |  });                                                                                                               |
|                              | |                                                                                                                    |
|                              | | ros.on('close', function() {                                                                                       |
|                              | |     console.log('Connection to websocket server closed.');                                                         |
|                              | |  });                                                                                                               |
|                              | |                                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

.. _Attitude_Quat_REST:


Attitude data
^^^^^^^^^^^^^

Fetches real time attitude data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               | | var listenerImu = new ROSLIB.Topic({                                                                                                                           |
| SAMPLE                       | |     ros :ros,                                                                                                                                                  |
|                              | |     name : '/<namespace>/mavros/imu/data',                                                                                                                     |
|                              | |     messageType : 'sensor_msgs/Imu',                                                                                                                           |
|                              | |     throttle_rate: 200                                                                                                                                         |
|                              | | });                                                                                                                                                            |
|                              | |                                                                                                                                                                |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.           |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 | | listenerImu.subscribe(function(message) {                                                                                                                      |
| SAMPLE                       | |     console.log(message.orientation.x);                                                                                                                        |
|                              | |     console.log(message.orientation.y);                                                                                                                        |
|                              | |     console.log(message.orientation.z);                                                                                                                        |
|                              | |     console.log(message.orientation.w);                                                                                                                        |
|                              | |     console.log(message.angular_velocity.x);                                                                                                                   |
|                              | |     console.log(message.angular_velocity.y);                                                                                                                   |
|                              | |     console.log(message.angular_velocity.z);                                                                                                                   |
|                              | |     console.log(message.linear_acceleration.x);                                                                                                                |
|                              | |     console.log(message.linear_acceleration.y);                                                                                                                |
|                              | |     console.log(message.linear_acceleration.z);                                                                                                                |
|                              | | });                                                                                                                                                            |
|                              | |                                                                                                                                                                |
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
| INITIALISATION               | | var listenerLocalPosition = new ROSLIB.Topic({                                                                                                                 |
| SAMPLE                       | |     ros :ros,                                                                                                                                                  |
|                              | |     name : '/<namespace>/mavros/local_position/local',                                                                                                         |
|                              | |     messageType : 'geometry_msgs/TwistStamped',                                                                                                                |
|                              | |     throttle_rate: 200                                                                                                                                         |
|                              | | });                                                                                                                                                            |
|                              | |                                                                                                                                                                |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.           |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 | | listenerImu.subscribe(function(message) {                                                                                                                      |
| SAMPLE                       | |     console.log(message.twist.linear.x);                                                                                                                       |
|                              | |     console.log(message.twist.linear.y);                                                                                                                       |
|                              | |     console.log(message.twist.linear.z);                                                                                                                       |
|                              | |     console.log(message.twist.angular.x);                                                                                                                      |
|                              | |     console.log(message.twist.angular.y);                                                                                                                      |
|                              | |     console.log(message.twist.angular.z);                                                                                                                      |
|                              | | });                                                                                                                                                            |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required local position data.                                                       |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+





















