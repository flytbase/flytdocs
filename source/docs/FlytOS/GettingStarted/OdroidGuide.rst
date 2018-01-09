.. _odroid_guide:


ODROID-XU4
============


Installing FlytOS
^^^^^^^^^^^^^^^^^^

To install FlytOS on ODROID-XU4, there are 2 ways that you can follow. We recommend the first method for an easier install:

* :ref:`Flashing FlytOS Linux Image <flashing_img_odroid>`  [**Recommended method**]
  
  OR

* :ref:`Installing FlytOS dependencies in your custom image<install_dependencies_odroid>`



.. **Security and Authentication**

.. From a Security and Authentication perspective, following layers are considered:


.. 1. Secure WiFi network using WPA2:
..    This is achieved by setting up a secure WiFi network (on FlytPOD by default or on a ground router).
.. 2. SSL (https and wss) encryption:
..    FlytOS uses SSL certificates and secure protocols (https, wss).
.. 3. User and Request authentication:
..    The last point involves, authenticating a user and providing role based access via a login mechanism. It also includes authenticating all the FlytAPIs for which a token based authentication mechanism is used.

.. **Accessing built-in apps with FlytOS**

.. 1. Open your browser and go to the following link - ``http://<ip-address-of-device>/flytconsole``.
.. 2. Enter ``flytpod`` in place of IP address in case you are connected to FlytPOD in AP mode- ``http://flytpod/flytconsole``.


.. 3. You will be directed to a page that shows a warning **Connection is not private**. FlytOS contains self signed SSL certificates to enable access over local network.
   
       
..    .. image:: /_static/Images/fOSinst1.png
..       :align: center
.. 4. Bypass the warning by clicking Advanced> Proceed to localhost. Confirm adding an exception if prompted to do so.
.. 5. Next you will be directed to FlytOS login page. Login using the default credentials provided to you.
       
..    .. image:: /_static/Images/fOSinst2.png
..       :align: center
.. 6. Once you have logged in you will see the list of standard apps along with other settings.
       
..    .. image:: /_static/Images/fOSinst3.png
..       :align: center

.. When a user tries to access an onboard web app e.g. FlytConsole, a login page is served asking for user credentials. The user credentials are validated and home page for the app is served. The response of a login request contains a token. All the FlytAPI calls need to have this token in the http header otherwise the request fails with unauthorized error.

.. The user authentication follows Single Sign On approach with a common login for FlytPOD allowing access to all the onboard apps.


.. **FlytAdmin for User Administration**
   
.. There is an inbuilt app FlytAdmin for user administration. Only ‘admin’ users have access to this app. The FlytOS admins of a device will be able to add, activate, edit, delete, deactivate users for that device using this app. The app provides views for Users and Roles. 

.. .. image:: /_static/Images/fOSinst4.png
..    :align: center

.. .. image:: /_static/Images/fOSinst5.png
..    :align: center


.. _activate_flytos_odroid:

Activate FlytOS
^^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your ODROID-XU4 has internet access before proceeding. You can connect to internet using WiFi dongle or ethernet to the ODROID-XU4. 
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in the ODROID's browser using the URL ``http://localhost/flytconsole`` or on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in. 
3. Choose a device nick-name and select your compute engine. 
4. In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.  
5. Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
6. Click on Save Changes to register device and generate a license key.
7. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


Hardware Setup
^^^^^^^^^^^^^^

Telemetry Connection
""""""""""""""""""""

FlytOS needs telemetry data from autopilot(Pixhawk). Connect Pixhawk’s Telemetry port to ODROID-XU4. 

1. **[Recommended]** Connect Pixhawk's Telem2 port to ODROID UART0 port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0(RX) and GPA0.1(TX) have been used as serial port UART0.
2. Connect Pixhawk's micro-USB to the USB port of ODROID. **[Not Recommended if using APM]**
3. Connect Pixhawk's Telem2 port to the USB port of ODROID using UART-USB converter.   

.. FlytConsole comes pre-packaged in FlytOS (a web-based drone configuration utility). To enable access to vehicle, WiFi-dongle must be installed onboard the ODROID-XU4.

Below is a hardware setup youtube video for Pixhawk + ODROID-XU4 covering all the necessary information, including WiFi-enabling the ODROID.

|br|

..  youtube:: B40pE02bjJI
    :aspect: 16:9
    :width: 80%

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

For APM users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on ODROID-XU4 and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.
   
For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameter SYS_COMPANION and set it to 921600. This would enable communication between FlytOS running on ODROID-XU4 and Pixhawk.
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
