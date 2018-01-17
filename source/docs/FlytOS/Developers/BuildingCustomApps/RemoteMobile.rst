.. _write_remote_mobile:

Remote Mobile
===============


These apps run on a mobile device and communicate with the drone using RESTful and WebSocket FlytAPIs. These apps can be built in native languages like Java-for-Android or using cross-platform frameworks like Cordova. Samples for remote mobile apps are available in `Flytsamples github <https://github.com/flytbase/flytsamples/tree/master/Mobile-Apps>`_.

**Android-Apps**: These are native Android apps built using java and Android Studio. This approach provides full flexibility in terms of native support for the platform. We have put together an `Android SDK <https://github.com/flytbase/flytsamples/raw/master/Mobile-Apps/Java-Apps/FlytbaseSDK/FlytSDK.jar>`_ for Flytbase to help you get started with your custom Android app.
:ref:`Read more<write_remote_mobile_android>`


**HTML-JS-Apps**: These apps are built using web technologies - HTML/JS/CSS and Cordova framework. Using cordova the app can be converted to desired target platform like Android, iOS or Blackberry etc. This is a good option for quick prototyping and building cross platform apps.
:ref:`Read more<write_remote_mobile_web>`



.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Developers 

   ./RemoteMobile/RemoteAndroidApps.rst
   ./RemoteMobile/RemoteWebApps.rst
