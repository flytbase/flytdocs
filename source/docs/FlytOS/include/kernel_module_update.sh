#!/bin/bash 
# install v4l2loopback kernel module required for FlytOS

#Run this script as root

cd $HOME
git clone https://github.com/umlaeute/v4l2loopback.git
cd v4l2loopback/
apt-get install linux-headers-$(uname -r)
apt-get update
ln -s /usr/src/linux-headers-$(uname -r)/ /lib/modules/$(uname -r)/build
sed -i 's/#define CONFIG_NEED_MACH_MEMORY_H 1/\/\/#define CONFIG_NEED_MACH_MEMORY_H 1/g' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
sed -i '$a \\n#define CONFIG_ARCH_MULTIPLATFORM 1\n' /lib/modules/$(uname -r)/build/include/generated/autoconf.h
cd ..
rm -rf v4l2loopback/

exit 0
