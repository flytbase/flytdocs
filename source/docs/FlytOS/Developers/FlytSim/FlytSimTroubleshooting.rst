.. _flytsim troubleshooting:

FlytSim Troubleshooting
=======================

.. _flytsim errors:

Errors
------

* **package 'core_api' not found**
  
  Check whether the following lines have been added to your /etc/bash.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
     source /flyt/flytos/flytcore/setup.bash
     source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh

  Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

* **Unable to find uri[model://iris]**
  
  Check whether the following lines have been added to your /etc/bash.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
     source /flyt/flytos/flytcore/setup.bash
     source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh

  Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

* **ImportError: No module named web.apps**

  Check whether the following lines have been added to your /etc/bash.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
     source /flyt/flytos/flytcore/setup.bash
     source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh

  Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

* **touch: cannot touch ‘/flyt/flytos/flytcore/share/sitl_gazebo/posix/rootfs/eeprom/parameters’: Permission denied** 
  
  Launch FlytSIM with **sudo** permission.

* **FCU: ERROR: Operation not permitted** 
  
  Launch FlytSIM with **sudo** permission.

* **IOError: [Errno 13] Permission denied: '/flyt/flytos/flytcore/share/core_api/param_files/flyt_params.yaml'**
  
  Launch FlytSIM with **sudo** permission.

* **ResourceNotFound: gazebo_ros**
  
  Execute the following command in your terminal.

  .. code-block:: bash

     $ sudo apt-get install ros-kinetic-gazebo*
  

* **dpkg: error processing archive /home/********_amd64.deb (--unpack): trying to overwrite '/flyt/flytos/flytcore/_setup_util.py', which is also in package flytsim**

  You had previously installed beta version of FlytSim on your machine. Please uninstall it by running the following commands in your terminal.

  .. code-block:: bash

     $ sudo dpkg -r flytsim
     $ sudo rm -r /flyt

* **ros/ros.h not found**

  Check whether the following line has been added to your /etc/bash.bashrc file 
  
  .. code-block:: bash

     export CPATH=$CPATH:/opt/ros/kinetic/include
 
FAQs
----

* How to know my FlytSIM version?

  Execute the following command in your terminal.

  .. code-block:: bash

   $ flytos_version.sh

* How to know my Gazebo version?

  Execute the following command in your terminal.

  .. code-block:: bash

   $ gazebo -v

* My drone keeps crashing sometime after takeoff. what should I do?
  
  Execute the following command in your terminal.

  .. code-block:: bash

   $ gz stats  

  The above command starts printing some information on your screen. Typically it would be something like this:

  .. code-block:: bash

   $ Factor[0.99] SimTime[11.99] RealTime[12.12] Paused[F]

