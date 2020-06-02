# Installing FlytOS in your custom image \(RPi3\)

## Installing FlytOS dependencies on custom image \(RPI 3\)

{% hint style="warning" %}
 **Warning:** You may face issues in FlytOS due to the latest update in OpenCV Library. It is currently advised to use FlytOS through flashing [FlytOS Linux Image](http://docs.flytbase.com/docs/FlytOS/GettingStarted/FlashingImgRpi.html#flashing-img-rpi).
{% endhint %}

{% hint style="info" %}
 **Note:** step ONLY if you have chosen NOT TO flash [FlytOS Linux Image](http://docs.flytbase.com/docs/FlytOS/GettingStarted/FlashingImgRpi.html#flashing-img-rpi).
{% endhint %}

* Please ensure you are running Linux - Ubuntu 16.04 Mate before proceeding with installation. This guide assumes you already have a working operating system on your Flight Computer. The following commands should be executed on your flight computer, you may either use an external display or ssh into your flight computer.

{% hint style="success" %}
**Tip:** To install Ubuntu 16.04 Mate, Raspberry Pi 3B users should refer to [this link](https://ubuntu-mate.org/raspberry-pi/), while 3B+ users should refer to [this link](https://ubuntu-mate.community/t/ubuntu-mate-for-raspberry-pi-3-model-b/15867/10).
{% endhint %}

{% hint style="warning" %}
**Warning:** Please make sure you have a stable internet connection. Save and close all open applications before executing the script as your system shall reboot on installation.
{% endhint %}

* Open terminal and run the following command

```text
$ sudo sh -c 'curl -sSL https://downloads.flytbase.com/flytos/install/flytOS.sh | bash'
```

In case you get an error saying **curl: command not found**, please run the following command

```text
$ sudo sh -c 'wget -O - https://downloads.flytbase.com/flytos/install/flytOS.sh | bash'
```

* Please enter your system password when prompted
* On successful installation you will get the message **Congratulations! FlytOS installation completed** and your system shall reboot.

## Troubleshooting

* If the installation script throws an error, please reboot and try again.
* If you get the error “**Connection Timed Out**”: Please check your internet connection and run the script again.
* If the script is interrupted during execution, try running the following command before you execute the script again

  ```text
  $ sudo dpkg --configure -a
  ```

* If the above command does not work, run the following to fix your packages before running the installation script

  ```text
  $ sudo apt-get upgrade --fix-broken
  ```

{% hint style="danger" %}
Caution: You must [activate your device](./#activate-flytos), without which critical APIs would not function.
{% endhint %}

## WiFi setup

* If you installed FlytOS on a custom image, then you can create your own WiFi access point.
* To access internet on your Raspberry Pi \(for activation, loading maps, auto updates, etc\), you can delete the access point and connect RPi’s WiFi to you home router that has internet access. Beginners can see [this tutorial](https://cdn-learn.adafruit.com/downloads/pdf/adafruits-raspberry-pi-lesson-3-network-setup.pdf) to learn about networking on Raspberry Pi. More advanced users can follow this [networking setup guide](../../../advanced-topics/advanced-networking.md).

## Now let's get back Installation Guide

{% page-ref page="./" %}

