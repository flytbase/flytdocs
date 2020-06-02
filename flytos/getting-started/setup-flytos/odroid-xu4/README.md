# Odroid XU4

## Installing FlytOS

To install FlytOS on ODROID-XU4, there are 2 ways that you can follow. We recommend the first method for an easier install:

* [Flashing FlytOS Linux Image](flashing-flytos-linux-image.md) \[**Recommended method**\]

  OR

* [Installing FlytOS dependencies in your custom image](installing-flytos-dependencies-in-your-custom-image.md)

## Activate FlytOS

{% hint style="info" %}
**Note:**  This step requires you to have a registered FlytBase Account. In case you don’t have an account, [create a FlytBase Account](../../create-flytbase-account.md) before you proceed.
{% endhint %}

You have to activate installed FlytOS, without which critical APIs would not function.

* Make sure your ODROID-XU4 has internet access before proceeding. You can connect to internet using WiFi dongle or Ethernet to the ODROID-XU4.
* Launch FlytConsole. You can launch FlytConsole in the ODROID’s browser using the URL `http://localhost/flytconsole` or on your PC’s browser using the URL `http://ip-address-of-device/flytconsole` . 
* In FlytConsole click on **Activate Now tag** under **License tab** at bottom right corner. A pop-up will appear which will direct you to the device registration page. If you are not logged in, enter your FlytBase Account credentials to log in.
* Choose a device nick-name and select your compute engine.
* In the license drop-down list, select existing license if available or select ‘Issue a new license’. You can also provide a nick-name for your license.
* Choose commercial license if you have purchased a commercial license and have the commercial license code or select the personal license.
* Click on Save Changes to register device and generate a license key.
* Copy the generated license key and enter it in FlytConsole to complete the activation process of your device. The Activate Now tag at bottom right corner of FlytConsole should now turn green.

## Hardware Setup For Pixhawk

### Pixhawk Telemetry Connection

FlytOS needs telemetry data from autopilot \(Pixhawk\). Connect Pixhawk’s Telemetry port to ODROID-XU4.

* **\[Recommended\]** Connect Pixhawk’s Telem2 port to ODROID UART0 port. We have used the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0\(RX\) and GPA0.1\(TX\) have been used as serial port UART0.
* Connect Pixhawk’s micro-USB to the USB port of ODROID. **\[Not Recommended if using APM\]**
* Connect Pixhawk’s Telem2 port to the USB port of ODROID using UART-USB converter.

Below is a hardware setup you tube video for Pixhawk + ODROID-XU4 covering all the necessary information, including WiFi-enabling the ODROID.

{% embed url="https://youtu.be/B40pE02bjJI" caption="Setup Odroid XU4 & Pixhawk for FlytOS" %}

### Configuring Pixhawk Autopilot

{% tabs %}
{% tab title="For APM users" %}
*  Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) in your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable APM release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameters **SERIAL2\_BAUD** and **SERIAL2\_PROTOCOL**, set them to **921** and **1** respectively. This would enable communication between FlytOS running on ODROID-XU4 and Pixhawk.
* Configure a dedicated switch position for `GUIDED MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `GUIDED MODE`.
{% endtab %}

{% tab title="For PX4 users" %}
* Install [QGC\(QGroundControl\)](http://qgroundcontrol.com/) in your local machine.
* Connect Pixhawk to QGC using the USB port at the side of Pixhawk.
* Install the latest stable PX4 release in Pixhawk using QGC by following [this](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Firmware.html) guide.
* Once done, visit [parameter widget in QGC](https://donlakeflyer.gitbooks.io/qgroundcontrol-user-guide/content/SetupView/Parameters.html) and search for parameter **SYS\_COMPANION** and set it to **921600**. This would enable communication between FlytOS running on ODROID-XU4 and Pixhawk.
* Configure a dedicated two way switch for `OFFBOARD MODE` during RC calibration, to allow FlytOS to take control of drone from RC when vehicle is switched to `OFFBOARD MODE`.
{% endtab %}
{% endtabs %}

## Hardware Setup For DJI

### DJI Telemetry Connection

{% tabs %}
{% tab title="DJI M100" %}
Connect DJI M100 UART RX & TX pins to ODROID UART0 port. User can use the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0\(RX\) and GPA0.1\(TX\) can be used as serial port UART0. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

![DJI M100 UART Port](../../../../.gitbook/assets/dji-m100_1.png)

{% hint style="danger" %}
**Caution:** Do NOT use the Vcc pin to power your own devices. You might damage your onboard computer.
{% endhint %}
{% endtab %}

{% tab title="DJI M210/M210-RTK" %}
Connect DJI M210 UART RX & TX pins to ODROID UART0 port. User can use the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0\(RX\) and GPA0.1\(TX\) can be used as serial port UART0. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

![DJI M210 UART Connection](../../../../.gitbook/assets/dji-m210_1.png)

{% hint style="danger" %}
**Caution:** Do NOT use the Vcc pin to power your own devices. You might damage your onboard computer.
{% endhint %}
{% endtab %}

{% tab title="DJI A3/M600/M600 Pro" %}
Connect DJI A3/M600 API RX & TX pins to ODROID UART0 port. User can use the ODROID XU4 Shifter Shield as a level converter and the pins mapped as GPA0.0\(RX\) and GPA0.1\(TX\) can be used as serial port UART0. Click [here](https://developer.dji.com/onboard-sdk/documentation/development-workflow/hardware-setup.html) for more details.

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

{% tab title="DJI M210/210-RTK" %}
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

