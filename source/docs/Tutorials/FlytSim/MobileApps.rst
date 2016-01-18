.. _flytsim mobile apps:

***********
Mobile Apps
***********

Introduction
============

This document deals with the instructions and step by step guide for creating Web and Mobile apps for your Drone. The Web apps can be developed using HTML, CSS and JS, however in the case of Mobile apps there are two ways of doing so. The conventional way is to build a mobile app using IDEs such as Eclipse or Android Studio in JAVA . The other way of going about creating mobile apps is to use the Web app created i.e a simple HTML,CSS and JS project and convert that into a mobile app using frameworks such as Cordova and Phonegap. This allows for sharing the same codebase for creating cross-platform mobile apps.


Here we will delve into the second approach: developing mobile apps using web technologies (HTML, CSS, JS/Jquery) and Cordova engine. These apps will allow you to remotely monitor and command your drone. You will also see how to get custom data from the Drone on your app.
  

The IDE that we have selected for this project is Intellij Idea. The GUI and the client side coding is done in HTML, CSS and JS/Jquery using Ionic as the front end framework for both Web and Mobile apps.


Front end Framework
^^^^^^^^^^^^^^^^^^^

Ionic is free and open source and offers a library of mobile optimized HTML, CSS and JS components, reusable and customizable UI elements and other tools for building highly interactive mobile apps.We will be using Ionic for the front end development of Web apps as well as we will be converting this Web app into Mobile app later in this tutorial.For this Ionic uses Cordova engine which is a mobile development framework that uses web technologies for cross platform app development. You can refer to Ionic `getting started`_ guide for further instructions and to make yourself familiarized with the Ionic framework. For details about Cordova, you can look at their documentation `here`_.


.. note:: There are many other Web and Mobile app front end frameworks available. You can use any framework that you are comfortable with.


IDE
^^^

The IDE that we have used here is IntelliJ IDEA. There are many other options available so feel free to use one that you are comfortable with. IntelliJ IDEA supports Ionic( Front end framework) and allows you to create Phonegap/Cordova projects. Since we will be using both these softwares, make sure the IDE that you use supports them. For more information on IntelliJ IDEA `click here`_.



Development Environment Setup
=============================

For a quick start, you can follow the steps given below to install Ionic, Cordova and IntelliJ IDEA :

.. note:: Node.js, Ionic and IntelliJ IDEA have to be installed for the creation of both Web and Mobile apps.



#. Please install Node.js v4 (Node.js v5 does not work at the moment with Ionic). To install node.js go to this `link`_. 
   

#. To install the latest Ionic and Cordova use the following command:
   $ npm install -g cordova ionic

#. Follow the Android and iOS platform guides to install required platform dependencies (SDKs).

   .. note:: iOS development requires Mac OS X. iOS simulator through the Ionic CLI requires the ios-sim npm package, which can be installed with the command sudo npm -g install ios-sim.



#. IntelliJ IDEA also requires JDK 7. To install JDK 7 go to `this link`_.

#. Go to the `link here`_ to install IntelliJ IDEA.



Creating and Running a Web Application Project
==============================================



Once all components are setup, you can begin app development by creating a new project in IntelliJ IDEA.


Steps to Create New Project for Web app:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Launch IntelliJ IDEA and click on **create new project**.
#. Select **Static Web** in the new window on the left side.
#. Make sure **Static Web** is selected on the right and click on **next**.
#. Fill up details of your project viz. Project Name and Project Location. Click on **Finish**.
#. New project opens up. You can create/edit your HTML, CSS and JS/Jquery files here.


The front end of the app is developed in HTML, CSS, JS/Jquery using the `Ionic components`_.


To use these components in your app, the Ionic libraries have to be included in your HTML files. Here is a list of Ionic files that have to be included:

#. ionic.css
#. ionic.min.css
#. ionic.bundle.js
#. ionic.bundle.min.js
#. fonts file

Also include eventemitter2.min.js and then roslib.js in your HTML pages. Follow the steps below to include these files in your project:

#. Clone the sample project from the `GitHub repository`_.
#. Go to the directory where the project is saved.
#. Go to the directory flytsamples.
#. Inside Android apps open the project folder.
#. From the JS folder copy eventemitter.js and roslib.js and import them to your project in IntelliJ IDEA.



Building and Running the Project:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can build and run the app using IntelliJ IDEA in a browser. Follow the steps below to do so :



- Go to **view**.
- Click on the **Open in browser** option.
- Select the browser of your choice.
  





Sample Web Application
======================


Following is a simple demonstration of how to build a Web application for your drone. This application allows you to trigger an onboard script that sends commands to your drone to trace a square of user defined dimension. We will also see how to stream live data from your drone.



Following are the components for this application : 


**Button to Execute Script:**



1) Here we create a simple button using the Ionic component ‘Button’. The html code for which is as follows:

.. code-block:: HTML

    <button class="button button-block button-positive" id="square">
    Execute Square
    </button>
       
       


2) This button when clicked executes the on-board script which makes the drone trace a square.
3) The JS code that calls the on-board script is as follows:
       
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

   The above mentioned code allows you to execute the on-board script with default square dimension. We now see how to use user defined square dimension to do the same.			
  			





        




**Text-Box for accepting Square dimension:**


1) First create a text area that accepts input from the user. The input here will be the Square dimension. Use the following Ionic code for creating the input text box.
    
.. code-block:: HTML
       
    <label class="item item-input">
    <input type="text" placeholder="Enter Square Dimension" id="dimension">
    </label>
       

    
    
    
2) On clicking the button created in step 1, the dimension set by the user is sent to the on-board script. The script is then executed and the drone forms a square of the dimension set by the user.

   
   
   




**Live data streaming from drone:**
   
In this example we stream live data of location status from the drone using topic Local Position.

1) First create a list using the code given below. Ionic provides a collection of lists that can be used.
       
.. code-block:: HTML
       
    <div class="item">
    <div class="row">
    <div class="col col-25 col-offset-10">X</div>
    <div class="col col-50 col-offset-25" id="posx"></div>
    </div>
    </div>
    ……….


2) We have also used the Ionic grid component in order to arrange the elements of the list.
3) Before you can stream data the namespace and websocket have to be set. Use the code given below:
       
.. code-block:: JS
       
    $.ajax({
    type: "POST",
    dataType: "json",
    data: JSON.stringify(msgdata),
    url: "http://"+ip+"/ros/get_global_namespace"


4) And for initializing websocket use the following code snippet:

.. code-block:: JS

    var ros = new ROSLIB.Ros({
    url : 'ws://'+ip+'/websocket'
    });               ros.on('connection', function() {
    console.log('Connected to websocket server.');
    });               ros.on('error', function(error) {
    console.log('Error connecting to websocket server: ', error);
    });               ros.on('close', function() {
    console.log('Connection to websocket server closed.');
    });


5) The JS to initialize Local Position topic and to subscribe to it is as follows. The data is being displayed in the HTML list:
       
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
    
   


.. note:: Please note that you will have to change the IP address in the JS file to the IP address of the device you run FlytSim on. This is required so that data can be received on any external device that you have connected.











Creating and Running a Mobile Application Project
=================================================






Steps to Create New Project for Mobile App:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: Most of the steps involved in creating a Mobile app are similar to that of a Web app except that you will have to select PhoneGap/Cordova Project instead of Static Web while creating a new project.

Follow the steps below to get create a mobile app : 

#. Launch IntelliJ IDEA and click on create new project.
#. Select Static Web in the new window on the left side.
#. Make sure Static Web is selected on the right and click on next.
#. Fill up details of your project viz. Project Name and Project Location. Click on Finish.
#. New project opens up. You can create/edit your HTML, CSS and JS/Jquery files here.


The front end of the app is developed in HTML, CSS, JS/Jquery using the `Ionic components`_.


To use these components in your app, the Ionic libraries have to be included in your HTML files. Here is a list of Ionic files that have to be included:

#. ionic.css
#. ionic.min.css
#. ionic.bundle.js
#. ionic.bundle.min.js
#. fonts file

Also include eventemitter2.min.js and then roslib.js in your HTML pages. Follow the steps below to include these files in your project:

#. Clone the sample project from the `GitHub repository`_.
#. Go to the directory where the project is saved.
#. Go to the directory flytsamples.
#. Inside Android apps open the project folder.
#. From the JS folder copy eventemitter.js and roslib.js and import them to your project in IntelliJ IDEA.



Building and Running the Project:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can build and run the app using IntelliJ IDEA in either a browser based emulator or load the app on your mobile device.

**Running in Browser:**

- Go to **view**.
- Click on the **Open in browser** option.
- Select the browser of your choice.
  

**Running in Device:**

- Connect mobile device to computer using a USB/uUSB cable.
- Select **Specify target** in IntelliJ Idea corresponding to your device (Refresh if necessary).
- Click on **Run** button to start building your app and to install it on the device.


Sample Mobile Application
=========================


Now that we have built a Web app for the drone, we can also build an Android application by converting this Web app using Cordova. This application too allows you to trigger an on-board script that sends command to your drone to trace a square and receive live data from it.


Just like in the Web app an on-board script is executed here as well to make the drone navigate in a particular manner. The command for executing this on-board script is given by the user through the Android  application.



Following are the components for this application : 


**Button to Execute Script:**



1) Here we create a simple button using the Ionic component ‘Button’. The html code for which is as follows:

.. code-block:: HTML

    <button class="button button-block button-positive" id="square">
    Execute Square
    </button>
       
       


2) This button when clicked executes the on-board script which makes the drone form a square.
3) The JS code that calls the on-board script is as follows:
       
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

   The above mentioned code allows you to execute the on-board script with default square dimension. We now see how to use user defined square dimension to do the same.			
  			




.. image:: /_static/Images/pic1.png
  :height: 400px
  :width: 250px
  :align: center
        




**Text-Box for accepting Square dimension:**


1) First create a text area that accepts input from the user. The input here will be the Square dimension. Use the following Ionic code for creating the input text box.
    
.. code-block:: HTML
       
    <label class="item item-input">
    <input type="text" placeholder="Enter Square Dimension" id="dimension">
    </label>
    
    
    
2) On clicking the button created in step 1, the dimension set by the user is sent to the on-board script. The script is then executed and the drone forms a square of the dimension set by the user.

   
   
   
.. image:: /_static/Images/pic2.png
  :height: 400px
  :width: 250px
  :align: center



**Live data streaming from drone:**
   
In this example we request location status from the drone using topic Local Position.

1) First create a list using the code given below. Ionic provides a collection of lists that can be used.
       
.. code-block:: HTML
       
    <div class="item">
    <div class="row">
    <div class="col col-25 col-offset-10">X</div>
    <div class="col col-50 col-offset-25" id="posx"></div>
    </div>
    </div>
    ……….


2) We have also used the Ionic grid component in order to arrange the elements of the list.
3) Before you can stream data the namespace and websocket have to be set. Use the code given below:
       
.. code-block:: JS
       
    $.ajax({
    type: "POST",
    dataType: "json",
    data: JSON.stringify(msgdata),
    url: "http://"+ip+"/ros/get_global_namespace"


4) And for initializing websocket use the following code snippet:
       
.. code-block:: JS
       
    var ros = new ROSLIB.Ros({
    url : 'ws://'+ip+'/websocket'
    });               ros.on('connection', function() {
    console.log('Connected to websocket server.');
    });               ros.on('error', function(error) {
    console.log('Error connecting to websocket server: ', error);
    });               ros.on('close', function() {
    console.log('Connection to websocket server closed.');
    });


5) The JS to initialize Local Position topic and to subscribe to it is as follows. The data is being displayed in the HTML list:
       
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


.. note:: Please note that you will have to change the IP address in the JS file to the IP address of the device you run FlytSim on. This is required so that data can be recieved on any external device that you have connected.



.. _getting started: http://ionicframework.com/getting-started

.. _here: https://cordova.apache.org/docs/en/latest/guide/overview/

.. _click here: https://www.jetbrains.com/idea/

.. _link: https://nodejs.org/en/download/

.. _this link: http://docs.oracle.com/javase/7/docs/webnotes/install/index.html 

.. _link here: https://www.jetbrains.com/idea/download

.. _Ionic components: http://ionicframework.com/docs/components/

.. _GitHub repository: https://github.com/navstik/flytsample
