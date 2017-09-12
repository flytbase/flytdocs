  .. _aero_guide:


Intel Aero
==========

.. _install_dependencies_aero:

Installing FlytOS
^^^^^^^^^^^^^^^^^

.. caution:: Intel Aero Compute board currently supports only the Yocto Linux distribution. Since FlytOS is only supported on Ubuntu/Debian based Linux distros, you will have to re-flash the operating system. This may void your Aero Board's warranty so we recommend users to use  their discretion while installing FlytOS on the board. Flytbase does not take any responsibility and is free from any liability caused by following these instructions to install Ubuntu on Intel Aero Board.

1. First create an Ubuntu 16.04 bootable USB drive by following `these instructions <https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu>`_. Connect the USB drive to the Aero Board using a micro USB OTG cable. You may also want to use a USB hub to attach a keyboard and mouse to the Board. Then power up the Aero board and press escape while it boots up to enter the BIOS menu. Select the option to boot from your USB drive. Then follow `these instructions <https://www.ubuntu.com/download/desktop/install-ubuntu-desktop>`__ to install Ubuntu on the board.

2. Please ensure you are running Linux - Ubuntu 16.04 before proceeding with installation. This guide assumes you already have a working operating system on your Flight Computer. The following commands should be executed on your flight computer, you may either use an external display or ssh into your flight computer.

.. warning:: Please make sure you have a stable internet connection. Save and close all open applications before executing the script as your system shall reboot on installation.

3. Open terminal and run the following command

   .. code-block:: bash

       $ sudo bash -c 'curl -sSL http://docs.flytbase.com/_static/Downloads/flytOS_installation.sh | bash -e'

   In case you get an error saying curl: command not found, please run the following command

   .. code-block:: bash

       $ sudo bash -c 'wget -O - http://docs.flytbase.com/_static/Downloads/flytOS_installation.sh | bash -e'

4. Please enter your system password when prompted

5. On successful installation you will get the message **Congratulations! FlytOS installation completed** and your system shall reboot.

Troubleshooting
---------------

* If the installation script throws an error, please reboot and try again.

* If you get the error "Connection Timed Out":
  Please check your internet connection and run the script again.

* If the script is interrupted during execution, try running the following command before you execute the script again

  .. code-block:: bash

      $ sudo dpkg --configure -a

* If the above command does not work, run the following to fix your packages before running the installation script

  .. code-block:: bash

      $ sudo apt-get upgrade --fix-broken

.. _activate_flytos_aero:

Activate FlytOS
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your Aero Board has internet access before proceeding.
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in your Aero's browser using the URL ``http://localhost/flytconsole`` or on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
3. Choose a device nick-name and select your compute engine.
4. In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
5. Click on Save Changes to register device and generate a license key.
6. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

Hardware Setup
^^^^^^^^^^^^^^


Telemetry Connection
--------------------

FlytOS needs telemetry data from autopilot(Pixhawk). Connect the Pixhawk autopilot board’s USB port on the side to Aero's USB port. The Pixhawk will be visible on Aero by the device name /dev/ttyACM0.

Configuring Pixhawk Autopilot
-----------------------------

For APM users
"""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on Aero and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
"""""""""""""

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameter SYS_COMPANION and set it to 921600. This would enable communication between FlytOS running on Aero and Pixhawk.
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
