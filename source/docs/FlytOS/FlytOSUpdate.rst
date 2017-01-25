.. _flytos_updates:

FlytOS Updates
==============

Automatic over the air Updates
------------------------------

* If your device is connected to the internet, FlytOS automatically detects and downloads available updates.
* Once the download is complete, the updates are installed upon the next reboot of your device.



Configure Updates
-----------------

* To configure updates launch FlytConsole and click on Update manager on the top right corner of FlytConsole. 
  
  .. image:: /_static/Images/UpdateManager.png
     :align: center 
     
  


* The update manager displays important information about FlytOS viz. Current FlytOS version, Available FlytOS version, update download progress, Install status and Blacklisted FlytOS versions. 
* Available FlytOS version displays the latest FlytOS update available. You can update your device to the latest version.   
* You can also monitor the progress of update download and the installation status.
* In case there is some version of FlytOS that does not install correctly, you can blacklist that version by entering it in the Blacklist FlytOS version field. FlytOS will no longer try to update the Blacklisted FlytOS version.
* In case of FlytPOD/PRO, the user LED-1 starts fast blinking red indicating that the FlytOS update is being installed.


Startup Log
-----------

* Upon launch FlytOS automatically detects and downloads FlytOS updates.
* The Startup log located at ``/flyt/logs/startup/`` contains a log of all the activities taking place after the launch of FlytOS.
* **For debugging:** In case the updates are not installed completely or you are unable to open FlytConsole, you can check the startup log to locate the error.
  

.. note:: For more help please post your queries on the FlytBase `forum <http://forums.flytbase.com/>`_. 

