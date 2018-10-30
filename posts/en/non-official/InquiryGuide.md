---
title: Wait before your inquiry! Please check below
published: true
img: ic-troubleshooting.png
permalink: /en/InquiryGuide.html
---

This is a guide you can use before contacting us for a quick and accurate answer.

1. [Contact us](#id-inquiry)
2. [Things to check in case of trouble](#id-check)
3. [FAQ](#id-faq)

---

___This guide is designed to help you resolve problems in the process of registering a gateway and obtaining normal data in a short period of time. If you refer to it as a guide, it will help you solve the problem quickly. However, please understand that we can not provide the code review or debugging service for the program (device agent) that fetches the sensor value as a principle for responding to inquiries.___

---

__You can find more examples in [FAQ](http://support.thingplus.net/en/help/faq.html) and [Troubleshooting](http://support.thingplus.net/en/help/troubleshooting.html) of `HELP`. First, please refer to the guide after the reference.__

<div id='id-inquiry'></div>

### Contact us
Please contact us with your inquiry form for a quick and accurate answer.
<br>
* For commercial service inquiries, please send an e-mail to `biz@daliworks.net`.
* If you have any inquiries regarding hardware interlock, please send an e-mail to `support@thingplus.net`.

* Please contact us with the following information.
* When sending e-mail with the following contents, please attach log, screenshot, etc. of problem situation to get quick and accurate answer.
* We will be given the answer as soon as possible and it may be delayed up to 7 days when there is no in charge of person..

<div id='id-inquirytable'></div>
#### Inquiry form

|      `List`       |                         `Contents`
| ---------------- | :-----------------------------------------------------------------------------:
| Belong            | `ex)  developer(name of company), student`
| Purpose to work with Thing +         | `ex) developement(POC), education, study, launching new service ...`
| Hardware to use   | `ex) RaspberryPi, Beagleboard, Arduino, Android, SensorSimulator ...`
| Sensors to use           | `ex) temperature, humidty, LED ...`
| Source Code Received Path    | `ex) support site, It received a personal request, Other routes ...`
| Thingplus url         |    `ex) http://trial.sandbox.thingplus.net`
| Account information         | `ex) ID: xxx, (PW :xxx , password is not mandatory)`
| Qustions        | `ex) I registered the device, but the data does not come up. I attached log`
| Gateway version    | `ex) openhardware-pi-v0.4.4`


* `gateway log` , `screenshot`

<br>

#### Verifying the Gateway Version
  ```
  $ cd /opt/thingplus/gateway/
  $ cat VERSION
  ```

---
<div id='id-check'></div>

### Things to check in case of trouble
If you can not find the cause after checking the checklist below, please send us the log with the [inquiry form](#id-inquirytable) above to give you a quicker and more accurate answer.

<br>

#### Check the status of gateway and sensor device running
* Gateway

  ```
  #Go to the path where you ran ./thingplus.sh
  $ cd /opt/thingplus/gateway/
  $ ./thingplus.sh status //If it is not running, restart it.
  $ ./thingplus.sh restart
  ```

* Sensor Device

  ```
  #Go to the path where you ran./thingplus_device.sh
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ //ex)RaspberryPi
  $ ./thingplus_device.sh status //If it is not running, restart it.
  $ ./thingplus_device.sh restart
  ```
<br>

#### How to check the log
* If you have any problems with the open hardware, you can check the log to find the cause of the problem.
* The log provides two types of gateway log and sensor device log.
  - Gateway log : Includes an MQTT log that sends sensor values from the sensor to the thingplus server.
  - Senosr Device log : You can check the sensor values that the sensor collects at regular intervals.
* You can see in the log whether the sensor has an abnormal sensor value or an error when sending it to the server.

* Gateway log

  ```
  #Go to the path where you ran ./thingplus.sh
  $ cd /opt/thingplus/gateway/
  $ tail -f -n 500 log/thingplus.log
  ```

* Sensor Device log

  ```
  #Go to the path where you ran./thingplus_device.sh
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ //ex)RaspberryPi
  $ tail -f -n 500 log/thingplus_device.log
  ```

* Please see these two logs and try debugging or sending them to us.

---
<div id='id-faq'></div>

### MQTT guide
* Thingplus recommends MQTT for data transmission.
* For data transmission, HTTPS using API is possible, but it is not recommended.
* If you want to send data directly from device without equipment, please refer to [MQTT guide](../en/mqttguide.html).


### FAQ
This is a frequently asked question. Please check if it is included.

<br>

#### 400 error or 409 error when registering gateway
* The gateway you are trying to use may already be registered with another service.
* You must delete the registered gateway and register it again.


<br>

#### Gateway Registration Failure
* From the top menu, go to the `sensor list` and make sure that the gateway you want to register is already registered.
* If it is already registered and does not operate normally, delete the gateway from the gateway management.
* Make sure the APIKEY part is the same as the APIKEY you have been issued.

  ```
  cd [Location where thingplus is installed]/gateway/thingplus-gateway/device/config/
  cat runtime.json
  ```
  If you open the runtime.json file, you can check the APIKEY of the currently registered gateway as follows.
  ```
  ...

  "Gateway": {
  "name": "Gateway name"
  },
  "Server": {
     "APIKEY": "uL0................00r4="
   ...

  ```
* If you do copy and paste, it will not be a problem. If you typing yourself, you may be confused with the lowercase `ㅣ` and the uppercase `I`.



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>

<br/>
<br/>
<br/>


























