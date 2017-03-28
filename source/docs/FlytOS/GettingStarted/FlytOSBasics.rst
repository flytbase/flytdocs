.. _flytos_basics_rpi:


FlytOS Basics
=============

**Start/Stop FlytOS on boot**

1. If you have installed FlytOS correctly, FlytOS will start automatically on every bootup.
2. On bootup FlytOS will also check for any updates. Available updates will be downloaded and installed automatically.
3. You can find more information on FlytOS automatic updates :ref:`here<flytos_updates>`.

**Start/Stop FlytOS from command line**

1. Launch FlytOS
       
   You can also launch FlytOS in a terminal to see debug messages at startup. Open a **new** terminal and run this command.

   .. code-block:: bash
       
       $ sudo $(rospack find core_api)/scripts/launch_flytOS.sh

   .. important:: If you get this error: ``Error: package 'core_api' not found``, source your /etc/bash.bashrc file.
	

2. Kill FlytOS
       
   To kill this instance of FlytOS, run this command in your terminal. 

   .. code-block:: bash
       
      $ sudo $(rospack find core_api)/scripts/stop_flytOS.sh    
       
