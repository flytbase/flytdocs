# Troubleshooting

## Errors

### **package ‘core\_api’ not found**

Check whether the following lines have been added to your /etc/bash.bashrc file

```text
export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
source /flyt/flytos/flytcore/setup.bash
source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh
```

Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

### **Unable to find uri\[model://iris\]**

Check whether the following lines have been added to your /etc/bash.bashrc file

```text
export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
source /flyt/flytos/flytcore/setup.bash
source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh
```

Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

### **ImportError: No module named web.apps**

Check whether the following lines have been added to your /etc/bash.bashrc file

```text
export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps
source /flyt/flytos/flytcore/setup.bash
source /flyt/flytos/flytcore/share/sitl_gazebo/setup.sh
```

Once checked/added, source your /etc/bash.bashrc file or launch FlytSim in new terminal

### **Touch: cannot touch ‘/flyt/flytos/flytcore/share/sitl\_gazebo/posix/rootfs/eeprom/parameters’: Permission denied**

Launch FlytSIM with **sudo** permission.

### **FCU: ERROR: Operation not permitted**

Launch FlytSIM with **sudo** permission.

### **IOError: \[Errno 13\] Permission denied: ‘/flyt/flytos/flytcore/share/core\_api/param\_files/flyt\_params.yaml’**

Launch FlytSIM with **sudo** permission.

### **ResourceNotFound: gazebo\_ros**

Execute the following command in your terminal.

```text
$ sudo apt-get install ros-kinetic-gazebo*
```

### **dpkg: error processing archive /home/\*\*\*\*\*\*\*\*\_amd64.deb \(–unpack\): trying to overwrite ‘/flyt/flytos/flytcore/\_setup\_util.py’, which is also in package flytsim**

You had previously installed beta version of FlytSim on your machine. Please uninstall it by running the following commands in your terminal.

```text
$ sudo dpkg -r flytsim
$ sudo rm -r /flyt
```

### **ros/ros.h not found**

Check whether the following line has been added to your /etc/bash.bashrc file

```text
export CPATH=$CPATH:/opt/ros/kinetic/include
```

## FAQs

### How to know my FlytSIM version?

Execute the following command in your terminal.

```text
$ flytos_version.sh
```

### How to know my Gazebo version?

Execute the following command in your terminal.

```text
$ gazebo -v
```

### My drone keeps crashing after takeoff, What should I do?

FlytSIM is computationally heavy. Make sure you are not running FlytSIM on a VirtualMachine, instead install Ubuntu natively on your machine. If you still are facing this issue, launch flytSIM and then execute the following command in a new terminal.

```text
$ gz stats
```

The above command starts printing some information on your screen. Typically it would be something like this:

```text
$ Factor[0.99] SimTime[5.29] RealTime[5.34] Paused[F]
$ Factor[0.99] SimTime[5.49] RealTime[5.54] Paused[F]
$ Factor[0.99] SimTime[5.68] RealTime[5.74] Paused[F]
$ Factor[0.99] SimTime[5.88] RealTime[5.94] Paused[F]
$ Factor[0.99] SimTime[6.08] RealTime[6.14] Paused[F]
$ Factor[0.99] SimTime[6.28] RealTime[6.34] Paused[F]
```

Make sure the value of `Factor` is above 0.7 all the time. The value of _Factor_ in essence shows how well your machine is handling FlytSIM’s computations. In case the value of _Factor_ keeps droping below 0.7, try closing the Gazebo GUI by clicking ‘x’ button in top left corner. To permanently prevent the Gazebo GUI from starting, edit the file in location _/flyt/flytos/flytcore/share/core\_api/launch/core\_api\_sitl.launch_ and change the value of gui to false.

