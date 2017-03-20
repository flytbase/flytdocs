.. _basic_flight:

Basic Flight
=============

1. Read all safety guidelines given :ref:`here<general_safety_guidelines>`. 

.. note:: In case you are using Pixhawk, check out the `pre-flight checklist <http://ardupilot.org/copter/docs/flying-arducopter.html>`_ before you fly. 

2. It is important to make sure that autopilot is configured properly for RC | POSCTL mode. 
3. Skip to step 4 if RC | POSCTL mode is already configured and tested:
   
   a. Keep vehicle in MANUAL mode 
   b. Wait for the RGB led to turn green.
   c. Arm the vehicle and takeoff manually. 
   d. If vehicle is not stabilized refer to gain tuning section `here <http://px4.io/docs/multicopter-pid-tuning-guide/>`_.
   e. Switch to RC | POSCTL mode using RC switch. Without LIDAR or SONAR the height might drift within a meter.
   f. In this mode throttle and roll/pitch stick should be at the center to hold drone at current location.
   
4. Prepare for Offboard mode:
  
   a. RGB LED should be green for this mode to work.
   b. Offboard / API switch on RC is used to switch API control ON or OFF. In case of emergency during offboard mode flip this switch to take back RC control.
   c. Vehicle will start to hover at the same position when switched to offboard mode.
   d. RC sticks will not work in this mode. FlytOS API's will be commanding the drone. 

5. While in RC | POSCTL mode flip the RC offboard switch to enter into OFFBOARD / API-POSCTL mode.
6. Vehicle should hover at the same location. RC sticks will not work in this mode. Just to make sure that it is indeed offboard mode try giving some control actions from RC e.g. roll. If vehicle doesn't react to these commands then FlytOS is controling the drone.
7. Now you can flip the switch to take back RC control and land it.
