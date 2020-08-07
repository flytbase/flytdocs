.. _write_remote_python:

Remote Python App
=================


Setup
"""""
1. Install the package by typing in terminal: 

.. code-block:: bash
       
       $ pip install flyt-python

2. Open terminal and install Redis-server by typing:

.. code-block:: bash
       
       $ sudo apt-get install redis-server

3. Setup |FlytSim Docker|
4. Follow the Documentation and launch the Docker.
5. Activate and Register Flytsim docker device using Flytbase Platform and get |Vehicle ID| and |Personal Access Token|
6. Go to the folder where library exists, open terminal and type `python3 daemon.py` and press Enter.


Execution
"""""""""

The source code *demoapp1.py* of this app is located at */flyt_python/Demo Apps/*. To execute this app run the following command in your terminal.

.. code-block:: bash

    $ python3 demo_app_1.py

Code
""""

.. literalinclude:: include/demo_app_1.py
   :language: py
   :tab-width: 2

Code Explained
""""""""""""""

* Imports:

  .. literalinclude:: include/demo_app_1.py
	   :language: py
	   :tab-width: 2
	   :lines: 1

* Enter token and vehicle ID for your drone

  .. literalinclude:: include/demo_app_1.py
     :language: py
     :tab-width: 2
     :lines: 2-3

* Creating instance of DroneApiConnector from flyt_python.flyt_python:

  .. literalinclude:: include/demo_app_1.py
	   :language: py
	   :tab-width: 2
	   :lines: 5

* Connect to the Drone

  .. literalinclude:: include/demo_app_1.py
     :language: py
     :tab-width: 2
     :lines: 8

* Actual flight logic: By default position_set() is synchronous in action, i.e. your script will wait for the vehicle to reach the specified target before continuing to execute the next command. Visit `FlytAPIs <http://api.flytbase.com>`_ for more information.

.. literalinclude:: include/demo_app_1.py
   :language: py
   :tab-width: 2
   :lines: 10-20

* Interface shutdown:

When drone interface is no longer required close the connection :

.. literalinclude:: include/demo_app_1.py
   :language: py
   :tab-width: 2
   :lines: 21-22

   
.. |FlytSim Docker| raw:: html

   <a href="http://docs.flytbase.com/docs/FlytSim/docker.html" target="_blank">FlytSim Docker</a>

   
.. |Vehicle ID| raw:: html

   <a href="https://my.flytbase.com/devices" target="_blank">Vehicle ID</a>  
   
   
.. |Personal Access Token| raw:: html

   <a href="https://my.flytbase.com/developer/token" target="_blank">Personal Access Token</a>  
   
   
   