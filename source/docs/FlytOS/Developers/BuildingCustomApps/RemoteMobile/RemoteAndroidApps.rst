.. _write_remote_mobile_android:


Android App - Java (Android-Studio)
====================================

Sample App
^^^^^^^^^^
Clone the FlytSample repository from Github:`FlytSample App <https://github.com/flytbase/flytsamples.git>`_

**Building**

* Open Android Studio, and from the Welcome screen, select Open an existing Android Studio project.
* From the Open File or Project window that appears, navigate to and select the directory from wherever you cloned the `FlytSDK Sample <https://github.com/flytbase/flytsamples.git>`_ Github repo. Click OK.
* If it asks you to do a Gradle Sync, click OK.
* You may also need to install various platforms and tools, if you get errors like **"Failed to find target with hash string 'android-23' "** and similar.
* Click the Run button (the green arrow) or use Run -> Run 'android' from the top menu.
* If it asks you to use Instant Run, click Proceed Without Instant Run.
* Also, you need to have an Android device plugged in with developer options enabled at this point. See here for more details on setting up developer devices.

How to use FlytSDK
^^^^^^^^^^^^^^^^^^

**Following is a sample implementation of the REST call to fetch namespace from FlytOS**

   .. code-block:: java
   
      HttpParam httpParam = new HttpParam();
      httpParam.setUrl("http://" + {IP ADDRESS} + "/ros/get_global_namespace");
      JSONObject params=new JSONObject();
      httpParam.setParams(params);

      HttpRequest request=  new HttpRequest(new HttpRequest.IResponseHandler() {
      @Override
      public void onResponse(String response) {
           try {
                   JSONObject resp = new JSONObject(response);
                   namespace = resp.getJSONObject("param_info").getString("param_value");
           } catch (Exception| IOError e) {
           }
       }
       });
       request.execute(httpParam);

  
**Following is a sample implementation of the websocket call to get state from FlytOS**

   
   .. code-block:: java
   
      Ros ros=new Ros("ws://"+{IP Address}+"/websocket");
      ros.connect();

       
   .. note:: The Ros object initialisation is done once every time the app is start unless you are planning to connect multiple FlytOS devices.
        
        


   .. code-block:: java
        
      Topic stateData = new Topic(ros, "/" + namespace + "/flyt/state","mavros_msgs/State", 200);
      stateData.subscribe(new CallbackRos() {
            @Override
            public void handleMessage(JSONObject message) {
                try {
                    connectionStatus = message.getBoolean("connected");
                    armStatus= message.getBoolean("armed");
                } catch (JSONException e) {
                }
          }
          });


