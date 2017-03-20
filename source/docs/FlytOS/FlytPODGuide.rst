.. _flytpod_guide:


FlytPOD/PRO
===========


Installing FlytOS
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: FlytOS Linux Image is pre-installed in FlytPOD/PRO. In case you want to re-flash their respective 32GB SD/eMMC card, or create a duplicate 32GB SD/eMMC card follow the steps given below. You can use 16GB SD/eMMC cards as well, but 32GB is preferable.

To re-install FlytOS on FlytPOD/PRO, there are 2 ways that you can follow. We recommended the first method for an easier install:

* :ref:`Flashing FlytOS Linux Image <flashing_img_flytpod>`  [**Recommended method**]
  
  OR

* :ref:`Installing FlytOS dependencies in your custom image<install_dependencies_flytpod>`

       

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


.. _activate_flytos_flytpod:

Activate FlytOS
^^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your FlytPOD/PRO has internet access before proceeding. Configure its onboard WiFi router to client mode by following :ref:`this guide <flytpod router setup>`.
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in the FlytPOD/PRO's browser using the URL ``http://localhost/flytconsole`` or on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in. 
3. Choose a device nick-name and select your compute engine. 
4. In the drop down for license, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.  
5. Click on Save Changes to register device and generate a license key.
6. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

.. _hardware_flytpod_guide:

Hardware Setup
^^^^^^^^^^^^^^^

FlytPOD comes in two variants - FlytPOD and FlytPOD PRO. Both of them have an inbuilt autopilot and you shall not have to go through this guide. See the detailed steps for getting started with FlytPOD/PRO :ref:`here<about_flytpod_pro>`.


Next Step: :ref:`Connections and Expansion Ports<FlytPOD_specifications>`
------------------------------------------------------------------

.. Getting started with FlytOS
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * After completing the above steps, you can now attach various components of you drone to the pixhawk like ESCs, GPS, Radio and other payloads. 
.. * Calibrate the drone's sensors, RC and ESCs in FlytConsole by following the instructions given on the :ref:`FlytConsole page<Motor_config>`.
.. * It is highly recommended that you visit the :ref:`FlytPOD essentials<First_Principles>`, :ref:`First Flight<First_Flight>` and :ref:`Safety Guidelines<Safety_guidelines>` pages before proceeding.
.. * You are now ready to try some sample FlytOS apps on your drone. A good starting point for beginners is the |github_link|. More documentation can be found in :ref:`Sample Apps section<onboard app>`. Please note, in order to run any onboard app in FlytOS, make sure that your drone is in Offboard/API mode.

.. .. |github_link| raw:: html

..    <a href="https://github.com/flytbase/flytsamples/tree/master/AndroidApps/HTML-JS-Apps/Joystick" target="_blank">Joystick app (Github Link)</a>

.. |br| raw:: html

   <br />
