# Intel Aero Compute Board

## Installing FlytOS

{% hint style="danger" %}
Caution: Intel Aero Compute board currently supports only the Yocto Linux distribution. Since FlytOS is only supported on Ubuntu/Debian based Linux distros, you will have to re-flash the operating system. This may void your Aero Board’s warranty so we recommend users to use their discretion while installing FlytOS on the board. Flytbase does not take any responsibility and is free from any liability caused by following these instructions to install Ubuntu on Intel Aero Board.
{% endhint %}

* First create an Ubuntu 16.04 bootable USB drive by following [these instructions](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu). Connect the USB drive to the Aero Board using a micro USB OTG cable. You may also want to use a USB hub to attach a keyboard and mouse to the Board. Then power up the Aero board and press escape while it boots up to enter the BIOS menu. Select the option to boot from your USB drive. Then follow [these instructions](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop) to install Ubuntu on the board.
* Please ensure you are running Linux - Ubuntu 16.04 before proceeding with installation. This guide assumes you already have a working operating system on your Flight Computer. The following commands should be executed on your flight computer, you may either use an external display or ssh into your flight computer.

{% hint style="info" %}
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

## Activate FlytOS

{% hint style="info" %}
**Note:** This step requires you to have a registered FlytBase Account. In case you don’t have an account, [create a FlytBase Account](../create-flytbase-account.md) before you proceed.
{% endhint %}

You have to activate installed FlytOS, without which critical APIs would not function.

* Make sure your Aero Board has internet access before proceeding.
* [Launch FlytConsole](../../../about-flytconsole/flytconsole.md). You can launch FlytConsole in your Aero’s browser using the URL `http://localhost/flytconsole` or on your PC’s browser using the URL `http://ip-address-of-device/flytconsole` .
* In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
* Choose a device nick-name and select your compute engine.
* In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
* Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
* Click on Save Changes to register device and generate a license key.
* Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

## Hardware Setup

### Telemetry Connection

FlytOS needs telemetry data from autopilot\(Pixhawk\). Connect the Pixhawk autopilot board’s USB port on the side to Aero’s USB port. The Pixhawk will be visible on Aero by the device name /dev/ttyACM0.

### Configuring Pixhawk Autopilot

{% tabs %}
{% tab title="For APM users" %}
* Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) on your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable APM release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameters **SERIAL2\_BAUD** and **SERIAL2\_PROTOCOL**, set them to **921** and **1** respectively. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
* Configure a dedicated switch position for `GUIDED MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `GUIDED MODE`.
{% endtab %}

{% tab title="For PX4 users" %}
* Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) on your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable PX4 release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameter **SYS\_COMPANION** and set it to 921600. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
* Configure a dedicated two way switch for `OFFBOARD MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `OFFBOARD MODE`.
{% endtab %}
{% endtabs %}

## **Now Let's move on to the Next step:**

{% page-ref page="../supported-gcs.md" %}

