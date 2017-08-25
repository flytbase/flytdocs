.. _flytpi_getting_started:

Getting Started with FlytPi
===========================

Contents
^^^^^^^^

* 1x Raspberry Pi3 Model B

* 1x Plastic Enclosure

* 1x 32GB uSD Card Class 10 with FlytOS Commercial Edition

* 1x Attached UART-to-UART cable

* 1x Power Module 5V 4A (Powers FlytPi provides battery out for Autopilot and ESCs)

* 1x Wall Adapter (Micro-USB)

* 1x HDMI Cable

* 1x Ethernet Cable

The FlytPi comes preactivated with a commercial licence so that you can start your drone application right out of the box.

Integrating FlytPi into your Drone
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Prerequsites
""""""""""""

* Drone with compatible autopilot.

* Drone should be able to do position hold with GPS.

* Offboard mode configured on a dedicated two way RC switch.

* Battery 2s-6s with XT60 output connector.

* Companion computer settings on autopilot as given below.

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

For APM users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ on your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on FlytPi and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ on your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on FlytPi and Pixhawk.
5. Configure a dedicated two way switch for ``OFFBOARD MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``OFFBOARD MODE``.


Once you are Ready to Set Up the FlytPi on your Drone
"""""""""""""""""""""""""""""""""""""""""""""""""""""

* Mount the FlytPi on drone at convenient spot.

* Connect the UART connector of your FlytPi to the TELEM 2 port of Pixhawk/Pixhawk2/Pixhawk Mini.

* (Optional) If you want to use a screen, connect a HDMI cable from the FlytPi to a monitor. This step is optional as you can also use FlytPi in headless mode (without a monitor).

* Mount power module on the drone.

* Connect micro USB connector of power module to the FlytPi power input connector.

* Connect Female XT60 connector of the power module to power module for Pixhawk. Note that the power module for FlytPi does not power up the Pixhawk.

* Connect male XT60 connector to the battery.

* Wait a minute for the FlytPi to boot.

* Wait for the FlytPi to boot up. This may take about a minute.

* Connect your device to the FlytPi WiFi network.

  | **SSID: flytos_WiFi**
  | **Password: flytos123**

* Open the browser on your device and navigate to http://10.42.0.1/flytconsole.

* Once FlytConsole loads, you can see that your device is activated with a commercial license. Open GCS and see that the HUD at the top right corner is responsive.

.. * With the drone on ground and GPS fix, switch the drone to OFFBoard mode. Pixhawk LED should fast blink green to show the successful transition. Also confirm the mode in FlytConsole top bar. It should show API-POSCTL. If it is successful then continue. Else check the autopilot connection settings.

You are now ready for :ref:`First Flight!<first_flight_main>`
------------------------------------------------------------
