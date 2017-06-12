.. _flashing_img_odroid:

Flashing FlytOS Linux Image (Odroid-XU4)
========================================

Flashing FlytOS Linux Image
^^^^^^^^^^^^^^^^^^^^^^^^^^^

This section will help you in flashing FlytOS Linux Image on any SD/eMMC card for your ODROID-XU4.

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
6. Uncompress/extract the downloaded image:

   * **Linux**- launch a terminal and execute the following command

     .. code-block:: bash

         gunzip <path-to-downloaded-image>/flyt*.img.gz

   * **Windows**- download and install 7-zip from `here <http://www.7-zip.org/download.html>`_. Extract downloaded image using 7-zip.
   * **Mac OS**- launch a terminal and execute the following command

     .. code-block:: bash

         gunzip <path-to-downloaded-image>/flyt*.img.gz

7. Uncompressed size of image is about 11.5GBs.

Image write to SD/eMMC Card
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. 1. We recommend using a 32 GB SD Card, but a 16 GB card would work fine too.
.. 2. Format the micro SD Card.
.. 3. Follow `this <http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ guide to install the image on ODROID-XU4’s SD/eMMC card.


.. **Expanding SD Card partition:**

.. Since the image is only around 8.5 GBs, the rest of the SD Card would have unallocated memory. Follow `this guide <http://elinux.org/RPi_Resize_Flash_Partitions>`_ to expand the partition to the maximum possible size to utilize all memory.

.. We have created a video tutorial for Linux and Mac OS users, to help flash FlytOS Linux Image on their SD/eMMC cards and then expand the partition. Windows users can refer `this guide http://odroid.com/dokuwiki/doku.php?id=en:odroid_flashing_tools>`_ for writing image and Windows Disk Management Utility to expand the SD/eMMC card.

We recommend using |etcher_link| for burning images to SD/eMMC cards.
To burn an image to your SD/eMMC card:

1. Download Etcher for your Operating System (OS X, Linux, Windows).

2. On opening you will be greeted with the following screen.

    .. image:: /_static/Images/etcher_tut_1.png

3. Select your downloaded **uncompressed** image.

4. Choose the bootable drive (SD/eMMC Card) to burn the image onto (Please note that Etcher detects pendrives as bootable disks so proceed with caution).

    .. image:: /_static/Images/etcher_tut_2.png

5. Click on **Flash**.

    .. image:: /_static/Images/etcher_tut_3.png

Etcher will burn the image onto the SD/eMMC card and verify the image. Remove the SD card after you get the prompt.

.. warning:: Since the image is of only around 11.5 GBs, the rest of the SD/eMMC Card would have unallocated memory. DO NOT forget to expand SD/eMMC card partition.

Users more comfortable with *gparted* can refer to the following video tutorial to help flash FlytOS Linux Image on their SD/eMMC cards and then expand the partition.

|br|

..  youtube:: jyFvzluXzug
    :aspect: 16:9
    :width: 80%


|br|

After performing the above steps, your FlytOS SD Card/eMMC is ready. Insert the card in ODROID-XU4’s SD Card/eMMC slot and apply power to it to start booting FlytOS.

Partition Expansion
^^^^^^^^^^^^^^^^^^^

The image is around 11.5 GB in size, thus the rest of the SD Card would have unallocated space. As this limits the available user area it is advised to extend your partition on your **first boot up**.

To extend your partition to cover your full SD card:

* Run the following command from terminal

  .. code-block:: bash

      $ sudo resize_flytimage

* On successful execution you will get the following output

  .. code-block:: bash

      Ok, Partition resized, please reboot now
      Once the reboot is completed please run this script again

* At this point please run the following to reboot your system

  .. code-block:: bash

      $ sudo reboot

* On successful reboot please run the command again

  .. code-block:: bash

      $ sudo resize_flytimage

* Your partition has been extended to cover your full SD Card and is now ready to use.




User Credentials
^^^^^^^^^^^^^^^^


All FlytOS Linux Image versions have the same Login user credentials:

| **username : flytos**
| **password : flytos**

:ref:`Go back to the installation guide <odroid_guide>`

.. |br| raw:: html

   <br />
