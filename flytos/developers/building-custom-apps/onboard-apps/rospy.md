# ROSPY

## Download and Build the Demo Apps

* Source code for the rospy sample applications can be found at our [github page](https://github.com/flytbase/flytsamples/tree/master/CPP-Python-ROS-Apps/ros_demoapps). Download the folder and place it in the `src` folder of your catkin workspace in your flight computer. If you haven’t created a catkin workspace before, follow these steps to create one.
* We are going to name our catkin workspace catkin\_ws. Create the folder by typing the following commands in your terminal:

  ```text
  $ mkdir -p ~/catkin_ws/src
  $ cd ~/catkin_ws/src
  ```

* Copy the ros\_demoapps folder in src
* You can now compile the the apps by entering the following commands

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
$ rosrun ros_demoapps demoapp1.py
```

### **Code**

```text
#!/usr/bin/env python
import rospy
from core_api.srv import *

global_namespace = ''

def setpoint_local_position(lx, ly, lz, yaw=0.0, tolerance= 1.0, async = False, relative= False, yaw_valid= False, body_frame= False):
  global global_namespace
  rospy.wait_for_service('/'+ global_namespace +'/navigation/position_set')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/position_set', PositionSet)

    # building message structure
    header_msg = std_msgs.msg.Header(1,rospy.Time(0.0,0.0),'a')
    twist = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(lx,ly,lz),geometry_msgs.msg.Vector3(0.0,0.0,yaw))
    twiststamped_msg= geometry_msgs.msg.TwistStamped(header_msg, twist)
    req_msg = PositionSetRequest(twiststamped_msg, tolerance, async, relative, yaw_valid, body_frame)
    resp = handle(req_msg)
    return resp.success
  except rospy.ServiceException, e:
    rospy.logerr("pos set service call failed %s", e)
    return None

def make_square():
  global global_namespace
  #first get the global namespace to call the subsequent services
  #wait for service to come up
  rospy.wait_for_service('/get_global_namespace')
  try:
    res = rospy.ServiceProxy('/get_global_namespace', ParamGetGlobalNamespace)
    op = res()
    global_namespace = str(op.param_info.param_value)
  except rospy.ServiceException, e:
    rospy.logerr("global namespace service not available", e)
    #cannot continue without global namespace
    return None

  # Next take off to an altitue of 3.0 meters
  rospy.wait_for_service('/'+ global_namespace +'/navigation/take_off')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/take_off', TakeOff)
    resp = handle(takeoff_alt=3.0)
  except rospy.ServiceException, e:
    rospy.logerr("takeoff service call failed %s", e)
    # cannot continue without taking off
    return None
  print "Took off successfully"

  # Then call the position set service for each edge of a square shaped trajectory
  if setpoint_local_position(5,0,-3.0):
    print "Successfully reached 1st waypoint"
  else: 
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(5,5,-3.0):
    print "Successfully reached 2nd waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(0,5,-3.0):
    print "Successfully reached 3rd waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(0,0,-3.0):
    print "Successfully reached 4th waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None

  # Finally land the drone
  rospy.wait_for_service('/'+ global_namespace +'/navigation/land')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/land', Land)
    resp = handle(False)
  except rospy.ServiceException, e:
    rospy.logerr("land service call failed %s", e)
    return None
  print "Landed Successfully. Exiting script."

if __name__ == "__main__":
  make_square()
```

### **Code Explained**

* We must include the header files for the services that we need to call

  ```text
  #!/usr/bin/env python
  import rospy
  from core_api.srv import *
  ```

* Call the global namespace getter service. The global namespace needs to be prepended to any service that will be called by this node. Visit the [namespace API documentation](http://api.flytbase.com/?python#namespace) page for more details.

  ```text
    rospy.wait_for_service('/get_global_namespace')
    try:
      res = rospy.ServiceProxy('/get_global_namespace', ParamGetGlobalNamespace)
      op = res()
      global_namespace = str(op.param_info.param_value)
    except rospy.ServiceException, e:
      rospy.logerr("global namespace service not available", e)
      #cannot continue without global namespace
      return None
  ```

* TakeOff command can be sent to vehicle with relative takeoff altitude in meters as argument. Over here the takeoff altitude is 3m. Visit the [take-off API documentation](http://api.flytbase.com/?python#take-off) page for more details.

  ```text
    # Next take off to an altitue of 3.0 meters
    rospy.wait_for_service('/'+ global_namespace +'/navigation/take_off')
    try:
      handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/take_off', TakeOff)
      resp = handle(takeoff_alt=3.0)
    except rospy.ServiceException, e:
      rospy.logerr("takeoff service call failed %s", e)
      # cannot continue without taking off
      return None
    print "Took off successfully"
  ```

{% hint style="danger" %}
**Caution:** You must ensure to call takeoff\(\) before sending any other position setpoints. takeoff\(\) inherently calls arm\(\), hence calling arm\(\) directly also arms the vehicle and makes it responsive towards next setpoint commands.
{% endhint %}

* Position Setpoints can be sent to the vehicle with \(x,y,z\) in meters in Local-NED Frame as argument. As the Position Setpoint service is being called repeatedly, we wrap it around with a function that takes in only the \(x, y, z\) coordinates. Users can modify the other fields like Async, tolerance and yaw\_valid an explore the effects on the mission. Visit the [position setpoint API documentation](http://api.flytbase.com/?python#position-setpoint) page for more details.

  ```text
  def setpoint_local_position(lx, ly, lz, yaw=0.0, tolerance= 1.0, async = False, relative= False, yaw_valid= False, body_frame= False):
    global global_namespace
    rospy.wait_for_service('/'+ global_namespace +'/navigation/position_set')
    try:
      handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/position_set', PositionSet)

      # building message structure
      header_msg = std_msgs.msg.Header(1,rospy.Time(0.0,0.0),'a')
      twist = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(lx,ly,lz),geometry_msgs.msg.Vector3(0.0,0.0,yaw))
      twiststamped_msg= geometry_msgs.msg.TwistStamped(header_msg, twist)
      req_msg = PositionSetRequest(twiststamped_msg, tolerance, async, relative, yaw_valid, body_frame)
      resp = handle(req_msg)
      return resp.success
    except rospy.ServiceException, e:
      rospy.logerr("pos set service call failed %s", e)
      return None
  ```

* Land command must be used to send the vehicle into Landing mode. Visit the [land API documentation](http://api.flytbase.com/?python#land) page for more details.

  ```text
    # Finally land the drone
    rospy.wait_for_service('/'+ global_namespace +'/navigation/land')
    try:
      handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/land', Land)
      resp = handle(False)
    except rospy.ServiceException, e:
      rospy.logerr("land service call failed %s", e)
      return None
    print "Landed Successfully. Exiting script."
  ```

* Please refer to [FlytAPIs](http://api.flytbase.com/) to get more information on the available list of APIs.

## Demo App 2

{% hint style="info" %}
**Note:** This demo requires arguments to be passed.
{% endhint %}

This demo app makes the drone takeoff, move in a square trajectory of side length _provided as an argument to the script_ and land once the entire mission is over.

### **Execution**

If you have downloaded the programs successfully, execute them by running the following command in your terminal.

```text
$ rosrun ros_demoapps demoapp2.py 3.0
# here '3.0' is passed as an argument, one could send any other float value.
```

### **Code**

```text
#!/usr/bin/env python
import sys
import rospy
from core_api.srv import *

global_namespace = ''

def setpoint_local_position(lx, ly, lz, yaw=0.0, tolerance= 1.0, async = False, relative= False, yaw_valid= False, body_frame= False):
  global global_namespace
  rospy.wait_for_service('/'+ global_namespace +'/navigation/position_set')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/position_set', PositionSet)

    # building message structure
    header_msg = std_msgs.msg.Header(1,rospy.Time(0.0,0.0),'a')
    twist = geometry_msgs.msg.Twist(geometry_msgs.msg.Vector3(lx,ly,lz),geometry_msgs.msg.Vector3(0.0,0.0,yaw))
    twiststamped_msg= geometry_msgs.msg.TwistStamped(header_msg, twist)
    req_msg = PositionSetRequest(twiststamped_msg, tolerance, async, relative, yaw_valid, body_frame)
    resp = handle(req_msg)
    return resp.success
  except rospy.ServiceException, e:
    rospy.logerr("pos set service call failed %s", e)
    return None

def make_square(side_length):
  global global_namespace
  #first get the global namespace to call the subsequent services
  #wait for service to come up
  rospy.wait_for_service('/get_global_namespace')
  try:
    res = rospy.ServiceProxy('/get_global_namespace', ParamGetGlobalNamespace)
    op = res()
    global_namespace = str(op.param_info.param_value)
  except rospy.ServiceException, e:
    rospy.logerr("global namespace service not available", e)
    #cannot continue without global namespace
    return None

  # Next take off to an altitue of 3.0 meters
  rospy.wait_for_service('/'+ global_namespace +'/navigation/take_off')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/take_off', TakeOff)
    resp = handle(takeoff_alt=3.0)
  except rospy.ServiceException, e:
    rospy.logerr("takeoff service call failed %s", e)
    # cannot continue without taking off
    return None
  print "Took off successfully"

  # Then call the position set service for each edge of a square shaped trajectory
  if setpoint_local_position(side_length,0,-3.0):
    print "Successfully reached 1st waypoint"
  else: 
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(side_length,side_length,-3.0):
    print "Successfully reached 2nd waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(0,side_length,-3.0):
    print "Successfully reached 3rd waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None
  if setpoint_local_position(0,0,-3.0):
    print "Successfully reached 4th waypoint"
  else:
    rospy.logerr("Failed to set position")
    return None

  # Finally land the drone
  rospy.wait_for_service('/'+ global_namespace +'/navigation/land')
  try:
    handle = rospy.ServiceProxy('/'+ global_namespace +'/navigation/land', Land)
    resp = handle(False)
  except rospy.ServiceException, e:
    rospy.logerr("land service call failed %s", e)
    return None
  print "Landed Successfully. Exiting script."

if __name__ == "__main__":
  if len(sys.argv) == 2:
    make_square(sys.argv[1])
  else:
    print "This node need side_length of square(float) as an argument"
    sys.exit(1)
```

