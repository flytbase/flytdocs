.. _hardware_setup:

Supported Ground Control Stations
=================================

FlytConsole
-----------

FlytOS comes pre-installed with FlytConsole, a web app for configuring your drone.
Follow the steps below to get started with FlytConsole.

1. Power on FlytPOD/PRO (or your device running FlytOS).
2. Connect your personal system to the same network that FlytPOD/PRO is connected to.
3. If in AP mode, you can connect to FlytPOD/PRO’s WiFi i.e flytpod_wifi. If in client mode, connect to your router i.e the device running FlytOS is connected to.
4. Next go to the following links to open FlytConsole:

    a) http://flytpod:9090/flytconsole (non-auth)
    b) https://flytpod/flytconsole  (auth)

.. 5. In the second link you will be prompted for login credentials. Use the following credentials to login:

..     * Username: admin
..     * Password: password
      
5. Next you will have to activate FlytOS. Click here to register your device and activate FlytOS. Learn more about setting up your FlytBase account (link to FlytBase Account doc).
6. Follow the steps `here <http://docs.flytbase.com/en/newlayout/docs/FlytConsole/FlytConsole.html>`_ to learn about FlytConsole widgets.


QGC
---

QGroundControl also supports FlytOS. Follow the steps given below to get started with QGCS:

1. Connect your personal system to the same WiFi network as FlytPOD/PRO.
2. `Download <http://qgroundcontrol.com/downloads/>`_ and Install QGC.

3. Once installed launch the QGC app.
4. QGC automatically connects to the default UDP link that is listening to port 14550.
5. You can go through the `User’s Guide <http://qgroundcontrol.org/users/start>`_ to learn more about QGC.




