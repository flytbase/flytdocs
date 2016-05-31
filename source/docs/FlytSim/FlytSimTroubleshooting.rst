.. _flytsim troubleshooting:

FlytSim Troubleshooting
=======================

.. _flytsim errors:

Errors
------

* *package 'core_api' not found*
  
  Check whether the following lines have been added to your $HOME/.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$(rospack find sitl_gazebo)/models

  Once checked/added, source your $HOME/.bashrc file or launch FlytSim in new terminal

* *Unable to find uri[model://iris]*
  
  Check whether the following lines have been added to your $HOME/.bashrc file 
    
  .. code-block:: bash

     export PYTHONPATH=$PYTHONPATH:/flyt/flytapps
     source /flyt/flytos/flytcore/setup.bash
     export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$(rospack find sitl_gazebo)/models

* *touch: cannot touch ‘/flyt/flytos/flytcore/share/sitl_gazebo/posix/rootfs/eeprom/parameters’: Permission denied* **OR** *FCU: ERROR: Operation not permitted* **OR** *IOError: [Errno 13] Permission denied: '/flyt/flytos/flytcore/share/core_api/param_files/flyt_params.yaml'*
  
  Launch FlytSIM with **sudo** permission.
  




FAQs
----

* How to know my FlytSIM version?
* How to know my Gazebo version?
* How to update FlytSIM to the latest version?
* When are new updates released?