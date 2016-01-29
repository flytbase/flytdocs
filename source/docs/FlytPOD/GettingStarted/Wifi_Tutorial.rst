***************************************
Configuring Wifi Module in Client Mode
***************************************


1. The FlytPOD has built-in WiFi router module. The Module can be configured in AP Mode or in Client Mode depending upon the application. Not both modes at a time. FlytPOD has hard-wired connection to the LAN port of this module. So USER has facility to do ssh from FlytPOD to this module.
Here we are configuring our module in Client mode.



* **Optional for Lab guys only:**
       First connect the LAN cable to Host PC and connect to Ethernet.

       .. note:: Make sure it is in DHCP mode.
 

       **Pre-requisite**: Before changing any configuration of the FlytPOD router, first get some details from your Home/Main Router.
       Get the IP address assigned to your device by Main Router. Use “ifconfig” or “ipconfig” from Linux and Windows OS respectively.
       E.g. if your device got the ip addr as : 192.168.1.130.

       Make sure that the configuration of FlytPOD router should be in the same domain.

* **For User:**
       By default wifi module is shipped with AP Mode firmware. The Name of SSID:  FlytPOD_wifi. Join the FlytPOD_wifi network from your laptop/mobile device.
       Password:  12345678

       And then access the module from Host browser using IP address : 192.168.1.1
       Click on the  “Administration” tab which is right side top corner of the webpage.
       OpenWRT configuration wizard GUI will prompt for username & password.
       
       Use the following :

       a) username: root
       b) password: 123
          

.. image:: /_static/Images/wifi1.png
	:align: center



        
2. Then go to “Network->Interfaces->LAN->Edit” option, Under the “Common Configuration” go to “General Setup” & here change the Ipv4 address from 192.168.1.1 to 192.168.1.254 (Remenber it for future USE) so that it should not conflict with the IP addresses assigned by the Main Router to other devices in the Network.
   
**Save the setting.**

.. image:: /_static/Images/wifi1.png
	:height: 400px
	:width: 600px
	:align: center

Then go to “Physical Settings” option & change the following :

* Uncheck the Bridge Interfaces option.
* Set the Interface to “VLAN Interface : “eth0.1” (lan)”.


**Save the settings.**

.. image:: /_static/Images/Interfaces.png
	:height: 400px
	:width: 600px
	:align: center


3. Again go to “Network->Interfaces->LAN->Edit” option, Under “DHCP Server” check the “Ignore Interface”.
   
**Save the settings.**

.. image:: /_static/Images/wifi3.png
	:height: 400px
	:width: 600px
	:align: center


4. Now configure the Wifi Settings,  go to “Network->wifi”. Then scan for the available wifi networks using “scan” option.
   
   Join your Main Router’s network.

   Then update the:

   - WPA passphrase : {password of your Main Router}
   - Name of network from “wwan” to : “wlan”
   - Set Firewall zone to : lan.


**Finally submit and Save the settings.**

.. image:: /_static/Images/wifi4.png
	:height: 400px
	:width: 600px
	:align: center


5. Create the Relay Bridge between LAN and WLAN Client. To create it, go to “Network->Interfaces” option, here  click “Add new interface” option and Create Interface as:
   
   * Name of the new interface: relay
   * protocol of the new interface: Relayd Bridge
     
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


6. Check for all interfaces, it should be :
   
.. image:: /_static/Images/Interface_overv.png
	:height: 400px
	:width: 600px
	:align: center

**At last Click on the “Unsaved Changes : **” option on the top right corner of webpage  then Save & Apply. Now your FlytPOD module is configured.**



**At last Save & Apply the settings.**

7. Final step is to get the new IP from Main Router. So reboot the wifi module as: 

go to “System->Reboot->Perform reboot.(At this point you should not see the FlytPOD_wifi Network in the available wifi network list)


- Now Connect the HDMI cable, keyboard, mouse to FlytPOD.
- From FlytPOD OS terminal do “ifconfig', check if the device got the new IP from Main router or not.
- Connect to the FlytPOD router using IP 192.168.1.254(The one you configured earlier in step 2.
   
Click on the “Administration” tab which is on right top corner of the webpage. OpenWRT configuration wizard GUI will prompt for username & password.
Use the following-


a. username: root
b. password: 123
   	

- After that go to “System->Administration” tab, update the SSH access as shown below figure.
     

**Save & Apply the settings.**
     

.. image:: /_static/Images/Interface_overv.png
	:height: 400px
	:width: 600px
	:align: center


`Ref Link.`_ 


Troubleshooting Guide:
^^^^^^^^^^^^^^^^^^^^^^


To Reset or Load the Factory settings:
""""""""""""""""""""""""""""""""""""""

1. **From FlytPOD Terminal**


a) First connect the HDMI cable, keyboard, mouse to FlytPOD.
b) Connect to Ethernet connection. Then from terminal, ssh root@openwrt
    
       
.. image:: /_static/Images/Reset.png
	:height: 400px
	:width: 600px
	:align: center


Password is :123 

c) Once you got the openwrt terminal, issue command  “firstboot && reboot”
d) Wait for approx. 1 min to reboot it completely.
e) After that you will see the module is in AP mode which has created its own network with SSID : FlytPOD_wifi.
f) Then follow steps i to vii to configure it in client mode.
	   
OR

2. **From the web gui**

   a) First connect the HDMI cable, keyboard, mouse to FlytPOD.
   b) Assign the manual IP to FlytPOD. E.g. IP : 192.168.1.253 & use Subnet : 255.255.255.0
   c) Connect to router from browser using IP address configured earlier in the step 2. i.e. 192.168.1.254.
       
      Click on the “Administration” tab which is right side top corner of the webpage. OpenWRT configuration wizard GUI will prompt for username & password. 
      
      Use the following::

      	username: root
      	password: 123				
		     
   d) Go to “System->Flash Firmware->perform reset”. Wait for module to reboot approx. 1min.
   e) After that you will see the module is in AP mode which has created its own network with SSID : FlytPOD_wifi.
   f) Then follow steps i to vii to configure it in client mode

Flashing the firmware:
^^^^^^^^^^^^^^^^^^^^^^

1. Join the FlytPOD_wifi network from your laptop/mobile device.
2. And then access the module from Host browser using IP address: 192.168.1.1
3. Directly Flash new Firmware Image menu will come then specify the binary(provided by NavStik) file loaction and then click on the “flash image” and follow the steps.



.. _Ref Link.: https://www.youtube.com/watch?v=zKM_zDicKaU