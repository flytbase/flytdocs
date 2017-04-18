.. _write_roscpp:

ROSCPP
=======

Download and Build the Demo Apps
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Source code for the roscpp sample applications can be found at our `github page`_. Download the folder and place it in the ``src`` folder of your catkin workspace in your flight computer. If you do not created a catkin workspace before, follow these steps to create one.

* We are going to name our catkin workspace catkin_ws. Create the folder by typing the following commands in your terminal:
  
  .. code-block:: bash

  		$ mkdir -p ~/catkin_ws/src
  		$ cd ~/catkin_ws/src

* Copy the ros_demoapps folder in src
  
* You can now compile the the app by entering the following commands

  .. code-block:: bash

  		$ cd ~/catkin_ws/
  		$ catkin_make

* You will have to source your workspace by entering the following command
  
  .. code-block:: bash

  		$ source ~/catkin_ws/devel/setup.bash

* You can add the above line at the end of your /etc/bash.bashrc file so that you don't have to execute the sourcing command every time you open a new terminal. You will need sudo privileges to edit the /etc/bash.bashrc file.



Demo App 1
----------

This demo app makes the drone takeoff, move in a square trajectory of side length 5m, and land the drone once the entire mission is over.

Below is a demo `youtube video <https://www.youtube.com/watch?v=lwKZXkzkM80>`_ of the same app when run on :ref:`FlytPOD <about_flytpod_pro>`.

..  youtube:: lwKZXkzkM80
    :aspect: 16:9
    :width: 100%

|br|

Execution
"""""""""""""""

If you have compiled the downloaded programs successfully, execute them by running the following command in your terminal.

.. code-block:: bash

    $ rosrun ros_demoapps demoapp1_node 

Code
""""""""""

.. literalinclude:: include/roscpp_demoapp1.cpp
   :language: cpp
   :tab-width: 2

Code Explained
""""""""""""""""""""

* You must include the following header files for the services that we need to call

  .. literalinclude:: include/roscpp_demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 1-5

* Call the global namespace getter service. The global namespace needs to be prepended to any service that will be called by this node. Visit the `namespace API documentation <http://api.flytbase.com/?cpp#namespace>`_ page for more details.

  .. literalinclude:: include/roscpp_demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 38-40

* TakeOff command can be sent to vehicle with relative takeoff altitude in meters as argument. Over here the takeoff altitude is 3m. Visit the `take-off API documentation <http://api.flytbase.com/?cpp#take-off>`_ page for more details. 

  .. literalinclude:: include/roscpp_demoapp1.cpp
     :language: c
     :tab-width: 2
     :lines: 46-53

  .. caution:: You must ensure to call takeoff() before sending any other position setpoints. takeoff() inherently calls arm(), hence calling arm() directly also arms the vehicle and makes it responsive towards next setpoint commands.

* Position Setpoints can be sent to the vehicle with (x,y,z) in meters in Local-NED Frame as argument. As the Position Setpoint service is being called repeatedly, we wrap it around with a function that takes in only the (x, y, z) coordinates. Users can modify the other fields like Async, tolerance and yaw_valid an explore the effects on the mission. Visit the `position setpoint API documentation <http://api.flytbase.com/?cpp#position-setpoint>`_ page for more details. 

  .. literalinclude:: include/roscpp_demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 17-31

* Land command must be used to send the vehicle into Landing mode. Visit the `land API documentation <http://api.flytbase.com/?cpp#land>`_ page for more details.

  .. literalinclude:: include/roscpp_demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 80-87

* Please refer to |api_link| to get more information on the available list of APIs.

.. |api_link| raw:: html

   <a href="http://api.flytbase.com" target="_blank">FlytAPIs</a> 



Demo App 2
----------

.. note:: This demo requires arguments to be passed.


This demo app makes the drone takeoff, move in a square trajectory of side length *provided as an argument to the script* and land once the entire mission is over.

Execution
"""""""""""""""

If you have compiled the downloaded programs successfully, execute them by running the following command in your terminal.

.. code-block:: bash

    $ rosrun ros_demoapps demoapp2_node 3.0
    # here '3.0' is passed as an argument, one could send any other float value.

Code
""""""""""

.. literalinclude:: include/roscpp_demoapp2.cpp
   :language: c
   :tab-width: 2



.. _github page: https://github.com/flytbase/flytsamples/tree/master/CPP-Python-ROS-Apps/ros_demoapps


.. |br| raw:: html

   <br />
