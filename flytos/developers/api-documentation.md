# API Documentation

Visit [api.flytbase.com](http://api.flytbase.com/) for extensive documentation of FlytAPI’s in various languages. Examples are available in Python, C++, Roscpp, Rospy, Javascript\(Rest and Websocket\).

FlytOS uses ROS at its heart. So all the API’s of FlytOS are basically implemented in ROS. However these APIs are also available in the form of various interfaces for non ROS and remote applications. Below is the list of external interfaces that FlytOS can talk with.

* **Python**: Pure python interface using flyt\_python package. It uses Zeromq internally which provides access to ROS system.
* **C++**: These are ROS to C++ bindings for pure C++ applications.
* **RESTful Server**: FlytOS runs a server to provide RESTful interface to the ROS system.
* **Web-socket**: FlytOS runs a Web-socket server to provide Web-socket interface to the ROS system.

Same functionality is available on all interfaces, only the API definition may change to suit a particular interface.

With all above interfaces available we can classify them into two broad categories on the basis of type of typical applications that will be using them.

* **Onboad APIs**: ROS, Python, C++ interfaces come under onboard API’s since they can only be accessed by on board \(which run on vehicle’s companion computer\) applications.
* **Remote APIs**: RESTful and WebSocket interfaces are classified as remote API’s since they will mostly be used by remote \(which run on ground devices\) applications.

Visit [api.flytbase.com](http://api.flytbase.com/) for FlytAPI documentation.

