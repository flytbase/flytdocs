.. index:: api

.. _REST_websocket_api_reference:

FlytAPI - REST/Websocket
========================

This document is the REST/Websocket FlytAPI reference for FlytOS/FlytSim.

Navigation APIs
---------------

Now let's talk about Navigation APIs in detail.
FlytAPIs have been extended from ROS to CPP, Python, REST and websocket. For each of the following APIs, detailed documentation for each of the above is followed.

.. _Arm_REST:

Namespace
^^^^^^^^^

This namespace is a part of the url for all other rest calls and websocket connection.This has to be the first rest call before any other rest call or web socket connection.

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



Arm
^^^

Arming the drone means you are ready to fly. In this mode the controller outputs are passed to the mixer.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/arm                                                                                     |
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
|                              | |     url: "http://<ip>/ros/navigation/arm",                                                                         |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+



Disarm
^^^^^^

Disarming the drone means you have finished flying and the drone can be handled and safe to approach. In disarmed state the drone does not react to any RC inputs given or mission execution commands.

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/navigation/disarm                                                                                  |
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
|                              | |     url: "http://<ip>/ros/navigation/disarm",                                                                      |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


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
|                              | |     data: JSON.stringify(msgdata),                                                                                 |
|                              | |     url: "http://<ip>/ros/navigation/position_hold",                                                               |
|                              | |     success: function(data){                                                                                       |
|                              | |         console.log(data);                                                                                         |
|                              | |     }                                                                                                              |
|                              | | });                                                                                                                |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


Position Set
^^^^^^^^^^^^

Land command brings th e drone down to the specified local coordinated. This does not disarm the system.

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
| NOTE                         | | linear:x ,y,z : xyz local position coordinates with respect to NED                                                 |
|                              | | angular: z  : used for heading when yaw_valid set to true                                                          |
|                              | | tolerance: The radial value within which the setpoint is considered reached                                        |
|                              | | relative: Decides whether the give xyz coordination are supposed to be taken relative to the current location      |
|                              | |     or relative to origin.                                                                                         |
|                              | | yaw_valid: Decides whether to use angular:z value for deciding the setpoint heading or just use default heading.   |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

Position Set
^^^^^^^^^^^^

Land command brings th e drone down to the specified local coordinated. This does not disarm the system.

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
| NOTE                         | | linear:x ,y,z : xyz local position coordinates with respect to NED                                                 |
|                              | | angular: z  : used for heading when yaw_valid set to true                                                          |
|                              | | tolerance: The radial value within which the setpoint is considered reached                                        |
|                              | | relative: Decides whether the given xyz coordination are supposed to be taken relative to the current location     |
|                              | |     or relative to origin.                                                                                         |
|                              | | yaw_valid: Decides whether to use angular:z value for deciding the setpoint heading or just use default heading.   |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


.. .. warning:: fwffefefe

 .. .. tip:: cqfeqe

.. .. note:: ccqeceqe

.. .. important:: cqecqecq

.. .. hint:: ecqcceqe

.. .. error:: cqcqecqecq

.. .. caution:: ceceqevqev

.. .. attention:: cqcqevcqe



















