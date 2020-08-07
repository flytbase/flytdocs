# FlytOS Logs

FlytOS Logs can be accessed through the Logs onboard web app. To open the web app, click on the Logs button on homepage or open the URL:

`http://<ip-address-of-device>/logs`

![FlytOS Logs Web Page](../../.gitbook/assets/logslocalhost.png)

## Startup Logs

* The startup log contains important startup related events including errors in updates or during installation.
* Viewing startup logs in browser helps debug any startup related issues in real time.
* You may view the current log as it is being generated and logs from previous instances of FlytOS.

![FlytOS Startup Logs](../../.gitbook/assets/startuplogs.png)

## Run Logs

* Run logs are the runtime logs generated by FlytOS. They capture all events and messages along with errors related to FlytOS and are instrumental in debugging.
* You may view, refresh and download the run log for the current instance of FlytOS under the Run Logs tab.

![FlytOS Run Logs](../../.gitbook/assets/runlogs.png)

## Autopilot Logs

{% hint style="warning" %}
**Warning:** Viewing and downloading autopilot logs can take place only when the drone is not armed. Please do not arm the drone in the process of log viewing and downloading.
{% endhint %}

* Autopilot logs generated by APM and PX4 are instrumental in after-flight analysis.
* Through FlytOS you can download autopilot logs to SBC. After a log is successfully downloaded to SBC, you can download it locally to any other device over your local network. FlytOS also provides upload of logs to cloud for remote downloading.

![Autopilot logs](../../.gitbook/assets/autopilotlogsdownload.png)

* Logs can be downloaded one at a time or in groups.
* Press the Autopilot tab to refresh the log list.
* To download individually, click on the GET Icon next to the log file you want to download. This will download the log file to SBC.
* Alternatively you can select the logs you want to download and click on bulk download to download them all to SBC one after the other.
* You can download the logs locally to any device by clicking on download after the logs are successfully downloaded on your SBC.
* In case you want to stop an ongoing download, click the cross icon beside log file currently being downloaded. Please wait until you are prompted that cancellation is complete.

{% hint style="info" %}
**Note:** Downloading logs from autopilot is significantly faster when the autopilot is connected to SBC through USB rather than telemetry.
{% endhint %}

 Successfully downloaded autopilot logs will be automatically uploaded to cloud on every startup of FlytOS. They can be accessed and downloaded through your account at [my.flytbase.com](https://my.flytbase.com/).

![Flight Logs](../../.gitbook/assets/cloudlogs.png)
