.. _advanced_networking:

Networking Setup
================

For commercial applications real-time transport of rich data to and from the drone is crucial. This guide suggests methods to help you customize your networking infrastructure for reliable operation.

FlytOS uses Mavlink protocol to speak with its autopilot, which uses serial links or IP based networks. However, for user applications (web/mobile) FlytOS strictly requires IP based network to provide RESTFull and WebSocket APIs. So in order to avail the full potential of FlytOS, you need a WiFi/3G/4G connection with your flight computer

To create a simple high bandwidth outdoor WiFi network covering acres of area, connecting one or more drones and a ground control station with internet, we recommend the following setup:

Equipment
---------

1. Primary ground router: wifi ap, client mode support, output power of at least 27 dBm / 500 mW, support for multiple external antennas, usb port (3G/4G/android usb tether) support, multiple ethernet ports, dual band support preferred (2.4GHz, 5.8GHz), ddns support, monitor mode support is preferred although not necessary. 
2. Directional antennas. 
3. Omnidirectional antennas.
4. (Already included in FlytPOD) Flight Computer with ethernet port, onboard power supply for router.
5. (Already included in FlytPOD) Onboard router: wifi ap, client mode support, output power of at least 27 dBm / 500 mW, support for multiple external antennas, usb port (3G/4G/android usb tether) support, dual band support preferred (2.4GHz, 5.8GHz), monitor mode support is preferred although not necessary. 
6. Optional: Wireless repeaters, multiple ground routers to cover large areas, antenna tracker. 

Setup
-----

1. Setup ground router in AP mode / create a wifi network on ground router. If you want internet on drone then connect your 3G/4G dongle to router’s USB port / tether your android phone. This usb connection will have to be configured as the WAN interface in your router’s setup page. You can find the procedure in the manual provided the router's manufacturer. 
2. Put omnidirectional antennas on router if you are going to work in small fields. ( less than 100 meters). For large fields directional antennas will perform far better than omnidirectional antennas. Additionally an antenna tracker would make it even more reliable. 
3. On the drone, put onboard router in client mode and connect to the wifi network hosted by ground router. Then connect companion computer to onboard router via ethernet. In this setup the onboard router will not have DHCP server, it will simply forward all dhcp requests to the ground router. So the companion computer will be assigned an IP address by the ground router. You can visit ground router setup page for fixed ip address assignment to the companion computer. (FlytPOD users can use wifi widget in FlytConosle to connect FlytPOD to your own wifi network). Multiple directional antennas onboard the drone could also be useful but the final performance will depend on antennas location and operational details. Omnidirectional antennas could be used for short distance flights.
4. Connect your client devices, tablet, phone, laptop, etc. to the wifi network hosted by ground router. To access the flight computer (onboard web apps like FlytConsole), you can use host name, e.g. flytpod. Host name resolution is provided by most ground routers these days. If it doesn’t work then you have to manually find out the IP assigned to the flight computer.

Some variations of above setup will be adequate for most solutions. If you have further questions about your application setup then post your queries in our `forum <http://forums.flytbase.com>`_.