.. _ready_visual_follow_me:

Visual Follow Me
================

Visual Follow Me is an onboard web app that comes bundled with FlytOS (placed in /flyt/flytapps/web/flytfollowme). This app talks to the onboard Object Tracking module using its FlytAPIs. To open this app, connect to your FlytPOD (or other device running FlytOS) from a browser and go to URL 



.. code-block:: c

		<ip>/followme

.
 .. image:: /_static/Images/visual_follow_me.png
     :align: center


How to use the app:
-------------------

* Launch the object tracking module (start button at top) and start the video stream.
* Note: For older version of FlytOS, you may have to run this command:
.. code-block:: c

		roslaunch vision_apps object_tracking.launch global_namespace:=<namespace>

* Once the object tracking module is up and running, the video stream will show processed images from the module
* The next step is to select the Track/Detect mode in the app (right panel)
* Select the target object in the video stream by drawing a rectangle with mouse (avoid including background i.e. non-target content)
* Once selected, the video will show the object being tracked. Use the params in the right panel to tune the tracking algorithm for the given object and environment
* To make the drone follow the object, select the Follow tab in the right panel for setting initial parameters for the onboard PD controller. Then click on the Start button in the same tab to start following. You can tune the controller parameters in-flight for desired performance.

.. note:: Try first in FlytSIM simulator to get acquainted and get approximate idea of the param values.


Setting up and deep dive:
-------------------------

* This app requires a downward looking camera mounted on the drone. By default FlytOS automatically connects to any camera available at /dev/video0 when it is booting up. If you connected the camera after FlytOS was launched then launch the cam_api as shown below -
.. code-block:: c

		roslaunch vision_apps cam_api.launch


* In case you want to change the camera capture settings, edit following launch file -

.. code-block:: c

		/flyt/flytos/flytcore/share/vision_apps/launch/cam_api.launch

* To start the onboard object tracking module, click on the Launch Object Tracking button. It can take few seconds to launch the app and get the video stream.

* The video shows processed images from the object tracking module. The next step is to select the Detect/Track mode in the app. Currently available modes:

Detect and Track Modes
----------------------
1. Color: Uses HSV color, heuristics like change in distance and area of the object and Kalman Filter for tracking.
2. Circle: Uses HSV color, Hough circle for circle detection and Kalman Filter for tracking.
3. TLD: Uses ros-openTLD library modified for integration with object tracking module.

OpenTLD Setup
-------------
If you want to use OpenTLD based tracker then follow instruction given below to run OpenTLD:

* Clone FlytOpenTLD repo from `here <https://github.com/flytbase/flyt_open_tld_3d.git>`_.
* It is a ROS project, so compile it using the 'catkin_make' command.
* After compilation, source the repo using command 'source <path to repo>/devel/setup.bash'.
* Launch OpenTLD using command 'roslaunch open_tld_3d open_tld_3d.launch global_namespace:=flytsim'.
* Once launched, it will share data with FlytOS and will be accessible through the Follow Me web app.
* To get more details on this project, visit `here <https://github.com/flytbase/flyt_open_tld_3d/tree/master/src>`_.

Object Tracking Workflow
------------------------
The object of interest can be selected on the video stream itself. Depending on the selected mode, corresponding attributes are detected and tracked in subsequent images. To follow the object, its distance from the image center is projected to ground and position setpoints are generated with a PD controller. The overall workflow:


 .. image:: /_static/Images/ObjTrackingBlog.png
     :align: center

Track and Follow Parameters
---------------------------
Several params have been exposed from the onboard object tracking module so that they can be tuned from the ground app for a given setup. These include HSV color ranges, Hough circle params, TLD params, controller gains and options to turn attitude compensation, tracking and follow modes On and Off. 



**Color Mode**
	* HSV color ranges (Hue, Saturation, Value)
**Circle Mode**
	* Canny Threshold - the higher threshold of the two passed to the Canny edge detector
	* Accumulated Threshold - the accumulator threshold for the circle centers at the detection stage
	* Accumulated Inv Ratio - Inverse ratio of the accumulator resolution to the image resolution
	* Minimum Radius - Minimum circle radius

TLD
	* Learning - Turn learning On or Off
	* Detector - If Off, detector is switched off when tracker is available
	* New Object - Turn On when starting with a new object
	* Model - Export saves the model to a file, Import loads model from the file, Clear resets model

Follow Mode
	* Kp, Kd - Proportional and derivative gains for controller
	* Velocity XY min, max - Minimum and maximum velocity along XY
	* Inner Tolerance - The drone is considered to have reached the target if the distance between them is less than inner tolerance
	* Outer Tolerance - Once inner tolerance is achieved, the drone is considered to be at the target until the distance between them is less than outer tolerance

Inspect Window
--------------
The Inspect section in the app shows object centroid position, drone’s position and the setpoints being sent. These data streams are obtained by subscribing to them using FlytOS websocket APIs. Please refer to API `docs <http://api.flytbase.com>`_ for more details. 


You may also want to visit our blog on `Object Tracking and Following <http://blogs.flytbase.com/computer-vision-for-drones-part-2/>`_.
