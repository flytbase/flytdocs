.. _flytsim onboard app:

Onboard App
===========

Execute built-in Demo Apps
^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytSim package comes with Demo apps which can be executed to do simple navigation tasks. Currently, CPP and Python based FlytAPIs are available, hence DemoApps for both CPP and Python have been provided.
All the sample apps can be found at our `github link`_.

Demo App 1
----------

This demo app makes the robot takeoff, move in a square trajectory of side length 5m and land once the entire mission is over. 

Below is a demo `youtube video <https://www.youtube.com/watch?v=z36zvRfn58U&feature=youtu.be>`_ of the same app.

CPP - Execution
"""""""""""""""

The source code of this app is located at */Flyt/FlytApps/Onboard/src/DemoApp1* and its executable *demoapp1* is at */Flyt/FlytApps/Onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ /Flyt/FlytApps/Onboard/install/demoapp1 

CPP - Code
""""""""""

.. literalinclude:: include/demoapp1.cpp
   :language: c
   :tab-width: 2

CPP - Code Explained
""""""""""""""""""""

* You must include the following header file to make FlytAPI-navigation available for the script.

  .. literalinclude:: include/demoapp1.cpp
	   :language: c
	   :tab-width: 2
	   :lines: 1

* Create an object of class **Navigation**, through which you can call any navigation FlytAPI.

  .. literalinclude:: include/demoapp1.cpp
	   :language: c
	   :tab-width: 2
	   :lines: 4

* TakeOff command could be sent to vehicle with relative takeoff altitude in metres as argument. Over here the takeoff altitude is 3m.

  .. literalinclude:: include/demoapp1.cpp
	   :language: c
	   :tab-width: 2
	   :lines: 7

  .. caution:: You must ensure to call takeoff() before sending any other position setpoints. takeoff() inherently calls arm(), hence calling arm() directly also arms the vehicle and makes it responsive towards next setpoint commands.

* Position Setpoints could be sent to the vehicle with (x,y,z) in metres in Local-NED Frame as argument. 

  .. literalinclude:: include/demoapp1.cpp
	   :language: cpp
	   :tab-width: 2
	   :lines: 8-11

* Land command must be used to send the vehicle into Landing mode.

  .. literalinclude:: include/demoapp1.cpp
	   :language: cpp
	   :tab-width: 2
	   :lines: 12

* Please refer to :ref:`FlytAPIs<list-of-APIs>` to get more information on the available list of APIs.

Python - Execution
""""""""""""""""""

The source code *demoapp1.py* of this app is located at */Flyt/FlytApps/Onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ python /Flyt/FlytApps/Onboard/install/demoapp1.py

Python - Code
"""""""""""""

.. literalinclude:: include/demoapp1.py
   :language: py
   :tab-width: 2

Python - Code Explained
"""""""""""""""""""""""

* Imports and initialization: 

  .. literalinclude:: include/demoapp1.py
	   :language: py
	   :tab-width: 2
	   :lines: 3

* Creating instance of navigation class from flyt_python.api: 

  .. literalinclude:: include/demoapp1.py
	   :language: py
	   :tab-width: 2
	   :lines: 4

* Actual flight logic:

By default position_set() is synchronous in action, i.e. your script will wait for the vehicle to reach the specified target before continuing to execute the next command. Visit :ref:`FlytAPIs<list-of-APIs>` for more information. 

.. literalinclude:: include/demoapp1.py
   :language: py
   :tab-width: 2
   :lines: 6-16

Demo App 2
----------

.. note:: This demo requires arguments to be passed.


This demo app makes the robot takeoff, move in a square trajectory of side length *provided as an argument to the script* and land once the entire mission is over.

CPP - Execution
"""""""""""""""

The source code of this app is located at */Flyt/FlytApps/Onboard/src/DemoApp2* and its executable *demoapp2* is at */Flyt/FlytApps/Onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ /Flyt/FlytApps/Onboard/install/demoapp2 3
    # here '3' is passed as an argument, one could send any other float value.

CPP - Code
""""""""""

.. literalinclude:: include/demoapp2.cpp
   :language: c
   :tab-width: 2

Python - Execution
""""""""""""""""""

The source code *demoapp2.py* of this app is located at */Flyt/FlytApps/Onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ python /Flyt/FlytApps/Onboard/install/demoapp2.py 3
    # here '3' is passed as an argument, one could send any other float value. 

Python - Code
"""""""""""""

.. literalinclude:: include/demoapp2.py
   :language: py
   :tab-width: 2


Create and Compile custom app
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To begin with one can download the above two demo apps (CPP and Python) from our `github link`_ under OnboardApps folder. Once downloaded follow the following steps to create your own app.

CPP
---

* Create a directory where you want to keep the source files of your onboard apps::
	
	$ mkdir <sitl_onboard_apps> 
* Create a directory inside *<sitl_onboard_apps>* for your first app::
	
	$ mkdir <my_first_cpp_app>
* Create your own <my_first_cpp_app>.cpp file. You can use the following snippet to start building your app.
  
  .. code-block:: c
    
        #include <core_script_bridge/navigation_bridge.h>
        #include <iostream>

        Navigation nav;
        int main(int argc, char *argv[])
        {
            nav.takeoff(3.0);		//OR nav.arm();
            /* Write your own logic below */
        }
  

* Copy CMakeLists.txt from the downloaded DemoApp1, and paste it inside <my_first_cpp_app>. This is the CMakeLists.txt file of DemoApp1. To find how to configure this file for <my_first_cpp_app>, go to :ref:`CMakeLists.txt - Explained`.

  .. literalinclude:: include/CMakeLists.txt
	   :language: cmake
	   :tab-width: 2

* Create a build directory to host all your build files::

	$ mkdir <build>
* Inside build directory, run the cmake command::
  
	$ cmake ..
* To build your cpp file, run the make command::
  
  $ make
  
.. _CMakeLists.txt - Explained:

CMakeLists.txt - Explained
""""""""""""""""""""""""""

* Enter your project name - <my_first_cpp_app>

  .. literalinclude:: include/CMakeLists.txt
	   :language: cmake
	   :tab-width: 2
	   :lines: 2

* Make Navigation FlytAPI Library - *core_script_bridge* and other dependencies available for your <my_first_cpp_app>.cpp.

  .. literalinclude:: include/CMakeLists.txt
	   :language: cmake
	   :tab-width: 2
	   :lines: 6-9

* Give a suitable name <my_first_cpp_app> to your executable and link it with libraries.

  .. literalinclude:: include/CMakeLists.txt
	   :language: cmake
	   :tab-width: 2
	   :lines: 11-12

*	Add the following install command to install your created <my_first_cpp_app> executable target to install space - /Flyt/FlytApps/Onboard/install. This would allow web/mobile apps to execute your installed scripts remotely.

	.. literalinclude:: include/CMakeLists.txt
	   :language: cmake
	   :tab-width: 2
	   :lines: 14-16

Python
------

* Create a directory where you want to keep the source files of your onboard apps::
	
	$ mkdir <sitl_onboard_apps> 
* Create a directory inside *<sitl_onboard_apps>* for your first app::
	
	$ mkdir <my_first_python_app>
* Create your own <my_first_python_app>.py file. You can use the following snippet to start building your app.
  
  .. code-block:: py
  
      #!/usr/bin/env python

      from flyt_python import api
      nav = api.navigation() # instance of flyt navigation class

      # Write your own logic below #



Execute custom app
^^^^^^^^^^^^^^^^^^

CPP
---

* After compiling your <my_first_cpp_app> project, your executable <my_first_cpp_app> will be created inside <build> directory.
* If FlytSim is not launched, launch FlytSim using :ref:`this<launch flytsim>` command.
* Execute your <my_first_cpp_app> cpp executable from terminal. 

Python
------

* If FlytSim is not launched, launch FlytSim using :ref:`this<launch flytsim>` command.
* Execute your <my_first_python_app>.py python script from terminal. 

Install custom app
^^^^^^^^^^^^^^^^^^

CPP
---

To install your app into /Flyt/FlytApps/Onboard/install space, so that your Android/Web App could execute it remotely, run this command in your terminal::

	$ sudo cmake -DCOMPONENT=Runtime -P cmake_install.cmake

Python
------

To install your app into /Flyt/FlytApps/Onboard/install space, so that your Android/Web App could execute it remotely, make your python script executable::

	$ sudo chmod +x <my_first_python_app>.py

and copy this script to mentioned location::

	$ sudo cp <my_first_python_app>.py /Flyt/FlytApps/Onboard/install/



.. Edit or create your own custom models
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. .. note:: This section is for advanced users

.. * model urdf files are available in <this path>
.. * users could edit or create their own model files


.. _github link: https://github.com/navstik/flytsamples


