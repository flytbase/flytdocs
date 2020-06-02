# FAQs

### **Not able to login after boot due to out of memory error after making a FlytOS sdcard**

Make sure you have not skipped the important step of expanding the root partition after flashing your sdcard/eMMC. Read the tutorial for your specific hardware again and make sure you completed every step.

### **FlytConsole shows connected and disconnected again and again**

Obtain the startup log by following [these steps](getting-help-in-forum.md#flytos-startup-log). If in the log you see mavros process is getting killed repeatedly, make sure that your companion computer is connected to a Pixhawk properly ads described in the hardware guide. Also make sure that you have configured Pixhawk parameters appropriately.

### **Errors like “core\_api not found”, “ros/ros.h not found” in FlytOS startup log**

Make sure you have these following lines amongst the last few lines in `/etc/bash.bashrc` file. If you don’t, add the missing lines, save the file \(you will need sudo permission to edit\) and them reboot your device.

```text
export CPATH=$CPATH:/opt/ros/kinetic/include
source /opt/ros/kinetic/setup.bash
export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
source /flyt/flytos/flytcore/setup.bash
```

Also make sure you DO NOT have any of the above lines in the `~/.bashrc` file. If the lines are present, remove them, save the file and reboot the device.

### **How to start/stop FlytOS**

```text
$ sudo $(rospack find core_api)/scripts/stop_flytOS.sh
```

```text
$ sudo $(rospack find core_api)/scripts/launch_flytOS.sh
```

### **Need to change the baudrate/port of Flight Control Unit\(Pixhawk\)**

From v1.5-4, FlytOS now auto-detects serial connection to autopilot with baudrate: `921600, 57600, 115200`.

To use your FCU/Pixhawk on another baudrate, open the following file on your Companion Computer: `/flyt/flytos/flytcore/share/core_api/launch/core_api_autopilot.launch` and edit the the line starting with `<arg name="fcu_url" value` appropriately. For e.g. If you want to use a USB to UART module to connect to Pixhawk’s TELEM2 and your module shows up as /dev/ttyUSB0 on your Companion Computer and Pixhawk’s baudrate is 38400. Edit the above line to be: `<arg name="fcu_url" value="/dev/ttyUSB0:38400" />`.

### **I am facing FlytOS related dependency issues**

Run the following commands on your Companion Computer to install all FlytOS dependencies.

```text
#!/bin/bash -e
# install dependency script for FlytOS

#installing known python dependencies
sudo apt install -y python-pip python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twisted python-future
sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2 simple_json pyzmp pyros-setup requests

#installing known ros dependencies
sudo apt install -y ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-eigen-conversions ros-kinetic-camera-info-manager ros-kinetic-pyros-utils libxslt-dev libxml2-dev 

#installing other dependencies
sudo apt install -y v4l2loopback-utils locate lsof minicom libglib2.0-dev gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo -H pip install certifi pyserial pymavlink

#removing some modules
sudo apt remove -y modemmanager xfce4-power-manager

exit 0
```

### **How do I figure out that FlytOS has auto detected my apm/px4 stack correctly**

Open up `flytconsole` and check for either `PX4` or `Ardupilot` logo at top right corner. If FlytOS is not being able to detect autopilot stack correctly:

* Open up `/flyt/logs/startup/flyt_startup.log`, and check the first couple of lines for debug messages.
* Make sure you have installed all the dependencies mentioned [here](faqs.md#i-am-facing-flytos-related-dependency-issues) successfully.
* If the problem still persists, make sure _portname_ and _baudrate_ is correctly configured in the file `/flyt/flytos/flytcore/share/core_api/launch/core_api_autopilot.launch`. For more information on this [click here](faqs.md#need-to-change-the-baudrate-port-of-flight-control-unit-pixhawk).

### **How do I report any bugs found in your documentation**

Go to our [github repository](https://github.com/flytbase/flytdocs), and raise if any issues/bugfixes that you want to be rectified.

