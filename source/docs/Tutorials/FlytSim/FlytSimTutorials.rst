.. _flytsim_tutorials:

FlytSim
=======

FlytSim offers a 3D SITL(Software In The Loop) simulation environment for testing user apps without the drone hardware. It is a ROS-Gazebo based environment where the drone and its world are simulated, programmatically generating the state variables, while the control algorithms applied are same as onboard the drone. The FlytAPIs are also available in FlytSim and thus the user apps built with these APIs can be tested on a computer in a native Linux environment using FlytSim. Please follow the :ref:`FlytSim Installation Guide` to install FlytSim package, start testing your app and see it in action.

FlytSim Tutorials
-----------------

Once you have installed FlytSim and FlytCore, you are ready to build your own apps and run it out on FlytSim.


Launch FlytSim
^^^^^^^^^^^^^^

To launch FlytSim, run this command in the terminal::

	$ $(rospack find core_api)/scripts/start_flytOS.sh --sitl

To execute prebuilt sample apps, run this command in the terminal::

	$ sample_app1

Create your own app
^^^^^^^^^^^^^^^^^^^

* go to this directory
* include library in makefile or use available makefile
* write your code using FlytAPIs

Compile and Execute your own app
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* run cmake
* make
* your binary will be created
* launch FLytSim using <command>
* execute your own script from terminal

Edit or create your own custom models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: This section is for advanced users

* model urdf files are available in <this path>
* users could edit or create their own model files