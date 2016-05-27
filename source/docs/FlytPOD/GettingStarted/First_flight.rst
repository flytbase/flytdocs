.. _First_Flight:

First Flight with FlytPOD
=========================

1. General Instructions: We recommend getting Manual stabilize mode to work first. Then go for Position hold using GPS. Once you are sure about these basic manual modes then you can switch to FlytOS using offboard switch. 

2. Manual Mode:
   
   a. This is basic stabilize mode. 
   b. If RGB LED is breathing blue or green then you are good to go. Click :ref:`here<RGB_LED>` to know more about RGB LED patterns.
   c. Make sure you are following all safety guidelines given :ref:`here<Safety_guidelines>`.
   d. In case you are not sure about Gains please have a look at this guide `here <https://pixhawk.org/users/multirotor_pid_tuning>`_.
   e. Once your basic gains are stable and vehicle is stabilizing well then go to ``Altctl Mode``. Height will be stabilized automatically. Without LIDAR or SONAR the height might drift within a meter.
   f. In ``altitude control mode`` throttle stick should be kept at middle to stay at current altitude. 

3. Position hold: 
  
   a. Position and height are stabilized in this mode.
   b. RGB LED should be green for this mode to work.
   c. In this mode throttle and roll/pitch stick should be at the center for staying at current location.

4. Offboard mode / Flying with FlytOS:
  
   a. Vehicle is autonomously controlled by FlytOS and will be given position, velocity commands according to running apps.
   b. RGB LED should be green for this mode to work.
   c. Make sure that Position control works before switching to offboard mode.
   d. Vehicle will start to hover at the same position after switching to offboard mode until you start using any other app. 
   e. RC controller sticks will not work in this mode. Only offboard switch will work which should be kept handy for emergency  situations.
   f. Try testing your first Flyt app :ref:`here<onboard app>`. 
