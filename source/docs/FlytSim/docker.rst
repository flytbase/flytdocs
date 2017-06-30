.. _flytsim_docker:

FlytSim Docker
==============

.. warning:: [WIP] This product is not LIVE yet.

**FlytSim** offers **SITL(Software In The Loop)** simulation environment for testing user apps without the drone hardware. FlytSim simulates the drone and its world, programmatically generating the state variables, while the control algorithms applied are same as onboard the drone. The **FlytAPIs** are also available in FlytSim and thus the user apps built with these APIs can be tested on any computer running FlytSim.
 
With **FlytSim as a Docker app**, we bring the power of Docker to our FlytSim developers. This eases FlytSim’s deployment procedure in any docker supported Linux, Windows and Mac environments.

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: FlytSim Docker 
	
   ./docker/prerequisites.rst
   ./docker/setup.rst
   ./docker/basics.rst
   ./docker/activation.rst
   ./docker/demoapps.rst
   ./docker/supported_gcs.rst
   ./docker/troubleshooting.rst