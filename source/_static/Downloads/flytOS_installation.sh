#!/bin/bash -e
# --
# Add -ex for Debugging
# Script to install FlytOS and its dependencies.
# This script needs to be run as root.
# --

echo -e "\033[0;34mThis script shall install FlytOS and its dependencies. \nPlease note that your system shall reboot on successful installation.\033[0m" 

echo Logging at $HOME/flytos_installation_log.txt

exec > >(tee -i $HOME/flytos_installation_log.txt)
exec 2>&1

#Function for setting up UART on Raspberry Pi
set_config_var() {
  lua - "$1" "$2" "$3" <<EOF > "$3.bak"
local key=assert(arg[1])
local value=assert(arg[2])
local fn=assert(arg[3])
local file=assert(io.open(fn))
local made_change=false
for line in file:lines() do
  if line:match("^#?%s*"..key.."=.*$") then
    line=key.."="..value
    made_change=true
  end
  print(line)
end

if not made_change then
  print(key.."="..value)
end
EOF
mv "$3.bak" "$3"
}


if [ "$EUID" -ne 0 ]
  then echo -e "\033[0;31m Please run as root \033[0m"
  echo "Exiting"
  exit 1
fi

#Query System Hardware
if [[ $(cat /proc/cpuinfo | grep -Po -m 1 'model name\t: \K.*$') = "Intel(R) Atom(TM) x7-Z8750  CPU @ 1.60GHz" ]]; then
  echo -e "\033[0;34mFound Intel Aero\033[0m"
  DEVICE="Aero"
elif [[ $(cat /proc/cpuinfo | grep -Po -m 1 'model name\t: \K.*$') = "Intel(R) Atom(TM) Processor T5700 @ 1.70GHz" ]]; then
  echo -e "\033[0;34mFound Intel Joule\033[0m"
  DEVICE="Aero"
elif [[ $(cat /proc/cpuinfo | grep -Po 'Hardware\t: \K.*$') = "ODROID-XU3" ]]; then
  echo -e "\033[0;34mFound ODROID\033[0m"
  DEVICE="ODROID"
elif [[ $(cat /proc/cpuinfo | grep -Po 'Hardware\t: \K.*$') = "BCM2709" ]]; then
  echo -e "\033[0;34mFound Raspberry Pi\033[0m"
  DEVICE="RPi"
elif [[ $(cat /proc/cpuinfo | grep -Po 'Hardware\t: \K.*$') = "BCM2835" ]]; then
  echo -e "\033[0;34mFound Raspberry Pi\033[0m"
  DEVICE="RPi"
elif [[ $(cat /proc/cpuinfo | grep -Po 'Hardware\t: \K.*$') = "jetson_tx1" ]]; then
  echo -e "\033[0;34mFound TX1\033[0m"
  DEVICE="TX1"
elif [[ $(cat /sys/module/tegra_fuse/parameters/tegra_chip_id) = "24" ]]; then
  echo -e "\033[0;34mFound TX2\033[0m"
  DEVICE="TX1"
else
    echo -e "\033[0;31m Please use Script with supported device \033[0m"
    echo "Exiting"
    exit 1
fi

#Query Operating System Version for Ubuntu 16.04
if [[ $(lsb_release -sc) = "xenial" ]]; then
  echo "Found Ubuntu 16.04"
else
    echo -e "\033[0;31m Please use Ubuntu 16.04 \033[0m"    
    echo "Exiting"
    exit 1
fi

#Check if FlytOS installed
if [[ $(sudo dpkg-query -l | grep flytcore-pe | wc -l) = "0" ]]; then
  echo ""
else
    echo -e "\033[0;31m FlytOS already installed \033[0m"
    echo "Please remove FlytOS before continuing"
    echo "Exiting"    
    exit 1
fi



#Setup your computer to accept software from packages.ros.org and Setup Keys
if [ "$DEVICE" == "TX1" ]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' 
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116 || ( echo -e "\033[0;31m Are You Connected to the Internet? \033[0m" ; exit 1 )
else
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 || ( echo -e "\033[0;31m Are You Connected to the Internet? \n Exiting \033[0m" ; exit 1 )
fi

#ROS Kinetic Installation
apt-get update || echo -e "\033[0;31m Please reboot your system and try again \033[0m"

apt-get install ros-kinetic-desktop -y || (echo -e "\033[0;31m Error Installing ROS, Please Try Again \n Exiting \033[0m" ; exit 1)

if [ $DEVICE == "TX1" ]; then
    # SSL Certificates 
    sudo c_rehash /etc/ssl/certs
fi

#Check if rosdep has been initialized earlier
ros_init_file="/etc/ros/rosdep/sources.list.d/20-default.list"

if [ ! -f "$ros_init_file" ]; then
    echo "rosdep not initialized"
    rosdep init
else
    echo "rosdep already initialized"    
fi

# Running rosdep update as root is not recommended
su -c 'rosdep update' $SUDO_USER

#installing known python dependencies
apt-get install -y python-pip python-serial python-flask python-wtforms python-sqlalchemy python-concurrent.futures python-mock python-zmq python-twisted python-future
sudo -H pip install flask_cors flask_reverse_proxy flask_restful tblib webargs click flask_security httplib2 simple_json pyzmp pyros-setup requests tornado

#installing known ros dependencies
apt-get install -y ros-kinetic-image-proc ros-kinetic-image-transport-plugins ros-kinetic-image-transport ros-kinetic-rosbridge-suite ros-kinetic-control-toolbox ros-kinetic-eigen-conversions ros-kinetic-camera-info-manager ros-kinetic-pyros-utils libxslt-dev libxml2-dev

#installing other dependencies
apt-get install -y v4l2loopback-utils locate lsof minicom libglib2.0-dev gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ethtool curl
pip install certifi pyserial pymavlink

#removing some modules
apt remove -y modemmanager xfce4-power-manager

# To prevent repeated sourcing
sed -i '/source \/opt\/ros\/kinetic\/setup.bash/d' /etc/bash.bashrc
sed -i '/export PYTHONPATH=$PYTHONPATH:\/flyt\/flytapps:\/flyt\/userapps/d' /etc/bash.bashrc
sed -i '/source \/flyt\/flytos\/flytcore\/setup.bash/d' /etc/bash.bashrc
sed -i '/export CPATH=$CPATH:\/opt\/ros\/kinetic\/include/d' /etc/bash.bashrc
sed -i '/alias launch_flytOS='\''sudo $(rospack find core_api)\/scripts\/launch_flytOS.sh'\''/d' /etc/bash.bashrc
sed -i '/alias stop_flytOS='\''sudo $(rospack find core_api)\/scripts\/stop_flytOS.sh'\''/d' /etc/bash.bashrc

#Add Sourcing
echo "source /opt/ros/kinetic/setup.bash" >> /etc/bash.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:/flyt/flytapps:/flyt/userapps' >> /etc/bash.bashrc
echo "source /flyt/flytos/flytcore/setup.bash" >> /etc/bash.bashrc
echo 'export CPATH=$CPATH:/opt/ros/kinetic/include' >> /etc/bash.bashrc

#Alias for start and stop
echo 'alias launch_flytOS='\''sudo $(rospack find core_api)/scripts/launch_flytOS.sh'\''' >> /etc/bash.bashrc
echo 'alias stop_flytOS='\''sudo $(rospack find core_api)/scripts/stop_flytOS.sh'\''' >> /etc/bash.bashrc

#Prevent clash in sourcing with local bashrc
sed -i 's#source /opt/ros/kinetic/setup.bash##g' $HOME/.bashrc

if [ $DEVICE == "TX1" ]; then
    sed -i 's/export PATH=/export PATH=\$PATH:/g' ~/.bashrc
    sed -i 's/export LD_LIBRARY_PATH=/export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/g' ~/.bashrc
fi

if [ $DEVICE == "Aero" ]; then

    wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Intel%20Aero/ | python -c "import sys, json; print json.load(sys.stdin)['link']") || (echo -e "\033[0;31m Unable to get flytos debian package. Are you connected to the internet? \n Exiting \033[0m" ; exit 1)

    # Check md5sum of downloaded file, continue if match, retry if fail, quit on another fail.
    if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Intel%20Aero/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
        echo "md5sum match, continuing with installation"
    else
        echo -e "\033[0;31m md5sum match: FAIL \033[0m"
        echo "Redownloading FlytOS package"
        rm $HOME/flytos.deb
        wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Intel%20Aero/ | python -c "import sys, json; print json.load(sys.stdin)['link']")
        if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Intel%20Aero/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
            echo "MD5sum match, continuing"
        else
            echo -e "\033[0;31m Problem downloading FlytOS debian package, please check internet connection and try again. \033[0m"
            echo "Exiting"
            exit 1
        fi
    fi
elif [ $DEVICE == "ODROID" ]; then

    #Enable Auto Login
    sed -i "/autologin-user=$SUDO_USER/d" /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
    echo "autologin-user=$SUDO_USER" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf

    wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/ODROID-XU4/ | python -c "import sys, json; print json.load(sys.stdin)['link']") || (echo -e "\033[0;31m Unable to get flytos debian package. Are you connected to the internet? \033[0m" ; exit 1)

    # Check md5sum of downloaded file, continue if match, retry if fail, quit on another fail.
    if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/ODROID-XU4/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
        echo "md5sum match, continuing with installation"
    else
        echo -e "\033[0;31m md5sum match: FAIL \033[0m"
        echo "Redownloading FlytOS package"
        rm $HOME/flytos.deb
        wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/ODROID-XU4/ | python -c "import sys, json; print json.load(sys.stdin)['link']")
        if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/ODROID-XU4/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
            echo "MD5sum match, continuing"
        else
            echo -e "\033[0;31m Problem downloading FlytOS debian package, please check internet connection and try again. \033[0m"
            echo "Exiting"
            exit 1
        fi
    fi    
elif [ $DEVICE == "RPi" ]; then

    #First disable login shell over serial
    sed -i /boot/cmdline.txt -e "s/console=ttyAMA0,[0-9]\+ //"
    sed -i /boot/cmdline.txt -e "s/console=serial0,[0-9]\+ //"

    #Enable serial hardware
    set_config_var enable_uart 1 /boot/config.txt

    # Disable Bluetooth and Switch Hardware Bluetooth to Pins.
    # Serial needs to be enabled from raspi-config as well, otherwise RPi may restart erratically.
    sed -i '/dtoverlay=pi3-disable-bt/d' /boot/config.txt
    echo 'dtoverlay=pi3-disable-bt' >> /boot/config.txt

    #Enable Auto Login
    sed -i "/autologin-user=$SUDO_USER/d" /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
    echo "autologin-user=$SUDO_USER" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf

    wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Raspberry%20Pi%203/ | python -c "import sys, json; print json.load(sys.stdin)['link']") || (echo -e "\033[0;31m Unable to get flytos debian package. Are you connected to the internet? \033[0m" ; exit 1)

    # Check md5sum of downloaded file, continue if match, retry if fail, quit on another fail.
    if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Raspberry%20Pi%203/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
        echo "md5sum match, continuing with installation"
    else
        echo -e "\033[0;31m md5sum match: FAIL \033[0m"
        echo "Redownloading FlytOS package"
        rm $HOME/flytos.deb
        wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Raspberry%20Pi%203/ | python -c "import sys, json; print json.load(sys.stdin)['link']")
        if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Raspberry%20Pi%203/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
            echo "MD5sum match, continuing"
        else
            echo -e "\033[0;31m Problem downloading FlytOS debian package, please check internet connection and try again. \033[0m"
            echo "Exiting"
            exit 1
        fi
    fi 
elif [ $DEVICE == "TX1" ]; then   

    wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Nvidia%20TX1/ | python -c "import sys, json; print json.load(sys.stdin)['link']") || (echo -e "\033[0;31m Unable to get flytos debian package. Are you connected to the internet? \033[0m" ; exit 1)

    # Check md5sum of downloaded file, continue if match, retry if fail, quit on another fail.
    if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Nvidia%20TX1/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
        echo "md5sum match, continuing with installation"
    else
        echo -e "\033[0;31m md5sum match: FAIL \033[0m"
        echo "Redownloading FlytOS package"
        rm $HOME/flytos.deb
        wget -O $HOME/flytos.deb $(curl -sS https://my.flytbase.com/api/downloads/latest/Nvidia%20TX1/ | python -c "import sys, json; print json.load(sys.stdin)['link']")
        if [ $(md5sum $HOME/flytos.deb | awk -F ' ' '{print $1}') = $(curl -sS https://my.flytbase.com/api/downloads/latest/Nvidia%20TX1/ | python -c "import sys, json; print json.load(sys.stdin)['md5hash']") ]; then
            echo "MD5sum match, continuing"
        else
            echo -e "\033[0;31m Problem downloading FlytOS debian package, please check internet connection and try again. \033[0m"
            echo "Exiting"
            exit 1
        fi
    fi 
fi

# In case there is an issue with installing flytos, second option
apt-get install -y $HOME/flytos.deb || (apt-get -f -y install ; apt-get install -y $HOME/flytos.deb)

echo "Your System Will Reboot in 10 seconds"

echo "Clearing Up Installation Files"

rm $HOME/flytos.deb || echo -e "\033[0;31m Unable to remove downloaded flytos debian package. please remove manually\033[0m"

sleep 10

sudo reboot


