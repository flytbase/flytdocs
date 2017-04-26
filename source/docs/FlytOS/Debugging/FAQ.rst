.. _faq_troubleshooting:

FAQs 
====

.. _cannot_login_to_device_after_image_write:

**Not able to login after boot due to out of memory error after making a FlytOS sdcard**

Make sure you have not skipped the important step of expanding the root partition after flashing your sdcard/eMMC. Read the tutorial for your specific hardware again and make sure you completed every step.


**FlytConsole shows connected and disconnected again and again**

Obtain the startup log by following :ref:`these steps<forum_startup_log>`. If in the log you see mavros process is getting killed repeatedly, make sure that your companion computer is connected to a Pixhawk properly ads described in the hardware guide. Also make sure that you have configured Pixhawk parameters appropriately.

.. _core_api_not_found:

**Errors like "core_api not found", "ros/ros.h not found" in FlytOS startup log**

Make sure you have these following lines amongst the last few lines in ``/etc/bash.bashrc`` file. If you don't, add the missing lines, save the file (you will need sudo permission to edit) and them reboot your device.

.. code-block:: bash

  export CPATH=$CPATH:/opt/ros/kinetic/include
  source /opt/ros/kinetic/setup.bash
  export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
  source /flyt/flytos/flytcore/setup.bash

Also make sure you DO NOT have any of the above lines in the ``~/.bashrc`` file. If the lines are present, remove them, save the file and reboot the device. 

.. _change_baudrate_or_portname:

**Need to change the baudrate/port of Flight Control Unit(Pixhawk)**

To use your FCU/Pixhawk on another port, open the following file on your Companion Computer: ``/flyt/flytos/flytcore/share/core_api/launch/core_api_autopilot.launch``  and edit the the line starting with ``<arg name="fcu_url" value`` appropriately. For e.g.  If you want to use a USB to UART module to connect to Pixhawk's TELEM2 and your module shows up as /dev/ttyUSB0 on your Companion Computer and Pixhawk's baudrate is 921600. Edit the above line to be: ``<arg name="fcu_url" value="/dev/ttyUSB0:921600" />``.

.. _flytos_dependency:

**I am facing FlytOS related dependency issues**

Run the following commands on your Companion Computer to install all FlytOS dependencies.

.. literalinclude:: include/flytos_dependency.sh
   :language: bash

.. _autodetect_px4_apm:

**How do I figure out that FlytOS has autodetected my apm/px4 stack correctly**

Open up ``flytconsole`` and check for either ``PX4`` or ``Ardupilot`` logo at top right corner. If FlytOS is not being able to detect autopilot stack correctly:

* Make sure you have installed all the dependencies mentioned :ref:`here <flytos_dependency>` successfully.
* If the problem still persists, make sure *portname* and *baudrate* is correctly configured in the file ``/flyt/flytos/flytcore/share/core_api/launch/core_api_autopilot.launch``. For more information on this :ref:`click here <change_baudrate_or_portname>`.
* Open up ``/flyt/logs/startup/flyt_startup.log``, and check the first couple of lines for debug messages.
