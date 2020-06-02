# Raspberry Pi 3B/3B+

## Installing FlytOS

To install FlytOS on Raspberry Pi 3B/3B+, there are 2 ways that you can follow. We recommend the first method for an easier install:

* [Flashing FlytOS Linux Image](flashing-flytos-linux-image-rpi-3b-3b+.md) \[**Recommended method**\]

  OR

* [Installing FlytOS dependencies in your custom image](installing-flytos-in-your-custom-image-rpi3.md)

## Activate FlytOS

{% hint style="info" %}
**Note:**  This step requires you to have a registered FlytBase Account. In case you don’t have an account, [create a FlytBase Account](../../create-flytbase-account.md) before you proceed.
{% endhint %}

You have to activate installed FlytOS, without which critical APIs would not function.

*  Make sure your Raspberry Pi has internet access before proceeding. To access internet on your Raspberry Pi \(for activation, loading maps, auto updates, etc\), you can either connect through a LAN cable from your router, or delete the access point and connect RPi’s WiFi to your home router with internet access. Beginners can see [this tutorial](https://cdn-learn.adafruit.com/downloads/pdf/adafruits-raspberry-pi-lesson-3-network-setup.pdf) to learn about networking on Raspberry Pi. More advanced users can follow this [networking setup guide](../../../advanced-topics/advanced-networking.md).
* Launch FlytConsole. You can launch FlytConsole in the ODROID’s browser using the URL `http://localhost/flytconsole` or on your PC’s browser using the URL `http://ip-address-of-device/flytconsole` . 
* In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
* Choose a device nick-name and select your compute engine.
* In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
* Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
* Click on Save Changes to register device and generate a license key.
* Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

## Hardware Setup For Pixhawk

### Pixhawk Telemetry Connection

Connect the UART RX and TX pins of your Raspberry Pi 3 to the TELEM2 Tx and Rx pins of your Pixhawk as shown below. Click [here](https://pixhawk.org/modules/pixhawk) for more details on Pixhawk.

![RPI 3B/3B+ UART Connection to Pixhawk](../../../../.gitbook/assets/rasppinout.png)

### Configuring Pixhawk Autopilot

{% tabs %}
{% tab title="For APM users" %}
* Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) on your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable APM release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameters **SERIAL2\_BAUD** and **SERIAL2\_PROTOCOL**, set them to **921** and **1** respectively. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
* Configure a dedicated switch position for `GUIDED MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `GUIDED MODE`.

{% hint style="danger" %}
**Caution:** To take manual control of drone from RC, switch the RC Mode to Position Hold-Mode or Atti-Mode
{% endhint %}
{% endtab %}

{% tab title="For PX4 users" %}
* Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) on your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable PX4 release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameter **SYS\_COMPANION** and set it to 921600. This would enable communication between FlytOS running on Raspberry Pi 3 and Pixhawk.
* Configure a dedicated two way switch for `OFFBOARD MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `OFFBOARD MODE`.

{% hint style="danger" %}
**Caution:** To take manual control of drone from RC, switch the RC Mode to Position Hold-Mode or Atti-Mode
{% endhint %}
{% endtab %}
{% endtabs %}

## Hardware Setup For DJI

### DJI Telemetry Connection

{% tabs %}
{% tab title="DJI M100" %}
Connect the UART RX and TX pins of your Raspberry Pi 3 to the UART port Tx and Rx pins of your DJI M100 as shown below. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

![DJI M100 UART Connection](../../../../.gitbook/assets/m100.png)

{% hint style="danger" %}
**Caution:** Do NOT use the Vcc pin to power your own devices. You might damage your onboard computer.
{% endhint %}
{% endtab %}

{% tab title="DJI M210/M210-RTK" %}
Connect the UART RX and TX pins of your Raspberry Pi 3 to the API port Tx and Rx pins of your DJI M210 as shown below. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

![DJI M210 UART Connection](../../../../.gitbook/assets/dji-m210.png)

{% hint style="danger" %}
**Caution:** Do NOT use the Vcc pin to power your own devices. You might damage your onboard computer.
{% endhint %}
{% endtab %}

{% tab title="DJI A3/M600/M600 Pro" %}
Connect the UART RX and TX pins of your Raspberry Pi 3 to the API port Tx and Rx pins of your DJI A3 as shown below. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

![DJI A3 UART Connection](../../../../.gitbook/assets/dji-a3.png)

{% hint style="danger" %}
**Caution:** Do NOT use the Vcc pin to power your own devices. You might damage your onboard computer.
{% endhint %}
{% endtab %}
{% endtabs %}

### Configuring DJI Autopilot

{% tabs %}
{% tab title="DJI M100" %}
* Make sure the API/UART port of M100 is connected to the Companion Computer’s UART port.
* Download [DJI Assistant](https://www.dji.com/downloads/softwares/assistant-dji-2) for DJI M100 on your Local Machine 
* Connect DJI M100 to Local Machine via USB Cable
* Verify M100 is running the latest firmware. Check [this](https://github.com/dji-sdk/Onboard-SDK#firmware-compatibility) link for the same.
* Launch DJI Assistant, go to SDK tab and enable the following check boxes: **Enable API control**, **Ground Station status**, **Enable SDK Failsafe Action**. Also, configure **baud rate to 230400** & **SDK Failsafe Action to Hover**.
* Set other data transmission rates to 10Hz.
* Reboot the M100
* Once rebooted, reconnect M100 with DJI assistant. Make sure the laptop running DJI assistant has an active internet connection.
* Install the DJI Go app on an Android/IOS phone, connect it to M100 RC. Make sure the phone is connected to the internet.
* Enable Multiple/intelligent flight mode from DJI GO4 App, to allow FlytOS to take control of drone from RC when the vehicle is switched to P-Mode or F-Mode

{% hint style="danger" %}
**Caution:** To take manual control of drone from RC, switch the RC Mode to P-Mode for DJI M100
{% endhint %}
{% endtab %}

{% tab title="DJI M210/M210-RTK" %}
* Make sure the API/UART port of autopilot is connected to the Companion Computer’s UART port.
* Download [DJI Assistant](https://www.dji.com/downloads/softwares/assistant-dji-2-for-matrice) for DJI M210 on your Local Machine.
* Connect DJI autopilot to Local Machine via USB Cable
* Verify autopilot is running the latest firmware. Check [this](https://github.com/dji-sdk/Onboard-SDK#firmware-compatibility) link for the same.
* Launch DJI Assistant, go to SDK tab and enable the following check boxes: **Enable API control**, **Ground Station status**, **Enable SDK Failsafe Action**. Also, configure **baud rate to 921600** & **SDK Failsafe Action to Hover**.
* Set other data transmission rates as shown in the screenshot

![DJI Assistant](../../../../.gitbook/assets/screenshot-62-.png)

* Reboot the drone/autopilot
* Once rebooted, reconnect the drone/autopilot with DJI assistant. Make sure the laptop running DJI assistant has an active internet connection.
* Install the DJI Go app on an Android/IOS phone, connect it to autopilot for drone's RC. Make sure the phone is connected to the internet.
* Enable Multiple/intelligent flight mode from DJI GO4 App, to allow FlytOS to take control of drone from RC when the vehicle is switched to P-Mode or F-Mode

{% hint style="danger" %}
**Caution:** To take manual control of drone from RC, switch the RC Mode to S-Mode or A-Mode
{% endhint %}
{% endtab %}

{% tab title="DJI A3/M600/M600 Pro" %}
* Make sure the API/UART port of autopilot is connected to the Companion Computer’s UART port.
* Download [DJI Assistant](https://www.dji.com/downloads/softwares/assistant-dji-2-for-matrice) for DJI A3/M600 on your Local Machine.
* Connect DJI autopilot to Local Machine via USB Cable
* Verify autopilot is running the latest firmware. Check [this](https://github.com/dji-sdk/Onboard-SDK#firmware-compatibility) link for the same.
* Launch DJI Assistant, go to SDK tab and enable the following check boxes: **Enable API control**, **Ground Station status**, **Enable SDK Failsafe Action**. Also, configure **baud rate to 921600** & **SDK Failsafe Action to Hover**.
* Set other data transmission rates as shown in the screenshot.

![DJI Assistant ](../../../../.gitbook/assets/screenshot-62-.png)

* Reboot the drone/autopilot
* Once rebooted, reconnect the drone/autopilot with DJI assistant. Make sure the laptop running DJI assistant has an active internet connection.
* Install the DJI Go app on an Android/IOS phone, connect it to autopilot for drone's RC. Make sure the phone is connected to the internet.
* Enable Multiple/intelligent flight mode from DJI GO4 App, to allow FlytOS to take control of drone from RC when the vehicle is switched to P-Mode or F-Mode

{% hint style="danger" %}
**Caution:** To take manual control of drone from RC, switch the RC Mode to S-Mode or A-Mode
{% endhint %}
{% endtab %}
{% endtabs %}

## **Now Let's move on to the Next step:**

{% page-ref page="../../supported-gcs.md" %}

