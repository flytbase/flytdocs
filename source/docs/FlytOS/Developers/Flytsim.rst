.. _about_flytsim:

FlytSim
=======

**FlytSim** offers a **3D SITL(Software In The Loop)** simulation environment for testing user apps without the drone hardware. It is a **ROS-Gazebo** based environment where the drone and its world are simulated, programmatically generating the state variables, while the control algorithms applied are same as onboard the drone (PX4). The **FlytAPIs** are also available in FlytSim and thus the user apps built with these APIs can be tested on a computer supporting a native Linux environment using FlytSim. FlytSim is based on Pixhawk SITL customised to work with FlytAPIs. Please follow the :ref:`FlytSim Installation Guide` to install FlytSim package, and :ref:`Flytsim Tutorials<flytsim basics>` to start testing your app and see it in action.

|br|

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytSim
   
   ./FlytSim/FlytSimInstallationGuide.rst
   ./FlytSim/FlytSimLaunch.rst
   ./FlytSim/FlytSimTroubleshooting.rst
   
.. |br| raw:: html

   <br />
