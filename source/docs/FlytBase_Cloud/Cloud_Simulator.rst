.. _cloud_simulator:

Cloud Simulator
===============

|br|

..  youtube:: lNCA13mgbdw
    :aspect: 16:9
    :width: 100%

|br|


One click access to simulator instance for drone developers. Test applications in a safe and secure environment, resolve issues and accelerate your development process.

To test Cloud API on the Cloud Simulator, follow the steps given in `Setup <Setup_FlytBase_Cloud.html>`_. When you are enabling access to Vehicles, enable it for the CloudSim device, and note that device's  VehicleID.

.. figure:: /_static/Images/cloudsim.png
	:align: center 
	:scale: 50 %


And use the Cloud Simulator's VehicleID as the VehicleID to control it using the Cloud APIs.

To run CloudSim device and see the results, go to the 'MyDevices' tab, and press the Start button to start the device.

.. figure:: /_static/Images/start_cloudsim.png
	:align: center 
	:scale: 50 %


Wait for the CloudSim device to start and load, once that is done, press the launch console button to launch the FlytConsole for the CloudSim device.

.. figure:: /_static/Images/cloudsim_console.png
	:align: center 
	:scale: 50 %

The cloudsim device is up and running. Use the FlytConsole cloud app to monitor, command the virtual drone. This app supports mission, basic navigation commands, HUD and basic telemetry. When the actual drone connects to FlytBase cloud this same app can be used to control and monitor the drone from anywhere in the world. Follow the local laws and regulations. 

FlytBase APIs for you virtual drone can be used to write cloud, web, mobile apps. Use the vehicle ID and API key of the virtual drone for testing and replace it with actual drone for deployment. 
Happy coding!

.. |br| raw:: html

   <br />

