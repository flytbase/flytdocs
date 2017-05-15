.. _write_remote_mobile_android:


Android App - Java (Android-Studio)
====================================

* You can download FlytSDK android from `here <https://downloads.flytbase.com/flytos/downloads/sdk/Flyt-Android-SDK.zip>`_ and build your app using it.


.. figure:: /_static/Images/android-sdk.png
  :align: center
  :width: 30%

* The SDK has all the required libraries for making REST calls and a websocket connection to FlytOS already integrated in it.
* The mainActivity in it shows a sample of how a REST call and a WebSocket call is to be made.
* Sample REST call to fetch namespace from FlytOS
   
   .. code-block:: java
   
       private class NamespaceRequest extends AsyncTask<Void, Void, String> {
          @Override
          protected String doInBackground(Void... params) {
              try {
                  //Rest url
                  final String url = "http://"+IP+"/ros/get_global_namespace";
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
    
* Sample websocket call to view roll pitch yaw from FlytOS.
   
   .. code-block:: java
   
       IP=editTextIP.getText().toString();
       //Initialise a ros object with websocket url
       ros=new Ros("ws://"+IP+"/websocket");
       ros.connect();

       
   .. note:: The Ros object initialisation is done once every time the app is run unless you are planning to connect to multiple FlytOS devices.
        
        


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

Sample Apps
----------------


1. Joystick App
^^^^^^^^^^^^^^^^^

* This is a sample joystick app to control your drone like you would in a regular joystick. 
* To try this app you can download the apk from `here <https://downloads.flytbase.com/flytos/downloads/apk/Flyt-Joystick-mode-1.apk>`_ or download the source code from `here <https://github.com/flytbase/flytsamples/tree/master/Mobile-Apps/Java-Apps/Joystick>`_.

* Once you have connected to your FlytOS device using the right URL, you will be redirected to the app screen.

* You need to press takeoff before you can use the joystick to control your drone(default 7 mts).

* The right joystick gives the drone commands to move up, down, turn-left and turn-right.

* The left joystick gives the drone commands to move front, back, left and right.

* All the commands are given with respect to the drone(front = direction of the nose/front of the drone).

* The app uses velocity_set API to control the drone.
  
  .. image:: /_static/Images/flytAndroidSample2.png
         :height: 300px
         :width: 500px
         :align: center

 
2. Follow me App
^^^^^^^^^^^^^^^^^^^^^^

* This App allows the user to send the drone the its(mobile device running the app) GPS location on click of a button and make the drone follow you. 
* To try this app you can download the apk from `here <https://downloads.flytbase.com/flytos/downloads/apk/Flyt-Follow-me.apk>`_ or download the source code from `here <https://github.com/flytbase/flytsamples/tree/master/Mobile-Apps/Java-Apps/Follow_me>`_.
* Once you have connected to your FlytOS device using the right URL, you will be redirected to the app screen.  
* The blue marker shows the location of the drone on the map.
* The blue dot shows the mobile location of the mobile device.
* Click on the follow on button on the bottom of the screen for the drone to start following you.
* Please wait for the mobile device to get an accurate GPS location for the drone to start accepting the GPS location.
* Click on follow off to stop the drone from following.
* Click the nudge button on the left side of the screen (first button on the left) to give or remove any offset between you and your drone when placed at the same location.
* Keep in mind to stop follow before giving it Land command.

  
  .. image:: /_static/Images/follow-me-android-app.png
         :height: 500px
         :width: 300px
         :align: center
  

