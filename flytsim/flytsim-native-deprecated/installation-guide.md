# Installation Guide

* Please ensure you are running Linux - Ubuntu 16.04 before proceeding with installation.

{% hint style="warning" %}
**Warning:** Please make sure you have a stable internet connection. Save and close all open applications before executing the script as your system shall reboot on installation.
{% endhint %}

* Open terminal and run the following command

  ```text
  $ sudo bash -c 'curl -sSL http://docs.flytbase.com/_static/Downloads/flytSim_installation.sh | bash -e'
  ```

  In case you get an error saying curl: command not found, please run the following command

  ```text
  $ sudo bash -c 'wget -O - http://docs.flytbase.com/_static/Downloads/flytSim_installation.sh | bash -e'
  ```

* Please enter your system password when prompted
* On successful installation you will get the message **Congratulations! FlytOS installation completed** and your system shall reboot.

{% hint style="warning" %}
Warning:  You must [activate your device](installation-guide.md#activate-flytsim), without which critical APIs will not function.
{% endhint %}

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

## Activate FlytSim

{% hint style="info" %}
**Note:** This step requires you to have a registered FlytBase Account. In case you don’t have an account, [create a FlytBase Account](../../flytos/getting-started/create-flytbase-account.md) before you proceed.
{% endhint %}

You have to activate installed FlytSim, without which critical APIs will not function.

* Make sure your machine has internet access before proceeding.
* [Launch FlytSim](how-to-launch.md#launch-flytsim) and ignore warnings thrown in the terminal for license not being activated.
* [Launch FlytConsole](http://localhost/flytconsole). You can launch FlytConsole in your browser using the URL `http://localhost/flytconsole` or on some other PC’s browser using the URL `http://ip-address-of-device/flytconsole`. In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
* Choose a device nick-name and select your compute engine.
* In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
* Click on Save Changes to register device and generate a license key.
* Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

## Update FlytSim

FlytSim comes with automatic over-the-air update feature whenever it detects an updated version of FlytSim in our servers. To know more about automatic updates, click [here](../../flytos/getting-started/flytos-updates.md).

