.. _setup_flytbase_cloud:

Setup
=====

1. Request Beta Access to Cloud APIs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Go to |flytbase_cloud_link| and press request access to cloud API. Fill the form, and our support team will contact you as soon as possible.

.. figure:: /_static/Images/cloud_beta.png
	:align: center 
	:scale: 50 %
	
	Cloud API access form
	  

2. Get Access Token
^^^^^^^^^^^^^^^^^^^
Once you get a confirmation from the support team, a new 'Developer Settings' tab will appear on your |my_flytbase_link| page.

.. figure:: /_static/Images/personal_access_token.png
	:align: center 
	:scale: 50 %
	
Once you get the 'Developer Settings' tab, you can open it to get your personal access token. Copy this API token ID. Do not share the token ID with any third party unless you trust them. As of the current cloud API release API token key and vehicle ID combined together grant access to all APIs, including navigation. 

Press the edit button to manage the devices  which can be accessed over the cloud. Unchecked devices won't be accessible through cloud APIs.    

.. figure:: /_static/Images/edit_access.png
	:align: center 
	:scale: 50 %

Enable the access status of the devices for which you want to enable the Cloud access. You can change your settings later from developer settings tab. 

.. note:: It is recommended to first test the Cloud APIs on the `Cloud Simulator <Cloud_Simulator.html>`_ device before actual drone. Proceed further to enable and use cloud APIs for actual drone.

3. Enable Cloud Client on drone
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To use cloud APIs the companion computer has to be connected to Internet over a 3G/4G/LTE or WiFi connection. Before proceeding further make sure that companion computer is connected to Internet.

FlytOS comes with in-built client software that runs on companion computer and connects with cloud. For user privacy and security this client is disabled by default. To enable the cloud APIs for companion computer start FlytOS and open FlytConsole.

.. figure:: /_static/Images/flytos_console.png
	:align: center 
	:scale: 50 %

Press the settings button, as shown in the image

.. figure:: /_static/Images/flytconsole.png
	:align: center 
	:scale: 50 %

Check the cloud client check box to enable cloud APIs.

.. figure:: /_static/Images/enable_cloud_client.png
	:align: center 
	:scale: 50 %
 
.. note:: Cloud APIs will be enabled after you restart your device

4. Ready to Test:
^^^^^^^^^^^^^^^^^

To try out the FlytConsole cloud app go to |my_flytbase_link|, devices tab. In front of the particular device click on launch console button to launch the app. This app can be used to control, monitor the drone from anywhere in the world. Follow the local rules and regulations. 

Refer to `api.flytbase.com <http://api.flytbase.com/>`_ JS-Rest/JS-WebSocket section to learn how to make the rest/websocket requests to the Cloud API using JavaScript.

.. note:: You'll need to replace <ip> with https://dev.flytbase.com/rest for rest call, and https://dev.flytbase.com/websocket for websocket calls.

An example of the rest calls using Python are available on the `GitHub <https://github.com/flytbase/flytsamples>`_.  

To run the example, `install Python 2.7 <https://www.python.org/downloads/>`_ on your computer, `install pip <https://packaging.python.org/tutorials/installing-packages/>`_ and `install requests for python <http://docs.python-requests.org/en/master/user/install/>`_ using your terminal or command prompt.

Then download the `flytsamples repository <https://github.com/flytbase/flytsamples>`_, open folder Cloud-Client, and open the file cloud_client_rest.py. 

Replace the variable 'token' with your Personal Access Token and the variable 'VehicleID' with the VehicleID of the device you want to control. Do not forget to place the Token and VehicleID within single inverted commas.

.. note:: Some APIs do not work for all devices, check `api.flytbase.com <http://api.flytbase.com/>`_ to check if your device supports a specific API.
.. note:: APIs which will result in the movement of vehicle have been commented out in the sample python file, so that the vehicle doesn't run into trouble because of arbitrary values. You can uncomment and try them yourselves, be careful of what values you pass with them. 
 

.. |flytbase_cloud_link| raw:: html

   <a href="https://flytbase.com/cloud" target="_blank">flytbase.com/cloud</a>

.. |my_flytbase_link| raw:: html

   <a href="https://my.flytbase.com" target="_blank">my.flytbase.com</a>
