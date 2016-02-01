.. _flytpod router setup:

FlytPOD - Router Setup
======================

.. _configuring wifi module in client mode:

Configuring WiFi Module in Client Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


The FlytPOD has built-in WiFi router module. FlytPOD has hard-wired connection to the LAN port of this module.The Module can be configured in AP Mode or in Client Mode depending upon the application. Not both modes at a time. By default, at the time of shipping, the router is configured in AP Mode.  

This tutorial deals with configuring the router in Client mode.
For this tutorial, you would need a WiFi capable device(laptop/PC) through which you would configure the in-built router.

1. Join your Home/Main Router Network using your device. Get the IP address assigned to your device by Main Router. Use ``ifconfig`` or ``ipconfig`` for Linux and Windows OS respectively. Note down your IP address details as they would be required in the STEP 3 of this tutorial.

2. As mentioned before, by default the WiFi module is configured in AP Mode, with ``SSID: FlytPOD_wifi``. Join the FlytPOD_wifi network from your laptop/PC device. The default ``passphrase`` of the router is ``FlytPOD123``. Access the OpenWrt login page from your browser using the ``IP address: 192.168.1.1`` and click on the ``Administration`` tab which is at the right side top corner of the webpage. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*.

   .. image:: /_static/Images/Authorization.png
	:align: center

       
3. Select ``Network->Interfaces->LAN->Edit`` option. Under ``Common Configuration`` section, go to ``General Setup`` tab. Select ``Protocol`` as ``Static address``. Change the IPv4 static address from 192.168.1.1 to 192.168.1.254 (In case of failure, it will be required in Troubleshooting). The skeleton of this IP must match that of STEP 1 of this tutorial. Make sure that the specified IP address does not conflict with the IP addresses assigned by the Main Router to other devices in its Network. 

   .. image:: /_static/Images/common_config.png
  	:align: center

   Now go to ``Physical Settings`` tab under the same ``Common Configuration`` section and change the following:

   * Uncheck the Bridge Interfaces option.
   * Set the Interface to “VLAN Interface: “eth0.1” (lan)” as shown in the following image.

   .. image:: /_static/Images/interfacelan.png
	:align: center


   In the same page, under ``DHCP Server`` section check the check-box for ``Ignore Interface`` to disable DHCP.

   .. image:: /_static/Images/DHCP_server.png
	:align: center


   Once done, click on the **Save button** at the bottom of the page.

   .. caution:: Do Not select Save and Apply button. The same instruction follows till the end of this tutorial. Save and Apply should only be pressed once all the relevant changes have been made.

4. To configure the WiFi Settings, select ``Network->wifi`` option, scan for the available WiFi networks. Join your Home/Main Router’s network. Update the following fields according to your Home/Main Router’s settings.

   - WPA passphrase: <passphrase of your Home/Main Router>
   - Change the name of network from ``wwan`` to ``wlan``
   - Set Firewall zone to ``lan``.

   Once done, click on the **Submit button** at the bottom of the page.

   .. image:: /_static/Images/join_nw_settings.png
	:align: center

   Once submitted, select ``Network->Interfaces->WLAN->Edit`` option and update ``Hostname to send when requesting DHCP`` to ``FlytPOD``.
   
   .. image:: /_static/Images/wlan.png
   
   


   Once done, click on the **Save button** at the bottom of the page.

5. Now to create a Relay Bridge between LAN and WLAN Client, select ``Network->Interfaces`` option. Click on ``Add new interface...`` option and Create Interface as:
   
   * Name of the new interface: relay
   * protocol of the new interface: Relay Bridge
     
   Once done, click on the **Submit button** at the bottom of the page.

   .. image:: /_static/Images/create_interface.png
	:align: center

   As you submit your settings, ``Interfaces - Relay`` window will open up. Under ``Common Configuration`` section, ensure that ``Relay between networks`` lan and wlan check-boxes are checked/enabled.

   Once done, click on the **Save button** at the bottom of the page.

   .. image:: /_static/Images/interface_relay.png
	:align: center


6. Select ``Network->Interfaces`` option and check whether all interfaces are configured properly as shown in the following picture.
   
   .. image:: /_static/Images/interface_over.png
	:align: center

7. You have successfully configured FlytPOD router in *client mode*. To make the changes permanent, click on the ``Unsaved Changes`` option on the top right corner of webpage and press ``Save & Apply`` button at the bottom. 


8. As you complete STEP 7, FlytPOD_wifi network would become unavailable. Ideally, FlytPOD should be assigned a new IP by your Home/Main Router. To find out the new IP, you have the following two options: 

   a) ``METHOD 1``: Connect to your Home/Main router, open its login page and check its ``DHCP Client list``. Verify that a device named ``FlytPOD`` is listed there and note down the IP assigned to it. If this is not true, then the router needs a reboot. Reboot FlytPOD using the Power Switch.
   b) ``METHOD 2``: Connect a monitor via HDMI cable, keyboard and mouse to FlytPOD. Access the terminal, and fire ``ifconfig`` command. Find out the assigned IP. If IP is NOT assigned, you must connect to FlytPOD router from FlytPOD's browser using the Static IP that you configured in STEP 3, in default case, it will be 192.168.1.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*. Select “System->Reboot->Perform reboot option.


9. By default ``SSH access`` is disabled in Client mode. To enable it, you have to connect a monitor via HDMI cable, keyboard and mouse to FlytPOD. 

   a) Connect to FlytPOD router from FlytPOD's browser using the Static IP that you configured in STEP 3, in default case, it will be 192.168.1.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*.
   b) Select ``System->Administration`` option, and update ``SSH Access`` as shown in the following picture.
     
   Once done, click on the **Save & Apply button** at the bottom of the page.

   .. image:: /_static/Images/SSH_access.png
	:align: center



Troubleshooting Guide
^^^^^^^^^^^^^^^^^^^^^


Reset router/Load Factory settings
++++++++++++++++++++++++++++++++++

1. Connect a monitor via HDMI cable, keyboard and mouse to FlytPOD.
2. From terminal, issue ``ifconfig`` command. If IP is not assigned, even after rebooting the FlytPOD, then assign manual IP (192.168.1.254) to FlytPOD wired connection and use a Subnet Mask (255.255.255.0). Connect to Ethernet connection.
3. You can follow two methods to reset your router:

   a) ``Method 1 (using terminal)``: From terminal, issue ``ssh root@openwrt`` command. Enter ``123`` as password. In the OpenWrt terminal, issue command ``firstboot && reboot``. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``passphrase: FlytPOD123``.

   .. image:: /_static/Images/root@openWRT.png
	:align: center
 

   b) ``Method 2 (using web-gui)``: Connect to router from browser using IP address configured earlier in the previous step 2. i.e. 192.168.1.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*. Select ``System->Flash Firmware->perform reset`` option. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``passphrase: FlytPOD123``.

.. Upgrading the firmware
.. ^^^^^^^^^^^^^^^^^^^^^^

.. 1. Join the FlytPOD_wifi network from your laptop/mobile device.
.. 2. And then access the module from Host browser using IP address: 192.168.1.1
.. 3. Directly Flash new Firmware Image menu will come then specify the binary(provided by NavStik) file location and then click on the “flash image” and follow the steps.

