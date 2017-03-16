
**********************
Mobile App Development
**********************

Android App- HTML,CSS,JS (Cordova)
==================================

Create a new Project
--------------------


Follow the steps below to get create a mobile app : 

#. Launch IntelliJ IDEA and click on create new project.
#. Select **Static Web** in the new window on the left side.
#. Make sure **PhoneGap/Cordova App** is selected on the right and click on next.
#. Fill up details of your project viz. Project Name and Project Location. Click on Finish.
#. New project opens up. You can create/edit your HTML, CSS and JS/Jquery files here.


The front end of the app is developed in HTML, CSS, JS/Jquery .


To start building an Android App using Cordova all you need to do is, add the files of `Flyt_Web_SDK`_ to this project and build your App like you would a Web App (editing the app.html and app.js files).


Building and running the project
---------------------------------



You can build and run the app using IntelliJ IDEA in either a browser based emulator or load the app on your mobile device.

**Running in Browser:**

- Go to **view**.
- Click on the **Open in browser** option.
- Select the browser of your choice.
  

**Running in Device:**

- Connect mobile device to computer using a USB cable.
- Select **Specify target** in IntelliJ Idea corresponding to your device (Refresh if necessary).
- Click on **Run** button to start building your app and to install it on the device.


Sample Mobile Application
--------------------------


In the earlier section we had built a Web app for the drone, we can also build an Android/iOS application by converting this Web app using Cordova. This application allows you to trigger an on-board service to takeoff and land the drone from your mobile device.


You just need to connect to the FlytOS running system by entering the **URL** in the first App screen.




.. image:: /_static/Images/mobile-sample-app-url.png
  :align: center

.. image:: /_static/Images/mobile-app-sample.png
  :align: center
        

You can Also try out `Flyt Joystick`_ app or view the code from the `repository`_:

- Install or build the app and launch it.
- Enter the IP of the device running FlytOS to be able to communicate with it.

.. image:: /_static/Images/app-login-screen.png
  :align: center 

- Once the IP is confirmed you are redirected to the app screen.
- This App allows the user to send the drone velocity setpoints and control the drone as with a regular joystick.

Things to Remember

- You need to takeoff before you can use the joystick to control your drone.
- The left joystick gives the drone commands to move up down turn-left and turn-right.
- The right joystick gives the drone commands to move front back left and right.
- All the commands are given with respect to the drone(front = direction of the nose/front of the drone).


.. image:: /_static/Images/app-screen.png
  :align: center




.. Android App - Java (Android-Studio)
.. ===================================


.. Flyt - Android SDK
.. ------------------

.. a. Here you are required to download the Flyt-Android-SDK based on Android Studio by signing up `here <http://flytbase.com/flytos#flytsdk>`_ and build your app using it.
.. b. You will recieve the download links by mail, once you sign up.
.. c. The SDK has all the required libraries for making REST calls and a websocket connection to FlytPOD already integrated in it.
.. d. The mainActivity in it shows a sample of how a REST call and a WebSocket call is to be made.
.. e. Sample REST call to fetch namespace of the flytpod
   
..    .. code-block:: java
   
..        private class NamespaceRequest extends AsyncTask<Void, Void, String> {
..           @Override
..           protected String doInBackground(Void... params) {
..               try {
..                   //Rest url
..                   final String url = "http://"+IP+"/ros/get_global_namespace";
..                   //params in json
..                   String requestJson = "{}";
..                   //headers
..                   HttpHeaders headers = new HttpHeaders();
..                   headers.setContentType(MediaType.APPLICATION_JSON);

..                   HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
..                   //restTemplate object initialise for rest call
..                   RestTemplate restTemplate = new RestTemplate();
..                   restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
..                   // make the rest call and recieve the response in "response"
..                   String response = restTemplate.postForObject(url,entity, String.class);

..                   return response;
..               } catch (Exception  e) {
..                   Log.e("MainActivity", e.getMessage(), e);
..               }

..               return null;
..           }
..           //function called after a successful rest call
..           @Override
..           protected void onPostExecute(String response) {
..               if (response!="") {

..                   try {
..                       //initialise a JSON object with the response string
..                       JSONObject resp = new JSONObject(response);
..                       //extract the required field from the JSON object
..                       namespace=resp.getJSONObject("param_info").getString("param_value");
..                   } catch (JSONException  | NullPointerException e) {
..               }
..           }
..       }
    
.. f. Sample websocket call to view roll pitch yaw of FlytPOD.
   
..    .. code-block:: java
   
..        IP=editTextIP.getText().toString();
..        //Initialise a ros object with websocket url
..        ros=new Ros("ws://"+IP+"/websocket");
..        ros.connect();

       
..    .. note:: The Ros object initialisation is done only once every time the app is run unless you are planning tp connect to multiple FlytPODs.
        
        


..    .. code-block:: java
        
..        //the namespace(unique for every FlytPOD) fetched from the rest call is used to subscribe to a web socket topic
..        //the syntax Topic(<ros>, <topic>, <type>, <throttle rate>optional)
..        topic=new Topic(ros,"/"+namespace+"/mavros/imu/data_euler" , "geometry_msgs/TwistStamped",200);
..        topic.subscribe(new CallbackRos(){
..              //callback method- what to do when messages recieved.
..              @Override
..              public void handleMessage(JSONObject message){
..                   try {
..                       updateRoll(message.getJSONObject("twist").getJSONObject("linear").getDouble("x"));
..                       updatePitch(message.getJSONObject("twist").getJSONObject("linear").getDouble("y"));
..                       updateYaw(message.getJSONObject("twist").getJSONObject("linear").getDouble("z"));


..                   }catch(JSONException e){}
..              }
..        });  


.. Flyt Sample Apps
.. ----------------


.. 1. Flyt Sample App 1 - REST
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * This sample app shows how to make REST calls. 
.. * To try this app you can download the apk from `here <https://s3-us-west-2.amazonaws.com/flytos/SampleAndroidApk/FLYT-Sample-App1-Rest.apk>`_ or download the source code from `here <https://github.com/flytbase/flytsamples/tree/master/AndroidApps/Java-Apps/SampleApp1-REST>`_.
  
..   .. image:: /_static/Images/flytAndroidSample1.png
..   				:height: 500px
..   				:width: 300px
..   				:align: center

 
.. 2. Flyt Sample App 2 - Socket
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * This sample app shows how to make WebSocket subscription for live streaming of data. 
.. * To try this app you can download the apk from `here <https://s3-us-west-2.amazonaws.com/flytos/SampleAndroidApk/FLYT-Sample-App2-Socket.apk>`_ or download the source code from `here <https://github.com/flytbase/flytsamples/tree/master/AndroidApps/Java-Apps/SampleApp2-Socket>`_.
  
..   .. image:: /_static/Images/flytAndroidSample3.png
..   				:height: 500px
..   				:width: 300px
..   				:align: center
  

.. 3. Flyt Sample App 3 - Joystick
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. * This is a sample Joystick app to control the FlytPOD. 
.. * To try this app you can download the apk from `here <https://s3-us-west-2.amazonaws.com/flytos/SampleAndroidApk/FLYT-Sample-App3-Joystick.apk>`_ or download the source code from `here <https://github.com/flytbase/flytsamples/tree/master/AndroidApps/Java-Apps/SampleApp3-Joystick>`_.
  
..   .. image:: /_static/Images/flytAndroidSample2.png
..   				:height: 300px
..   				:width: 500px
..   				:align: center
  				




.. _Ionic components: http://ionicframework.com/docs/components/
.. _Flyt_Web_SDK: https://github.com/flytbase/flytsamples/tree/master/WebApps/Flyt_Web_SDK
.. _repository: https://github.com/flytbase/flytsamples/tree/master/AndroidApps/HTML-JS-Apps
.. _Flyt Joystick: https://flyt.blob.core.windows.net/flytos/downloads/apk/Flyt-Joystick.apk
.. _Flyt Follow me: https://flyt.blob.core.windows.net/flytos/downloads/apk/Flyt-FollowMe.apk
.. _Flyt GPS: https://flyt.blob.core.windows.net/flytos/downloads/apk/Flyt-GPS.apk