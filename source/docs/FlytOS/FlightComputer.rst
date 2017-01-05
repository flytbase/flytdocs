

Preparing your Flight Computer
==============================

Installing FlytOS on Raspberry Pi3
----------------------------------

* **Image Download** : Download the FlytOS for RPi3 image from this link : https://drive.google.com/file/d/0B2IXB8LxWs-qMjFsVlRHSnpzS3M/view?usp=sharing
It is about 2.7 GBs in size compressed (md5sum 3355a1ea968ede3d7571452fa19b2e05) and ~ 7.9 GBs uncompressed. Uncompress the file using the following command in your terminal:
gunzip pi_flytimage.img.gz 

* **Image Write to SD Card** : Format a micro sd card (we recommend using a 32 GB sdcard, but a 16 GB card would work fine too). Follow these instructions to copy the image on to the sdcard/emmc: https://www.raspberrypi.org/documentation/installation/installing-images/linux.md

* **Expand SD Card** : Since the image is only 7.9 GBs, the rest of the sdcard would have unallocated memory. Follow this guide to expand the partion to the maximum possible size to utilize all memory: http://elinux.org/RPi_Resize_Flash_Partitions

* **Download latest version of FlytOS** : We highly recommend you to update the FlytOS version on your Rpi3. Download new debian from the following link: 
https://drive.google.com/file/d/0B2IXB8LxWs-qUkM1UUM0ME5kVTA/view?usp=sharing

* **Install FlytOS** : Install it by running the following command in your RasPi’s terminal:
$ sudo dpkg -i flytcore_0.7-4b_armhf.deb

* Insert the sd card in RPi3 and apply power to boot it. By default a wifi access point is created on the Pi with following credentials:
Ssid:           Flytpod_wifi
Password:   FlytPOD12#

Connect to the access point on another computer. Open the following link in your browser to view flytconsole:
10.42.0.1:9090/flytconsole



