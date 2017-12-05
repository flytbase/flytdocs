.. _forum_help_troubleshooting:

Getting Help in Forum
=====================

If you are facing any issues or have any general query regarding FlytOS, you can visit |forum_link| and get your questions answered quickly by FlytBase experts and other community members. To be more helpful while asking your questions, it is recommended that you include logs and files pertaining to the issue.

.. |forum_link| raw:: html

   <a href="http://forums.flytbase.com" target="_blank">our forum</a>


.. _getting_flytos_version:

Getting FlytOS version
""""""""""""""""""""""

To know which version of FlytOS is running on your Flight Computer,enter the following command in a terminal in your Flight Computer. You can get terminal access either by attaching an HDMI monitor to your Flight Computer or SSHing into it.

.. code-block:: bash
    
    $ flytos_version.sh

You can also see the FlytOS version in FlytConsole in the top right. 

.. figure:: /_static/Images/FlytOSVersion.png
	:align: center 
	:scale: 60 %


.. _forum_run_log:

FlytOS Run Log
""""""""""""""

Many errors can be caught in the FlytOS run log itself. 
You can use our :ref:`logviewer <flytos_logs>` **web app** to see the logs in your browser.

**Otherwise**, you can also attach the file ``/flyt/logs/runlogs/flyt_runlogs.log``, which will be present on your Flight Computer, with your question on the forum. You can view the log in a terminal using the following command:

.. code-block:: bash
   
   $ cat /flyt/logs/runlogs/flyt_runlogs.log

.. _forum_startup_log:

FlytOS Startup Log
""""""""""""""""""

If you are facing any issues related to Autoupdate such as in case the updates are not installed successfully or you are unable to open FlytConsole, you can check the startup log to locate the error. 

You can use our :ref:`logviewer <flytos_logs>` **web app** to see the logs in your browser.

**Otherwise**, you can also attach the file ``/flyt/logs/startup/flyt_startup.log``, which will be present on your Flight Computer, with your question on the forum. You can view the log in a terminal using the following command:

.. code-block:: bash
   
   $ cat /flyt/logs/startup/flyt_startup.log

.. _forum_sourcing_files:

Sourcing Files
""""""""""""""

If you are facing any sourcing related issues, you can attach the following files present on your Flight Computer  with your question:

* ``/etc/bash.bashrc``
* ``~/.bashrc``

.. |br| raw:: html

   <br />
