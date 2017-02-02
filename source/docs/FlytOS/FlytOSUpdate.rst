.. _flytos_updates:

FlytOS Updates
==============

Automatic Over-the-air Updates
------------------------------

.. caution:: You must :ref:`activate your device<activate_flytos>`, without which auto-updates would not work.

* If your device is connected to the internet, FlytOS automatically detects and downloads available updates.
* Once the download is complete, the updates are installed upon the next reboot of your device.
* In case of FlytPOD/PRO, during automatic installation, the USER-LED-1 starts fast blinking red indicating that the FlytOS is being installed. You can also check the startup log for updates/installation related debug messages.



Configure Updates
-----------------

* To configure updates launch FlytConsole and click on Update manager on the top right corner of FlytConsole. 
  
  .. image:: /_static/Images/UpdateManager.png
     :align: center 
     
  


* The update manager displays important information about FlytOS viz. Current FlytOS version, Available FlytOS version, Update download progress, Install status and Blacklisted FlytOS versions. 
* Available FlytOS version displays the latest FlytOS update available.   
* You can disable or enable auto-updates anytime using the Auto Updates checkbox. If Auto Update field is checked and new update is available, it will get downloaded in the background if the device has internet connection.
* You can also monitor the progress of update being downloaded and the current installation status.
* In case there is some version of FlytOS that does not install correctly, you can blacklist that version by entering it in the Blacklist FlytOS version field. FlytOS will no longer try to update the Blacklisted FlytOS version.
* In case there is some update of FlytOS that you would like to skip, you can blacklist that version by entering it in the Blacklist FlytOS version field. FlytOS will no longer try to update the Blacklisted FlytOS version.

Startup Log
-----------

* The Startup log located at ``/flyt/logs/startup/`` contains a log of important startup events including any errors in updates or installation.
* **For debugging:** In case the updates are not installed successfully or you are unable to open FlytConsole, you can check the startup log to locate the error. 
  

.. note:: For more help please post your queries in the `FlytBase forum <http://forums.flytbase.com/>`_. 