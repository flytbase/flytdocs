
**********************
Mobile App Development
**********************

Android App- HTML,CSS,JS (Cordova)
==================================

Create a new Project
--------------------




.. note:: Most of the steps involved in creating a Mobile app are similar to that of a Web app except that you will have to select PhoneGap/Cordova Project instead of Static Web while creating a new project.

Follow the steps below to get create a mobile app : 

#. Launch IntelliJ IDEA and click on create new project.
#. Select **Static Web** in the new window on the left side.
#. Make sure **PhoneGap/Cordova App** is selected on the right and click on next.
#. Fill up details of your project viz. Project Name and Project Location. Click on Finish.
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


Building and running the project
---------------------------------



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
--------------------------


In the earlier section we had built a Web app for the drone, we can also build an Android/iOS application by converting this Web app using Cordova. This application allows you to trigger an on-board script from a mobile that sends command to your drone to trace a square and receive live data from it.


Just like in the Web app an on-board script is executed here as well to make the drone navigate in a particular manner. 



Following are the components for this application : 


**Button to Execute Script:**



1) Here we create a simple button using the Ionic component ‘Button’. This button when clicked executes the on-board script which makes the drone form a square. The HTML code for which is as follows.

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
  			




.. image:: /_static/Images/Button.png
  :height: 200px
  :width: 250px
  :align: center
        




**Text-Box for accepting Square dimension:**


1) First create a text area that accepts input from the user. The input here will be the Square dimension. Use the following Ionic code for creating the input text box.
    
.. code-block:: HTML
       
    <label class="item item-input">
    <input type="text" placeholder="Enter Square Dimension" id="dimension">
    </label>
    
    
    
2) On clicking the button created in step 1, the dimension set by the user is sent to the on-board script. The script is then executed and the drone forms a square of the dimension set by the user.

   
   
   
.. image:: /_static/Images/Square_dim.png
  :height: 200px
  :width: 250px
  :align: center



**Live data streaming from drone:**
   
In this example we request location status from the drone using topic Local Position.

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
    
   
.. image:: /_static/Images/Square_app.png
  :height: 400px
  :width: 250px
  :align: center   


.. note:: Please note that you will have to change the IP address in the FlytDemo JS file to the IP address of the device you run FlytSim on. This is required so that data can be received on any external device that you have connected.


Android App - Java (Android-Studio)
===================================


Flyt - Android SDK
------------------

a. Here you are required to download the Flyt-Android-SDK based on Android Studio by signing up `here <http://flytbase.com/flytpod>`_ and build your app using it.
b. You will recieve the download links by mail, once you sign up.
c. The SDK has all the required libraries for making REST calls and a websocket connection to FlytPOD already integrated in it.
d. The mainActivity in it shows a sample of how a REST call and a WebSocket call is to be made.
e. Sample REST call to fetch namespace of the flytpod
   
   .. code-block:: java
   
       private class NamespaceRequest extends AsyncTask<Void, Void, String> {
          @Override
          protected String doInBackground(Void... params) {
              try {
                  //Rest url
                  final String url = "http://"+IP+":9090/ros/get_global_namespace";
                  //params in json
                  String requestJson = "{}";
                  //headers
                  HttpHeaders headers = new HttpHeaders();
                  headers.setContentType(MediaType.APPLICATION_JSON);

                  HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
                  //restTemplate object initialise for rest call
                  RestTemplate restTemplate = new RestTemplate();
                  restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
                  // make the rest call and recieve the response in "response"
                  String response = restTemplate.postForObject(url,entity, String.class);

                  return response;
              } catch (Exception  e) {
                  Log.e("MainActivity", e.getMessage(), e);
              }

              return null;
          }
          //function called after a successful rest call
          @Override
          protected void onPostExecute(String response) {
              if (response!="") {

                  try {
                      //initialise a JSON object with the response string
                      JSONObject resp = new JSONObject(response);
                      //extract the required field from the JSON object
                      namespace=resp.getJSONObject("param_info").getString("param_value");
                  } catch (JSONException  | NullPointerException e) {
              }
          }
      }
    
f. Sample websocket call to view roll pitch yaw of FlytPOD.
   
   .. code-block:: java
   
       IP=editTextIP.getText().toString();
       //Initialise a ros object with websocket url
       ros=new Ros("ws://"+IP+":9090/websocket");
       ros.connect();

       
   .. note:: The Ros object initialisation is done only once every time the app is run unless you are planning tp connect to multiple FlytPODs.
        
        


   .. code-block:: java
        
       //the namespace(unique for every FlytPOD) fetched from the rest call is used to subscribe to a web socket topic
       //the syntax Topic(<ros>, <topic>, <type>, <throttle rate>optional)
       topic=new Topic(ros,"/"+namespace+"/mavros/imu/data_euler" , "geometry_msgs/TwistStamped",200);
       topic.subscribe(new CallbackRos(){
             //callback method- what to do when messages recieved.
             @Override
             public void handleMessage(JSONObject message){
                  try {
                      updateRoll(message.getJSONObject("twist").getJSONObject("linear").getDouble("x"));
                      updatePitch(message.getJSONObject("twist").getJSONObject("linear").getDouble("y"));
                      updateYaw(message.getJSONObject("twist").getJSONObject("linear").getDouble("z"));


                  }catch(JSONException e){}
             }
       });    



.. _Ionic components: http://ionicframework.com/docs/components/