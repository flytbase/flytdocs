# Web SDK

To help speed up the process of App building, we have provided a [FlytSDK Web](https://downloads.flytbase.com/flytos/downloads/sdk/Flyt_Web_SDK.zip).

* The SDK has **FlytLibrary Web** pre-integrated.
* It has a **URL** screen and websocket initialisation code for telemetry data which is required for all FlytApps.
* All your App specific UI components and JS code goes in **app.html** and **app.js** respectively.

All you need to do is add specific UI components and respective socket or REST calls from the [API documentation](http://api.flytbase.com/) to the above mentioned files and you are good to go.

You can run the app by opening the **index.html** file in a browser. Follow the steps below:

* In the screen that pops up, enter the **URL** of the device running FlytOS and click on connect.
* You will be redirected to your app screen.

![FlytSDK Web](../../../.gitbook/assets/web-sdk-url.png)

