.. _flytsim troubleshooting:

FlytSim Troubleshooting
=======================

.. _flytsim errors:

Errors
------

* **package 'core_api' not found**
  
  Check whether the following lines have been added to your $HOME/.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$(rospack find sitl_gazebo)/models

  Once checked/added, source your $HOME/.bashrc file or launch FlytSim in new terminal

* **Unable to find uri[model://iris]**
  
  Check whether the following lines have been added to your $HOME/.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$(rospack find sitl_gazebo)/models

  Once checked/added, source your $HOME/.bashrc file or launch FlytSim in new terminal

* **ImportError: No module named web.apps**

  Check whether the following lines have been added to your $HOME/.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$(rospack find sitl_gazebo)/models

  Once checked/added, source your $HOME/.bashrc file or launch FlytSim in new terminal

* **touch: cannot touch ‘/flyt/flytos/flytcore/share/sitl_gazebo/posix/rootfs/eeprom/parameters’: Permission denied** 
  
  Launch FlytSIM with **sudo** permission.

* **FCU: ERROR: Operation not permitted** 
  
  Launch FlytSIM with **sudo** permission.

* **IOError: [Errno 13] Permission denied: '/flyt/flytos/flytcore/share/core_api/param_files/flyt_params.yaml'**
  
  Launch FlytSIM with **sudo** permission.

* **ResourceNotFound: gazebo_ros**
  
  Execute the following command in your terminal.

  .. code-block:: bash

   $ sudo apt-get install ros-indigo-gazebo6-*
  




FAQs
----

* How to know my FlytSIM version?
* How to know my Gazebo version?
* How to update FlytSIM to the latest version?
* When are new updates released?