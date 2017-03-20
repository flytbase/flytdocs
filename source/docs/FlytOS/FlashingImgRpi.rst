.. _flashing_img_rpi:

Flashing FlytOS Linux Image (RPi3)
==================================

This section will help you in flashing FlytOS Linux Image on any SD card for your Raspberry Pi 3. 
This step requires you to have a registered FlytBase account. In case you don't have an account, :ref:`create a FlytBase Account<create_flytbase_account>` before you proceed.


Image download:
^^^^^^^^^^^^^^^
.. |my_flytbase_link| raw:: html

   <a href="http://my.flytbase.com" target="_blank">Login</a>

.. |flytos_dl_link| raw:: html

   <a href="http://my.flytbase.com/FlytOS" target="_blank">FlytOS Linux Image</a>

1. |my_flytbase_link| to your FlytBase Account.
2. Download the hardware specific |flytos_dl_link| from your FlytBase account.
3. Download size of the image is about 2.5 GBs.
4. Check *MD5 Hash* to verify the integrity of downloaded file. Since it is a large file, the commands may take a few minutes to complete:

   * Linux- launch a terminal and execute the following command 
   
   .. code-block:: bash
    
       $ md5sum <path-to-downloaded-image>/flyt*.img.gz
   
   * Windows- launch a command window and execute the following command 

   .. code-block:: bash
    
       $ CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5

   * Mac OS- launch a terminal and execute the following command 
   
   .. code-block:: bash
       
       $ md5 <path-to-downloaded-image>/flyt*.img.gz

5. Compare the MD5 Hash generated to *MD5 Hash* mentioned in the |flytos_dl_link| download page.
6. Uncompress/extract the downloaded image:

   * Linux- launch a terminal and execute the following command 
     
     .. code-block:: bash
         
         gunzip <path-to-downloaded-image>/flyt*.img.gz

   * Windows- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
   * Mac OS- launch a terminal and execute the following command 
     
     .. code-block:: bash

         gunzip <path-to-downloaded-image>/flyt*.img.gz

7. Uncompressed size of image is about 8.5GBs.
      
Image write to SD/eMMC Card and partition expansion:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. 1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too. 
.. 2. Format the micro SD Card.
.. 3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.


.. **Expanding SD Card partition:**

.. Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partition to the maximum possible size to utilize all memory.

We have created a video tutorial for Linux and Mac OS users, to help flash FlytOS Linux Image on their SD/eMMC cards and then expand the partition. Windows users can refer `this guide <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ for writing image and Windows Disk Management Utility to expand the SD/eMMC card.

.. warning:: Since the image is of only around 8.5 GBs, the rest of the SD/eMMC Card would have unallocated memory. DONOT forget to expand SD/eMMC card partition.


|br|

..  youtube:: jyFvzluXzug
    :aspect: 16:9
    :width: 80%


|br|

After performing the above steps, your FlytOS SD Card is ready. Insert the card in Raspberry Pi's SD Card slot and apply power to the Pi to start booting FlytOS.


WiFi Setup
^^^^^^^^^^^

* Insert the SD Card in your Raspberry Pi 3 after flashing :ref:`FlytOS Linux image<flashing_img_rpi>` on it and apply power to boot it. On boot up a WiFi access point is created on the device with following credentials:
ssid:       FlytPOD_wifi

Password:   FlytPOD123

Connect to the access point on another computer. Open the following link in your browser to view :ref:`FlytConsole<about flytconsole>`: http://10.42.0.1/flytconsole


User Credentials
^^^^^^^^^^^^^^^^

All FlytOS Linux Image versions have the same Login user credentials: **username - flytpod & password - flytpod**

.. note:: RaspberryPi3 will boot up with its wifi configured as Access Point. For more details, check :ref:`here<raspi_wifiap>`.

|br|

:ref:`Go back to the installation guide <rpi_guide>`


.. |br| raw:: html

   <br />

