.. _install_dependencies_odroid:

Installing FlytOS dependencies in your custom image (Odroid-XU4)
=================================================================

.. warning:: You may face issues in FlytOS due to the latest update in OpenCV Library. It is currently advised to use FlytOS through flashing :ref:`FlytOS Linux Image <flashing_img_odroid>`.

.. note:: Follow this step ONLY if you have chosen to NOT flash :ref:`FlytOS Linux Image <flashing_img_odroid>`.

1. Please ensure you are running Linux - Ubuntu 16.04 before proceeding with installation. This guide assumes you already have a working image for your Flight Computer.

.. warning:: Please save and close all open applications before executing the script as your system shall reboot on installation.

2. Open terminal and run the following command

   .. code-block:: bash

       $ sudo bash -c 'curl -sSL http://docs.flytbase.com/_static/Downloads/flytOS_installation.sh | bash'

3. Please enter your system password when prompted

4. On successful installation you will get the message **Congratulations! FlytOS installation completed** and your system shall reboot.

Troubleshooting
---------------

* If you get an error while installation, please reboot and try again.

* If you get the error "Connection Timed Out":
  Please check your internet connection and run the script again.

* If the script is interrupted during execution try running the following command before you execute the script again

  .. code-block:: bash

      $ sudo dpkg --configure -a

* If the above command does not work run the following to fix your packages before running the install script

  .. code-block:: bash

      $ sudo apt-get upgrade --fix-broken


.. 1. List of FlytOS dependencies to be installed in your Flight Computer:
..
..    a) Linux - Ubuntu 16.04
..    b) `ROS - Kinetic <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (install *ros-kinetic-desktop* package)
..    c) `OpenCV 2.4 <http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html>`_ (for vision/video streaming APIs).
..    d) Other dependencies - To install run the following commands in your terminal.
..
..    .. literalinclude:: include/flytos_dependency.sh
..       :language: bash
..
.. .. 2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
..
.. ..    .. literalinclude:: include/kernel_module_update.sh
.. ..       :language:  bash
..
.. 2. Before proceeding further, add the following lines at the end of your /etc/bash.bashrc file. To open the file for editing, run the following command the terminal ``sudo nano /etc/bash.bashrc`` and to save your edited file, press ``ctrl+o+ENTER`` and to exit press ``ctrl+x``.
..
..    .. code-block:: bash
..
..        source /opt/ros/kinetic/setup.bash
..        export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
..        source /flyt/flytos/flytcore/setup.bash
..
.. 3. Run the following additional command in your terminal:
..
..    .. code-block:: bash
..
..        sed -i 's#source /opt/ros/kinetic/setup.bash##g' ~/.bashrc
..
.. .. _installing_flytos_odroid:
..
..
.. Installing FlytOS debian package
.. --------------------------------
..
.. .. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.
..
.. 1. `Login <https://my.flytbase.com>`_ to your FlytBase Account.
.. 2. Download the hardware specific `FlytOS Debian Package <https://my.flytbase.com/FlytOS>`_ from your FlytBase Account.
.. 3. Install some dependencies - To install run the following commands in your terminal.
..
..    .. literalinclude:: include/flytos_dependency.sh
..       :language: bash
..
.. 4. Once you have downloaded the Debian package, run the following command in your terminal to install FlytOS:
..
.. .. code-block:: bash
..
..    #make sure to provide absolute path of the debian package file: /home/flytpod/flyt*.deb
..    $ sudo apt install -y <path to debian package location>/flyt*.deb
..
.. 4. Check for **Congratulations! FlytOS installation completed** message at the end.
.. 5. Just in case you see any dependency issues cropping up in your screen while installing FlytOS, kindly run the following command and execute the previous command again:
..
.. .. code-block:: bash
..
..    $ sudo apt -f -y install

.. caution:: You must :ref:`activate your device<activate_flytos_odroid>`, without which critical APIs would not function.

:ref:`Go back to the installation guide <odroid_guide>`
