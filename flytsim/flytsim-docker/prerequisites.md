# Prerequisites

{% tabs %}
{% tab title="Linux" %}
Visit the [Docker installation guide](https://docs.docker.com/engine/installation/#supported-platforms) and make sure your flavour of Linux is supported by Docker. If you are running anything apart from Ubuntu, please follow the above guide and install docker in your machine. **For Ubuntu users, we have an installation script**, details of which are in [setup](setup.md) section. It is preferable if you use Ubuntu 14.04 or above.
{% endtab %}

{% tab title="Windows" %}
Visit installation guide for [Docker-for-Windows](https://docs.docker.com/docker-for-windows/install/) and install it if it is supported by your Windows OS. Typically 64bit Windows 10 Pro, Enterprise and Education support the newer _Docker-for-Windows_. To know more about it, click [here](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install). Currently we DO NOT support [Docker Toolbox \(legacy\)](https://docs.docker.com/toolbox/toolbox_install_windows/) and have no plan to do it in near future.
{% endtab %}

{% tab title="Mac OS" %}
Visit installation guide for [Docker-for-Mac](https://docs.docker.com/docker-for-mac/install/) and install it if it is supported by your Mac OS. Typically OS X El Capitan 10.11 and newer macOS releases support the newer _Docker-for-Mac_. To know more about it, click [here](https://docs.docker.com/docker-for-mac/install/#what-to-know-before-you-install). Currently we DO NOT support [Docker Toolbox \(legacy\)](https://docs.docker.com/toolbox/toolbox_install_mac/) and have no plan to do it in near future.

{% hint style="warning" %}
**Warning:** In MacOS we could not enable GUI support from within Docker, which means if you are keen on having 3D GUI Gazebo based environment, then please use Linux or Windows.
{% endhint %}
{% endtab %}
{% endtabs %}

