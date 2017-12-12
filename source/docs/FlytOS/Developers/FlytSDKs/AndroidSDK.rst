.. _flytsdks_android:

Android SDK
============

* You can download FlytSDK android from `here <https://downloads.flytbase.com/flytos/downloads/sdk/Flyt-Android-SDK.zip>`_ and build your app using it.
* You need to add the JAR to Android Project. You can do that by copying the JAR File to Libs Folder and also choose the dependency pointing towards the JAR file which will be in Libs folder.
* Finally press the Sync Gradle button.


.. figure:: /_static/Images/android-sdk.png
	:align: center
	:width: 30%

* The SDK has all the required libraries for making REST calls and a websocket connection to FlytOS already integrated in it.
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

       
   .. note:: The Ros object initialisation is done once every time the app is run unless you are planning to connect multiple FlytOS devices.
        
        


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
