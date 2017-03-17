.. _test_flytos:


Test FlytOS
============

Make sure that you have successfully tested Offboard mode with FlytOS.

Next step is to test a web/mobile app built on top of FlytOS APIs.

1. Download Flyt Joystick android app from `here`_ .
2. Alternatively you can use joystik web app on your laptop. Download Flyt Joystick web app on your laptop from `here`_ . Enter into the directory and open index.html into browser.
3. Connect your mobile / laptop to same wifi network that your companion computer / FlytPOD is connected to.


.. image:: /_static/Images/app-login-screen.png
  :align: center 

4. Enter IP address of the companion computer / FlytPOD in the app and click connect.
5. Manually arm the drone and takeoff. Switch to RC-POSCTL mode. Make sure that drone is holding its position.
6. Switch to OFFBOARD/API-POSCTL mode using the offboard switch on RC.
7. Now the Joystik app should have the control. Try moving the drone using buttons on app.


.. image:: /_static/Images/app-screen.png
  :align: center

8. The left joystick gives the drone commands to move up down turn-left and turn-right.
9. The right joystick gives the drone commands to move front back left and right.
10. All the commands are given with respect to the drone(front = direction of the nose/front of the drone).
11. If everything goes right then press land button on app.
12. If auto landing worked well then keep the drone on ground, disarmed and switch to OFFBOARD/ API-POSCTL.
13. This time take-off with app and move the drone around and then land.
14. If you are here then you have succefully integrated FlytOS with your drone.
15. Welcome onboard! Go ahead and check out some cool built in apps for your drone.






.. _here: https://flyt.blob.core.windows.net/flytos/downloads/apk/Flyt-Joystick.apk
.. _here:  https://github.com/flytbase/flytsamples/tree/master/WebApps/Flyt_Joystick
