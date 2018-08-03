---
title: Arduino+WizFi250 User Guide
tags: "open-hardware"
published: true
image: "http://support.thingplus.net/assets/ogp/ogp_wizwifiArduino.png"
img: ic-wizfi-250-arduino.png
permalink: /en/open-hardware/arduino-noSSL-wizFi250-user-guide.html
---

Thing+ Guide for Arduino(Arduino with WizFi250 & Non-SSL)<br/>
<div id='id-ide'></div>

1. [ Install Arduino IDE](#id-ide)
2. [Environment Setting](#id-setting)
3. [Arduino Firmware install](#id-firmware)
4. [Gateway Registration](#id-gateway)
5. [Firmware build and upload](#id-build)


<br/>

---
___This document is only for the purposes of the education and personal test.
Arduino and/or H/W having similar specs with Arduino can’t support the SSL Encryption because they don’t have enough CPU Power for it. Because of that, An extra H/W which support the SSL Encryption is required to use Arduino with ThingPlus Cloud.
For Arduino Users’ convenience, we’d like to introduce the new way to use Arduino Board as the ThingPlus IoT Gateway without any extra H/W.
All of the communications between your Arduino board and ThingPlus Cloud can be disclosed because they are not encrypted. <br>
WE STRONGLY RECOMMEND TO USE THIS ONLY FOR THE EDUCATION AND PERSONAL TESTS WHICH DOESN’T INCLUDE ANY KINDS OF SENSITIVE DATA.<br>
API KEY for the non encrypted communication between Arduino and ThingPlus Cloud will be valid only for 30 days.
If you want to use the API KEY over 30 days, please extend the valid duration before it is expired___

---

#### Compatible Board for Thingplus Arduino Library

- Arduino Board / Orange Board
- ESP8266 (without Arduino board)
- Arduino WizFi250
- Board using ARM CORETEX-M chip

<br/>

#### 1.  Install Arduino IDE

1) Install Arduino IDE upon PC OS environment. Please use above version. 1.6.9.

   - [Download Link](https://www.arduino.cc/en/Main/Software)

<div id='id-setting'></div>

<br/>

#### 2. Environment Setting

1) Connect Arduino and PC.

  - Connect sensors as the following.
  ![Arduino Select Port](/assets/arduino_sensor_w250.png)

  - Below is `WizFi250 EVB` from wiznet. Check mac address at top of wizFi250 chip.
  ![Arduino Mac Address](/assets/arduino_wizFi250.png)

  - Connect Arduino Uno(Orange Board) with grove shield and then Connect wizFi250 EVB on there.
  ![Arduino Select Port](/assets/arduino_wizFi250_connect.png)

<br/>

2) Execute Arduino IDE.


<br/>
3) Select USB for Arduino Port in IDE. (for windows, COMxx)

   - Tools -> Port -> Arduino/Genuino Uno

     ![Arduino Select Port](/assets/arduino_port.png)

<div id='id-firmware'></div>

<br/>

#### 3. Arduino Firmware install

1) Select Firmware to download into Arduino.

  - Have to install Firmware is as the following.
    - Arduino Library
    - ArduinoJson
    - PubSubClient
    - Time
    - Timer
    - wizFi250

  - thingplus Library (above. v1.0.7)
    - `Sketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > thingplus > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Arduino Lib](/assets/arduino_lib.png)
      <div class="dwExpand2"></div>
  - ArduinoJson
    - `Sketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > ArduinoJson > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_json](/assets/arduino_json_search.png)
      <div class="dwExpand2"></div>
  - PubSubClient
    - `Sketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > PubSubClient > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Pubsub](/assets/arduino_pubsub_search.png)
      <div class="dwExpand2"></div>
  - Time
    - `Sketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > timekeep > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Time](/assets/arduino_time_search.png)
      <div class="dwExpand2"></div>
  - Timer
    - [Download `Timer` Library](https://github.com/JChristensen/Timer/archive/master.zip)
    - `Sketch -> Include Library -> Add .ZIP Library...`
      <p class="dwExpand">- To load downloaded .zip file</p>
      ![Arduino_timer](/assets/arduino_lib_timer.png)
      <div class="dwExpand2"></div>

  - WizFi250
    - `Sketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > wizFi250 > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Time](/assets/arduino_lib_wizfi250.png)
      <div class="dwExpand2"></div>


<br/>
<div id='id-pubsub'></div>

2) Modify header file in PubSubClient

  - Arduino Library Directory Path

    ``` bash
    Windows : My Documents\Arduino\libraries\
    Mac : ~/Documents/Arduino/libraries/
    Linux : /home/<your user name>/sketchbook/libraries
    ```

  - open _**LibraryPath**/PubSubClient/src/PubSubClient.h_ and modify as the following.
    - `MQTT_MAX_PACKET_SIZE 196`
    - `MQTT_KEEPALIVE 120`

    ![Arduino_Edit_Pubsub](/assets/arduino_edit_pubsub.png)

> Notice : If you didn't modify this part, actuator will be not works.


3) config setting
- open **_LibraryPath_/Thingplus/src/Thingplus.cpp** and modify as the following.(at line: 230)
  - `mqtt.thingplus.net` -> `mqtt.sandbox.thingplus.net`

```c++
void ThingplusClass::begin(Client& client, byte mac[], const char *apikey) {
	const char *server = "dmqtt.sandbox.thingplus.net";
	const int port = 1883;

	this->mac = mac;
	snprintf(this->gatewayId, sizeof(this->gatewayId), PSTR("%02x%02x%02x%02x%02x%02x"),
			mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
	this->apikey = apikey;

	this->mqtt.setCallback(mqttSubscribeCallback);
	this->mqtt.setServer(server, port);
	this->mqtt.setClient(client);
}
```


<div id='id-gateway'></div>

<br/>

#### 4. Gateway Registration


1) Get API key and register sensors

  - There are 3 examples in _**LibraryPath**/Thingplus/examples/_ (above thingplus library v1.0.7)
    - ArduinoEthernet : For Arduino + ethernet shield
    - ArduinoWizFi250 : For Arduino + WizFi250(wifi module of Wiznet)
    - ESP8266 : For ESP8266 (without Arduino board)
  - This guide is guide of Arduino+wizFi250, so we use `LibraryPath/Thingplus/examples/ArduinoWizFi250/ArduinoWizFi250.ino`.
  -  If you want to add `another sensors or another actions`, then modify/add the scripts.

<br/>

  - Get API KEY in thingplus portal using mac address. (you might checked mac address on Ethernet Shield)
    - Assumed mac address is `11-FF-1F-F9-03-DF`

    - https://trial.sandboxthingplus.net/#/login > sign in > Settings > Gateway Management
    ![Arduino Register](/assets/arduino_register.png)
<br/>

    - Select `Arduino-Developer` as Gateway Model.
    ![Arduino GW Model](/assets/arduino_developer.png)
<br/>


    - Input mac address in Gateway ID field.

    - Select a `Get API key` button.
    ![Arduino Get APIKEY](/assets/arduino_getAPIkey.png)
<br/>

    - API Key is issued. (The API key wil be expired in 30 days) **copy 'API KEY'**
    ![Arduino APIKEY](/assets/arduino_apikey.png)
<br/>

    - Select a `Register Gateway` button.

    - Input `Gateway name`.

    - Select `grove startkit for Arduino` as the device model.

    - Input a `Device name`.
    ![Arduino  Register](/assets/arduino_Register_form.png)
<br/>

    - Select a `Register a Gateway, Device and Sensors` button.
    ![Arduino  Register Finish](/assets/arduino_reg_finish.png)
<br/>

    - [Move to Gateway Management in thingplus portal](https://trial.sandbox.thingplus.net/#/gatewaymgmt)

    - You can see the sensor ID.
    ![Arduino  Sensor ID](/assets/arduino_sensor_id.png)
<br/>

  - Update _ArduinoWizFi250.ino_ file.
    - To connect WiFi, input `ssid` and `password` as the following.
    ![Arduino set wifi](/assets/arduino_wizFi_set_wifi.png)

    - Update api key : update using `Copied API KEY`.
    ![Arduino APIKEY Register](/assets/arduino_wizFi_set_apikey.png)

    - Update sensor ID (input `mac address` in place of `00000000000`)
    ![Arduino Setting](/assets/arduino_wizFi_set_sensor.png)

 > Notice :
 > The `Gateway ID` and `API KEY` is just for help to understand.
 > Above ID and KEY is not available.


<div id='id-build'></div>

<br/>

#### 5. Firmware build and upload(execute)

1) build(compile) firmware.

![Arduino Verify](/assets/arduino_wizFi_verify.png)

<br/>
2) Upload Firmware on Arduino.

![Arduino Download](/assets/arduino_wizFi_upload.png)

<br/>
3) Check if the below message shown at IDE.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

4) Reay to use

  - now, you can use arduino Independently.


