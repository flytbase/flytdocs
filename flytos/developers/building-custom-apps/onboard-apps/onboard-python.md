# Onboard Python

 Below is a demo [youtube video](https://www.youtube.com/watch?v=rKUt884XtNg) describing how to execute a built-in demo-app in FlytSim.

{% embed url="https://youtu.be/rKUt884XtNg" caption="Onboard Python App Test" %}

## Demo App 1

This demo app makes the vehicle takeoff, move in a square trajectory of side length 5m and then land.

This [youtube video](https://www.youtube.com/watch?v=z36zvRfn58U&feature=youtu.be) shows the demo app1 running on [FlytSim](../../../../flytsim/flytsim-docker/).

{% embed url="https://youtu.be/z36zvRfn58U" caption="Demo App 1 Test" %}

And this is actual flight test [video](https://www.youtube.com/watch?v=lwKZXkzkM80) of the same app.

{% embed url="https://youtu.be/lwKZXkzkM80" caption="Demo App 1 Flight Test" %}

### Execution

The source code _demoapp1.py_ of this app is located at _/flyt/flytapps/onboard/install_. To execute this app run the following command in your terminal.

```text
$ python /flyt/flytapps/onboard/install/demoapp1.py
```

### Code

```text
#!/usr/bin/env python
import time
from flyt_python import api

drone = api.navigation(timeout=120000)  # instance of flyt droneigation class

# at least 3sec sleep time for the drone interface to initialize properly
time.sleep(3)

print 'taking off'
drone.take_off(5.0)

print ' going along the setpoints'
drone.position_set(5, 0, 0, relative=True)
drone.position_set(0, 5, 0, relative=True)
drone.position_set(-5, 0, 0, relative=True)
drone.position_set(0, -5, 0, relative=True)

print 'Landing'
drone.land(async=False)

# shutdown the instance
drone.disconnect()
```

### Code Explained

* Imports and initialization:

  ```text
  #!/usr/bin/env python
  import time
  from flyt_python import api
  ```

* Creating instance of navigation class from flyt\_python.api:

  ```text

  drone = api.navigation(timeout=120000)  # instance of flyt droneigation class

  ```

* Actual flight logic: By default position\_set\(\) is synchronous in action, i.e. your script will wait for the vehicle to reach the specified target before continuing to execute the next command. Visit [FlytAPIs](http://api.flytbase.com/) for more information.

```text
time.sleep(3)

print 'taking off'
drone.take_off(5.0)

print ' going along the setpoints'
drone.position_set(5, 0, 0, relative=True)
drone.position_set(0, 5, 0, relative=True)
drone.position_set(-5, 0, 0, relative=True)
drone.position_set(0, -5, 0, relative=True)

```

* Interface shutdown:

When drone interface is no longer required shut it down :

```text
drone.land(async=False)
```

## Demo App 2

{% hint style="info" %}
**Note:** This demo requires arguments to be passed.
{% endhint %}

 This demo app makes the robot takeoff, move in a square trajectory of side length _provided as an argument to the script_ and land once the entire mission is over.

## Execution

The source code _demoapp2.py_ of this app is located at _/flyt/flytapps/onboard/install_. To execute this app run the following command in your terminal.

```text
$ python /flyt/flytapps/onboard/install/demoapp2.py 3.0
# here '3.0' is passed as an argument, one could send any other float value.
```

### Code

```text
#!/usr/bin/env python
import time
import argparse
from flyt_python import api

drone = api.navigation(timeout=120000)  # instance of flyt droneigation class

# at least 3sec sleep time for the drone interface to initialize properly
time.sleep(3)

## parsing command line arguments
parser = argparse.ArgumentParser(description='Process a float value.')
parser.add_argument('side', metavar='side_length', type=float, help='side length of the square')
args = parser.parse_args()

## lets fly
side_length = args.side

print "taking off!"
drone.take_off(5.0)

print 'flying in square', side_length
drone.position_set(side_length, 0, 0, relative=True)
drone.position_set(0, side_length, 0, relative=True)
drone.position_set(-side_length, 0, 0, relative=True)
drone.position_set(0, -side_length, 0, relative=True)

print "landing"
drone.land(False)
print 'Cheers!!'

# shutdown the instance
drone.disconnect()
```

### **Create and Compile custom app**

* Create a directory where you want to keep the source files of your onboard apps:

  ```text
  $ mkdir <sitl_onboard_apps>
  ```

* Create a directory inside _&lt;sitl\_onboard\_apps&gt;_ for your first app:

  ```text
  $ mkdir <my_first_python_app>
  ```

* Create your own &lt;my\_first\_python\_app&gt;.py file. You can use the following snippet to start building your app.

  ```text
  #!/usr/bin/env python

  from flyt_python import api
  drone = api.navigation(timeout=120000) # instance of flyt navigation class
  time.sleep(3)
  # Write your own logic below #
  #
  # When done, shutdown the drone interface
  drone.disconnect()
  ```

### **Execute custom app**

* If FlytOS/FlytSim is not launched, launch [FlytOS](../../introduction.md#start-stop-flytos) or [FlytSim](../../../../flytsim/flytsim-native-deprecated/how-to-launch.md#launch-flytsim).
* Execute your &lt;my\_first\_python\_app&gt;.py python script from terminal.

### **Install custom app**

To install your app into /flyt/userapps/onboard\_user/install space, so that your Android/Web App could execute it remotely, make your python script executable:

```text
$ sudo chmod +x <my_first_python_app>.py
```

and copy this script to mentioned location:

```text
$ sudo cp <my_first_python_app>.py /flyt/userapps/onboard_user/install
```

