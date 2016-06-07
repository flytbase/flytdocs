
*******************
Web App development
*******************


Create a New Project
====================

Once all components are setup, you can begin app development by creating a new project in IntelliJ IDEA.




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

Also include eventemitter2.min.js and then roslib.js in your HTML pages. 

.. code-block:: HTML

    <script type="text/javascript" src="http://cdn.robotwebtools.org/EventEmitter2/current/eventemitter2.min.js"></script>
    <script type="text/javascript" src="http://cdn.robotwebtools.org/roslibjs/current/roslib.min.js"></script>



Building and Running the Project
================================




You can build and run the app using IntelliJ IDEA in a browser. Follow the steps below to do so:



- Go to **view**.
- Click on the **Open in browser** option.
- Select the browser of your choice.
  





Sample Web Application
======================

.. note:: The source code for the sample web/mobile apps is available in github in above mentioned repository for your reference.



Following is a simple demonstration of how to build a Web application for your drone. This application allows you to trigger an on-board script that sends commands to your drone to trace a square of user defined dimension. We will also see how to stream live data from your drone.



Following are the components for this application : 


**Button to Execute Script:**



1) Here we create a simple button using the Ionic component ‘Button’. This button when clicked executes the on-board script which makes the drone trace a square. The HTML code for which is as follows:

.. code-block:: HTML

    <button class="button button-block button-positive" id="square">
    	Execute Square
    </button>
       
       


2) Connection status needs to be checked. For this a REST call has to be made. If this is successful we get the namespace data and this can be used for making other REST calls and connecting to Web Scoket.
	
.. code-block:: JS
       
    $.ajax({
    	type: "POST",
    	dataType: "json",
    	data: JSON.stringify(msgdata),
    	url: "http://"+ip+"/ros/get_global_namespace"
    	success: function(data){
          if(data.success){
              namespace=data.param_info.param_value;
            }
    });

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
    		url: "http://"+ip+"/ros/"+namespace+"/navigation/exec_script",
    		success: function(data){
    			console.log(data);
    		}
    	});
    });

	

The above mentioned code allows you to execute the on-board script with default square dimension. We now see how to use user defined square dimension to do the same.
			
						
  			
.. image:: /_static/Images/web_button.png
  :align: center




        




**Text-Box for accepting Square dimension:**


1) First create a text area that accepts input from the user. The input here will be the Square dimension. Use the following Ionic code for creating the input text box.
    
.. code-block:: HTML
       
    <label class="item item-input">
    	<input type="text" placeholder="Enter Square Dimension" id="dimension">
    </label>
       


.. image:: /_static/Images/web_square_dim.png
  :align: center

    
    
    
2) On clicking the button created in step 1, the dimension set by the user is sent to the on-board script. The script is then executed and the drone forms a square of the dimension set by the user.


**Live data streaming from drone:**
   
In this example we stream live data of location status from the drone by subscribing to topic Local Position.

1) First create a list using the code given below. Ionic provides a collection of lists that can be used.
       
.. code-block:: HTML
       
    <div class="item">
    	<div class="row">
    		<div class="col col-20 col-offset-10">X</div>
    		<div class="col col-65 col-offset-20" id="posx"></div>
    	</div>
    </div>
    <div class="item">
    	<div class="row">
    		<div class="col col-20 col-offset-10">Y</div>
    		<div class="col col-65 col-offset-20" id="posy"></div>
    	</div>
    </div>
    <div class="item">
    	<div class="row">
    		<div class="col col-20 col-offset-10">Z</div>
    		<div class="col col-65 col-offset-20" id="posz"></div>
    	</div>
    </div>




2) We have also used the Ionic Grid component in order to arrange the elements of the list.



3) For initializing websocket use the following code snippet. This is done to stream live data from the drone.

.. code-block:: JS

    var ros = new ROSLIB.Ros({
    url : 'ws://'+ip+'/websocket'
    });               
    ros.on('connection', function() {
    console.log('Connected to websocket server.');
    });               
    ros.on('error', function(error) {
    console.log('Error connecting to websocket server: ', error);
    });               
    ros.on('close', function() {
    console.log('Connection to websocket server closed.');
    });


4) The REST call used to fetch the namespace in previous steps is used here to subscribe to topics to get the live stream of data.
   Follow the code below to do so:
       
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
 
.. image:: /_static/Images/web_square_app.png
  :align: center




.. note:: Please note that you will have to change the IP address in the FlytDemo_web JS file to the IP address of the device you run FlytSim on. This is required so that data can be received on any external device that you have connected.





Deploying Web App Onboard
=============================

Once you have built your Web app, you are ready to deploy it Onboard. These are the steps to be followed.

1) Go into the folder Flyt/flytapps/web.
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



6) Now come back to Flyt/flytapps/web and add an entry for your sampleApp in apps.py file.

.. code-block:: python

    from flask import Blueprint, render_template, Flask

    from .flytconsole.views import flytconsole
    from .flytvision.views import flytvision
    from .demoapp1.views import demoapp1
    from .demomarker.views import demomarker
    from .apriltagsdemo.views import apriltagsdemo
    from .joystick.views import joystick
    from .sampleApp.views import sampleApp

    def register( main_app ):
      main_app.register_blueprint(flytconsole,url_prefix='/flytconsole')
      main_app.register_blueprint(flytvision,url_prefix='/flytvision')
      main_app.register_blueprint(demoapp1,url_prefix='/demoapp1')
      main_app.register_blueprint(demomarker,url_prefix='/demomarker')
      main_app.register_blueprint(apriltagsdemo,url_prefix='/april')
      main_app.register_blueprint(joystick,url_prefix='/joystick')
      main_app.register_blueprint(sampleApp,url_prefix='/sampleApp')



7) Now restart the FlytOS and your web app will be served at www.flytpod:9090/sampleApp .

.. _Ionic components: http://ionicframework.com/docs/components/