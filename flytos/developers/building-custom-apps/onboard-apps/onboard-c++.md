# Onboard C++

## Execute built-in Demo Apps

FlytOS comes with pre-installed Demo apps which can be executed to do simple navigation tasks. All the sample applications can be found on our [github repository](https://github.com/flytbase/flytsamples).

## Demo App 1

This demo app makes the drone takeoff, move in a square trajectory of side length 5m and land once the entire mission is over.

Below is a demo [youtube video](https://www.youtube.com/watch?v=lwKZXkzkM80) of the same app.

{% embed url="https://youtu.be/lwKZXkzkM80" caption="Demo App 1 Flight Test" %}

### **Execution**

The source code of this app is located at _/flyt/flytapps/onboard/src/demoapp1_ and its executable file _demoapp1_ is at _/flyt/flytapps/onboard/install_. To execute this app run the following command in your terminal.

```text
$ /flyt/flytapps/onboard/install/demoapp1
```

### **Code**

```text
#include <cpp_api/navigation_bridge.h>

Navigation nav;
int main(int argc, char *argv[])
{
    nav.take_off(3.0);            //Taking Off
    nav.position_set(5,0,-3);       //Sending Position Setpoints
    nav.position_set(5,5,-3);
    nav.position_set(0,5,-3);
    nav.position_set(0,0,-3);
    nav.land(false);                  //Landing
}
```

### **Code Explained**

* You must include the following header file to make FlytAPI-navigation available for the script.

  ```text
  #include <cpp_api/navigation_bridge.h>
  ```

* Create an object of class **Navigation**, through which you can call any navigation FlytAPI.

  ```text
  Navigation nav;
  ```

* TakeOff command can be sent to vehicle with relative takeoff altitude in meters as argument. Over here, the takeoff altitude is 3m.

  ```text
      nav.take_off(3.0);            //Taking Off
  ```

{% hint style="danger" %}
**Caution:** You must ensure to call takeoff\(\) before sending any other position setpoints. takeoff\(\) inherently calls arm\(\), hence calling arm\(\) directly also arms the vehicle and makes it responsive towards next setpoint commands.
{% endhint %}

* Position Setpoints could be sent to the vehicle with \(x,y,z\) in meters in Local-NED Frame as argument.

  ```text
      nav.position_set(5,0,-3);       //Sending Position Setpoints
      nav.position_set(5,5,-3);
      nav.position_set(0,5,-3);
      nav.position_set(0,0,-3);
  ```

* Land command must be used to send the vehicle into Landing mode.

  ```text
      nav.land(false);                  //Landing
  ```

* Please refer to [FlytAPIs](http://api.flytbase.com/) to get more information on the available list of APIs.

## Demo App 2

{% hint style="info" %}
**Note:** This demo requires arguments to be passed.
{% endhint %}

This demo app makes the drone takeoff, move in a square trajectory of side length _provided as an argument to the script_ and land once the entire mission is over.

### **Execution**

The source code of this app is located at _/flyt/flytapps/onboard/src/demoapp2_ and its executable file _demoapp2_ is at _/flyt/flytapps/onboard/install_. To execute this app run the following command in your terminal.

```text
$ /flyt/flytapps/onboard/install/demoapp2 3
# here '3' is passed as an argument, one could send any other float value.
```

### **Code**

```text
#include <cpp_api/navigation_bridge.h>
#include <iostream>
#include <ros/package.h>

Navigation nav;
int main(int argc, char *argv[])
{
  if(argc < 2){
    std::cout<<"\nThis app expects arguments\n";
    exit(0);
  }
  
    float side_length = std::stof(argv[1]);             //Convert Argument from string to float
    nav.take_off(3.0);                                   //Taking Off
    nav.position_set(side_length,0,-3);                 //Sending Position Setpoints with side length accepted from script
    nav.position_set(side_length,side_length,-3);
    nav.position_set(0,side_length,-3);
    nav.position_set(0,0,-3);
    nav.land(false);                                         //Landing
}

```

### Create and Compile custom app

* Create a directory where you want to keep the source files of your onboard apps:

  ```text
  $ mkdir onboard_apps
  ```

* Create a directory inside _onboard\_apps_ for your first app:

  ```text
  $ mkdir my_first_cpp_app
  ```

* Create your own my\_first\_cpp\_app.cpp file. You can use the following snippet to start building your app.

  ```text
  #include <cpp_api/navigation_bridge.h>

  Navigation nav;
  int main(int argc, char *argv[])
  {
      nav.takeoff(3.0);   //OR nav.arm();
      /* Write your own logic below */
  }
  ```

* Copy CMakeLists.txt from the downloaded DemoApp1, and paste it inside my\_first\_cpp\_app. This is the CMakeLists.txt file of DemoApp1. To find how to configure this file for my\_first\_cpp\_app, go to [CMakeLists.txt - Explained](onboard-c++.md#cmakelists-txt-explained).

  ```text
  cmake_minimum_required(VERSION 2.8.3)
  project(demoapp1)

  SET(CMAKE_INSTALL_PREFIX /usr/local/flytos/flytapps CACHE PATH "Cmake install prefix path for flytapps" FORCE)

  add_definitions(-std=c++11)

  find_package(catkin REQUIRED COMPONENTS cpp_api)
  find_package(Boost REQUIRED COMPONENTS system python)
  find_package(PythonLibs 2.7 REQUIRED)
  include_directories(${catkin_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})

  add_executable(demoapp1 demoapp1.cpp)
  target_link_libraries(demoapp1 ${catkin_LIBRARIES} ${Boost_LIBRARIES} ${PYTHON_LIBRARIES}) 

  install(TARGETS demoapp1
    DESTINATION /flyt/userapps/onboard_user/install COMPONENT Runtime
  )
  ```

* Create a build directory to host all your build files:

  ```text
  $ mkdir build
  $ cd build
  ```

* Inside build directory, run the cmake command:

  ```text
  $ cmake ..
  ```

* To build your cpp file, run the make command:

  ```text
  $ make
  ```

### CMakeLists.txt - Explained

* Enter your project name - my\_first\_cpp\_app

  ```text
  cmake_minimum_required(VERSION 2.8.3)
  project(my_first_cpp_app)

  SET(CMAKE_INSTALL_PREFIX /usr/local/flytos/userapps CACHE PATH "Cmake install prefix path for flytapps" FORCE)

  add_definitions(-std=c++11)
  ```

* Make Navigation FlytAPI Library - _cpp\_api_ and other dependencies available for your my\_first\_cpp\_app.cpp.

  ```text
  cmake_minimum_required(VERSION 2.8.3)
  find_package(catkin REQUIRED COMPONENTS cpp_api)
  find_package(Boost REQUIRED COMPONENTS system python)
  find_package(PythonLibs 2.7 REQUIRED)
  include_directories(${catkin_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})
  ```

* Give a suitable name \(for example my\_first\_cpp\_app\) to your executable file and link it with libraries.

  ```text
  add_executable(demoapp1 demoapp1.cpp)
  target_link_libraries(demoapp1 ${catkin_LIBRARIES} ${Boost_LIBRARIES} ${PYTHON_LIBRARIES}) 
  ```

* Add the following install command to install your created my\_first\_cpp\_app executable target to install space - /flyt/userapps/onboard\_user/install. This would allow web/mobile apps to execute your installed scripts remotely. Visit [this link](http://api.flytbase.com/?shell#execute-script) for details about the corresponding API call.

  ```text
  install(TARGETS demoapp1
    DESTINATION /flyt/userapps/onboard_user/install COMPONENT Runtime
  )
  ```

### Execute custom app

* After compiling your my\_first\_cpp\_app project, your executable my\_first\_cpp\_app will be created inside build directory.
* If FlytOS/FlytSim is not launched, launch [FlytOS](../../introduction.md#start-stop-flytos) or [FlytSim](../../../../flytsim/flytsim-native-deprecated/how-to-launch.md#launch-flytsim).
* Execute your my\_first\_cpp\_app cpp executable from terminal.

### Install custom app

To install your app into /flyt/userapps/onboard\_user/install space, so that your Android/Web App could execute it remotely, run this command in your terminal:

```text
$ sudo make install
```

