.. _flashing_img_rpi:

Flashing FlytOS Linux Image (RPi3)
==================================

This section will help you in flashing FlytOS Linux Image on any SD card for your Raspberry Pi 3.
This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.


Image download
^^^^^^^^^^^^^^
.. |my_flytbase_link| raw:: html

   <a href="https://my.flytbase.com" target="_blank">Login</a>

.. |flytos_dl_link| raw:: html

   <a href="https://my.flytbase.com/FlytOS" target="_blank">FlytOS Linux Image</a>

.. |etcher_link| raw:: html

   <a href="https://etcher.io/" target="_blank">Etcher</a>

1. |my_flytbase_link| to your FlytBase Account.
2. Download the hardware specific |flytos_dl_link| from your FlytBase account.
3. Download size of the image is about 2.5 GBs.
4. Check *MD5 Hash* to verify the integrity of downloaded file. Since it is a large file, the commands may take a few minutes to complete:

   * **Linux**- launch a terminal and execute the following command

     .. code-block:: bash

         $ md5sum <path-to-downloaded-image>/flyt*.img.gz

   * **Windows**- launch a command window and execute the following command

     .. code-block:: bash

         $ CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5

   * **Mac OS**- launch a terminal and execute the following command

     .. code-block:: bash

         $ md5 <path-to-downloaded-image>/flyt*.img.gz

5. Compare the MD5 Hash generated to *MD5 Hash* mentioned in the |flytos_dl_link| download page.
.. 6. Uncompress/extract the downloaded image:

..    * **Linux**- launch a terminal and execute the following command

..      .. code-block:: bash

..          gunzip <path-to-downloaded-image>/flyt*.img.gz

..    * **Windows**- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
..    * **Mac OS**- launch a terminal and execute the following command

..      .. code-block:: bash

..          gunzip <path-to-downloaded-image>/flyt*.img.gz

.. 7. Uncompressed size of image is about 8.5GBs.

Image write to SD Card
^^^^^^^^^^^^^^^^^^^^^^

.. 1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too.
.. 2. Format the micro SD Card.
.. 3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.


.. **Expanding SD Card partition:**

.. Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partition to the maximum possible size to utilize all memory.

.. We have created a video tutorial for Linux and Mac OS users, to help flash FlytOS Linux Image on their SD/eMMC cards and then expand the partition. Windows users can refer `this guide <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ for writing image and Windows Disk Management Utility to expand the SD/eMMC card.

We recommend using |etcher_link| for burning images to SD/eMMC cards.
To burn an image to your SD/eMMC card:

1. Download Etcher for your Operating System (OS X, Linux, Windows).

2. On opening you will be greeted with the following screen.

    .. image:: /_static/Images/etcher_tut_1.png

.. 3. Select your downloaded **uncompressed** image.

3. Select your downloaded image.

4. Choose the bootable drive (SD/eMMC Card) to burn the image onto (Please note that Etcher detects pendrives as bootable disks so proceed with caution).

    .. image:: /_static/Images/etcher_tut_2.png

5. Click on **Flash**.

    .. image:: /_static/Images/etcher_tut_3.png

Etcher will burn the image onto the SD/eMMC card and verify the image. Remove the SD card after you get the prompt.

After performing the above steps, your FlytOS SD Card is ready. Insert the card in Raspberry Pi's SD Card slot and power ON the Pi to start booting FlytOS.

.. warning:: Since the image is of only around 11.5 GBs, the rest of the SD/eMMC Card would have unallocated memory. DO NOT forget to expand SD/eMMC card partition.

Partition Expansion on Raspberry Pi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After you burn the Raspberry Pi FlytOS image, the rest of the SD Card has unallocated space. As this limits the available user area it is advised to extend your partition on your **first boot up**.

To extend your partition to cover your full SD card, execute the following steps.

You will need to connect your Raspberry Pi to the internet. As the internal WiFi is being used as an Access Point, internet can be provided through either an ethernet cable or through the USB port by connecting a WiFi dongle or using an Android phone in USB Tethering mode.

* Run the following command in system terminal

  .. code-block:: bash

      $ sudo apt-get update

* Download raspi-config

  .. code-block:: bash

      $ sudo apt-get install raspi-config

* On successful installation of raspi-config run

  .. code-block:: bash

      $ sudo raspi-config --expand-rootfs

* After execution you will be asked to reboot your system

  .. code-block:: bash

      $ sudo reboot

* On restart your partition has will be extended to cover your full SD Card and is now ready to use.

WiFi Setup
^^^^^^^^^^

Insert the SD Card in your Raspberry Pi 3 after flashing :ref:`FlytOS Linux image<flashing_img_rpi>` on it and apply power to boot it. On boot up a WiFi access point is created on the device with following credentials:

| ssid:       flytos_WiFi
| Password:   flytos123

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://10.42.0.1/flytconsole


User Credentials
^^^^^^^^^^^^^^^^

All FlytOS Linux Image versions have the same Login user credentials:

| **username : flytos**
| **password : flytos**

|br|

:ref:`Go back to the installation guide <rpi_guide>`


.. |br| raw:: html

   <br />
