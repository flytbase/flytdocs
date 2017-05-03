.. _write_onboard_web:

Onboard Web
============

Visual Follow Me:
^^^^^^^^^^^^^^^^^

Visual Flyt Follow-Me is an onboard web app that comes bundled with FlytOS (placed in /flyt/flytapps/web/flytfollowme). This app talks to the onboard Object Tracking module using its FlytAPIs. To open this app, connect to your FlytPOD (or other device running FlytOS) from a browser and go to URL 

	.. code-block:: c
	
			<ip>/flytfollowme


[snapshot of app]

How to use the app:
-------------------

Launch the object tracking module (Launch button at top) and start the video stream (left panel Start button)
Once the object tracking module is up and running, the video stream will show processed images from the module
The next step is to select the Detect/Track mode in the app (right panel)
Select the target object in the video stream by drawing a rectangle with mouse (avoid including background i.e. non-target content)
Once selected, the video will show the object being tracked. Use the params in the right panel to tune the tracking algorithm for the given object and environment
To make the drone follow the object, select the Follow tab in the right panel for setting initial parameters for the onboard PD controller. Then click on the Start button in the same tab to start following. You can tune the controller parameters in-flight for desired performance. Note: Try first in FlytSIM simulator to get acquainted and get approximate idea of the param values.

Setting up and deep dive:
-------------------------

This app requires a downward looking camera mounted on the drone. By default FlytOS automatically connects to any camera available at /dev/video0 when it is booting up. If you connected camera after FlytOS was launched then launch the cam_api as shown below -
roslaunch vision_apps cam_api.launch
In case you want to change the camera capture settings, edit following launch file -
/flyt/flytos/flytcore/share/vision_apps/launch/cam_api.launch

To start the onboard object tracking module, click on the Launch Object Tracking button. It can take few seconds to launch the app and get the video stream.

The video shows processed images from the object tracking module. The next step is to select the Detect/Track mode in the app. Currently available modes:
Color: Uses HSV color, heuristics like change in distance and area of the object and Kalman Filter for tracking
Circle: Uses HSV color, Hough circle for circle detection and Kalman Filter for tracking
TLD: Uses ros-openTLD library modified for integration with object tracking module 

If you want to use OpenTLD based tracker then follow instruction given below to run OpenTLD:
Clone FlytOpenTLD repo from https://github.com/flytbase/flyt_open_tld_3d.git
It is a ROS project, so compile it using the 'catkin_make' command
After compilation, source the repo using command 'source <path to repo>/devel/setup.bash'
Launch OpenTLD using command 'roslaunch open_tld_3d open_tld_3d.launch global_namespace:=flytsim'
Once launched, it will share data with FlytOS and will be accessible through the Follow Me web app
To get more details on this project, visit 'https://github.com/flytbase/flyt_open_tld_3d/tree/master/src'

The object of interest can be selected on the video stream itself. Depending on the selected mode, corresponding attributes are detected and tracked in subsequent images. To follow the object, its distance from the image center is projected to ground and position setpoints are generated with a PD controller. The overall workflow:




Several params have been exposed from the onboard object tracking module so that they can be tuned from the ground app for a given setup. 

[More details for params?]
These include HSV color ranges, Hough circle params, TLD params, controller gains and options to turn attitude compensation, tracking and follow modes On and Off. The Inspect section in the app shows object centroid position, drone’s position and the setpoints being sent. These data streams are obtained by subscribing to them using FlytOS websocket APIs. Please refer to API docs<link> for more details. 

You may also want to visit our blog on Object Tracking and Following. 
