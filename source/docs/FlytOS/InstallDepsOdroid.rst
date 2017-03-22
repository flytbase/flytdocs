.. _install_dependencies_odroid:

Installing FlytOS dependencies in your custom image (Odroid-XU4)
=================================================================


.. warning:: Follow this step ONLY if you have chosen to NOT TO flash :ref:`FlytOS Linux Image <flashing_img_odroid>`.

.. note:: You have to perform all the steps below on your FlytPOD/PRO. 

This guide assumes you already have a working image for your Flight Computer. We would lay down steps to install dependencies and configure your device for FlytOS.

1. List of FlytOS dependencies to be installed in your Flight Computer:

   a) Linux - Ubuntu 16.04
   b) `ROS - Kinetic <http://wiki.ros.org/kinetic/Installation/Ubuntu>`_ (install *ros-kinetic-desktop* package)
   c) `OpenCV 2.4 <http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html>`_ (for vision/video streaming APIs).
   d) Other dependencies - To install run the following commands in your terminal.

   .. literalinclude:: include/flytos_dependency.sh
      :language: bash   
 
.. 2. You have to update some kernel modules for video streaming to work properly. Run the following script as root or run each command with sudo permission.
   
..    .. literalinclude:: include/kernel_module_update.sh
..       :language:  bash  

2. Before proceeding further, add the following lines at the end of your /etc/bash.bashrc file. To open the file for editing, run the following command the terminal ``sudo nano /etc/bash.bashrc`` and to save your edited file, press ``ctrl+o+ENTER`` and to exit press ``ctrl+x``.

   .. code-block:: bash
   
       source /opt/ros/kinetic/setup.bash
       export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
       source /flyt/flytos/flytcore/setup.bash

3. Run the following additional command in your terminal:

   .. code-block:: bash
   
       sed -i 's/source \/opt\/ros\/kinetic\/setup.bash//g' ~/.bashrc
       
.. _installing_flytos_odroid:


Installing FlytOS debian package
--------------------------------

.. note:: This step requires you to have a registered FlytBase Account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed. 

Once you have installed the latest FlytOS Linux Image, you **MUST update your FlytOS debian package** by following the steps below:

1. `Login <https://my.flytbase.com>`_ to your FlytBase Account.
2. Download the hardware specific `FlytOS Debian Package <https://my.flytbase.com/FlytOS>`_ from your FlytBase Account.
3. Install some dependencies - To install run the following commands in your terminal.

   .. literalinclude:: include/flytos_dependency.sh
      :language: bash	

4. Once you have downloaded the Debian package, run the following command in your terminal to install FlytOS: 
   
.. code-block:: bash
   
   #make sure to provide absolute path of the debian package file: /home/flytpod/flytos_*.deb
   $ sudo apt install -y <path to debian package location>/flytos_*.deb 

4. Check for **Congratulations! FlytOS installation completed** message at the end.
5. Just in case you see any dependency issues cropping up in your screen while installing FlytOS, kindly run the following command and execute the previous command again:
   
.. code-block:: bash
   
   $ sudo apt -f -y install

.. caution:: You must :ref:`activate your device<activate_flytos_odroid>`, without which critical APIs would not function.

:ref:`Go back to the installation guide <odroid_guide>`