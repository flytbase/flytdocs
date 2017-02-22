.. _supported_GCS:

Supported GCS
=============

FlytConsole
-----------

:ref:`FlytConsole<about flytconsole>`, a web app for configuring your drone comes pre-packaged in FlytOS.
Follow the steps below to get started with FlytConsole.

1. Power on your Flight Computer running FlytOS.
2. Connect your personal computer to the same network that your Flight Computer is connected to.
3. If your flight computer is in Access Point(AP) mode, you can connect to its WiFi (ssid: FlytPOD_wifi). If the flight computer is client mode, connect your personal computer to the same router which your flight computer is connected to.
4. Next go to the following link to open FlytConsole: `<http://flytpod/flytconsole>`_
 


.. b) https://flytpod/flytconsole  (auth)

.. 5. In the second link you will be prompted for login credentials. Use the following credentials to login:

..     * Username: admin
..     * Password: password
      
5. You will now have to activate FlytOS. Click `here <http://my.flytbase.com>`_ to register your device and activate FlytOS. Learn more about setting up your FlytBase account :ref:`here.<activate_flytos>` 
6. Follow the steps :ref:`here <flytconsole widgets>` to learn about FlytConsole widgets.


QGC
---

`QGroundControl <http://qgroundcontrol.com>`_ also supports FlytOS. Follow the steps given below to get started with QGCS:

1. `Download <http://qgroundcontrol.com/downloads/>`_ and Install QGC.
2. Once installed launch the QGC app.
3. Connect your personal computer to the same WiFi network your flight computer is connected to.
4. Create a new *TCP Comm Link* in QGC, with *Host Address* as IP Address of your flight computer and *TCP Port* as 5760.
5. Once done, press the button connect and QGC will now connect to FlytOS.
6. You can go through the `User’s Guide <http://qgroundcontrol.org/users/start>`_ to learn more about QGC.

