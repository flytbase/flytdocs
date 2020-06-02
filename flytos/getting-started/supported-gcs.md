# Supported GCS

## For APM users

{% tabs %}
{% tab title="FlytConsole" %}
[FlytConsole](../../about-flytconsole/flytconsole.md), a web app for configuring your drone comes pre-packaged in FlytOS. Follow the steps below to get started with FlytConsole.

{% hint style="info" %}
**Note:** FlytConsole has beta support for APM, and still has a couple of widgets to be released with APM support, till then users are requested to follow other supported GCS mentioned on the page.
{% endhint %}

* Power on your Flight Computer running FlytOS.
* Connect your personal computer to the same network that your Flight Computer is connected to.
* If your flight computer is in Access Point\(AP\)/HotSpot mode, you can connect to its WiFi \(ssid: flytos\_WiFi\). If the flight computer is in client mode, connect your personal computer to the same router with which your flight computer is connected to.
* Next, go to the following link to open FlytConsole: [http://localhost/flytconsole](http://localhost/flytconsole) or `http://<ip-address-of-device>/flytconsole`
* Follow the steps [here](../../about-flytconsole/flytconsole-widgets.md) to learn about FlytConsole widgets.
{% endtab %}

{% tab title="QGC" %}
[QGroundControl](http://qgroundcontrol.com/) also supports FlytOS. Follow the steps given below to get started with QGCS:

* [Download](http://qgroundcontrol.com/downloads/) and Install QGC.
* Once installed, launch the QGC app.
* Connect your personal computer to the same WiFi network your flight computer is connected to.
* Create a new _TCP Comm Link_ in QGC with _Host Address_ as IP Address of your flight computer, and _TCP Port_ as 5760.
* Once done, press the _connect_ button and QGC will now connect to FlytOS.
* You can go through their [User’s Guide](http://qgroundcontrol.org/users/start) to learn more about QGC.
{% endtab %}

{% tab title="APM Planner/Mission Planner" %}
[APM Planner](http://ardupilot.org/planner2/) and [Mission Planner](http://ardupilot.org/planner/index.html) also support FlytOS. Follow the steps given below to get started with them:

* Download and install either of APM Planner/Mission Planner by following the above links.
* Once installed launch the app.
* Connect your personal computer to the same WiFi network your flight computer is connected to.
* Create a new _TCP Comm Link_ in the app, with _Host Address_ as IP Address of your flight computer and _TCP Port_ as 5760.
* Once done, press the _connect_ button and the app will now connect to FlytOS.
{% endtab %}
{% endtabs %}

## For PX4 users

{% tabs %}
{% tab title="FlytConsole" %}
[FlytConsole](../../about-flytconsole/flytconsole.md), a web app for configuring your drone comes pre-packaged in FlytOS. Follow the steps below to get started with FlytConsole.

* Power on your Flight Computer running FlytOS.
* Connect your personal computer to the same network that your Flight Computer is connected to.
* If your flight computer is in Access Point\(AP\)/HotSpot mode, you can connect to its WiFi \(ssid: flytos\_WiFi\). If the flight computer is in client mode, connect your personal computer to the same router with which your flight computer is connected to.
* Next, go to the following link to open FlytConsole: [http://localhost/flytconsole](http://localhost/flytconsole) or `http://<ip-address-of-device>/flytconsole`
* Follow the steps [here](../../about-flytconsole/flytconsole-widgets.md) to learn about FlytConsole widgets.
{% endtab %}

{% tab title="QGC" %}
[QGroundControl](http://qgroundcontrol.com/) also supports FlytOS. Follow the steps given below to get started with QGCS:

* [Download](http://qgroundcontrol.com/downloads/) and Install QGC.
* Once installed, launch the QGC app.
* Connect your personal computer to the same WiFi network your flight computer is connected to.
* Create a new _TCP Comm Link_ in QGC, with _Host Address_ as IP Address of your flight computer and _TCP Port_ as 5760.
* Once done, press the _connect_ button and QGC will now connect to FlytOS.
* You can go through their [User’s Guide](http://qgroundcontrol.org/users/start) to learn more about QGC.
{% endtab %}
{% endtabs %}

