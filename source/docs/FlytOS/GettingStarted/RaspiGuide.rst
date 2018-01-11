.. _rpi_guide:


Raspberry Pi 3
===============

Installing FlytOS 
^^^^^^^^^^^^^^^^^^

To install FlytOS on Raspberry Pi 3, there are 2 ways that you can follow. We recommend the first method for an easier install:

* :ref:`Flashing FlytOS Linux Image <flashing_img_rpi>` [**Recommended method**]
              
  OR

* :ref:`Installing FlytOS dependencies in your custom image<install_dependencies_rpi>`


   
       

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


.. _activate_flytos_rpi:

Activate FlytOS
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your Raspberry Pi has internet access before proceeding. To access internet on your Raspberry Pi (for activation, loading maps, auto updates, etc), you can either connnect through a LAN cable from your router, or delete the access point and connect RPi's wifi to your home router with internet access. Beginners can see `this tutorial <https://cdn-learn.adafruit.com/downloads/pdf/adafruits-raspberry-pi-lesson-3-network-setup.pdf>`_  to learn about networking on Raspberry Pi. More advanced users can follow :ref:`this networking setup guide<advanced_networking>`. 
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in the RPi's browser using the URL ``http://localhost/flytconsole`` or on your PC's browser using the URL ``http://<ip-address-of-device>/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in. 
3. Choose a device nick-name and select your compute engine. 
4. In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.  
5. Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
6. Click on Save Changes to register device and generate a license key.
7. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


.. _hardware_rpi_guide:

Hardware Setup
^^^^^^^^^^^^^^

.. _raspi_telem:

Telemetry Connection
""""""""""""""""""""

Connect the UART RX and TX pins of your Raspberry Pi 3 to the TELEM2 Tx and Rx pins of your Pixhawk as shown below. Click `here <https://pixhawk.org/modules/pixhawk>`_ for more details on Pixhawk.

.. figure:: /_static/Images/RaspPinout.png
	:align: center 
	:scale: 60 %
	
	Connection between Raspberry Pi 3’s GPIO and Pixhawk’s TELEM 2

.. figure:: /_static/Images/Pinout_PX_Rasp.png
	:align: center 
	:scale: 75 %

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

For APM users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ on your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ on your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameter SYS_COMPANION and set it to 921600. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
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
