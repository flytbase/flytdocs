.. _supported_GCS:

Supported GCS
=============

FlytConsole
-----------

:ref:`FlytConsole<about flytconsole>`, a web app for configuring your drone comes pre-packaged in FlytOS.
Follow the steps below to get started with FlytConsole.

1. Power on your Flight Computer running FlytOS.
2. Connect your personal computer to the same network that your Flight Computer is connected to.
3. If your flight computer is in Access Point(AP)/HotSpot mode, you can connect to its WiFi (ssid: FlytPOD_wifi). If the flight computer is in client mode, connect your personal computer to the same router with which your flight computer is connected to.
4. Next go to the following link to open FlytConsole: `<http://flytpod/flytconsole>`_ or ``<http://<ip-address-of-device>/flytconsole>``
5. Follow the steps :ref:`here <flytconsole widgets>` to learn about FlytConsole widgets.


QGC
---

`QGroundControl <http://qgroundcontrol.com>`_ also supports FlytOS. Follow the steps given below to get started with QGCS:

1. `Download <http://qgroundcontrol.com/downloads/>`_ and Install QGC.
2. Once installed launch the QGC app.
3. Connect your personal computer to the same WiFi network your flight computer is connected to.
4. Create a new *TCP Comm Link* in QGC, with *Host Address* as IP Address of your flight computer and *TCP Port* as 5760.
5. Once done, press the *connect* button and QGC will now connect to FlytOS.
6. You can go through their `User’s Guide <http://qgroundcontrol.org/users/start>`_ to learn more about QGC.

