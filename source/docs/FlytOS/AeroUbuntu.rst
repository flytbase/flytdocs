Installing Ubuntu 16.04 on Intel Aero
=====================================

.. _aero_ubuntu:

Intel Aero Compute board currently supports only the Yocto Linux distribution. Since FlytOS is only supported on Ubuntu/Debian based Linux distros, you will have to re-flash the operating system. This may void your Aero Board's warranty so we recommend users to use  their discretion while installing FlytOS on the board. Flytbase does not take any responsibility and is free from any liability caused by following these instructions to install Ubuntu on Intel Aero Board.

First create an Ubuntu 16.04 bootable USB drive by following `these instructions <https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu>`_ . Connect the USB drive to the Aero Board using a micro USB OTG cable. You may also want to use a USB hub to attach a keyboard and mouse to the Board. Then power up the Aero board and press escape while it boots up to enter the BIOS menu. Select the option to boot from your USB drive.	Then follow `these instructions <https://www.ubuntu.com/download/desktop/install-ubuntu-desktop>`_ to install Ubuntu on the board. 

Return to :ref:`FlytOS Installation Guide <install_dependencies>` to complete your FlytOS installation.

.. |br| raw:: html

   <br />