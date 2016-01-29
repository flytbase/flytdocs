********************************************
Configuring SKW75 Wifi Module in Client Mode
********************************************


1. Once the module is flashed with correct binary, then we can configure it according to our purpose. The Module will work either in AP Mode or in Client Mode. Not both modes at a time.
Here we are configuring our module in Client mode.



* **For Lab guys:**
       First connect the LAN cable to Host PC and connect to Ethernet.

       .. note:: Make sure it is in DHCP mode.

* **For User:**
       By defaul the wifi module is shipped with AP Mode firmware. The Name of ESSID is : FlytBot. Connect your device to FlytBot network.

       And then access the module from Host browser using IP address : 192.168.1.1
       Click on the  “Administration” tab which is right side top corner of the webpage.
       OpenWRT configuration wizard GUI will prompt for username & password.
       
       Use the following :

       a) username: root
       b) password: 123
        
2. Then go to “Network->Interfaces->LAN->Edit” option, Under the “Common Configuration” go to “General Setup” & here change the Ipv4 address from 192.168.1.1 to 192.168.1.3(Remenber it for future USE) so that it should not conflict with the Main Router IP.
   
   **Save the setting.**

.. image:: /_static/Images/wifi1.png
	:height: 400px
	:width: 600px
	:align: center

Then go to “Physical Settings” option & changes the following :

* Uncheck the Bridge Interfaces option.
* Set the Interface to “VLAN Interface : “eth0.1” (lan)”.
  
  **Save the settings.**


.. image:: /_static/Images/wifi2.png
	:height: 400px
	:width: 600px
	:align: center

3. Again go to “Network->Interfaces->LAN->Edit” option, Under “DHCP Server” check the “Ignore Interface”.
   
   **Save the settings.**

.. image:: /_static/Images/wifi3.png
	:height: 400px
	:width: 600px
	:align: center


5. Now configure the wifi,  go to “Network->wifi”. Then scan for the available wifi networks using “scan” option.
   
   Join the available network(e.g. AIN) for internet connection.
   Also update the name of network from “wwan” to : “wlan”
   and Set Firewall zone to : lan.


   **Finally submit and Save the settings.**

.. image:: /_static/Images/wifi4.png
	:height: 400px
	:width: 600px
	:align: center


6. Create the Relay bridge between LAN and WLAN Client. To create it go to “Network->Interfaces” option, here  click “Add new interface”   and Create Inteface as :
   
   * Name of the new interface : relay
   * protocol of the new interface : Relayd Bridge
     
   **Submit the changes.**

.. image:: /_static/Images/wifi5.png
	:height: 400px
	:width: 600px
	:align: center

After this “Interfaces – Relay” window will prompt & in Common Configuration, set the Relay between networks “lan” & “wlan”.

    


**Save the settings.**

.. image:: /_static/Images/wifi6.png
	:height: 400px
	:width: 600px
	:align: center


7. Check for all interfaces, it should be :
   
.. image:: /_static/Images/wifi7.png
	:height: 400px
	:width: 600px
	:align: center



**At last Save & Apply the settings.**

8. Final step is to get the new IP from Main Router. So reboot the wifi module by either Power-On-Reset(unplug and plug the power cord) or go to “System->Reboot->Perform reboot.  From host terminal do “ifconfig' , you will see that your device got the new IP from Main router.  Open the browser and open any site to check it.


`Ref Link.`_ 



.. _Ref Link.: https://www.youtube.com/watch?v=zKM_zDicKaU