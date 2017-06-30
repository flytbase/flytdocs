.. _edison_guide:


Intel Edison
============

..  FlytOS requires a lot of dependencies to be installed. For this, we have provided the following two approaches:

.. * :ref:`Flashing FlytOS Linux Image <FlytOS_linux_image>`
.. * :ref:`Installing FlytOS dependencies in your custom image<install_dependencies>`

.. Preparing your Intel Edison Board
.. ----------------------------------

.. _FlytOS_linux_image_edison:

Flashing FlytOS Image
^^^^^^^^^^^^^^^^^^^^^

.. note:: Due to the large number of steps involved in installing dependencies for FlytOS on Intel Edison, currently the only recommended method to use FlytOS on Intel Edison is using the FlytOS Image.

.. note:: This guide assumes you already have a working Edison with `Jubilinux <http://www.jubilinux.org/>`_ image installed.


This section will help you in flashing FlytOS Linux Image on your Intel Edison Board.
This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

**Image download:**

.. |my_flytbase_link| raw:: html

   <a href="https://my.flytbase.com" target="_blank">Login</a>

.. |flytos_dl_link| raw:: html

   <a href="https://my.flytbase.com/FlytOS" target="_blank">FlytOS Linux Image</a>

1. |my_flytbase_link| to your FlytBase Account.
2. Download the hardware specific |flytos_dl_link| from your FlytBase account.
3. Download size of the image is about 1.5 GBs.
4. Check *MD5 Hash* to verify the integrity of downloaded file. Since it is a large file, the command may take a few minutes to complete:

   * Linux- launch a terminal and execute the following command

   .. code-block:: bash

       $ md5sum <path-to-downloaded-image>/flyt*.img.gz

   * Windows- launch a command window and execute the following command

   .. code-block:: bash

       $ CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5

   * Mac OS- launch a terminal and execute the following command

   .. code-block:: bash

       $ md5 <path-to-downloaded-image>/flyt*.img.gz

5. Compare the MD5 Hash generated to *MD5 Hash* mentioned in the |flytos_dl_link| download page.

**Image flash:**

We have created a video tutorial demonstrating how to flash FlytOS Linux Image on your Intel Edison board. Additionally one can refer Step-2 of `this guide <https://github.com/oskarpearson/mmeowlink/wiki/Backing-up-and-cloning-your-OpenAPS-Edison#step-2-flash-image-onto-edison>`_ for the same.

|br|

..  youtube:: LHMF8peY2MY
    :aspect: 16:9
    :width: 80%


|br|

**User Credentials**

All FlytOS Linux Image versions have the same Login user credentials:

| **username - flytpod**
| **password - flytpod**

.. note:: Intel Edison will boot up with its wifi configured as Access Point.

.. _edison_wifiap:

WiFi Access Point
^^^^^^^^^^^^^^^^^

After flashing FlytOS Linux Image in your Intel Edison, WiFi access point is created on the device on system startup with following credentials:

ssid:       edison_wifi

Password:   FlytPOD123

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://192.168.42.1/flytconsole


.. _activate_flytos_edison:

Activate FlytOS
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your Edison has internet access before proceeding.
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
3. Choose a device nick-name and select your compute engine.
4. In license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
5. Click on Save Changes to register device and generate a license key.
6. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


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
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on Edison and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Edison and Pixhawk.
5. Configure a dedicated two way switch for ``OFFBOARD MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``OFFBOARD MODE``.


Next Step: :ref:`Supported Ground Control Stations<supported_GCS>`
------------------------------------------------------------------


.. Getting started with FlytOS
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * After completing the above steps, you can now attach various components of you drone to the pixhawk like ESCs, GPS, Radio and other payloads.
.. * Calibrate the drone's sensors, RC and ESCs in FlytConsole by following the instructions given on the :ref:`FlytConsole page<Motor_config>`.
.. * You are now ready to try some sample FlytOS apps on your drone. A good starting point for beginners is the |github_link|. More documentation can be found in :ref:`Sample Apps section<onboard app>`. Please note, in order to run any onboard app in FlytOS, make sure that your drone is in Offboard/API mode.

.. .. |github_link| raw:: html

..    <a href="https://github.com/flytbase/flytsamples/tree/master/AndroidApps/HTML-JS-Apps/Joystick" target="_blank">Joystick app (Github Link)</a>

.. |br| raw:: html

   <br />
