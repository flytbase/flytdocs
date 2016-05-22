.. _flytpod router setup:


FlytPOD - Wifi Setup 
====================

.. .. _configuring wifi module in client mode:


Breif introduction of HotSpot and Client Modes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Flytpod has inbuilt powerful 2.4 GHz wifi router, which can be set into Hotspot/AP or Client mode.

**HotSpot Mode**

Flytpod creates a wifi access point to which your mobile devices can connect. FlytPOD ships with this default mode. Please note that in this mode FlytPOD can not access the internet. Hence, automatic updates, maps in flytconsole will not work when flytpod is operating in hotspot mode.

**Client Mode**

Flytpod connects to available university, home wifi network. Your wifi network should have internet connectivity in order for the FytPOD to access the internet.


.. Configuring WiFi Module
.. ^^^^^^^^^^^^^^^^^^^^^^^

.. The wifi module can be configured in two ways viz.

.. * Using FlytConsole
.. * Using Router GUI


.. Using FlytConsole
.. """""""""""""""""

Changing the Wifi Mode
^^^^^^^^^^^^^^^^^^^^^^

.. **Changing the Wifi Mode:**

1. Power on FlyPOD using the battery or wall adapter.
2. Connect to flytpod_wifi network.
   
   .. important:: * By default Flytpod is configured into hotspot/AP mode.
   					* Default SSID: flytpod_wifi.
   					* Default password: Please check the flyer shipped with FlytPOD.
   					

3. Launch FlytConsole in the web browser using the url ``flytpod:9090/flytconsole``. Go to the options menu in the top right corner and select wifi setup.
4. Select hotspot/AP or client mode.
5. Select proper encryption option for hotspot/AP mode and set a password.
6. In client mode click on the button to scan for available networks. It takes nearly 10 seconds. Select the network that you want to connect to. Enter the password and click on connect.
7. After clicking on connect in hotspot or client mode you should wait for 2 minutes and then shutdown FlytPOD by pressing the power switch on the back panel for 4 seconds. After shutdown is complete (fan stopped) remove the power cable and then power it up again. FlytPOD should now be in the new configured mode.

8. If the mode changes are not successful then FlytPOD will automatically reset itself to default mode viz. Hotspot with SSID: flytpod_wifi and password: shipped with FlytPOD.



.. 3. Launch FlytConsole in the web browser using the url ``flytpod:9090/flytconsole ``. Go to the options menu in the top right corner and select wifi setup.
.. 4. Select hotspot/AP or client mode.
.. 5. Select proper encryption option for hotspot/AP mode and set a password.
.. 6. In client mode click on the button to scan for available networks. It takes nearly 10 seconds. Select the network that you want to connect to. Enter the password and click on connect.
.. 7. After clicking on connect in hotspot or client mode you should wait for 2 minutes and then shutdown flytpod by pressing the power switch on the back panel for 4 seconds.
..  After shutdown is complete (fan stopped) remove the power cable and then power it again. FlytPOD should now be in the new configured mode.
.. 8. If the mode changes are not successful then FlytPOD will automatically reset itself to default mode viz. Hotspot with ssid: flytpod_wifi and password: shipped with FlytPOD.


In hotspot mode you can access FlytConsole at ``flytpod:9090/flytconsole``.

In client mode you might have to replace ``flytpod`` with the IP address of FlytPOD which you can find through your router page by looking for connected client with the name 'flytpod'.


.. note:: Another client with name 'FlytWRT' would be connected as well, but that is of no use.




.. Using Router GUI
.. """"""""""""""""

.. The FlytPOD has built-in WiFi router module. FlytPOD has hard-wired connection to the LAN port of this module.The Module can be configured in AP Mode or in Client Mode depending upon the application. Not both modes at a time. By default, at the time of shipping, the router is configured in AP Mode.  

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

.. 1. Connect a monitor via HDMI cable, keyboard and mouse to FlytPOD.
.. 2. You can use one of the following three methods to reset your router (we recommend the first approach using UART):

..    a) ``Method 1 (using UART)``: From terminal, open OpenWrt terminal by issuing ``sudo minicom -D /dev/ttySAC2 -b 57600`` in the terminal. Enter ``flytpod`` if asked for password. In the OpenWrt terminal, issue command ``firstboot && reboot``. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.

..    .. image:: /_static/Images/root@openWRTcrop.png
.. 	:align: center
 
..    b) ``Method 2 (using terminal)``: From terminal, issue ``ifconfig`` command. If IP is not assigned, even after rebooting the FlytPOD, then assign manual IP (192.168.3.253) to FlytPOD wired connection and use a Subnet Mask (255.255.255.0). Connect to Ethernet connection. From terminal, issue ``ssh root@openwrt`` command. Enter ``123`` as password. In the OpenWrt terminal, issue command ``firstboot && reboot``. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.

..    .. image:: /_static/Images/root@openWRT.png
.. 	:align: center
 

..    c) ``Method 3 (using web-gui)``: From terminal, issue ``ifconfig`` command. If IP is not assigned, even after rebooting the FlytPOD, then assign manual IP (192.168.3.253) to FlytPOD wired connection and use a Subnet Mask (255.255.255.0). Connect to Ethernet connection. Connect to router from browser using IP address configured earlier in the previous step 3. i.e. 192.168.3.254. Click on the Administration tab. OpenWRT configuration wizard GUI will prompt for username: *root* and password: *123*. Select ``System->Flash Firmware->perform reset`` option. Wait for about a minute to let the router reboot itself. Once rebooting is done, FlytPOD router gets configured in AP mode with ``SSID: FlytPOD_wifi`` and ``password: FlytPOD123``.





.. Upgrading the firmware
.. ^^^^^^^^^^^^^^^^^^^^^^

.. 1. Join the FlytPOD_wifi network from your laptop/mobile device.
.. 2. And then access the module from Host browser using IP address: 192.168.1.1
.. 3. Directly Flash new Firmware Image menu will come then specify the binary(provided by NavStik) file location and then click on the “flash image” and follow the steps.

