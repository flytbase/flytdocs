.. _flytpod router setup:


WiFi Setup 
==========

.. .. _configuring WiFi module in client mode:


Introduction
^^^^^^^^^^^^

FlytPOD/PRO has inbuilt powerful 2.4 GHz WiFi router, which can be set into Hotspot/AP or Client mode.



**HotSpot/AP Mode**

FlytPOD/PRO creates a WiFi access point to which your mobile devices can connect. FlytPOD ships with this as default mode. Please note that in this mode FlytPOD/PRO can't access the Internet. Hence, automatic updates and maps in FlytConsole will not work while FlytPOD/PRO is operating in Hotspot/AP mode.



**Client Mode**

FlytPOD/PRO connects to available WiFi network. Your WiFi network should have Internet connectivity in order for the FlytPOD/PRO to access the Internet.


.. Configuring WiFi Module
.. ^^^^^^^^^^^^^^^^^^^^^^^

.. The WiFi module can be configured in two ways viz.

.. * Using FlytConsole
.. * Using Router GUI


.. Using FlytConsole
.. """""""""""""""""

Changing the WiFi Mode
^^^^^^^^^^^^^^^^^^^^^^

.. **Changing the WiFi Mode:**

1. Power ON FlytPOD/PRO using the battery or wall adapter.
2. Connect to FlytPOD_wifi network.
   
   .. important:: * By default FlytPOD/PRO is configured into Hotspot/AP mode.
   					* Default SSID: FlytPOD_wifi.
   					* Default password: FlytPOD123 (or please check the flyer shipped with FlytPOD/PRO).
   					

3. Launch FlytConsole in the web browser using the URL ``flytpod/flytconsole``. Go to the WiFi setup.

.. figure:: /_static/Images/DashboardFc.png
	:align: center
	:scale: 50 %
	
	WiFi Setup

4. Select Hotspot/AP or client mode.

.. figure:: /_static/Images/APClient.png
	:align: center
	:scale: 50 %
	
	AP and Client Modes


.. figure:: /_static/Images/ApMode.png
	:align: center
	:scale: 50 %
	
	AP Mode

.. figure:: /_static/Images/ClientMode.png
	:align: center
	:scale: 50 %
	
	Client Mode


5. Select proper encryption option for Hotspot/AP mode and set a password.
6. In client mode click on the button to scan for available networks. It takes nearly 10 seconds. Select the network that you want to connect to, enter the password and click on connect.
7. After clicking on connect in Hotspot or client mode you should wait for 2 minutes and then shutdown FlytPOD by pressing the power switch on the back panel. After shutdown is complete (fan stopped) remove the power cable and then power it up again. FlytPOD/PRO should now be in the new configured mode.

8. If the mode changes are not successful then FlytPOD/PRO will automatically reset itself to default mode viz. Hotspot with SSID: FlytPOD_wifi and password: FlytPOD123 (shipped with FlytPOD/PRO).



.. 3. Launch FlytConsole in the web browser using the url ``flytpod/flytconsole ``. Go to the options menu in the top right corner and select wifi setup.
.. 4. Select hotspot/AP or client mode.
.. 5. Select proper encryption option for hotspot/AP mode and set a password.
.. 6. In client mode click on the button to scan for available networks. It takes nearly 10 seconds. Select the network that you want to connect to. Enter the password and click on connect.
.. 7. After clicking on connect in hotspot or client mode you should wait for 2 minutes and then shutdown flytpod by pressing the power switch on the back panel for 4 seconds.
..  After shutdown is complete (fan stopped) remove the power cable and then power it again. FlytPOD should now be in the new configured mode.
.. 8. If the mode changes are not successful then FlytPOD will automatically reset itself to default mode viz. Hotspot with ssid: flytpod_wifi and password: shipped with FlytPOD.


.. note:: * In hotspot mode you can access FlytConsole at ``flytpod/flytconsole``.
			 * In client mode you might have to replace ``flytpod`` with the IP address of FlytPOD/PRO which you can find through your router page by looking for connected client with the name 'flytpod'. Another client with name 'FlytWRT' will be connected as well but that won't be useful.



Troubleshooting
^^^^^^^^^^^^^^^

1. **Cannot reach FlytPOD/PRO** 
  
   a. In hotspot mode you can access FlytConsole at ``flytpod/flytconsole``.
   b. In client mode you might have to replace ``flytpod`` with the IP address of FlytPOD which you can find through your router page by looking for connected client with the name* 'flytpod'.

2. **Forgot Password**
  
   If you forgot your password or your settings are not useful, then you can reset the wifi to default.

   a. Connect monitor, keyboard, mouse to FlytPOD/PRO. Plug FlytPOD/PRO using wall adapter/battery. 
   b. Open firefox browser in FlytPOD/PRO UI.
   c. Open FlytConsole using this URL ``localhost/flytconsole``.
   d. You can follow steps given above to configure WiFi into AP or Client mode with new password.


.. In hotspot mode you can access FlytConsole at ``flytpod/flytconsole``.

.. In client mode you might have to replace ``flytpod`` with the IP address of FlytPOD which you can find through your router page by looking for connected client with the name 'flytpod'.








Please follow the steps below only if you are an advanced user.

For advanced users
""""""""""""""""""

The FlytPOD/PRO has built-in OpenWRT powered WiFi router. Internally it is connected with the main computer on Ethernet. The Module can be configured in AP Mode or in Client Mode depending upon the application. Router is using *relayd* for client mode operation.

In case the FlytConsole WiFi setup is not sufficient for you, you can access OpenWRT router directly. There are two methods available.

**Access Router**

1) Accessing router LUCI web page from FlytPOD/PRO at IP 192.168.1.1 (in AP mode) or 10.0.0.1 (in Client mode). 
The ``default username: root`` and ``password: 123``.

2) Access serial console to OpenWRT router on FlytPOD/PRO. ``Port: /dev/ttySAC2`` ``Baudrate: 57600``
This console is accessible from FlytPOD/PRO and you can use minicom.

``sudo minicom -D /dev/ttySAC2 -b 57600``

After this command press enter twice to initialize OpenWRT shell.

.. More about using relayd for client connections on this link https://wiki.openwrt.org/doc/recipes/relayclient

`Click here`_ to know more about using relayd for client connections.



**Reset the router**

Access serial console to OpenWRT router as shown above and execute the following command:


``firstboot && reboot``



.. This tutorial deals with configuring the router in Client mode.
.. For this tutorial, you would need a WiFi capable device(laptop/PC) through which you would configure the in-built router.

.. 1. Join your Home/Main Router Network using your device. Get the IP address assigned to your device by Main Router. Use ``ifconfig`` or ``ipconfig`` for Linux and Windows OS respectively. Note down your IP address details as they would be required for configuration purposes. In this tutorial we would assume that the IP address of your device(laptop/PC) is ``192.168.3.xxx``, please remember ``192.168.3``.

.. 2. As mentioned before, by default the WiFi module is configured in AP Mode, with ``SSID: FlytPOD_wifi``. Join the FlytPOD_wifi network from your laptop/PC device. The default ``password`` of the router is ``FlytPOD123``. Access the OpenWrt login page from your browser using the ``IP address: 192.168.1.1`` and click on the ``Administration`` tab which is at the right side top corner of the webpage. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*.

..    .. image:: /_static/Images/Authorization.png
.. 	:align: center

       
.. 3. Select ``Network->Interfaces->LAN->Edit`` option. Under ``Common Configuration`` section, go to ``General Setup`` tab. Select ``Protocol`` as ``Static address``. Change the IPv4 static address from 192.168.1.1 to ``192.168.3.254`` (In case of failure, it will be required in Troubleshooting). The skeleton of this IP must match that of STEP 1 of this tutorial. Make sure that the specified IP address does not conflict with the IP addresses assigned by the Main Router to other devices in its Network. 

..    .. image:: /_static/Images/common_config.png
..   	:align: center

..    Now go to ``Physical Settings`` tab under the same ``Common Configuration`` section and change the following:

..    * Uncheck the Bridge Interfaces option.
..    * Set the Interface to “VLAN Interface: “eth0.1” (lan)” as shown in the following image.

..    .. image:: /_static/Images/interfacelan.png
.. 	:align: center


..    In the same page, under ``DHCP Server`` section check the check-box for ``Ignore Interface`` to disable DHCP.

..    .. image:: /_static/Images/DHCP_server.png
.. 	:align: center


..    Once done, click on the **Save button** at the bottom of the page.

..    .. caution:: Do Not select Save and Apply button. The same instruction follows till the end of this tutorial. Save and Apply should only be pressed once all the relevant changes have been made.

.. 4. To configure the WiFi Settings, select ``Network->wifi`` option, scan for the available WiFi networks. Join your Home/Main Router’s network. Update the following fields according to your Home/Main Router’s settings.

..    - WPA passphrase: <password of your Home/Main Router>
..    - Change the name of network from ``wwan`` to ``wlan``
..    - Set Firewall zone to ``lan``.

..    Once done, click on the **Submit button** at the bottom of the page.

..    .. image:: /_static/Images/join_nw_settings.png
.. 	:align: center

..    Once submitted, select ``Network->Interfaces->WLAN->Edit`` option and update ``Hostname to send when requesting DHCP`` to ``FlytPOD``.
   
..    .. image:: /_static/Images/wlan.png
   
   


..    Once done, click on the **Save button** at the bottom of the page.

.. 5. Now to create a Relay Bridge between LAN and WLAN Client, select ``Network->Interfaces`` option. Click on ``Add new interface...`` option and Create Interface as:
   
..    * Name of the new interface: relay
..    * protocol of the new interface: Relay Bridge
     
..    Once done, click on the **Submit button** at the bottom of the page.

..    .. image:: /_static/Images/create_interface.png
.. 	:align: center

..    As you submit your settings, ``Interfaces - Relay`` window will open up. Under ``Common Configuration`` section, ensure that ``Relay between networks`` lan and wlan check-boxes are checked/enabled.

..    Once done, click on the **Save button** at the bottom of the page.

..    .. image:: /_static/Images/interface_relay.png
.. 	:align: center


.. 6. Select ``Network->Interfaces`` option and check whether all interfaces are configured properly as shown in the following picture.
   
..    .. image:: /_static/Images/interface_over.png
.. 	:align: center

.. 7. You have successfully configured FlytPOD router in *client mode*. To make the changes permanent, click on the ``Unsaved Changes`` option on the top right corner of webpage and press ``Save & Apply`` button at the bottom. 


.. 8. As you complete STEP 7, FlytPOD_wifi network would become unavailable. Ideally, FlytPOD should be assigned a new IP by your Home/Main Router. To find out the new IP, you have the following two options: 

..    a) ``METHOD 1``: Connect to your Home/Main router, open its login page and check its ``DHCP Client list``. Verify that a device named ``FlytPOD`` is listed there and note down the IP assigned. If this is not true, try rebooting and if it still doesn't work then go to :ref:`Troubleshooting Guide<Troubleshooting Guide>`.
..    b) ``METHOD 2``: Connect a monitor via HDMI cable, keyboard and mouse to FlytPOD. Access the terminal, and fire ``ifconfig`` command. Find out the assigned IP. If IP is NOT assigned, try rebooting and if it still doesn't work then go to :ref:`Troubleshooting Guide<Troubleshooting Guide>`.


.. 9. By default ``SSH access`` is disabled in Client mode. To enable it, you have to connect a monitor via HDMI cable, keyboard and mouse to FlytPOD. 

..    a) Connect to FlytPOD router from FlytPOD's browser using the Static IP that you configured in STEP 3, in case you have followed this tutorial, it will be 192.168.3.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*.
..    b) Select ``System->Administration`` option, and update ``SSH Access`` as shown in the following picture.
     
..    Once done, click on the **Save & Apply button** at the bottom of the page.

..    .. image:: /_static/Images/SSH_access.png
.. 	:align: center





.. .. _Troubleshooting Guide: 

.. Troubleshooting Guide
.. ^^^^^^^^^^^^^^^^^^^^^

.. Reset router/Load Factory settings
.. """"""""""""""""""""""""""""""""""

.. 2. You can use one of the following three methods to reset your router (we recommend the first approach using UART):

..    a) ``Method 1 (using UART)``: From terminal, open OpenWrt terminal by issuing ``sudo minicom -D /dev/ttySAC2 -b 57600`` in the terminal. Enter ``flytpod`` if asked for password. In the OpenWrt terminal, issue command ``firstboot && reboot``. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.

..    .. image:: /_static/Images/root@openWRTcrop.png
.. 	:align: center
 
..    b) ``Method 2 (using terminal)``: From terminal, issue ``ifconfig`` command. If IP is not assigned, even after rebooting the FlytPOD, then assign manual IP (192.168.3.253) to FlytPOD wired connection and use a Subnet Mask (255.255.255.0). Connect to Ethernet connection. From terminal, issue ``ssh root@openwrt`` command. Enter ``123`` as password. In the OpenWrt terminal, issue command ``firstboot && reboot``. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.

..    .. image:: /_static/Images/root@openWRT.png
.. 	:align: center
 

..    c) ``Method 3 (using web-gui)``: From terminal, issue ``ifconfig`` command. If IP is not assigned, even after rebooting the FlytPOD, then assign manual IP (192.168.3.253) to FlytPOD wired connection and use a Subnet Mask (255.255.255.0). Connect to Ethernet connection. Connect to router from browser using IP address configured earlier in the previous step 3. i.e. 192.168.3.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*. Select ``System->Flash Firmware->perform reset`` option. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.





.. .. Upgrading the firmware
.. .. ^^^^^^^^^^^^^^^^^^^^^^

.. .. 1. Join the FlytPOD_wifi network from your laptop/mobile device.
.. .. 2. And then access the module from Host browser using IP address: 192.168.1.1
.. .. 3. Directly Flash new Firmware Image menu will come then specify the binary(provided by NavStik) file location and then click on the “flash image” and follow the steps.

.. _Click here: https://wiki.openwrt.org/doc/recipes/relayclient
