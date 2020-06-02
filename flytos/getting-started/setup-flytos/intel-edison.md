# Intel Edison

FlytOS Linux Image is based on the latest stable release of Debian ‘stretch’. This image comes pre-installed with ROS-Kinetic and FlytOS.

## Flashing FlytOS Image

{% hint style="info" %}
**Note:** Due to the large number of steps involved in installing dependencies for FlytOS on Intel Edison, the only recommended method to use FlytOS on Intel Edison is using the FlytOS Linux Image.
{% endhint %}

This section will help you in flashing FlytOS Linux Image on your Intel Edison Board.

This step requires you to have a registered FlytBase account. In case you don’t have an account, [create a FlytBase Account](../create-flytbase-account.md) before you proceed.

## Image Download

* [Login](https://my.flytbase.com/) to your FlytBase Account.
* Download the hardware specific [FlytOS Linux Image](https://my.flytbase.com/FlytOS) from your FlytBase account.
* Download size of the image is about 2.5 GB's.
* Check _MD 5 Hash_ to verify the integrity of downloaded file. Since it is a large file, the commands may take a few minutes to complete

Launch a terminal and execute the following command

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

* Compare the MD 5 Hash generated to _MD 5 Hash_ mentioned in the [FlytOS Linux Image](https://my.flytbase.com/FlytOS) download page. 
* Uncompress/extract the downloaded image:

## Image flash

{% hint style="info" %}
**Note:** This step is exactly similar to the standard method of flashing Intel Edison board. The following guide is ONLY for Linux users. Windows users could follow [this](https://software.intel.com/en-us/flashing-firmware-on-your-intel-edison-board-windows) and MacOS users could use [this guide](https://software.intel.com/en-us/node/637974#manual-flash-process).
{% endhint %}

* Unzip the downloaded file flyt\*.zip to any location.
* Plug a USB cable into the USB port labeled OTG.
* Open a terminal window and navigate to the extracted folder: toFlashflytos.
* Run the command: `sudo ./flashall.sh`. If you receive an `dfu-util: command not found` error, you can install dfu-util by running `sudo apt-get install dfu-util`.

## User Credentials

All FlytOS Linux Image versions have the same Login user credentials:

> **username - flytos  
> password - flytos**

{% hint style="info" %}
**Note:** Intel Edison will boot up with its WiFi configured as Access Point.
{% endhint %}

## WiFi Access Point

After flashing FlytOS Linux Image in your Intel Edison, WiFi access point is created on the device on system startup with following credentials:

ssid: EDISON-XX-XX \(XX-XX will be replaced by string unique to your device\)

Password: flytos12\#

Connect to the access point on another computer. Open the following link in your browser to view [FlytConsole](../../../about-flytconsole/flytconsole.md): [http://192.168.42.1/flytconsole](http://192.168.42.1/flytconsole).

## WiFi in Client Mode

By default Edison will be configured in Hotspot or AP mode. Follow these steps to get internet access or to configure it in client mode.

* Disable hostapd service from running on next reboot.

  ```text
  $ sudo systemctl disable hostapd
  ```

* Open up /etc/network/interfaces file. Default content of the file would be:

  ```text
  # interfaces(5) file used by ifup(8) and ifdown(8)
  # Include files from /etc/network/interfaces.d:
  #source-directory /etc/network/interfaces.d

  auto lo
  iface lo inet loopback

  #auto usb0
  iface usb0 inet static
      address 192.168.2.15
      netmask 255.255.255.0

  #auto wlan0
  #iface wlan0 inet dhcp
      # For WPA
      #wpa-ssid Emutex
      #wpa-psk passphrase
      # For WEP
      #wireless-essid Emutex
      #wireless-mode Managed
      #wireless-key s:password
      dns-nameservers 8.8.8.8 8.8.4.4

  # And the following 4 lines are for when using hostapd...
  iface wlan0 inet static
      address 192.168.42.1
      netmask 255.255.255.0
  ```

* Comment out all the lines under section `# And the following 4 lines are for` `when using hostapd...` and un-comment the following four lines:

  ```text
  auto wlan0
  iface wlan0 inet dhcp
      # For WPA
      wpa-ssid Emutex
      wpa-psk passphrase

  Replace 'Emutex' and 'passphrase' according to the router you want edison to connect to.
  ```

* Reboot the Edison for the changes to take effect.

## Activate FlytOS

{% hint style="info" %}
**Note:** This step requires you to have a registered FlytBase Account. In case you don’t have an account, [create a FlytBase Account](../create-flytbase-account.md) before you proceed.
{% endhint %}

You have to activate installed FlytOS, without which critical APIs would not function.

* Make sure your Edison has internet access before proceeding.
* [Launch FlytConsole](../../../about-flytconsole/flytconsole.md). You can launch FlytConsole on your PC’s browser using the URL `http://ip-address-of-device/flytconsole` .
* In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
* Choose a device nick-name and select your compute engine.
* In license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
* Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
* Click on Save Changes to register device and generate a license key.
* Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

## Hardware Setup

### Telemetry Connection

FlytOS needs telemetry data from autopilot\(Pixhawk\). Connect Pixhawk’s Telemetry port to Intel Edison.

* **\[Recommended\]** Connect Pixhawk’s Telem2 port to Edison’s UART port\(ttyMFD1\) using J18/13\(RX\) and J19/8\(TX\) \(refer page-7 of [edison hardware guide](http://download.intel.com/support/edison/sb/edisonbreakout_hg_331190006.pdf) for connections\). If you are using Pixhawk2.1, this connection is already made available.
* Connect Pixhawk’s micro-USB to the USB port of Edison.
* Connect Pixhawk’s Telem2 port to the USB port of Edison using UART-USB converter.

![Connection between Edison&#x2019;s ttyMFD1 uart port and Pixhawk&#x2019;s TELEM 2](../../../.gitbook/assets/edison_pixhawk.jpg)

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

