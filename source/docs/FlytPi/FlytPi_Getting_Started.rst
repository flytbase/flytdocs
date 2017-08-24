.. _flytpi_getting_started:

Getting Started with FlytPi
===========================

Contents
^^^^^^^^

* 1x Raspberry Pi3 Model B

* 1x Plastic Enclosure

* 1x 32GB uSD Card Class 10 with FlytOS Commercial Edition

* 1x Attached UART-to-UART cable

* 1x Power Module 5V 4A (Powers both FlytPi and Autopilot, provides battery out for ESCs)

* 1x Wall Adapter (Micro-USB)

* 1x HDMI Cable

* 1x Ethernet Cable

Getting Started
^^^^^^^^^^^^^^^

The FlytPi comes preactivated commercial licence so that you can start your drone application right out of the box.

* (Optional) If you want to use a screen, connect a HDMI cable from the FlytPi to a monitor. This step is optional as you can also try out FlytPi in headless mode (without a monitor).

* Connect the UART connector of your FlytPi to the TELEM 2 port of Pixhawk.

* You will need to configure your Pixhawk for it to be able to communicate with FlytOS. Refer :ref:`here <raspi_telem>` for more information.

* Power on the FlytPi. Use the provided 5V 2A power supply. It is not recommended to run the FlytPi from a computer USB port. Any other 5V 2A power supply will also do.

* Wait for the FlytPi to boot up. This may take about a minute.

* Connect your device to the FlytPi WiFi network.
  SSID: flytos_WiFi
  Password: flytos123

* Open the browser on your device and navigate to http://10.42.0.1/flytconsole.

* Once FlytConsole loads, you can see that your device is preactivated with a commercial license. Open GCS and see that the HUD at the top right corner is responsive.

* You can now proceed with integrating the FlytPi in your drone.

Integrating FlytPi into your Drone
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Prerequsites
""""""""""""

* Drone with compatible autopilot.

* Drone able to do position hold with GPS.

* Offboard mode configured on a dedicated two way RC switch.

* Battery 2s-6s with XT60 output connector.

* Companion computer settings on autopilot as provided in :ref:`this <raspi_telem>` guide.

Once you are Ready to Set Up the FlytPi on your Drone
"""""""""""""""""""""""""""""""""""""""""""""""""""""

* Mount the raspberry pi on drone at convenient spot.

* Connect the UART connector of your FlytPi to the TELEM 2 port of Pixhawk.

* Mount power module on the drone.

* Connect micro USB connector of power module to the FlytPi power input connector.

* Connect Female XT60 connector of the power module to power module for Pixhawk. Note that the power module for FlytPi does not power up the Pixhawk.

* Connect male XT60 connector to the battery.

* Wait for a minute for the FlytPi to boot.

* Follow steps in Getting Started to view FlytConsole.

* With the drone on ground and GPS fix, switch the drone to OFFBoard mode. Pixhawk LED should fast blink green to show the successful transition. Also confirm the mode in FlytConsole top bar. It should show API-POSCTL. If it is successful then continue. Else check the autopilot connection settings.

* You are now ready to fly and test out the :ref:`Ready To Use Apps<ready_to_use_apps>`
