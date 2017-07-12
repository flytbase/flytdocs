.. _integration_third_party:

Third Party Integrations
========================

FlytBase cloud allows seamless integration with major third-party business and social apps to help developers create custom workflows to suit different business needs. Work within your existing systems and directly integrate with Drone Deploy, AirMap, Twilio, Slack, Salesforce, Zendesk, Cisco Spark, Jira, Facebook, Twitter and much more.

You can now build your own apps using the Cloud API, to make the best of your drone flying experience.

Our APIs are now available for integration using `Built.io <https://www.built.io/>`_. 

Login to built.io
^^^^^^^^^^^^^^^^^

.. figure:: /_static/Images/built-io-login.png
	:align: center 
	:scale: 50 %

Create a new Workflow
^^^^^^^^^^^^^^^^^^^^^

.. figure:: /_static/Images/add-workflow.png
	:align: center 
	:scale: 50 %


Add Trigger
^^^^^^^^^^^

Use any of the available options as a trigger

.. figure:: /_static/Images/add-trigger.png
	:align: center 
	:scale: 50 %

Add Action
^^^^^^^^^^

To integrate it to FlyBase, you need to add an action as a FlytBase API.

.. figure:: /_static/Images/add-action.png
	:align: center 
	:scale: 50 %

Select Event
^^^^^^^^^^^^

Select the desirable event that needs to take place and press Next.

.. figure:: /_static/Images/select_action.png
	:align: center 
	:scale: 50 %

Add Account
^^^^^^^^^^^

Press add account to integrate with your vehicle.

.. figure:: /_static/Images/add_account.png
	:align: center 
	:scale: 50 %

Fill Access Details
^^^^^^^^^^^^^^^^^^^

Fill in the access details of your desired vehicle and press Next. To get the access details, follow the steps given in `Setup <Setup_FlytBase_Cloud.html>`_

.. figure:: /_static/Images/fill_access.png
	:align: center 
	:scale: 50 %


Account Added
^^^^^^^^^^^^^

Once your account is added, press on the newly made action to configure it.

.. figure:: /_static/Images/account_added.png
	:align: center 
	:scale: 50 %

Configure
^^^^^^^^^

Fill in the required details to configure the vehicle.

To add namespace, press on the dropdown menu 

.. figure:: /_static/Images/add_namespace.png
	:align: center 
	:scale: 50 %

and select "Use data from FlytBase account" and select the first option, e.g flytsim in this case.

.. figure:: /_static/Images/add_namespace_2.png
	:align: center 
	:scale: 50 % 

Fill in the other details, like height in this case and press Next.

.. figure:: /_static/Images/specify_height.png
	:align: center 
	:scale: 50 % 

Save and Test Workflow
^^^^^^^^^^^^^^^^^^^^^^

Save the workflow. 

.. figure:: /_static/Images/save_workflow.png
	:align: center 
	:scale: 50 % 

Test the workflow.

.. figure:: /_static/Images/use_exec.png
	:align: center 
	:scale: 50 % 

Use the Execution url to trigger this event in future. e.g Make a get or post request.

