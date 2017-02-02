.. Flyt documentation master file, created by
   sphinx-quickstart on Tue Dec 15 14:58:19 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. _introduction:

Welcome to FlytDocs!
====================

|br|

Welcome to FlytBase, the next generation platform for commercial drone applications. It is by design open for developers to build advanced drone applications using its open APIs. Flyt consists of FlytOS, the software framework and FlytPOD/PRO, the integrated hardware.

**FlytOS** is based on Linux and ROS (Robot Operating System) making it an ideal platform for research and commercial drone applications. It can interact with any compatible drone/autopilot using its adapter layer and exposes high level FlytAPIs in ROS, CPP, Python, REST and Websocket. It makes it easy to integrate custom payload and also provides advanced APIs using its onboard modules. These rich set of APIs allow for easy development of onboard business logic as well as remote monitoring and control through web and mobile apps. The modular design of FlytOS allows for integration with external ROS/Linux libraries and custom data plumbing between onboard and offboard apps. The vision of FlytOS is to provide a standard language for the drone developers to talk to their drones.

**FlytPOD/PRO** is an integrated hardware stack with a hybrid architecture consisting of a Pixhawk like custom board tightly coupled with the Odroid XU4 SBC. It has an onboard WiFi router and several interfaces for custom payloads, radio receivers and special sensors etc. It comes with PX4 and FlytOS preloaded for an out-of-the-box ready-to-fly experience.

This documentation gives all the inputs to get you started with Flyt. You can learn about FlytOS and get a detailed reference for all the FlytAPIs. It provides a step by step guide to install and get started with FlytSim simulation on your laptop. You can refer to the sample apps and start building your own onboard and web/mobile apps and test them with FlytSim.


Checkout and participate in our `forums`_ and interact with the community sharing your use cases, feedback and anything you need help with. You can always reach out to us for any issues at support@flytbase.com. 

.. _documentation:  

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytOS
	
   docs/FlytOS/FlytOS.rst
   docs/FlytOS/FlytOSInstallationGuide.rst
   docs/FlytOS/FlytOSUpdate.rst
   docs/FlytOS/Hardware_setup.rst
   docs/FlytOS/Ground_control_stations.rst


.. toctree::
    :maxdepth: 2
    :hidden:
    :caption: FlytPOD
	
    docs/FlytPOD/About_FlytPOD.rst
    docs/FlytPOD/Hardware_specifications.rst
    docs/FlytPOD/FlytPOD_Quickstart.rst
    docs/FlytPOD/First_principles.rst
    docs/FlytPOD/First_flight.rst
    docs/FlytPOD/Safety_instructions.rst
    docs/FlytPOD/RouterSetup.rst


    


.. toctree::
    :maxdepth: 2
    :hidden:
    :caption: FlytConsole
  
    docs/FlytConsole/About_FlytConsole.rst
    docs/FlytConsole/FlytConsole.rst 


   
.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytSim
   
   docs/FlytSim/FlytSim.rst
   docs/FlytSim/FlytSimInstallationGuide.rst
   docs/FlytSim/FlytSimLaunch.rst
   docs/FlytSim/FlytSimTroubleshooting.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytAPI
  
   docs/FlytAPI/ListOfAPIs.rst
   docs/FlytAPI/OnboardAPIs.rst
   docs/FlytAPI/REST_WebsocketAPIs.rst


.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytApps Tutorials
   
   docs/FlytApps/OnboardApps.rst
   docs/FlytApps/Web_MobileApps.rst
   docs/FlytApps/WebApps.rst
   docs/FlytApps/MobileApps.rst
   

.. docs/GettingStarted/Getting_started_index.rst
.. docs/FlytInternals/Flyt_internals_index.rst
.. docs/API/API_index.rst
.. docs/UserAppsDevelopment/User_apps_development_index.rst
.. docs/Tutorials/Tutorials_index.rst
.. docs/FirmwareUpdate/Firmware_update_index.rst            

.. _forums: http://forums.flytbase.com

.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`

.. |br| raw:: html

   <br />
