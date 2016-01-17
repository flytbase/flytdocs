.. _flytsim mobile apps:

***********
Mobile Apps
***********

Introduction
============

This document deals with the instructions and step by step guide for creating Mobile Apps for your Drone. There are two ways of doing so. The conventional way is to build a native mobile app using IDEs such as Eclipse or Android Studio for Android applications. The other way of going about creating mobile apps is to make a simple HTML, CSS and JS project and convert that into a mobile app using frameworks such as Cordova and Phonegap. This allows for sharing the same codebase for creating cross-platform mobile apps.


Here we will delve into the second approach developing mobile apps using web technologies (HTML, CSS, JS) and Cordova engine. These apps will allow you to remotely monitor and command your drone. You will also see how to get custom data from the Drone on your app.
  

The IDE that we have selected for this project is IntelliJ Idea. The GUI and the client side coding is done in HTML, CSS and JS using Ionic as the front end framework.


Front end Framework
^^^^^^^^^^^^^^^^^^^

Ionic is free and open source and offers a library of mobile optimized HTML, CSS and JS components, reusable and customizable UI elements and other tools for building highly interactive mobile apps. Ionic uses Cordova engine which is a mobile development framework that uses web technologies for cross platform app development. You can refer to Ionic getting started guide for further instructions and to get yourself familiar with the Ionic framework - http://ionicframework.com/getting-started. For details on Cordova, you can look at their documentation here - https://cordova.apache.org/docs/en/latest/guide/overview/

IDE
^^^

The IDE that we have used here is IntelliJ Idea. There are many others available so feel free to use one that you’re comfortable with. IntelliJ Idea supports Ionic( Front end framework) and allows you to create Phonegap/Cordova projects. Since we will be using both these softwares, make sure the IDE that you use supports them. For more information on IntelliJ - https://www.jetbrains.com/idea/




Development Environment Setup
=============================

For a quick start, you can follow steps below to install Ionic and cordova :





#. Please install Node.js v4 (Node.js v5 does not work at the moment with Ionic). To install node.js go to the link given below: 
   https://nodejs.org/en/download/

#. To install the latest Ionic and Cordova use the following command:
   $ npm install -g cordova ionic

#. Follow the Android and iOS platform guides to install required platform dependencies (SDKs).

   .. note:: iOS development requires Mac OS X. iOS simulator through the Ionic CLI requires the ios-sim npm package, which can be installed with the command sudo npm -g install ios-sim.



#. IntelliJ Idea requires JDK 7 and the mobile platform SDK (covered in previous step) as prerequisites before starting mobile app development. To install JDK 7 go to the following link: 
   http://docs.oracle.com/javase/7/docs/webnotes/install/index.html

#. Go to the link given below to download and install IntelliJ Idea on your system.                                                      https://www.jetbrains.com/idea/download



Creating and Running a Project
==============================



Once all components are setup, you can begin app development by creating a new project in IntelliJ.


Steps to Create New Project:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. On launching IntelliJ Idea start wizard for creating new project.
#. Select Static Web in the pop up.
#. Then select PhoneGap/Cordova App and click on next.
#. Fill up details of your project viz Project Name, Project Location and Cordova Location. Click on Finish.
#. In the project skeleton you’ll be able to see a www folder. Put all your HTML, CSS and JS files in this folder.


The front end of the app is developed in HTML, CSS, JS using the Ionic components - http://ionicframework.com/docs/components/


To use these components in your app, the Ionic libraries have to be included in your HTML files. Here is a list of Ionic files that have to be included:

#. ionic.css
#. ionic.min.css
#. ionic.bundle.js
#. ionic.bundle.min.js
#. font files


Building and Running the Project:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can build and run the app using IntelliJ in either a browser based emulator or load the app on your mobile device.

**Running in Browser:**

- Go to view.
- Click on Open in browser option.
- Select the browser your system supports.
  

**Running in Device:**

- Connect mobile device to computer using a USB/uUSB cable.
- Select ‘Specify target’ in IntelliJ corresponding to your device (Refresh if necessary).
- Click on <Run> button to start building your app and to install it on the device.



Tutorial for developing Mobile Application
==========================================


Following is a simple demonstration of how to build an Android Application for your drone. This application allows you to send commands to your drone to form a square the dimension of which will be provided by the user. It also shows you how to receive live data from your drone.


In order to make your drone navigate in the manner mentioned above an onboard script is executed. The command for executing this onboard script is given by the user through the Android  application.



Follow the steps given below to develop the Android application for your drone:

**Button to Execute Script:**


1) Create a new project in IntelliJ Idea and import the necessary Ionic files by following the steps mentioned earlier in this document.
2) Here we create a simple button using the Ionic component ‘Button’. The html code for which is as follows:

.. code-block:: HTML

    <button class="button button-block button-positive" id="square">
    Execute Square
    </button>
       
       


3) This button when clicked executes the onboard script which makes the drone form a square.
4) The JS code that calls the onboard script is as follows:
       
.. code-block:: JS
       
    $("#square").click(function(){
    var msgdata={};
    msgdata["app_name"]="app2";
    msgdata["arguments"]="3";
    $.ajax({
    type: "POST",
    dataType: "json",
    data: JSON.stringify(msgdata),
    url: "http://"+ip+"/ros/"+namespace+"/navigation/exec_script"

   The above mentioned code allows you to execute the onboard script with default square dimension. We now see how to use user defined square dimension to do the same.


.. image:: /_static/Images/pic1.png
  :height: 400px
  :width: 250px
  :align: center




**User defined Square dimension:**


1) First create a text area that accepts input from the user . The input here will be the Square dimension. The default value for this is 3 meters. Use the following Ionic code for creating the input text box.
    
.. code-block:: HTML
       
    <label class="item item-input">
    <input type="text" placeholder="Enter Square Dimension" id="dimension">
    </label>
    
     


2) The JS for the textbox is as follows:
       
.. code-block:: JS
       
    dim = $("#dimension").val();
    
    
    
3) On clicking the button created in step 1, the dimension set by the user is sent to the onboard script . the script is then executed and the drone forms a square of the dimension set by the user.

   
   
   
.. image:: /_static/Images/pic2.png
  :height: 400px
  :width: 250px
  :align: center



**Live data streaming from drone:**
   
In this example we request location status from the drone using topic Local Position.

1) First create a list using the code given below. Ionic provides a collection of lists that can be used .
       
.. code-block:: HTML
       
    <div class="item">
    <div class="row">
    <div class="col col-25 col-offset-10">X</div>
    <div class="col col-50 col-offset-25" id="posx"></div>
    </div>
    </div>
    ……….


2) We have also used the Ionic grid component in order to arrange  the elements of the list.
3) Before you can stream data the namespace and websocket have to be set . Use the code given below:
       
.. code-block:: JS
       
    $.ajax({
    type: "POST",
    dataType: "json",
    data: JSON.stringify(msgdata),
    url: "http://"+ip+"/ros/get_global_namespace"


4) And for initialising websocket use the following code snippet:
       
.. code-block:: JS
       
    var ros = new ROSLIB.Ros({
    url : 'ws://'+ip+'/websocket'
    });


5) The JS to initialize Local Position topic and subscribe to it is as follows. The data is being displayed in the HTML list:
       
.. code-block:: JS
       
   var listenerLocalPosition = new ROSLIB.Topic({
   ros :ros,
   name : '/'+namespace+'/mavros/local_position/local',
   messageType : 'geometry_msgs/TwistStamped',
   throttle_rate: 200
   });
   listenerLocalPosition.subscribe(function(message) {
   $("#posx").html(message.twist.linear.x);
   $("#posy").html(message.twist.linear.y);
   $("#posz").html(message.twist.linear.z);

   });
    
   
.. image:: /_static/Images/pic3.png
  :height: 400px
  :width: 250px
  :align: center   