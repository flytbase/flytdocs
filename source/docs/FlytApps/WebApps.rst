
*******************
Web App development
*******************


Create a New Project
====================

To help speed up the process of App building, we have provided a `Flyt_Web_SDK`_ from here.



#. The SDK has **Flyt_Web_Library** included by default.
#. It has a **URL** screen and websocket initialisation code preintegrated for telemetry data which is required for all FlytApps.
#. All your App specific UI components and JS code goes in **app.html** and **app.js** respectively.



All you need to do is add specific UI components and respective socket or REST calls from the `API documentation`_ to the above mentioned files and you are good to go.




Running the Project
================================




You can run the app by opening the **index.html** file in a browser. Follow the steps below:



- In the screen that pops up, enter the **URL** of the system/FlytPOD running FlytOS and click on connect to be redirected to your app screen.


.. image:: /_static/Images/web-sdk-url.png
  :align: center


Sample Web Application
======================

.. note:: The source code for the sample web/mobile apps is available in `github repository`_ for your reference.



Following is a simple demonstration of how to run a Web application for your drone. This application allows you to trigger an on-board service that sends commands to your drone to takeoff and land.


  			
.. image:: /_static/Images/sample-app-screen.png
  :align: center




You can Also try out `Flyt Joystick`_ Web app :

- Launch the index.html file in your browser.
- Enter the IP of the device running FlytOS to be able to communicate with it.

.. image:: /_static/Images/web-app-login-screen.png
  :align: center 

- Once the IP is confirmed you are redirected to the app screen.
- This App allows the user to send the drone velocity setpoints and control the drone as with a regular joystick.

Things to Remember

- You need to takeoff before you can use the joystick to control your drone.
- The left joystick gives the drone commands to move up down turn-left and turn-right.
- The right joystick gives the drone commands to move front back left and right.
- All the commands are given with respect to the drone(front = direction of the nose/front of the drone).


.. image:: /_static/Images/web-app-screen.png
  :align: center



Deploying Web App Onboard
=============================

Once you have built your Web app, you are ready to deploy it Onboard. FlytOS uses lightweight Flask microframework for onboard web apps. Custom user apps can be added as blueprints as shown below. You can write a complete app with server side code in Python and Static content with HTML, CSS, JS. These are the steps to be followed.

1) Go into the folder /flyt/flytapps/web_user.
2) Create a folder for your Web app, eg sampleApp.
3) Inside th samplApp folder create a folder named static and paste the contents of your Web app folder inside this folder.
4) Create an empty document named __init__.py and views.py alongside static folder.
5) Open the views.py file and write the following code:

.. code-block:: python

    from flask import Blueprint, render_template

    sampleApp = Blueprint('sampleApp', __name__,static_folder='static')

    @sampleApp.route('/')
    def timeline():
      return sampleApp.send_static_file('index.html')
      #index.html is the page that is rendered when your custom webapp is fired.



6) Now come back to /flyt/flytapps/web_user and add an entry for your sampleApp in apps.py file.

.. code-block:: python

    from flask import Blueprint, render_template, Flask

    from .user_app1.views import user_app1
    from .sampleApp.views import sampleApp

    def register_user( main_app ):
      main_app.register_blueprint(user_app1,url_prefix='/user_app1')
      main_app.register_blueprint(sampleApp,url_prefix='/sampleApp')




7) Now restart the FlytOS and your web app will be served at <URL>/sampleApp .
8) You can also try out other Sample Apps in the repository.

.. _Ionic components: http://ionicframework.com/docs/components/
.. _Flyt_Web_SDK: https://github.com/flytbase/flytsamples/tree/master/WebApps/Flyt_Web_SDK
.. _Flyt Joystick: https://github.com/flytbase/flytsamples/tree/master/WebApps/Flyt_Joystick
.. _API documentation: http://docs.flytbase.com/docs/FlytAPI/REST_WebsocketAPIs.html
.. _github repository: https://github.com/flytbase/flytsamples
