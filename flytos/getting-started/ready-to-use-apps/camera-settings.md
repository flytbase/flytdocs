# Camera Settings

During bootup FlytOS automatically connects to any camera device available at port ‘/dev/video0’. If you connect the camera after FlytOS was launched you’ll have to manually launch the cam\_api using the commands given below:

```text
$ export ROS_NAMESPACE=<namespace>
```

```text
$ roslaunch vision_apps cam_api.launch
```

If you have attached a single camera it’s detected as /dev/video0. If you have attached multiple cameras you will have multiple devices detected namely ‘/dev/video0’, ‘/dev/video1’, ‘/dev/video2’ and so on

You can check the list of cameras attached using the command below in your terminal :

```text
$ ls /dev/video*
```

By default FlytOS uses the device present at /dev/video0. In case you have multiple camera devices attached and you wish to use devices other than /dev/video0 you will have to make change in file

```text
/flyt/flytos/flytcore/share/vision_apps/launch/cam_api.launch
```

Also, if you want to change the camera capture settings you’ll have to make changes in the launch file mentioned above. Various camera capture settings such as resolution, frame rate, brightness, pixel format can be changed by making edits in this launch file.

If you wish to calibrate your camera and use it for your application refer here “[http://wiki.ros.org/camera\_calibration](http://wiki.ros.org/camera_calibration)”. Once you have obtained the camera calibration file, Place your file in the folder below

```text
/flyt/flytos/flytcore/share/vision_apps/calibration
```

And change the camera\_info\_url param in the launch file mentioned above.

## Using Raspi Cam with Raspberry Pi

To get raspi cam enabled, run the following commands:

```text
$ sudo apt-get update
```

```text
$ sudo apt-get upgrade
```

```text
$ sudo raspi-config
```

In raspi-config window, enable camera from Interfacing Options. Once done, reboot your device. Tada. your camera should be enabled now. Future FlytOS images, would have enabled camera support by default. It would be better if you also upgrade your kernel, by running this command

```text
$ sudo rpi-update
```

Once, done reboot your device.

**Make sure while using the raspi camera you connect the camera to the board before booting it up.**

