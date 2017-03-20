.. _write_onboard_python:

Onboard Python APP
===============


Below is a demo `youtube video <https://www.youtube.com/watch?v=rKUt884XtNg>`_ describing how to execute a built-in demo-app in FlytSim.

..  youtube:: rKUt884XtNg
    :aspect: 16:9
    :width: 100%


Demo App 1
----------

This demo app makes the vehicle takeoff, move in a square trajectory of side length 5m and then land.

This `youtube video <https://www.youtube.com/watch?v=z36zvRfn58U&feature=youtu.be>`_ shows the demo app1 running on :ref:`FlytSim <about_flytsim>`.

..  youtube:: z36zvRfn58U
    :aspect: 16:9
    :width: 100%

|br|


And this is actual flight test `video <https://www.youtube.com/watch?v=lwKZXkzkM80>`_ of the same app when run on :ref:`FlytPOD <about_flytpod_pro>`.

..  youtube:: lwKZXkzkM80
    :aspect: 16:9
    :width: 100%


Execution
""""""""""""""""""

The source code *demoapp1.py* of this app is located at */flyt/flytapps/onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ python /flyt/flytapps/onboard/install/demoapp1.py

Code
"""""""""""""

.. literalinclude:: include/demoapp1.py
   :language: py
   :tab-width: 2

Code Explained
"""""""""""""""""""""""

* Imports and initialization:

  .. literalinclude:: include/demoapp1.py
	   :language: py
	   :tab-width: 2
	   :lines: 1-3

* Creating instance of navigation class from flyt_python.api:

  .. literalinclude:: include/demoapp1.py
	   :language: py
	   :tab-width: 2
	   :lines: 4-6

* Actual flight logic: By default position_set() is synchronous in action, i.e. your script will wait for the vehicle to reach the specified target before continuing to execute the next command. Visit :ref:`FlytAPIs<list-of-APIs>` for more information.

.. literalinclude:: include/demoapp1.py
   :language: py
   :tab-width: 2
   :lines: 8-18

* Interface shutdown:

When drone interface is no longer required shutdown it *[]:

.. literalinclude:: include/demoapp1.py
   :language: py
   :tab-width: 2
   :lines: 20-21

Demo App 2
----------

.. note:: This demo requires arguments to be passed.


This demo app makes the robot takeoff, move in a square trajectory of side length *provided as an argument to the script* and land once the entire mission is over.

Execution
""""""""""""""""""

The source code *demoapp2.py* of this app is located at */flyt/flytapps/onboard/install*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ python /flyt/flytapps/onboard/install/demoapp2.py 3.0
    # here '3.0' is passed as an argument, one could send any other float value.

Code
"""""""""""""

.. literalinclude:: include/demoapp2.py
   :language: py
   :tab-width: 2


Create and Compile custom app
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Create a directory where you want to keep the source files of your onboard apps::

	$ mkdir <sitl_onboard_apps>
* Create a directory inside *<sitl_onboard_apps>* for your first app::

	$ mkdir <my_first_python_app>
* Create your own <my_first_python_app>.py file. You can use the following snippet to start building your app.

  .. code-block:: py

      #!/usr/bin/env python

      from flyt_python import api
      drone = api.navigation(timeout=120000) # instance of flyt navigation class
      time.sleep(3)
      # Write your own logic below #
      #
      # When done, shutdown the drone interface
      drone.disconnect()



Execute custom app
^^^^^^^^^^^^^^^^^^

* If FlytOS/FlytSim is not launched, launch :ref:`FlytOS <launch flytos>` or :ref:`FlytSim <launch flytsim>`.
* Execute your <my_first_python_app>.py python script from terminal.

Install custom app
^^^^^^^^^^^^^^^^^^

To install your app into /flyt/flytapps/onboard/install space, so that your Android/Web App could execute it remotely, make your python script executable::

	$ sudo chmod +x <my_first_python_app>.py

and copy this script to mentioned location::

	$ sudo cp <my_first_python_app>.py /flyt/flytapps/onboard/install/


.. _github link: https://github.com/flytbase/flytsamples


.. |br| raw:: html

   <br />
