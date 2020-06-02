# Installing FlytOS dependencies in your custom image

## Installing FlytOS dependencies on custom image

{% hint style="warning" %}
 **Warning:** You may face issues in FlytOS due to the latest update in Open-CV Library. It is currently advised to use FlytOS through flashing [FlytOS Linux Image](flashing-flytos-linux-image.md).
{% endhint %}

{% hint style="info" %}
**Note:** Follow this step ONLY if you have chosen NOT TO flash [FlytOS Linux Image](flashing-flytos-linux-image.md).
{% endhint %}

* Please ensure you are running Linux - Ubuntu 16.04 before proceeding with installation. This guide assumes you already have a working operating system on your Flight Computer. The following commands should be executed on your flight computer, you may either use an external display or ssh into your flight computer.

{% hint style="warning" %}
**Warning:** Please make sure you have a stable internet connection. Save and close all open applications before executing the script as your system shall reboot on installation.
{% endhint %}

* Open terminal and run the following command

1. ```text
   $ sudo sh -c 'curl -sSL https://downloads.flytbase.com/flytos/install/flytOS.sh | bash'
   ```

   In case you get an error saying curl: command not found, please run the following command

   ```text
   $ sudo sh -c 'wget -O - https://downloads.flytbase.com/flytos/install/flytOS.sh | bash'
   ```

* Please enter your system password when prompted
* On successful installation you will get the message **Congratulations! FlytOS installation completed** and your system shall reboot.

## Troubleshooting

* If the installation script throws an error, please reboot and try again.
* If you get the error “Connection Timed Out”: Please check your internet connection and run the script again.
* If the script is interrupted during execution, try running the following command before you execute the script again

  ```text
  $ sudo dpkg --configure -a
  ```

* If the above command does not work, run the following to fix your packages before running the installation script

  ```text
  $ sudo apt-get upgrade --fix-broken
  ```

{% hint style="danger" %}
**Caution:** You must [activate your device](./#activate-flytos), without which critical APIs would not function.
{% endhint %}

## Now let's get back Installation Guide

{% page-ref page="./" %}

