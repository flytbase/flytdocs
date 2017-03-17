.. _dev_getting_started:

Getting Started 
===============

Introduction
^^^^^^^^^^^^

|br|

..  youtube:: CZFVWDN5Gcc
    :aspect: 16:9
    :width: 100%

|br|


FlytOS is the software framework of FlytBase. It is based on Linux and ROS (Robot Operating System) making it an ideal platform for research and commercial drone applications. It can interact with any compatible drone/autopilot using its adapter layer and exposes high level FlytAPIs in ROS, CPP, Python, REST and Websocket. It makes it easy to integrate custom payload and also provides advanced APIs using its onboard modules. These rich set of APIs allow for easy development of onboard business logic as well as remote monitoring and control through web and mobile apps. The modular design of FlytOS allows for integration with external ROS/Linux libraries and custom data plumbing between onboard and offboard apps. 

FlytOS comes preloaded with FlytPOD/PRO. Alternatively, it is also available for download and can then be installed on a Linux/ROS based computer. This setup allows for integration with any compatible drone/autopilot.

The apps developed with FlytAPIs can talk to compatible drone/autopilot as well as can be tested in a virtual ROS/Gazebo environment using FlytSim. The vision of FlytOS is to provide a standard language for the drone developers to talk to their drones.


.. figure:: /_static/Images/FlytOSArch_withbg.png
	:align: center
	:width: 90 %

	FlytOS Architecture Diagram



FlytOS Basics
^^^^^^^^^^^^^

**Start/Stop FlytOS on boot**

1. If you have installed FlytOS correctly, FlytOS will start automatically on every bootup.
2. On bootup FlytOS will also check for any updates. Available updates will be downloaded and installed automatically.
3. You can find more information on FlytOS automatic updates :ref:`here<flytos_updates>`.

**Start/Stop FlytOS from command line**

1. Launch FlytOS
       
   You can also launch FlytOS in a terminal to see debug messages at startup. Open a **new** terminal and run this command.

   .. code-block:: bash
       
       $ sudo $(rospack find core_api)/scripts/launch_flytOS.sh

   .. important:: If you get this error: ``Error: package 'core_api' not found``, source your /etc/bash.bashrc file.
	

2. Kill FlytOS
       
   To kill this instance of FlytOS, run this command in your terminal. 

   .. code-block:: bash
       
      $ sudo $(rospack find core_api)/scripts/stop_flytOS.sh    



.. |br| raw:: html

   <br />


Types of APIs
^^^^^^^^^^^^^^

FlytOS uses ROS at its heart. So all the API's of FlytOS are basically implemented in ROS.
However these APIs are also available in the form of various interfaces for non ROS and remote applications. Below is the list of external interfaces that FlytOS can talk with.

1. Python: Pure python interface using flyt_python package. It uses Zeromq internally which provides access to ROS system.

2. CPP: These are ROS to CPP bindings for pure CPP applications.

3. RESTful Server: FlytOS runs a server to provide RESTful interface to the ROS system.

4. WebSocket: FlytOS runs a WebSocket server to provide WebSocket interface to the ROS system.

Same functionality is available on all interfaces, only the API definition may change to suit a particular interface.

With all above interfaces available we can classify them into two broad categories on the basis of type of typical applications that will be using them.

1. **Onboad APIs**: ROS, Python, CPP interfaces come under onboard API's since they can only be accessed by on board (which run on vehicle's companion computer) applications.

2. **Remote APIs**: RESTful and WebSocket interfaces are classified as remote API's since they will mostly be used by remote (which run on ground devices) applications.

