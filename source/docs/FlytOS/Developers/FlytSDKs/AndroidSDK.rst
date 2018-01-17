.. _flytsdks_android:

Android SDK
============

Prerequisite
^^^^^^^^^^^^

Before you can use the Android FlytSDK, you'll need:

* Android SDK Level 14 (Ice Cream Sandwich 4.0) or higher
* JDK 1.8 or higher
* Android Studio

Setup
^^^^^

1. Download FlytSDK android from `here <https://github.com/flytbase/flytsamples/raw/master/Mobile-Apps/Java-Apps/FlytbaseSDK/FlytSDK.jar>`_
2. Copy the Downloaded file and add it to the libs folder in your android project. If your project does not contain any libs directory, you can create the directory in the same level to the project src folder.
3. Register module in build.gradle file.

* Click on file menu and on the pop up menu click on the project structure
     
* On the new window, select you app and click on Dependencies tab to select it.

* Click on the + sign icon on the top right, choose File dependency and select the dependency file from libs folder.Then click apply and OK to finish.

4. Click on Sync Project with gradle files

Sample App
^^^^^^^^^^
Download the FlytSample repository from Github:`FlytSample App <https://github.com/flytbase/flytsamples/tree/master/Mobile-Apps/Java-Apps/SampleApp>`_

**Building**

* Open Android Studio, and from the Welcome screen, select Open an existing Android Studio project.
* From the Open File or Project window that appears, navigate to and select the directory where you have cloned the FlytSample App, Click OK.
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
