.. _write_onboard_cpp:

Onboard C++
============


Execute built-in Demo Apps
^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytOS comes with pre-installed Demo apps which can be executed to do simple navigation tasks. 
All the sample applications can be found at our `github link`_.

.. Below is a demo `youtube video <https://www.youtube.com/watch?v=rKUt884XtNg>`_ about how to execute a built-in demo-app in FlytSim.

.. ..  youtube:: rKUt884XtNg
..     :aspect: 16:9
..     :width: 100%


Demo App 1
----------

This demo app makes the drone takeoff, move in a square trajectory of side length 5m and land once the entire mission is over. 

.. Below is a demo `youtube video <https://www.youtube.com/watch?v=z36zvRfn58U&feature=youtu.be>`_ of the same app when run on :ref:`FlytSim <about_flytsim>`.

.. ..  youtube:: z36zvRfn58U
..     :aspect: 16:9
..     :width: 100%


Below is a demo `youtube video <https://www.youtube.com/watch?v=lwKZXkzkM80>`_ of the same app when run on :ref:`FlytPOD <about_flytpod_pro>`.

..  youtube:: lwKZXkzkM80
    :aspect: 16:9
    :width: 100%

|br|

Execution
"""""""""

The source code of this app is located at */flyt/flytapps/onboard/src/demoapp1* and its executable *demoapp1* is at */flyt/flytapps/onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ /flyt/flytapps/onboard/install/demoapp1 

Code
""""

.. literalinclude:: include/demoapp1.cpp
   :language: c
   :tab-width: 2

Code Explained
""""""""""""""

* You must include the following header file to make FlytAPI-navigation available for the script.

  .. literalinclude:: include/demoapp1.cpp
     :language: c
     :tab-width: 2
     :lines: 1

* Create an object of class **Navigation**, through which you can call any navigation FlytAPI.

  .. literalinclude:: include/demoapp1.cpp
     :language: c
     :tab-width: 2
     :lines: 3

* TakeOff command could be sent to vehicle with relative takeoff altitude in meters as argument. Over here the takeoff altitude is 3m.

  .. literalinclude:: include/demoapp1.cpp
     :language: c
     :tab-width: 2
     :lines: 6

  .. caution:: You must ensure to call takeoff() before sending any other position setpoints. takeoff() inherently calls arm(), hence calling arm() directly also arms the vehicle and makes it responsive towards next setpoint commands.

* Position Setpoints could be sent to the vehicle with (x,y,z) in meters in Local-NED Frame as argument. 

  .. literalinclude:: include/demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 7-10

* Land command must be used to send the vehicle into Landing mode.

  .. literalinclude:: include/demoapp1.cpp
     :language: cpp
     :tab-width: 2
     :lines: 11

* Please refer to |api_link| to get more information on the available list of APIs.

.. |api_link| raw:: html

   <a href="http://api.flytbase.com" target="_blank">FlytAPIs</a> 



Demo App 2
----------

.. note:: This demo requires arguments to be passed.


This demo app makes the drone takeoff, move in a square trajectory of side length *provided as an argument to the script* and land once the entire mission is over.

Execution
"""""""""

The source code of this app is located at */flyt/flytapps/onboard/src/demoapp2* and its executable *demoapp2* is at */flyt/flytapps/onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ /flyt/flytapps/onboard/install/demoapp2 3
    # here '3' is passed as an argument, one could send any other float value.

Code
""""

.. literalinclude:: include/demoapp2.cpp
   :language: c
   :tab-width: 2


Create and Compile custom app
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


* Create a directory where you want to keep the source files of your onboard apps::
  
  $ mkdir onboard_apps 
* Create a directory inside *onboard_apps* for your first app::
  
  $ mkdir my_first_cpp_app
* Create your own my_first_cpp_app.cpp file. You can use the following snippet to start building your app.
  
  .. code-block:: c
    
        #include <cpp_api/navigation_bridge.h>

        Navigation nav;
        int main(int argc, char *argv[])
        {
            nav.takeoff(3.0);   //OR nav.arm();
            /* Write your own logic below */
        }
  

* Copy CMakeLists.txt from the downloaded DemoApp1, and paste it inside my_first_cpp_app. This is the CMakeLists.txt file of DemoApp1. To find how to configure this file for my_first_cpp_app, go to :ref:`CMakeLists.txt - Explained<cmakelists_explained>`.

  .. literalinclude:: include/CMakeLists.txt
     :language: cmake
     :tab-width: 2

* Create a build directory to host all your build files::

  $ mkdir build
  $ cd build 

* Inside build directory, run the cmake command::
  
  $ cmake ..

* To build your cpp file, run the make command::
  
  $ make
  


.. _cmakelists_explained:

CMakeLists.txt - Explained
^^^^^^^^^^^^^^^^^^^^^^^^^^

* Enter your project name - my_first_cpp_app

  .. code-block:: CMake

      cmake_minimum_required(VERSION 2.8.3)
      project(my_first_cpp_app)

      SET(CMAKE_INSTALL_PREFIX /usr/local/flytos/userapps CACHE PATH "Cmake install prefix path for flytapps" FORCE)

      add_definitions(-std=c++11)

* Make Navigation FlytAPI Library - *cpp_api* and other dependencies available for your my_first_cpp_app.cpp.

  .. code-block:: CMake

      cmake_minimum_required(VERSION 2.8.3)
      find_package(catkin REQUIRED COMPONENTS cpp_api)
      find_package(Boost REQUIRED COMPONENTS system python)
      find_package(PythonLibs 2.7 REQUIRED)
      include_directories(${catkin_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})


* Give a suitable name (for example my_first_cpp_app) to your executable and link it with libraries.

  .. literalinclude:: include/CMakeLists.txt
     :language: cmake
     :tab-width: 2
     :lines: 14-15

* Add the following install command to install your created my_first_cpp_app executable target to install space - /flyt/userapps/onboard_user/install. This would allow web/mobile apps to execute your installed scripts remotely. Visit |exec_script_link| for details about the corresponding API call. 

  .. literalinclude:: include/CMakeLists.txt
     :language: cmake
     :tab-width: 2
     :lines: 17-19

.. |exec_script_link| raw:: html

   <a href="http://api.flytbase.com/?shell#execute-script" target="_blank">this link</a> 

Execute custom app
^^^^^^^^^^^^^^^^^^

* After compiling your my_first_cpp_app project, your executable my_first_cpp_app will be created inside build directory.
* If FlytOS/FlytSim is not launched, launch :ref:`FlytOS <start_stop_flytos>` or :ref:`FlytSim <launch flytsim>`.
* Execute your my_first_cpp_app cpp executable from terminal. 


Install custom app
^^^^^^^^^^^^^^^^^^


To install your app into /flyt/userapps/onboard_user/install space, so that your Android/Web App could execute it remotely, run this command in your terminal::

  $ sudo make install



.. _github link: https://github.com/flytbase/flytsamples


.. |br| raw:: html

   <br />
