.. _tx1_guide:


Nvidia TX1
==========


.. Preparing your TX1
.. -------------------

.. _install_dependencies_tx1:

Installing FlytOS 
^^^^^^^^^^^^^^^^^

Install Dependencies
""""""""""""""""""""

1. List of FlytOS dependencies to be installed on your Nvidia TX1:

   a) Linux - Ubuntu 16.04. Visit `this link <http://docs.nvidia.com/jetpack-l4t/2_3/index.html#developertools/mobile/jetpack/l4t/2.3/jetpack_l4t_install.htm>`_ to flash your flight computer with the latest Jetpack.
   b) `ROS - Kinetic. <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (install *ros-kinetic-desktop* package) You can refer `this link <http://www.jetsonhacks.com/2016/10/12/robot-operating-system-ros-on-nvidia-jetson-tx1/>`_ for help in installing ros-kinetic-desktop.  

   c) `OpenCV 2.4 <http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html>`_ (for vision/video streaming APIs. Opencv is installed by default if you have flashed Jetpack successfully).
   d) Other dependencies - To install run the following commands in your terminal.

   .. literalinclude:: include/flytos_dependency.sh
      :language: bash   
 
.. 2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
   
..    .. literalinclude:: include/kernel_module_update.sh
..       :language:  bash  

2. Before proceeding further, add the following lines at the end of your /etc/bash.bashrc file. To open the file for editing, run the following command in the terminal ``sudo nano /etc/bash.bashrc`` and to save your edited file, press ``ctrl+o+ENTER`` and to exit press ``ctrl+x``.

   .. code-block:: bash
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash

3. Run the following additional commands in your terminal:

   .. code-block:: bash
   
       sed -i 's/export PATH=/export PATH=\$PATH:/g' ~/.bashrc 
       sed -i 's/export LD_LIBRARY_PATH=/export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/g' ~/.bashrc
       sed -i 's#source /opt/ros/kinetic/setup.bash##g' ~/.bashrc

.. _installing_flytos_tx1:


Installing debian package
"""""""""""""""""""""""""

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed. 

1. `Login <https://my.flytbase.com>`_ to your FlytBase Account.
2. Download the hardware specific `FlytOS Debian Package <https://my.flytbase.com/FlytOS>`_ from your FlytBase Account.

.. 3. Install some dependencies - To install run the following commands in your terminal.

..    .. literalinclude:: include/flytos_dependency.sh
..       :language: bash	

3. Once you have downloaded the Debian package, run the following command in your terminal to install FlytOS: 
   
.. code-block:: bash
   
   #make sure to provide absolute path of the debian package file: /home/flytpod/flyt*.deb
   $ sudo apt install -y <path to debian package location>/flyt*.deb 

4. Check for **Congratulations! FlytOS installation completed** message at the end.
5. Just in case you see any dependency issues cropping up in your screen while installing FlytOS, kindly run the following command and execute the previous command again:
   
.. code-block:: bash
   
   $ sudo apt -f -y install

.. caution:: You must :ref:`activate your device<activate_flytos_tx1>`, without which critical APIs would not function.

       

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

WiFi Setup
^^^^^^^^^^^

*  To access internet on your TX1 (for activation, loading maps, auto updates, etc), you can connect the WiFi on TX1 to your home's WiFi router that has access to internet.
*  If you want to create a WiFi hotspot on the TX1, follow the steps given in `this post <https://devtalk.nvidia.com/default/topic/910608/jetson-tx1/setting-up-wifi-access-point-on-tx1/post/4893879/#4893879>`_

.. _activate_flytos_tx1:

Activate FlytOS
^^^^^^^^^^^^^^^

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.

You have to activate installed FlytOS, without which critical APIs would not function.

1. Make sure your TX1 has internet access before proceeding. 
2. :ref:`Launch FlytConsole <FlytConsole_launch>`. You can launch FlytConsole in the TX1's browser using the URL ``http://localhost/flytconsole`` or on your PC's browser using the URL ``http://ip-address-of-device/flytconsole`` . In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in. 
3. Choose a device nick-name and select your compute engine. 
4. In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.  
5. Click on Save Changes to register device and generate a license key.
6. Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.


Hardware Setup
^^^^^^^^^^^^^^

Telemetry Connection
""""""""""""""""""""

Connect the Pixhawk autopilot board’s TELEM2 port to TX1’s UART1 port . If you are using the TX1 developer kit carrier board , then the UART1 can be found on the J17 connector. Visit `this link <https://developer.nvidia.com/embedded/dlc/jetson-tx1-developer-kit-carrier-board-spec>`_ (Page 28 Section 3.7) to view the pinout of TX1's J17 connector.

.. figure:: /_static/Images/Tx1_Connection.png
  :align: center 
  :scale: 80 %
  
  Connection between TX1 developer kit's J17 connector and Pixhawk’s TELEM 2

Configuring Pixhawk Autopilot
"""""""""""""""""""""""""""""

For APM users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable APM release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SERIAL2_BAUD and SERIAL2_PROTOCOL, set them to 921 and 1 respectively. This would enable communication between FlytOS running on Nvidia TX1 and Pixhawk.
5. Configure a dedicated switch position for ``GUIDED MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``GUIDED MODE``.

For PX4 users
-------------

1. Install `QGC(QGroundControl) <http://qgroundcontrol.com/>`_ in your local machine.
2. Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
3. Install the latest stable PX4 release in Pixhawk using QGC by following `this <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html>`_ guide.
4. Once done, visit `parameter widget in QGC <https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html>`_ and search for parameters SYS_COMPANION and MAV_COMP_ID, set them to 921600 and 50 respectively. This would enable communication between FlytOS running on Nvidia TX1 and Pixhawk.
5. Configure a dedicated two way switch for ``OFFBOARD MODE`` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to ``OFFBOARD MODE``.

Next Step: :ref:`Supported Ground Control Stations<supported_GCS>`
------------------------------------------------------------------


.. * After completing the above steps, you can now attach various components of you drone to the pixhawk like ESCs, GPS, Radio and other payloads. 
.. * Calibrate the drone's sensors, RC and ESCs in FlytConsole by following the instructions given on the :ref:`FlytConsole page<Motor_config>`.
.. * You are now ready to try some sample FlytOS apps on your drone. A good starting point for beginners is the |github_link|. More documentation can be found in :ref:`Sample Apps section<onboard app>`. Please note, in order to run any onboard app in FlytOS, make sure that your drone is in Offboard/API mode.

.. .. |github_link| raw:: html

..    <a href="https://github.com/flytbase/flytsamples/tree/master/AndroidApps/HTML-JS-Apps/Joystick" target="_blank">Joystick app (Github Link)</a>



.. |br| raw:: html

   <br />
