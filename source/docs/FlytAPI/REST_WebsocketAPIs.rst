.. index:: api

.. _REST_websocket_api_reference:

FlytAPI - REST/Websocket
========================

FlytAPIs have been extended from ROS to REST and Websocket. This document describes all the available REST/Websocket FlytAPIs in details.

.. caution:: This guide is under active development.

..  Authentication APIs
..  -------------------

..  Be advised, the Authentication APIs are specifically for FlytPODs with authentication enabled in them.

..  .. _Login_REST:

..  Login/token
..  ^^^^^^^^^^^

..  This API is used for getting a valid token from FlytPOD. A valid token recieved from this call is sent in the header with any rest call for it to be accepted by the FlytPOD.


..  REST
..  """"


..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | URL                          | | https://<ip>/login                                                                                                 |
..  |                              | | <ip>: IP of the flytpod in the network                                                                             |
..  |                              | |     eg: 192.168.x.xxx                                                                                              |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | METHOD                       |  POST                                                                                                                |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | DATA PARAMS                  | | Content: application/JSON                                                                                          |
..  |                              | | {                                                                                                                  |
..  |                              | |      username:[String],                                                                                            |
..  |                              | |      email: [String],                                                                                              |
..  |                              | |      password: [String]                                                                                            |
..  |                              | | }                                                                                                                  |
..  |                              | | username: An existing username for the device being handled.                                                       |
..  |                              | | email: Email with which the account was created / can also be supplied with the username.                          |
..  |                              | | password: Valid password for the account.                                                                          |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | SUCCESS                      | | Code: 200                                                                                                          |
..  | RESPONSE                     | | Content: {                                                                                                         | 
..  |                              | |     response : {                                                                                                   |
..  |                              | |          user: {                                                                                                   |
..  |                              | |                  autentication_token : [String]                                                                    |
..  |                              | |          }                                                                                                         |
..  |                              | |     }                                                                                                              |
..  |                              | | }                                                                                                                  |
..  |                              | |                                                                                                                    |
..  |                              | | authentication_token: token for making all the other rest calls.                                                   |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | ERROR                        | | Code: 404                                                                                                          |
..  | RESPONSE                     | | resource not found                                                                                                 |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+
..  | SAMPLE                       |  .. code-block:: rest                                                                                                |
..  | CALL                         |                                                                                                                      |
..  |                              |          var msgdata={};                                                                                             |
..  |                              |          msgdata['username']=$("#username").val();                                                                   |
..  |                              |          msgdata['email']=$("#username").val();                                                                      |
..  |                              |          msgdata['password']=$("#password").val();                                                                   |
..  |                              |          $.ajax({                                                                                                    |
..  |                              |          type: "POST",                                                                                               |
..  |                              |          dataType: "json",                                                                                           |
..  |                              |          data: JSON.stringify(msgdata),                                                                              |
..  |                              |          url: "https://<ip>/login",                                                                                  |
..  |                              |          success: function(data){                                                                                    |
..  |                              |              console.log(data.response.user.authentication_token);                                                   |
..  |                              |          }                                                                                                           |
..  |                              |      });                                                                                                             |
..  +------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Namespace_REST:

Namespace
^^^^^^^^^

This namespace is a part of the url for all other rest calls and websocket connection. This has to be the **first REST call before any other REST call** or web socket connection.

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/get_global_namespace                                                                               |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {}                                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : [Boolean]                                                                                            |
|                              | |     param_info:{                                                                                                   |
|                              | |         param_value: [String]                                                                                      |
|                              | |     }                                                                                                              |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
|                              | | param_info: the namespace value                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |          $.ajax({                                                                                                    |
|                              |          type: "POST",                                                                                               |
|                              |          dataType: "json",                                                                                           |
|                              |          headers: { 'Authentication-Token': token },   \\optional , for authentication only                          |
|                              |          data: JSON.stringify(msgdata),                                                                              |
|                              |          url: "http://<ip>/ros/get_global_namespace",    \\ change http to https for authentication                  |
|                              |          success: function(data){                                                                                    |
|                              |              console.log(data);                                                                                      |
|                              |          }                                                                                                           |
|                              |      });                                                                                                             |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----



Navigation APIs
---------------

These APIs allows you to have navigational control over your vehicle, and also provides vehicle telemetry data for further processing.


.. _Arm_REST:

Arm
^^^

Arming the drone means you are ready to fly. In this mode the controller outputs are passed to the mixer.

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/arm                                                                         |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |     success : [Boolean]                                                                                            |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |            type: "POST",                                                                                             |
|                              |            headers: { 'Authentication-Token': token },   \\optional , for authentication only                        |
|                              |            dataType: "json",                                                                                         |
|                              |            data: JSON.stringify(msgdata),                                                                            |
|                              |            url: "http://<ip>/ros/<namespace>/navigation/arm",    \\ change http to https for authentication          |
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

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/disarm                                                                      |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |     success : [Boolean]                                                                                            |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                         |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/disarm",   \\ change http to https for authentication         |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/take_off                                                                    |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be               |
|                              | |     fetched from get namespace rest call.                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
|                              | | {                                                                                                                  |
|                              | |     takeoff_alt : [Float]                                                                                          |
|                              | | }                                                                                                                  |
|                              | |                                                                                                                    |
|                              | | Example:                                                                                                           |
|                              | | msgdata={                                                                                                          |
|                              | |     takeoff_alt : 3.00                                                                                             |
|                              | | }                                                                                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                          |
| RESPONSE                     | | Content: {                                                                                                         | 
|                              | |     success : [Boolean]                                                                                            |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       var msgdata={};                                                                                                |
|                              |       msgdata["takeoff_alt"]=4.00;                                                                                   |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                         |
|                              |           dataType: "json",                                                                                          |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/take_off", \\ change http to https for authentication         |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/land                                                                        |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |     success : [Boolean]                                                                                            |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                         |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/land",  \\ change http to https for authentication            |
|                              |           success: function(data){                                                                                   |
|                              |               console.log(data);                                                                                     |
|                              |           }                                                                                                          |
|                              |       });                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+


----

.. _Position_Hold_REST:

Position hold
^^^^^^^^^^^^^

This command commands the vehicle to hover at the current location. It overrides any previous mission being carried out and starts hovering.



.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/position_hold                                                               |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |     success : [Boolean]                                                                                            |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                         |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/position_hold",   \\ change http to https for authentication  |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/position_set                                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx                                                                                                                                         |
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
|                              | |                 x: [Float],                                                                                                                                   |
|                              | |                 y: [Float],                                                                                                                                   |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance:  [Float],                                                                                                                                      |
|                              | |     async:      [Boolean],                                                                                                                                    |
|                              | |     relative:   [Boolean],                                                                                                                                    |
|                              | |     yaw_valid : [Boolean],                                                                                                                                    |
|                              | |     body_frame : [Boolean]                                                                                                                                    |
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
|                              | |     success : [Boolean],                                                                                                                                      |
|                              | | }                                                                                                                                                             |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                                               |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                                           |
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
|                              |          headers: { 'Authentication-Token': token },   \\optional , for authentication only                                                                     |
|                              |           data: JSON.stringify(msgdata),                                                                                                                        |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/position_set",         \\ change http to https for authentication                                        |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/velocity_set                                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx                                                                                                                                         |
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
|                              | |                 x: [Float],                                                                                                                                   |
|                              | |                 y: [Float],                                                                                                                                   |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance:  [Float],                                                                                                                                      |
|                              | |     async:      [Boolean],                                                                                                                                    |
|                              | |     relative:   [Boolean],                                                                                                                                    |
|                              | |     yaw_rate_valid : [Boolean],                                                                                                                               |
|                              | |     body_frame :[Boolean]                                                                                                                                     |
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
|                              | |     success : [Boolean],                                                                                                                                      |
|                              | | }                                                                                                                                                             |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                                               |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                                           |
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
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                                                                 |
|                              |              data: JSON.stringify(msgdata),                                                                                                                     |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/velocity_set",      \\ change http to https for authentication                                        |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/attitude_set                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |                 x: [Float],                                                                                        |
|                              | |                 y: [Float],                                                                                        |
|                              | |                 z: [Float]                                                                                         |
|                              | |             }                                                                                                      |
|                              | |         }                                                                                                          |
|                              | |     },                                                                                                             |
|                              | |     thrust:  [Float]                                                                                               |
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
|                              | |     success : [Boolean],                                                                                           |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
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
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                      |
|                              |              data: JSON.stringify(msgdata),                                                                          |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/attitude_set",  \\ change http to https for authentication |
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


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/exec_script                                                                 |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
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
|                              | |     success : [Boolean],                                                                                           |
|                              | | }                                                                                                                  |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                          |
| RESPONSE                     | | resource not found                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       var  msgdata={};                                                                                               |
|                              |       msgdata["app_name"]= "app12";                                                                                  |
|                              |       msgdata["arguments"]= "2 45 4 run";                                                                            |
|                              |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |              type: "POST",                                                                                           |
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                      |
|                              |              dataType: "json",                                                                                       |
|                              |              data: JSON.stringify(msgdata),                                                                          |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/exec_script",  \\ change http to https for authentication  |
|                              |              success: function(data){                                                                                |
|                              |                  console.log(data);                                                                                  |
|                              |              }                                                                                                       |
|                              |       )};                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Get_Waypoints_REST:

Get Waypoints
^^^^^^^^^^^^^

This command gets the current waypoint mission set on the autopilot.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_get                                                                              |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
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
|                              | |     success : [Boolean],                                                                                                         |
|                              | |     wp_recieved : [Int],                                                                                                         |
|                              | |     waypoints: [{                                                                                                                |
|                              | |          frame : [Int] 0/1/2/3/4,                                                                                                |
|                              | |          command : [Int] 16/17/18/19/20/21/22,                                                                                   |
|                              | |          is_current : [Boolean],                                                                                                 |
|                              | |          autocontinue : [Boolean],                                                                                               |
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
|                              | | command: 16:waypoint(recommended), 17:loiter, 18:loiter turns, 19: loiter time, 20: return to launch, 21: land, 22:take-off.     |
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
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                                    |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_get",      \\ change http to https for authentication           |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Set_Waypoints_REST:

Set Waypoints
^^^^^^^^^^^^^

This command gets the current waypoint mission set on the autopilot.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_set                                                                              |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {"waypoints":[{                                                                                                                  |
|                              | |          frame : [Int] 0/1/2/3/4,                                                                                                |
|                              | |          command : [Int] 16/17/18/19/20/21/22,                                                                                   |
|                              | |          is_current : [Boolean],                                                                                                 |
|                              | |          autocontinue : [Boolean],                                                                                               |
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
|                              | | {"waypoints":[{                                                                                                                  |
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
|                              | | command: 16:waypoint(recommended), 17:loiter, 18:loiter turns, 19: loiter time, 20: return to launch, 21: land, 22:take-off.     |
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
|                              | |     success : [Boolean]                                                                                                          |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
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
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                                    |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_set",        \\ change http to https for authentication         |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Execute_Waypoints_REST:

Execute Waypoints
^^^^^^^^^^^^^^^^^

This command tells the autopilot to start executing the mission already set. 


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_execute                                                                          |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
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
|                              | |     success : [Boolean]                                                                                                          |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                                    |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_execute",     \\ change http to https for authentication        |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Clear_Waypoints_REST:

Clear Waypoints
^^^^^^^^^^^^^^^

This command clears the previously set mission. 


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_clear                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
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
|                              | |     success : [Boolean],                                                                                                         |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },   \\optional , for authentication only                                    |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_clear",      \\ change http to https for authentication         |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Pause_Waypoints_REST:

Pause Waypoints
^^^^^^^^^^^^^^^

This command tells the autopilot to pause the execution of a waypoint mission and hold its current position and can be resumed on execute-waypoint rest call. 


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_pause                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
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
|                              | |     success : [Boolean],                                                                                                         |
|                              | | }                                                                                                                                |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |       var  msgdata={};                                                                                                             |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "POST",                                                                                                         |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },        \\optional , for authentication only                               |
|                              |              data: JSON.stringify(msgdata),                                                                                        |
|                              |              url: "http://<ip>/ros/<namespace>/navigation/waypoint_pause",      \\ change http to https for authentication         |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Global_Position_Setpoint_REST:

Global Position Setpoint
^^^^^^^^^^^^^^^^^^^^^^^^

This command commands the vehicle to go to specified geo coordinates and hover. It overrides any previous mission being carried out and starts hovering.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/position_set_global                                                                                                    |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx                                                                                                                                         |
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
|                              | |                 x: [Float],                                                                                                                                   |
|                              | |                 y: [Float],                                                                                                                                   |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z: [Float]                                                                                                                                    |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance:  [Float],                                                                                                                                      |
|                              | |     async:      [Boolean],                                                                                                                                    |
|                              | |     relative:   [Boolean],                                                                                                                                    |
|                              | |     yaw_valid : [Boolean],                                                                                                                                    |
|                              | |     body_frame : [Boolean]                                                                                                                                    |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | {                                                                                                                                                             |
|                              | |     twist:{                                                                                                                                                   |
|                              | |         twist:{                                                                                                                                               |
|                              | |             linear:{                                                                                                                                          |
|                              | |                 x: 18.594061,                                                                                                                                 |
|                              | |                 y: 73.911037,                                                                                                                                 |
|                              | |                 z: -1.00                                                                                                                                      |
|                              | |             },                                                                                                                                                |
|                              | |             angular:{                                                                                                                                         |
|                              | |                 z : 1.0                                                                                                                                       |
|                              | |             }                                                                                                                                                 |
|                              | |         }                                                                                                                                                     |
|                              | |     },                                                                                                                                                        |
|                              | |     tolerance: 2.00,                                                                                                                                          |
|                              | |     async: true,                                                                                                                                              |
|                              | |     yaw_valid: true,                                                                                                                                          |
|                              | |                                                                                                                                                               |
|                              | |                                                                                                                                                               |
|                              | | }                                                                                                                                                             |
|                              | | linear: x ,y,z : xyz global position coordinates.                                                                                                             |
|                              | | angular: z  : used for heading when yaw_valid set to true.                                                                                                    |
|                              | | tolerance: The radial value within which the setpoint is considered reached.                                                                                  |
|                              | | yaw_valid: Decides whether to use angular: z value for deciding the setpoint heading or just use default heading.                                             |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                                                     |
| RESPONSE                     | | Content: {                                                                                                                                                    | 
|                              | |     success : [Boolean],                                                                                                                                      |
|                              | | }                                                                                                                                                             |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                                               |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                                           |
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
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                                                                    |
|                              |           data: JSON.stringify(msgdata),                                                                                                                        |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/position_set_global",    \\ change http to https for authentication                                      |
|                              |           success: function(data){                                                                                                                              |
|                              |                  console.log(data);                                                                                                                             |
|                              |           }                                                                                                                                                     |
|                              |       };                                                                                                                                                        |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Set_Home_REST:

Set Home
^^^^^^^^

This command sets the home position for the drone.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/set_home                                                                                                               |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx                                                                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                                                          |
|                              | |     fetched from get namespace rest call.                                                                                                                     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                                                      |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                                                     |
|                              | | {                                                                                                                                                             |
|                              | |     lat:  [Float],                                                                                                                                            |
|                              | |     lon:  [Float],                                                                                                                                            |
|                              | |     alt:  [Float],                                                                                                                                            |
|                              | |     set_current: [Boolean],                                                                                                                                   |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | {                                                                                                                                                             |
|                              | |     lat: 2.00,                                                                                                                                                |
|                              | |     lon: true,                                                                                                                                                |
|                              | |     alt: true,                                                                                                                                                |
|                              | |     set_current: ,                                                                                                                                            |
|                              | |                                                                                                                                                               |
|                              | | }                                                                                                                                                             |
|                              | |  Lat: latitude coordinates of home.                                                                                                                           |
|                              | | Lon: longititude coordinates of home.                                                                                                                         |
|                              | | alt: altitude at which the vehicle will hover.                                                                                                                |
|                              | | set_current:                                                                                                                                                  |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                                                     |
| RESPONSE                     | | Content: {                                                                                                                                                    | 
|                              | |     success : [Boolean],                                                                                                                                      |
|                              | | }                                                                                                                                                             |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                                               |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                                           |
| CALL                         |                                                                                                                                                                 |
|                              |       var  msgdata={};                                                                                                                                          |
|                              |       msgdata["lat"]=2.00;                                                                                                                                      |
|                              |       msgdata["lon"]=true;                                                                                                                                      |
|                              |       msgdata["alt"]=false;                                                                                                                                     |
|                              |       msgdata["set_current"]=true;                                                                                                                              |
|                              |                                                                                                                                                                 |
|                              |       $.ajax({                                                                                                                                                  |
|                              |           type: "POST",                                                                                                                                         |
|                              |           dataType: "json",                                                                                                                                     |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                                                                    |
|                              |           data: JSON.stringify(msgdata),                                                                                                                        |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/set_home",         \\ change http to https for authentication                                            |
|                              |           success: function(data){                                                                                                                              |
|                              |                  console.log(data);                                                                                                                             |
|                              |           }                                                                                                                                                     |
|                              |       };                                                                                                                                                        |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Set_Current_Waypoint_REST:

Set Current Waypoint
^^^^^^^^^^^^^^^^^^^^

This command sets the current waypoint for the vehicle.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/navigation/waypoint_set_current                                                                                                   |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                                        |
|                              | |     eg: 192.168.x.xxx                                                                                                                                         |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                                                          |
|                              | |     fetched from get namespace rest call.                                                                                                                     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                                                      |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                                                     |
|                              | | {                                                                                                                                                             |
|                              | |     wp_seq:  [int]                                                                                                                                            |
|                              | | }                                                                                                                                                             |
|                              | |                                                                                                                                                               |
|                              | | Example                                                                                                                                                       |
|                              | |                                                                                                                                                               |
|                              | | {                                                                                                                                                             |
|                              | |     wp_seq: 2.00                                                                                                                                              |
|                              | | }                                                                                                                                                             |
|                              | | wp_seq: latitude coordinates of home.                                                                                                                         |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                                                     |
| RESPONSE                     | | Content: {                                                                                                                                                    | 
|                              | |     success : [Boolean],                                                                                                                                      |
|                              | | }                                                                                                                                                             |
|                              | | success: true:  command accepted by system , false: command rejected by system.                                                                               |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                                                     |
| RESPONSE                     | | resource not found                                                                                                                                            |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                                           |
| CALL                         |                                                                                                                                                                 |
|                              |       var  msgdata={};                                                                                                                                          |
|                              |       msgdata["wp_seq"]=2.00;                                                                                                                                   |
|                              |                                                                                                                                                                 |
|                              |       $.ajax({                                                                                                                                                  |
|                              |           type: "POST",                                                                                                                                         |
|                              |           dataType: "json",                                                                                                                                     |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                                                                    |
|                              |           data: JSON.stringify(msgdata),                                                                                                                        |
|                              |           url: "http://<ip>/ros/<namespace>/navigation/waypoint_set_current",         \\ change http to https for authentication                                |
|                              |           success: function(data){                                                                                                                              |
|                              |                  console.log(data);                                                                                                                             |
|                              |           }                                                                                                                                                     |
|                              |       };                                                                                                                                                        |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

Video Streaming APIs
--------------------

.. _List_Stream_REST:

List Video Streams
^^^^^^^^^^^^^^^^^^

This command gets the list of video streams available from the FlytOS.


.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 

REST
""""


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/list_streams                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx:8080                                                                                         |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                          |
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
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |       $.ajax({                                                                                                       |
|                              |           type: "POST",                                                                                              |
|                              |           dataType: "json",                                                                                          |
|                              |           headers: { 'Authentication-Token': token },   \\optional , for authentication only                         |
|                              |           data: JSON.stringify(msgdata),                                                                             |
|                              |           url: "http://<ip>/ros/list_streams",         \\ change http to https for authentication                    |
|                              |           success: function(data){                                                                                   |
|                              |                  console.log(data);                                                                                  |
|                              |           }                                                                                                          |
|                              |       )};                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Start_Stream_REST:

Start video stream
^^^^^^^^^^^^^^^^^^

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
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |      <img src=URL />                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Stop_Stream_REST:

Stop video stream
^^^^^^^^^^^^^^^^^

This command stops the video stream for the particular link to your ip.


+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | In HTML setting the src="" of the <img> tag should stop the  streaming                                             |
|                              | | or PLace the <img> tag in a <div> and set the div-html="" deleting the <img> tag completely.                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Capture_Stream_REST:

Snapshot
^^^^^^^^

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
| SAMPLE                       |  .. code-block:: rest                                                                                                |
| CALL                         |                                                                                                                      |
|                              |      <img src=URL />                                                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Please keep an eye out for the port. this api has a different port : 8080 .                                        |
|                              | | To get new images everytime make sure you add a system time as variables to the link because if the actual link    |
|                              | | doesnt change the browser gets the old image from cache instead of querying from the server.                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Object Tracking APIs
--------------------

.. important:: The Object Tracking module does not start automatically when you start FlytOS, it needs to be launched seperately using the following command.

.. code-block:: bash 

  	$ roslaunch vision_apps object_tracking.launch global_namespace:=<namespace>
  	#<namespace> : Name of the flytpod (default: flytpod) which is required for 
  	#              every socket subscription and can be fetched from get namespace rest call.



Detect-Track Mode Selection
^^^^^^^^^^^^^^^^^^^^^^^^^^^

+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_mode                                                                                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_mode : 0 : Detection by Color                                                                             |
|                              | |                 1 : Detection by Shape - Circle                                                                    |
|                              | |                 2 : TLD                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                               |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Detection by Color
^^^^^^^^^^^^^^^^^^

+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_hrange, ob_track_srange, ob_track_vrange                                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_hrange : 0 - 125: Hue levels for Color detection.                                                         |
|                              | | ob_track_srange : 0 - 125: Saturation levels for Color detection.                                                  |
|                              | | ob_track_vrange : 0 - 125: Intensity value levels for Color detection.                                             |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                               |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Detection by Shape - Circle
^^^^^^^^^^^^^^^^^^^^^^^^^^^

+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_ct, ob_track_at, ob_track_ir, ob_track_mr                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_ct : 0 - 255: Threshold for the internal Canny edge detector.                                             |
|                              | | ob_track_at : 0 - 255: Accumulator threshold for the circle centers.                                               |
|                              | | ob_track_ir : 0 - 255: Inverse ratio of the accumulator resolution to the image resolution.                        |
|                              | | ob_track_mr : 0 - 255: Minimum circle radius.                                                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                               |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Detection by TLD
^^^^^^^^^^^^^^^^

.. important:: To use the TLD option you need download and compile FlytOpenTLD 3D from `here <https://github.com/flytbase/flyt_open_tld_3d>`_. And launch it by running the command. 

.. code-block:: bash 

  	$ roslaunch open_tld_3d open_tld_3d.launch global_namespace:=<namespace>
  	#<namespace> : Name of the flytpod (default: flytpod) which is required for every
  	#              socket subscription and can be fetched from get namespace rest call.


+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_tld_learning_disabled, ob_track_tld_detector_disabled, ob_track_tld_new_object, ob_track_tld_clear_model, ob_track_tld_import_model, ob_track_tld_export_model                         |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_tld_learning_disabled : 0 : Turn learning ON.                                                                                                                                          |
|                              | |                                  1 : Turn learning OFF.                                                                                                                                         |
|                              | | ob_track_tld_detector_disabled : 0 : Detector is switched on - alternating mode is off.                                                                                                         |
|                              | |                                  1 : Detector is switched off -alternating mode on.                                                                                                             |
|                              | | ob_track_tld_new_object : 0 : Continue with previous model.                                                                                                                                     |
|                              | |                           1 : Create new model.                                                                                                                                                 |
|                              | | ob_track_tld_clear_model : 1: Model is cleared.                                                                                                                                                 |
|                              | | ob_track_tld_import_model : 1: Model is imported.                                                                                                                                               |
|                              | | ob_track_tld_export_model : 1: Model is exported.                                                                                                                                               |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                                                                                                            |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----


Follow Object (Downward Camera)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_follow                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_follow :  0 : Stop Following                                                                              |
|                              | |                    1 : Start Following                                                                             |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                               |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

Follow Object ON
^^^^^^^^^^^^^^^^

+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| PARAMETERS                   | | ob_track_kp, ob_track_kd, ob_track_vel_xy_min, ob_track_vel_xy_max, ob_track_tolerance_inner, ob_track_tolerance_outer, ob_track_compensate                                                     |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| VALUES                       | | ob_track_kp : Propotional Gain for object follow controller.                                                                                                                                    |
|                              | | ob_track_kd : Differential  Gain for object follow controller.                                                                                                                                  |
|                              | | ob_track_vel_xy_min : Minimum velocity in horizontl plane.                                                                                                                                      |
|                              | | ob_track_vel_xy_max : Maximum velocity in horizontl plane.                                                                                                                                      |
|                              | | ob_track_tolerance_inner : Inner radius in video feed within which if object detected it starts position hold.                                                                                  |
|                              | | ob_track_tolerance_outer : Outer radius in video feed outside which it stops position hold.                                                                                                     |
|                              | | ob_track_compensate : 0: Attitude compensation is stopped.                                                                                                                                      |
|                              | |                       1: Attitude compensation is added.(required in case of Gimbal)                                                                                                            |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | Use the set parameter api to set the parameter to the desired value.                                                                                                                            |
+------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

Telemetry APIs
---------------

Websocket Initializations
^^^^^^^^^^^^^^^^^^^^^^^^^

Websocket needs to be initialized once in every session. It requires additional libraries: event.emitter.js and roslib.js to be included in case of web based client.

Socket
""""""


.. important:: Please make sure replace ws with wss and remove port in IP. Also provide a token by making a REST call for Token for websocket authentication.

+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| URL                          | | ws://<ip>/websocket                                                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                             |
|                              | |     eg: 192.168.x.xxx                                                                                              |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                |
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
|                              |        // This part is optional. only required in case of authentication                                             |
|                              |        var rauth = new ROSLIB.Message({                                                                              |
|                              |              "op": "auth",                                                                                           |
|                              |              "mac" : token,                                                                                          |
|                              |                                                                                                                      |
|                              |          });                                                                                                         |
|                              |                                                                                                                      |
|                              |        ros.authenticate(rauth);                                                                                      |
|                              |                                                                                                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------+

----

.. _Attitude_Quat_REST:


Attitude Quaternion data
^^^^^^^^^^^^^^^^^^^^^^^^

Fetches real time attitude data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
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
| SUBSCRIPTION                 |   .. code-block:: rest                                                                                                                                           |
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

REST
""""

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/mavros/imu/data                                                                                      |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       |
|                              | |     orientation:{                                                                                                                |
|                              | |                 x: [Float],                                                                                                      |
|                              | |                 y: [Float],                                                                                                      |
|                              | |                 z: [Float]                                                                                                       |
|                              | |                 w: [Float]                                                                                                       |
|                              | |             },                                                                                                                   |
|                              | |      angular_velocity:{                                                                                                          |
|                              | |                 x: [Float],                                                                                                      |
|                              | |                 y: [Float],                                                                                                      |
|                              | |                 z: [Float]                                                                                                       |
|                              | |             },                                                                                                                   |
|                              | |      linear_acceleration:{                                                                                                       |
|                              | |                 x: [Float],                                                                                                      |
|                              | |                 y: [Float],                                                                                                      |
|                              | |                 z: [Float]                                                                                                       |
|                              | |             }                                                                                                                    |
|                              | |         }                                                                                                                        |
|                              | |     }                                                                                                                            |
|                              | | }                                                                                                                                |
|                              | |                                                                                                                                  |
|                              | | linear_acceleration in meter/second/second                                                                                       |
|                              | |                                                                                                                                  |
|                              | | angular_velocity: x: rollspeed                                                                                                   |
|                              | |          y: pitchspeed                                                                                                           |
|                              | |          z: yawspeed                                                                                                             |
|                              | | rollspeed/pitchspeed/yawspeed values in radians/sec.                                                                             |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "GET",                                                                                                          |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },        \\optional , for authentication only                               |
|                              |              url: "http://<ip>/ros/<namespace>/mavros/imu/data_euler",         \\ change http to https for authentication          |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+


----

.. _Attitude_Euler_REST:


Attitude Euler data
^^^^^^^^^^^^^^^^^^^

Fetches real time attitude data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerAttitude = new ROSLIB.Topic({                                                                                                                  |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/imu/data_euler',                                                                                                           |
|                              |           messageType : 'geometry_msgs/TwistStamped',                                                                                                            |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |        });                                                                                                                                                       |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |                                                                                                                                                                  |
|                              |           listenerAttitude.subscribe(function(message) {                                                                                                         |
|                              |                                                                                                                                                                  |
|                              |                  $('#roll').textround(message.twist.linear.x);                                                                                                   |
|                              |                  $('#pitch').text(message.twist.linear.y);                                                                                                       |
|                              |                  $('#yaw').text(message.twist.linear.z);                                                                                                         |
|                              |                  $('#rollSpeed').text(message.twist.angular.x);                                                                                                  |
|                              |                  $('#pitchSpeed').text(message.twist.angular.y);                                                                                                 |
|                              |                  $('#yawSpeed').text(message.twist.angular.z);                                                                                                   |
|                              |            });                                                                                                                                                   |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required attitude data.                                                             |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

REST
""""

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/mavros/imu/data_euler                                                                                |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       |
|                              | |         twist:{                                                                                                                  |
|                              | |             linear:{                                                                                                             |
|                              | |                 x: [Float],                                                                                                      |
|                              | |                 y: [Float],                                                                                                      |
|                              | |                 z: [Float]                                                                                                       |
|                              | |             },                                                                                                                   |
|                              | |             angular:{                                                                                                            |
|                              | |                 x: [Float],                                                                                                      |
|                              | |                 y: [Float],                                                                                                      |
|                              | |                 z: [Float]                                                                                                       |
|                              | |             }                                                                                                                    |
|                              | |         }                                                                                                                        |
|                              | | }                                                                                                                                |
|                              | |                                                                                                                                  |
|                              | | linear: x: roll                                                                                                                  |
|                              | |         y: pitch                                                                                                                 |
|                              | |         z: yaw                                                                                                                   |
|                              | | roll/pitch/yaw values in radians.                                                                                                |
|                              | |                                                                                                                                  |
|                              | | angular: x: rollspeed                                                                                                            |
|                              | |          y: pitchspeed                                                                                                           |
|                              | |          z: yawspeed                                                                                                             |
|                              | | rollspeed/pitchspeed/yawspeed values in radians/sec.                                                                             |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "GET",                                                                                                          |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },        \\optional , for authentication only                               |
|                              |              url: "http://<ip>/ros/<namespace>/mavros/imu/data_euler",         \\ change http to https for authentication          |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----


.. _LPOS_REST:

Local Position data
^^^^^^^^^^^^^^^^^^^

Fetches real time local position data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerLocalPosition = new ROSLIB.Topic({                                                                                                             |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/global_position/global',                                                                                                   |
|                              |           messageType : 'geometry_msgs/TwistStamped',                                                                                                            |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |       });                                                                                                                                                        |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |      listenerLocalPosition.subscribe(function(message) {                                                                                                         |
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

----

GPS data
^^^^^^^^^

Fetches real time GPS data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerGlobalPosition = new ROSLIB.Topic({                                                                                                            |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/local_position/local',                                                                                                     |
|                              |           messageType : 'sensor_msgs/NavSatFix',                                                                                                                 |
|                              |           throttle_rate: 1000                                                                                                                                    |
|                              |       });                                                                                                                                                        |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |      listenerGlobalPosition.subscribe(function(message) {                                                                                                        |
|                              |          console.log(message.latitude);                                                                                                                          |
|                              |          console.log(message.longitude);                                                                                                                         |
|                              |      });                                                                                                                                                         |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required local position data.                                                       |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Battery_REST:

Battery Status
^^^^^^^^^^^^^^

Fetches real time battery status at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerBatteryStatus = new ROSLIB.Topic({                                                                                                             |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/battery',                                                                                                                  |
|                              |           messageType : 'mavros_msgs/BatteryStatus',                                                                                                             |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |        });                                                                                                                                                       |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |      listenerBatteryStatus.subscribe(function(message) {                                                                                                         |
|                              |          console.log(message.voltage);                                                                                                                           |
|                              |          console.log(message.current);                                                                                                                           |
|                              |          console.log(message.remaining);                                                                                                                         |
|                              |      });                                                                                                                                                         |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required battery data.                                                              |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

REST
""""

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/mavros/battery                                                                                       |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     current : [Float],                                                                                                           |
|                              | |     voltage : [Float],                                                                                                           |
|                              | |     remaining : [Float],                                                                                                         |
|                              | | }                                                                                                                                |
|                              | | current: Current consumption in Amperes.                                                                                         |
|                              | | voltage: Current voltage in Volts.                                                                                               |
|                              | | remaining: Percentage of battery remaining.                                                                                      |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "GET",                                                                                                          |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },        \\optional , for authentication only                               |
|                              |              url: "http://<ip>/ros/<namespace>/mavros/battery",    \\ change http to https for authentication                      |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----


.. _HUD_REST:

HUD
^^^

Fetches real time HUD data at required rate. To be done after initialization of websocket.

Socket
""""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| INITIALISATION               |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |       var listenerHUD = new ROSLIB.Topic({                                                                                                                       |
|                              |           ros :ros,                                                                                                                                              |
|                              |           name : '/<namespace>/mavros/vfr_hud',                                                                                                                  |
|                              |           messageType : 'mavros_msgs/VFR_HUD',                                                                                                                   |
|                              |           throttle_rate: 200                                                                                                                                     |
|                              |        });                                                                                                                                                       |
|                              |                                                                                                                                                                  |
|                              |  <namespace>: Name of the flytpod (default: flytpod) which is required for every socket subscription and can be fetched from get namespace rest call.            |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SUBSCRIPTION                 |  .. code-block:: rest                                                                                                                                            |
| SAMPLE                       |                                                                                                                                                                  |
|                              |                                                                                                                                                                  |
|                              |           listenerHUD.subscribe(function(message) {                                                                                                              |
|                              |                                                                                                                                                                  |
|                              |               $('#aspeed').text(message.airspeed);                                                                                                               |
|                              |               $('#gspeed').text(message.groundspeed);                                                                                                            |
|                              |               $('#head').text(message.heading);                                                                                                                  |
|                              |               $('#hthrottle').text(message.throttle);                                                                                                            |
|                              |               $('#halt').text(message.altitude);                                                                                                                 |
|                              |               $('#hclimb').text(message.climb);                                                                                                                  |
|                              |            });                                                                                                                                                   |
|                              |                                                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NOTES                        | | ros: Pointed to the ros object created in the initialization of a web socket connection                                                                        |
|                              | | name: Requires the name of the topic which gives out the required data.                                                                                        |
|                              | | messageType: Set the type of predefined data structure used to deliver the required HUD data.                                                                  |
|                              | | throttle_rate: Sets the rate at which callbacks are called in miliseconds.                                                                                     |
|                              | |                                                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

REST
""""

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/mavros/vfr_hud                                                                                       |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                           |
|                              | |     eg: 192.168.x.xxx                                                                                                            |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call and can be                             |
|                              | |     fetched from get namespace rest call.                                                                                        |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                        |
|                              | | {}                                                                                                                               |
|                              | |                                                                                                                                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                        |
| RESPONSE                     | | Content: {                                                                                                                       | 
|                              | |     airspeed : [Float],                                                                                                          |
|                              | |     groundspeed : [Float],                                                                                                       |
|                              | |     head : [Float],                                                                                                              |
|                              | |     throttle : [Float],                                                                                                          |
|                              | |     altitude : [Float],                                                                                                          |
|                              | |     climb : [Float],                                                                                                             |
|                              | | }                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                        |
| RESPONSE                     | | resource not found                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                              |              
| CALL                         |                                                                                                                                    |
|                              |                                                                                                                                    |
|                              |       $.ajax({                                                                                                                     |
|                              |              type: "GET",                                                                                                          |
|                              |              dataType: "json",                                                                                                     |
|                              |              headers: { 'Authentication-Token': token },        \\optional , for authentication only                               |
|                              |              url: "http://<ip>/ros/<namespace>/mavros/vfr_hud",       \\ change http to https for authentication                   |
|                              |              success: function(data){                                                                                              |
|                              |                  console.log(data);                                                                                                |
|                              |              }                                                                                                                     |
|                              |       )};                                                                                                                          |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

----

Parameter Handling APIs
-----------------------


.. _Param_set_REST:

Parameter Set
^^^^^^^^^^^^^

This command sets parameters in FlytOS. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_set                                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |      param_info:{                                                                                                                      |
|                              | |                        param_id: [String],                                                                                             |
|                              | |                        param_value: [String]                                                                                           |
|                              | |                 }                                                                                                                      |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |  Example                                                                                                                               |
|                              | | {                                                                                                                                      |
|                              | |      param_info:{                                                                                                                      |
|                              | |                        param_id: "RTL_ALT",                                                                                            |
|                              | |                        param_value: "5.0"                                                                                              |
|                              | |                 }                                                                                                                      |
|                              | | }                                                                                                                                      |
|                              | | param_id: Name of the parameter to be set.                                                                                             |
|                              | | param_value: Value of the parameter to be set. Should be of type string.                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             | 
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       msgdata.param_info["param_value"]="5.0";                                                                                           |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_set",               \\ change http to https for authentication                   |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_get_all_REST:

Parameter Get All
^^^^^^^^^^^^^^^^^

This command gets all parameters from FlytOS. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_get_all                                                                                        |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {}                                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |               success : [Boolean],                                                                                                     |
|                              | |               param_list: [{   param_id: [String],                                                                                     |
|                              | |                                param_value: [String]                                                                                   |
|                              | |                            },                                                                                                          |
|                              | |                            {   param_id: [String],                                                                                     |
|                              | |                                param_value: [String]                                                                                   |
|                              | |                            },                                                                                                          |
|                              | |                            {   param_id: [String],                                                                                     |
|                              | |                                param_value: [String]                                                                                   |
|                              | |                            },{},{},....]                                                                                               |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
|                              | | param_list: Array of parameters with ids and respective values.                                                                        |
|                              | | param_id: Name of the parameter.                                                                                                       |
|                              | | param_value: Value of the parameter.                                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_get_all",                        \\ change http to https for authentication      |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_get_REST:

Parameter Get
^^^^^^^^^^^^^

This command gets a particular parameter from FlytOS. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_get                                                                                            |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |      param_id: [String]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |  Example                                                                                                                               |
|                              | | {                                                                                                                                      |
|                              | |      param_id: "RTL_ALT"                                                                                                               |
|                              | | }                                                                                                                                      |
|                              | | param_id: Name of the parameter to be fetched.                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             | 
|                              | |     success : [Boolean],                                                                                                               |
|                              | |     param_info:{   param_value:[String]      }                                                                                         |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
|                              | | param_value: It carries the value of the parameter to be fetched.                                                                      |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_id"]="RTL_ALT";                                                                                                     |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },        \\optional , for authentication only                                        |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_get",           \\ change http to https for authentication                       |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data.param_info.param_value);                                                                               |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_save_REST:


Parameter Save
^^^^^^^^^^^^^^

This command Saves all parameters in FlytOS with changes still reflected on next reboot. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_save                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {}                                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |               success : [Boolean],                                                                                                     |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },        \\optional , for authentication only                                        |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_save",              \\ change http to https for authentication                   |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_load_REST:

Parameter Load
^^^^^^^^^^^^^^

This command loads parameters on to the FlytOS if a new parameter file is uploaded to the FlytOS through Flytconsole. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_load                                                                                           |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {}                                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |               success : [Boolean],                                                                                                     |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },        \\optional , for authentication only                                        |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_load",               \\ change http to https for authentication                  |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_create_REST:

Parameter Create
^^^^^^^^^^^^^^^^

This command creates parameters in FlytOS. 

.. important:: Please make sure to replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_create                                                                                         |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |      param_info:{                                                                                                                      |
|                              | |                        param_id: [String],                                                                                             |
|                              | |                        param_value: [String]                                                                                           |
|                              | |                 }                                                                                                                      |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |  Example                                                                                                                               |
|                              | | {                                                                                                                                      |
|                              | |      param_info:{                                                                                                                      |
|                              | |                        param_id: "RTL_ALT",                                                                                            |
|                              | |                        param_value: "5.0"                                                                                              |
|                              | |                 }                                                                                                                      |
|                              | | }                                                                                                                                      |
|                              | | param_id: Name of the parameter to be created.                                                                                         |
|                              | | param_value: Value of the parameter to be created. Should be of type string.                                                           |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             | 
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       msgdata.param_info["param_value"]="5.0";                                                                                           |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_create",               \\ change http to https for authentication                |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

.. _Param_delete_REST:

Parameter Delete
^^^^^^^^^^^^^^^^

This command deletes the parameters in FlytOS. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_delete                                                                                         |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |     param_id: [String]                                                                                                                 |
|                              | |                                                                                                                                        |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |  Example                                                                                                                               |
|                              | | {                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | |     param_id: "RTL_ALT"                                                                                                                |
|                              | |                                                                                                                                        |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | param_id: Name of the parameter to be deleted.                                                                                         |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             | 
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_delete",               \\ change http to https for authentication                |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

Parameter Reset
^^^^^^^^^^^^^^^

This command resets the parameters in FlytOS. 

.. important:: Please make sure replace http with https and remove port in IP and add token in header of the REST call. 


REST
""""


+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/param/param_reset                                                                                          |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {}                                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/param/param_reset",               \\ change http to https for authentication                 |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----


Setup APIs
----------

.. _Setup_actuator_testing:

Actuator Testing
^^^^^^^^^^^^^^^^

This command tests the actuators in FlytOS.

+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/setup/actuator_testing                                                                                     |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |     actuator_id: [uint8],                                                                                                              |
|                              | |     time_s: [float32]                                                                                                                  |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | Example                                                                                                                                |
|                              | | {                                                                                                                                      |
|                              | |     actuator_id: " ",                                                                                                                  |
|                              | |     time_s: " "                                                                                                                        |
|                              | | }                                                                                                                                      |
|                              | | actuator_id: The id of the actuator                                                                                                    |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/setup/actuator_testing",               \\ change http to https for authentication            |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

ESC Calibration
^^^^^^^^^^^^^^^

.. _Setup_esc_calibration:

This command calibrates the ESCs in FlytOS.

+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/setup/esc_calibration                                                                                      |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |     pwm_min: [float32],                                                                                                                |
|                              | |     pwm_max: [float32],                                                                                                                |
|                              | |     num_of_actuators: [int8],                                                                                                          |
|                              | |     calibration_state: [int8]                                                                                                          |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | Example                                                                                                                                |
|                              | | {                                                                                                                                      |
|                              | |     pwm_min: ,                                                                                                                         |
|                              | |     pwm_max: ,                                                                                                                         |
|                              | |     num_of_actuators: ,                                                                                                                |
|                              | |     calibration_state:                                                                                                                 |
|                              | | }                                                                                                                                      |
|                              | | pwm_min:                                                                                                                               |
|                              | | pwm_max:                                                                                                                               |
|                              | | num_of_actuators:                                                                                                                      |
|                              | | calibration_state:                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/setup/esc_clibration",               \\ change http to https for authentication              |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

----

Module Calibration
^^^^^^^^^^^^^^^^^^

.. _Setup_module_calibration:

This command calibrates the ESCs in FlytOS.

+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| URL                          | | http://<ip>/ros/<namespace>/setup/module_calibration                                                                                   |
|                              | | <ip>: IP of the flytpod in the network along with port                                                                                 |
|                              | |     eg: 192.168.x.xxx                                                                                                                  |
|                              | | <namespace>: Name of the flytpod (default: flytpod) which is required for every rest call                                              |
|                              | |     and can be fetched from get namespace rest call.                                                                                   |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| METHOD                       | GET , POST                                                                                                                               |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| DATA PARAMS                  | | Content: application/JSON                                                                                                              |
|                              | | {                                                                                                                                      |
|                              | |     module_calibrate: [int8]                                                                                                           |
|                              | | }                                                                                                                                      |
|                              | |                                                                                                                                        |
|                              | | Example                                                                                                                                |
|                              | | {                                                                                                                                      |
|                              | |     module_calibrate:                                                                                                                  | 
|                              | | }                                                                                                                                      |
|                              | | module_calibrate:                                                                                                                      |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SUCCESS                      | | Code: 200                                                                                                                              |
| RESPONSE                     | | Content: {                                                                                                                             |
|                              | |     success : [Boolean]                                                                                                                |
|                              | | }                                                                                                                                      |
|                              | | success:  Tells whether the command is accepted or rejected by system.                                                                 |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| ERROR                        | | Code: 404                                                                                                                              |
| RESPONSE                     | | resource not found                                                                                                                     |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| SAMPLE                       |  .. code-block:: rest                                                                                                                    |
| CALL                         |                                                                                                                                          |
|                              |       var msgdata={};                                                                                                                    |
|                              |       msgdata["param_info"]={};                                                                                                          |
|                              |       msgdata.param_info["param_id"]="RTL_ALT";                                                                                          |
|                              |       $.ajax({                                                                                                                           |
|                              |           type: "POST",                                                                                                                  |
|                              |           dataType: "json",                                                                                                              |
|                              |           headers: { 'Authentication-Token': token },       \\optional , for authentication only                                         |
|                              |           data: JSON.stringify(msgdata),                                                                                                 |
|                              |           url: "http://<ip>/ros/<namespace>/setup/module_clibration",               \\ change http to https for authentication           |
|                              |           success: function(data){                                                                                                       |
|                              |                  console.log(data);                                                                                                      |
|                              |           }                                                                                                                              |
|                              |       )};                                                                                                                                |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| NOTE                         | | The changes made by set-param are lost in reboot. Use the save-param api after set-param to retain changes on reboot.                  |
+------------------------------+------------------------------------------------------------------------------------------------------------------------------------------+

