.. _flytsim_troubleshooting:

Troubleshooting
===============

.. .. _flytsim_errors:

.. Errors
.. ------

.. _flytsim_faqs:
 
FAQs
----

.. _flytsim_faq1:

How to start PX4-SITL instead of the default (APM-SITL)?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To configure FlytSim to launch PX4 simulator, start the FlytSim simulator. Open **flytconsole**, and click top-right corner setup button. It would open a config window, go to Sim Settings tab, and select PX4 as *sim pilot*. You could configure other FlytSim settings as well.
 
|br|

Why don’t I see Gazebo GUI when I launch FlytSim?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytSim is by default configured to run APM-SITL which is NOT Gazebo based. You would have to configure FlytSim to run PX4-SITL to get Gazebo GUI. :ref:`Click here <flytsim_faq1>` to know how.

|br|


How to check whether PX4-SITL or APM-SITL is being run?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once you start FlytSim, open up `FlytConsole <http://localhost/flytconsole>`_ and look at top right corner. Look out for either PX4 or APM logo, once it connects to FlytSim.

|br|
 
How to get my FlytSIM version?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

:ref:`Start FlytSim <flytsim_start>` if it is not already running. Open `FlytConsole <http://localhost/flytconsole>`_ and wait for it to get connected to Flytsim instance. Once connected, look out for FlytSim version in the top right corner.

.. figure:: /_static/Images/FlytOSVersion.png
	:align: center

|br|

How to get FlytSim startup logs?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you are facing any issues related to Autoupdate in case the updates are not installed successfully or you are unable to open FlytConsole, you can check the startup log to locate the error. You should attach the file ``/flyt/logs/startup/flyt_startup.log`` , which will be present inside FlytSim's docker container, with your question on the forum. To open terminal inside the container, :ref:`click here <flytsim_shell>`. You can view the log in a terminal using the following command:

.. code-block:: bash
   
   $ cat /flyt/logs/startup/flyt_startup.log

|br|

How to get FlytSim run logs?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Many errors can be caught in the FlytOS run log itself. You should attach the file ``/flyt/logs/startup/flyt_startup.log`` , which will be present inside FlytSim's docker container, with your question on the forum. To open terminal inside the container, :ref:`click here <flytsim_shell>`. You can view the log in a terminal using the following command:

.. code-block:: bash
   
   $ cat /flyt/logs/runlogs/flyt_runlogs.log

|br|

How much CPU and RAM should I allocate to Docker-for-Windows/Mac?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytSim with its **default configuration (APM-SITL)** is very light weight and allocating 2GB RAM and 4 CPUs should be just fine.
 
FlytSim if configured to use **PX4-SITL** is quite computationally heavy. You can allocate 2GB RAM for Docker. For CPU, you could begin with allocating 4CPUs, but since it depends on your device's CPU power, the number may vary for different machines. FlytSim is a very power intensive application, and it won't function correctly if not allotted enough resources. To know whether FlytSim is not getting deprived of resources, try opening a shell inside the container using *openshell* script. Once inside run this command:
 
.. code-block:: bash
    
   $ gz stats 

This should start printing Gazebo statistics on your shell. A typical output would be:

.. code-block:: bash
    
   $ Factor[1.00] SimTime[2.23] RealTime[2.26] Paused[F]
   $ Factor[1.00] SimTime[2.44] RealTime[2.46] Paused[F]

Make sure the value of your *Factor* is above 0.70 all the time, for smooth functioning of FlytSim. In case it is lower than that try increasing CPU allocation.
 
|br|
 
Why does my drone crash after takeoff?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Typically, this happens when your CPU is not powerful enough to handle FlytSim's computational requirements. If you are running Docker for Windows/Mac, increase CPU and RAM allocated to docker. If you have configured FlytSim to run **PX4-SITL**, open a shell inside the container using *openshell* script. Once inside run this command:
 
.. code-block:: bash
    
   $ gz stats

This should start printing Gazebo statistics on your shell. A typical output would be:
 
.. code-block:: bash
    
   $ Factor[1.00] SimTime[2.23] RealTime[2.26] Paused[F]
   $ Factor[1.00] SimTime[2.44] RealTime[2.46] Paused[F]

Make sure the value of your *Factor* is above 0.70 all the time, for smooth functioning of FlytSim. A value lower than that, would result in poor and unreliable performance of FlytSim.
 
|br|


My device has Nvidia GPU alongside Intel GPU. How do I know, which graphics card is being used by my Linux OS?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you want APM-SITL, you don't need to worry about it, and go ahead with Intel GPU steps. For PX4-SITL, there are many ways to find this out. If you are using Ubuntu, go to System Settings -> Details look for Graphics Card details. You can also install `glxinfo` and run the command: `glxinfo | grep OpenGL` to view the GPU being used.
 
|br|

.. _flytsim_faq10:

How do I install Nvidia proprietary drivers for my Linux OS?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
If you are on Ubuntu, download latest driver from `here <http://www.nvidia.com/object/unix.html>`_.

|br|

Why is FlytSim not responding to my Api calls?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FlytSim has many safety features because of which it might reject any syntactically correct API calls. Every API call, responds with a suitable debug message on its success or failure. For Navigation APIs, FlytConsole's message window also captures this debug info.

|br|


.. |br| raw:: html

   <br />
