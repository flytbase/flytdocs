.. _edison_guide:


Intel Edison
============

FlytOS Linux Image is based on the latest stable release of Debian 'stretch'. This image comes pre-installed with ROS-Kinetic and FlytOS.

.. _FlytOS_linux_image_edison:

Flashing FlytOS Image
^^^^^^^^^^^^^^^^^^^^^

.. note:: Due to the large number of steps involved in installing dependencies for FlytOS on Intel Edison, the only recommended method to use FlytOS on Intel Edison is using the FlytOS Linux Image.

This section will help you in flashing FlytOS Linux Image on your Intel Edison Board.

This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

|br|

**Image download**

1. |my_flytbase_link| to your FlytBase Account.
2. Download the Intel Edison |flytos_dl_link| from your Downloads page.
3. Download size of the image is about 700 MBs.
4. Check *MD5 Hash* to verify the integrity of downloaded file. Since it is a large file, the command may take a few minutes to complete:

   * **Linux**- launch a terminal and execute the following command

     .. code-block:: bash

         $ md5sum <path-to-downloaded-image>/flyt*.zip

   * **Windows**- launch a command window and execute the following command

     .. code-block:: bash

         $ CertUtil -hashfile <path-to-downloaded-image>/flyt*.zip MD5

   * **Mac OS**- launch a terminal and execute the following command

     .. code-block:: bash

         $ md5 <path-to-downloaded-image>/flyt*.zip
		
5. Compare the MD5 Hash generated to *MD5 Hash* mentioned in the |flytos_dl_link| download page.

|br|

**Image flash**

.. note:: This step is exactly similar to the standard method of flashing Intel Edison board. The following guide is ONLY for Linux users. Windows users could follow `this <https://software.intel.com/en-us/flashing-firmware-on-your-intel-edison-board-windows>`_ and MacOS users could use `this guide <https://software.intel.com/en-us/node/637974#manual-flash-process>`_.

1. Unzip the downloaded file flyt*.zip to any location.
2. Plug a USB cable into the USB port labeled OTG.
3. Open a terminal window and navigate to the extracted folder: toFlashflytos.
4. Run the command: ``sudo ./flashall.sh``. If you receive an ``dfu-util: command not found`` error, you can install dfu-util by running ``sudo apt-get install dfu-util``.

|br|

**User Credentials**

All FlytOS Linux Image versions have the same Login user credentials:

| **username - flytos**
| **password - flytos**

.. note:: Intel Edison will boot up with its wifi configured as Access Point.

.. _edison_wifiap:

WiFi Access Point
^^^^^^^^^^^^^^^^^

After flashing FlytOS Linux Image in your Intel Edison, WiFi access point is created on the device on system startup with following credentials:

ssid:       edison_ap

Password:   flytos12#

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://192.168.42.1/flytconsole. 


.. _edison_wificlient:

WiFi in Client Mode
^^^^^^^^^^^^^^^^^^^

By default Edison will be configured in Hotspot or AP mode. Follow these steps to get internet access or to configure it in client mode.

1. Disable hostapd service from running on next reboot.
   
   .. code-block:: bash

       $ sudo systemctl disable hostapd

2. Open up /etc/network/interfaces file. Default content of the file would be:
   
   .. code-block:: bash

		   # interfaces(5) file used by ifup(8) and ifdown(8)
		   # Include files from /etc/network/interfaces.d:
		   #source-directory /etc/network/interfaces.d

		   auto lo
		   iface lo inet loopback

		   #auto usb0
		   iface usb0 inet static
		       address 192.168.2.15
		       netmask 255.255.255.0

		   #auto wlan0
		   #iface wlan0 inet dhcp
		       # For WPA
		       #wpa-ssid Emutex
		       #wpa-psk passphrase
		       # For WEP
		       #wireless-essid Emutex
		       #wireless-mode Managed
		       #wireless-key s:password
		       dns-nameservers 8.8.8.8 8.8.4.4

		   # And the following 4 lines are for when using hostapd...
		   iface wlan0 inet static
		       address 192.168.42.1
		       netmask 255.255.255.0

3. Comment out all the lines under section ``# And the following 4 lines are for`` ``when using hostapd...`` and uncomment the following four lines:
   
   .. code-block:: bash

		   auto wlan0
		   iface wlan0 inet dhcp
		       # For WPA
		       wpa-ssid Emutex
		       wpa-psk passphrase

		   Replace 'Emutex' and 'passphrase' according to the router you want edison to connect to.

4. Reboot the Edison for the changes to take effect.
   
.. _activate_flytos_edison:

Activate FlytOS
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your Edison has internet access before proceeding.
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
3. Choose a device nick-name and select your compute engine.
4. In license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
5. Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
6. Click on Save Changes to register device and generate a license key.
7. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


Hardware Setup
^^^^^^^^^^^^^^^


Telemetry Connection
""""""""""""""""""""

FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk’s Telemetry port to Intel Edison.

1. **[Recommended]** Connect Pixhawk's Telem2 port to Edison's UART port(ttyMFD1) using J18/13(RX) and J19/8(TX) (refer page-7 of `edison hardware guide <http://download.intel.com/support/edison/sb/edisonbreakout_hg_331190006.pdf>`_ for connections). If you are using Pixhawk2.1, this connection is already made available.
2. Connect Pixhawk's micro-USB to the USB port of Edison.
3. Connect Pixhawk's Telem2 port to the USB port of Edison using UART-USB converter.


.. figure:: /_static/Images/edison_pixhawk.jpg
  :align: center
  :scale: 100 %

  Connection between Edison's ttyMFD1 uart port and Pixhawk’s TELEM 2

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

For APM users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`__ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921(921600) and 1 respectively. This would enable communication between FlytOS running on Edison and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`__ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameter SYS_COMPANION and set it to 921600. This would enable communication between FlytOS running on Edison and Pixhawk.
5. Configure a dedicated two way switch for ``OFFBOARD MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``OFFBOARD MODE``.


Next Step: :ref:`Supported Ground Control Stations<supported_GCS>`
------------------------------------------------------------------


.. |my_flytbase_link| raw:: html

   <a href="https://my.flytbase.com" target="_blank">Login</a>

.. |flytos_dl_link| raw:: html

   <a href="https://my.flytbase.com/FlytOS" target="_blank">FlytOS Linux Image</a>

.. |br| raw:: html

   <br />
