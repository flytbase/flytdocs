# ROSCPP

## Download and Build the Demo Apps

* Source code for the roscpp sample applications can be found at our [github page](https://github.com/flytbase/flytsamples/tree/master/CPP-Python-ROS-Apps/ros_demoapps). Download the folder and place it in the `src` folder of your catkin workspace in your flight computer. If you haven’t created a catkin workspace before, follow these steps to create one.
* We are going to name our catkin workspace catkin\_ws. Create the folder by typing the following commands in your terminal:

  ```text
  $ mkdir -p ~/catkin_ws/src
  $ cd ~/catkin_ws/src
  ```

* Copy the ros\_demoapps folder in src
* You can now compile the the app by entering the following commands

  ```text
  $ cd ~/catkin_ws/
  $ catkin_make
  ```

* You will have to source your workspace by entering the following command

  ```text
  $ source ~/catkin_ws/devel/setup.bash
  ```

* You can add the above line at the end of your /etc/bash.bashrc file so that you don’t have to execute the sourcing command every time you open a new terminal. You will need sudo privileges to edit the /etc/bash.bashrc file.

## Demo App 1

This demo app makes the drone takeoff, move in a square trajectory of side length 5m, and land the drone once the entire mission is over.

Below is a demo [youtube video](https://www.youtube.com/watch?v=lwKZXkzkM80) of the same app.

{% embed url="https://youtu.be/lwKZXkzkM80" caption="Demo App 1 Flight Test" %}

### **Execution**

If you have compiled the downloaded programs successfully, execute them by running the following command in your terminal.

```text
$ rosrun ros_demoapps demoapp1_node
```

### **Code**

```text
#include <ros/ros.h>
#include <core_api/ParamGetGlobalNamespace.h>
#include <core_api/TakeOff.h>
#include <core_api/Land.h>
#include <core_api/PositionSet.h>

std::string global_namespace;

core_api::ParamGetGlobalNamespace namespace_srv;
core_api::TakeOff takeoff_srv;
core_api::Land land_srv;
core_api::PositionSet pos_srv;

ros::ServiceClient pos_client,land_client,takeoff_client;


bool position_set(float x, float y, float z)
{
  pos_srv.request.twist.twist.linear.x = x;
  pos_srv.request.twist.twist.linear.y = y;
  pos_srv.request.twist.twist.linear.z = z;
  pos_srv.request.twist.twist.angular.z = 0.0;
  pos_srv.request.tolerance = 1.0;
  pos_srv.request.async = false;
  pos_srv.request.yaw_valid = false;
  pos_srv.request.relative = false;
  pos_srv.request.body_frame = false;
  ROS_INFO("Going to the next setpoint");
  pos_client.call(pos_srv);
  return pos_srv.response.success;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "roscpp_demoapp1");
  ros::NodeHandle nh;

  ros::ServiceClient namespace_client = nh.serviceClient<core_api::ParamGetGlobalNamespace>("/get_global_namespace");
  namespace_client.call(namespace_srv);
  global_namespace = namespace_srv.response.param_info.param_value;
  
  takeoff_client = nh.serviceClient<core_api::TakeOff>("/"+global_namespace+"/navigation/take_off");
  land_client    = nh.serviceClient<core_api::Land>("/"+global_namespace+"/navigation/land");
  pos_client     = nh.serviceClient<core_api::PositionSet>("/"+global_namespace+"/navigation/position_set");

  ROS_INFO("Taking Off");
  takeoff_srv.request.takeoff_alt = 3.0;
  takeoff_client.call(takeoff_srv);
  if(!takeoff_srv.response.success)
  {
    ROS_ERROR("Failed to takeoff");
    return 1;    
  }
  
  //Sending Position Setpoints
  if(!position_set(5,0,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(5,5,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(0,5,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(0,0,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  ROS_INFO("Landing");
  land_srv.request.async =false;
  land_client.call(land_srv); 
  if(!land_srv.response.success)
  {
    ROS_ERROR("Failed to Land!");
    return 1;
  }
  return 0;
}
```

### **Code Explained**

* You must include the following header files for the services that we need to call

  ```text
  #include <ros/ros.h>
  #include <core_api/ParamGetGlobalNamespace.h>
  #include <core_api/TakeOff.h>
  #include <core_api/Land.h>
  #include <core_api/PositionSet.h>
  ```

* Call the global namespace getter service. The global namespace needs to be prepended to any service that will be called by this node. Visit the [namespace API documentation](http://api.flytbase.com/?cpp#namespace) page for more details.

  ```text
    ros::ServiceClient namespace_client = nh.serviceClient<core_api::ParamGetGlobalNamespace>("/get_global_namespace");
    namespace_client.call(namespace_srv);
    global_namespace = namespace_srv.response.param_info.param_value;
  ```

* TakeOff command can be sent to vehicle with relative takeoff altitude in meters as argument. Over here the takeoff altitude is 3m. Visit the [take-off API documentation](http://api.flytbase.com/?cpp#take-off) page for more details.

  ```text
    ROS_INFO("Taking Off");
    takeoff_srv.request.takeoff_alt = 3.0;
    takeoff_client.call(takeoff_srv);
    if(!takeoff_srv.response.success)
    {
      ROS_ERROR("Failed to takeoff");
      return 1;    
    }
  ```

{% hint style="info" %}
**Note:** You must ensure to call takeoff\(\) before sending any other position setpoints. takeoff\(\) inherently calls arm\(\), hence calling arm\(\) directly also arms the vehicle and makes it responsive towards next setpoint commands.
{% endhint %}

* Position Setpoints can be sent to the vehicle with \(x,y,z\) in meters in Local-NED Frame as argument. As the Position Setpoint service is being called repeatedly, we wrap it around with a function that takes in only the \(x, y, z\) coordinates. Users can modify the other fields like Async, tolerance and yaw\_valid an explore the effects on the mission. Visit the [position setpoint API documentation](http://api.flytbase.com/?cpp#position-setpoint) page for more details.

  ```text
  bool position_set(float x, float y, float z)
  {
    pos_srv.request.twist.twist.linear.x = x;
    pos_srv.request.twist.twist.linear.y = y;
    pos_srv.request.twist.twist.linear.z = z;
    pos_srv.request.twist.twist.angular.z = 0.0;
    pos_srv.request.tolerance = 1.0;
    pos_srv.request.async = false;
    pos_srv.request.yaw_valid = false;
    pos_srv.request.relative = false;
    pos_srv.request.body_frame = false;
    ROS_INFO("Going to the next setpoint");
    pos_client.call(pos_srv);
    return pos_srv.response.success;
  }
  ```

* Land command must be used to send the vehicle into Landing mode. Visit the [land API documentation](http://api.flytbase.com/?cpp#land) page for more details.

  ```text
    ROS_INFO("Landing");
    land_srv.request.async =false;
    land_client.call(land_srv); 
    if(!land_srv.response.success)
    {
      ROS_ERROR("Failed to Land!");
      return 1;
    }
  ```

* Please refer to [FlytAPIs](http://api.flytbase.com/) to get more information on the available list of APIs.

## Demo App 2

{% hint style="info" %}
**Note:** This demo requires arguments to be passed.
{% endhint %}

This demo app makes the drone takeoff, move in a square trajectory of side length _provided as an argument to the script_ and land once the entire mission is over.

### **Execution**

If you have compiled the downloaded programs successfully, execute them by running the following command in your terminal.

```text
$ rosrun ros_demoapps demoapp2_node 3.0
# here '3.0' is passed as an argument, one could send any other float value.
```

### **Code**

```text
#include <ros/ros.h>
#include <iostream>
#include <core_api/ParamGetGlobalNamespace.h>
#include <core_api/TakeOff.h>
#include <core_api/Land.h>
#include <core_api/PositionSet.h>

std::string global_namespace;

core_api::ParamGetGlobalNamespace namespace_srv;
core_api::TakeOff takeoff_srv;
core_api::Land land_srv;
core_api::PositionSet pos_srv;

ros::ServiceClient pos_client,land_client,takeoff_client;


bool position_set(float x, float y, float z)
{
  pos_srv.request.twist.twist.linear.x = x;
  pos_srv.request.twist.twist.linear.y = y;
  pos_srv.request.twist.twist.linear.z = z;
  pos_srv.request.twist.twist.angular.z = 0.0;
  pos_srv.request.tolerance = 1.0;
  pos_srv.request.async = false;
  pos_srv.request.yaw_valid = false;
  pos_srv.request.relative = false;
  pos_srv.request.body_frame = false;
  ROS_INFO("Going to the next setpoint");
  pos_client.call(pos_srv);
  return pos_srv.response.success;
}

int main(int argc, char **argv)
{
  if(argc < 2)
  {
    std::cout<<"\nThis app expects arguments\n";
    exit(0);
  }

  float side_length = std::stof(argv[1]);             //Convert Argument from string to float
  ros::init(argc, argv, "roscpp_demoapp1");
  ros::NodeHandle nh;

  ros::ServiceClient namespace_client = nh.serviceClient<core_api::ParamGetGlobalNamespace>("/get_global_namespace");
  namespace_client.call(namespace_srv);
  global_namespace = namespace_srv.response.param_info.param_value;
  
  takeoff_client = nh.serviceClient<core_api::TakeOff>("/"+global_namespace+"/navigation/take_off");
  land_client    = nh.serviceClient<core_api::Land>("/"+global_namespace+"/navigation/land");
  pos_client     = nh.serviceClient<core_api::PositionSet>("/"+global_namespace+"/navigation/position_set");

  ROS_INFO("Taking Off");
  takeoff_srv.request.takeoff_alt = 3.0;
  takeoff_client.call(takeoff_srv);
  if(!takeoff_srv.response.success)
  {
    ROS_ERROR("Failed to takeoff");
    return 1;    
  }
  //Sending Position Setpoints

  if(!position_set(side_length,0,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(side_length,side_length,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(0,side_length,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  if(!position_set(0,0,-3))
  {
    ROS_ERROR("Failed to set position");
    return 1;    
  }

  ROS_INFO("Landing");
  land_srv.request.async =false;
  land_client.call(land_srv); 
  if(!land_srv.response.success)
  {
    ROS_ERROR("Failed to Land!");
    return 1;
  }
  return 0;
}
```

