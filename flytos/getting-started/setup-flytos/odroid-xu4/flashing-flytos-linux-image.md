# Flashing FlytOS Linux Image \(Odriod XU4\)

## Flashing FlytOS Linux Image

This section will help you in flashing FlytOS Linux Image on any SD/eMMC card for your ODROID-XU4.

This step requires you to have a registered FlytBase account. In case you don’t have an account, [create a FlytBase Account](../../create-flytbase-account.md) before you proceed.

## Image Download

* [Login](https://my.flytbase.com/) to your FlytBase Account.
* Download the hardware specific [FlytOS Linux Image](https://my.flytbase.com/FlytOS) from your FlytBase account.
* Download size of the image is about 2.5 GB's.
* Check _MD 5 Hash_ to verify the integrity of downloaded file. Since it is a large file, the commands may take a few minutes to complete.

{% tabs %}
{% tab title="Linux" %}
Launch a terminal and execute the following command

```text
$ md5sum <path-to-downloaded-image>/flyt*.img.gz
```
{% endtab %}

{% tab title="Windows" %}
Launch a command window and execute the following command

```text
$ CertUtil -hashfile <path-to-downloaded-image>/flyt*.img.gz MD5
```
{% endtab %}

{% tab title="Mac OS" %}
Launch a terminal and execute the following command

```text
$ md5 <path-to-downloaded-image>/flyt*.img.gz
```
{% endtab %}
{% endtabs %}

*  Compare the MD 5 Hash generated to _MD 5 Hash_ mentioned in the [FlytOS Linux Image](https://my.flytbase.com/FlytOS) download page.
* Uncompress/extract the downloaded image.

## Image write to SD/eMMC Card

We recommend using [Etcher](https://www.balena.io/etcher/) for burning images to SD/eMMC cards. To burn an image to your SD/eMMC card:

* Download Etcher for your Operating System \(OS X, Linux, Windows\).
* On opening you will be greeted with the following screen.

![Etcher Main Menu](../../../../.gitbook/assets/etcher_tut_1.png)

* Select your downloaded image.
* Choose the boot-able drive \(SD/eMMC Card\) to burn the image onto \(Please note that Etcher detects pen drives as boot-able disks so proceed with caution\).

![Etcher : Select the FlytOS image](../../../../.gitbook/assets/etcher_tut_2.png)

*  Click on **Flash**.

![Etcher: Click on Flash](../../../../.gitbook/assets/etcher_tut_3.png)

Etcher will burn the image onto the SD/eMMC card and verify the image. Remove the SD card after you get the prompt.

{% hint style="warning" %}
**Warning:** Etcher will burn the image onto the SD/eMMC card and verify the image. Remove the SD card after you get the prompt.
{% endhint %}

After performing the above steps, your FlytOS SD Card/eMMC is ready. Insert the card in ODROID-XU4’s SD Card/eMMC slot and apply power to it to start booting FlytOS.

## Partition Expansion

The image is around 11.5 GB in size, thus the rest of the SD Card would have unallocated space. As this limits the available user area it is advised to extend your partition on your **first boot up**.

To extend your partition to cover your full SD card:

* Run the following command from terminal

  ```text
  $ sudo resize_flytimage
  ```

* On successful execution you will get the following output

  ```text
  Ok, Partition resized, please reboot now
  Once the reboot is completed please run this script again
  ```

* At this point please run the following to reboot your system

  ```text
  $ sudo reboot
  ```

* On successful reboot please run the command again

  ```text
  $ sudo resize_flytimage
  ```

* Your partition has been extended to cover your full SD Card and is now ready to use.

## User Credentials

All FlytOS Linux Image versions have the same Login user credentials:

> **username : flytos**  
>  **password : flytos**

## Now let's get back Installation Guide

{% page-ref page="./" %}

