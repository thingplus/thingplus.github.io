---
title: NodeMCU User Guide
tags: "open-hardware"
published: true
image: "http://support.thingplus.net/assets/ogp/ogp_esp8266.png"
img: ic-esp-8266.png
permalink: /en/open-hardware/nodemcu-user-guide.html
---

Thing+ Guide for NodeMCU/Esp8266<br/>
<div id='id-ide'></div>

1. [Install Arduino IDE](#id-ide)
2. [Environment Setting for NodeMCU](#id-setting)
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
- ESP8266 (without Aruino board)
- Arduino WizFi250
- NodeMCU
- Board using ARM CORETEX-M chip

<br/>
**_This guide covers how to intergrate the ESP8266 with the NodeMCU._**
**_NodeMCU will be dealt with by reference, and ESP8266 will be referenced in the same way. Please note that ESP8266 is 3.3v._**
<br/>

#### 1. Install Arduino IDE

1) Install Arduino IDE upon PC OS environment. Please use above version. 1.6.9.

   - [Download link](https://www.arduino.cc/en/Main/Software)

<div id='id-setting'></div>

<br/>

#### 2. Environment Setting for NodeMCU

1) Only LEDs and temperature sensors are connected in this guide.

  - The `grove LED` was used for the LED and the `grove temperature` sensor was used for the temperature sensor.

    ![](/assets/nodemcu_sensors.png)

2) Connect the sensors.

  - Connect temperature `SIG` to` A0` and connect `VCC` and` GND`.

  - Connect `SIG` of LED to` D1` and connect `VCC` and` GND`.

  - Connect `PC` and `NodeMCU` with usb cable.

<br/>

3) Launch the Arduino IDE.

<br/>

4) In the Arduino IDE, select board and port.

   - Tools -> Board -> NodeMCU 1.0

     ![Arduino Select Port](/assets/nodeMCU_setboard.png)

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

  - thingplus Library (above. v1.0.9)
    - `Scketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > thingplus > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Arduino Lib](/assets/arduino_lib.png)
      <div class="dwExpand2"></div>
  - ArduinoJson
    - `Scketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > ArduinoJson > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_json](/assets/arduino_json_search.png)
      <div class="dwExpand2"></div>
  - PubSubClient
    - `Scketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > PubSubClient > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Pubsub](/assets/arduino_pubsub_search.png)
      <div class="dwExpand2"></div>
  - Time
    - `Scketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > timekeep > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Time](/assets/arduino_time_search.png)
      <div class="dwExpand2"></div>
  - Timer
    - [Download `Timer` Library](https://github.com/JChristensen/Timer/archive/master.zip)
    - `Scketch -> Include Library -> Add .ZIP Library...`
      <p class="dwExpand">- To load downloaded .zip file</p>
      ![Arduino_timer](/assets/arduino_lib_timer.png)
      <div class="dwExpand2"></div>

  - WizFi250
    - `Scketch -> Include Library -> Manage Libraries...`
      <p class="dwExpand">- Search > wizFi250 > install</p>
      ![Arduino_json](/assets/arduino_json.png)
      ![Search Arduino_Time](/assets/arduino_lib_wizfi250.png)
      <div class="dwExpand2"></div>

<br/>
<div id='id-pubsub'></div>

2) Modify the header file of PubSubClient

  - Arduino Library Directory Path

    ``` bash
    Windows : My Documents\Arduino\libraries\
    Mac : ~/Documents/Arduino/libraries/
    Linux : /home/<your user name>/sketchbook/libraries
    ```

  - _Open **LibrayPath**/PubSubClient/src/PubSubClient.h_ and modify the following.

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
  - There are 3 examples in _**LibrayPath**/Thingplus/examples/_ (above thingplus library v1.0.7)
    - ArduinoEthernet : For Arduino + ethernet shield
    - ArduinoWizFi250 : For Arduino + WizFi250(wifi module of Wiznet)
    - ESP8266 : For ESP8266 (without Arduino board), NodeMCU
  - This guide is guide of Node MCU, so we use `LibrayPath/Thingplus/examples/Esp8266/Esp8266.ino`.
  -  If you want to add `another sensors or another actions`, then modify/add the scripts.


<br/>

  - Check the Mac address of the NodeMCU.
    - Upload it without modification from _Esp8266.ino_ file.
    - When the upload is complete, open the serial monitor.
    - Take note of the Mac address on the serial Monitor.

  - Acquire APIKEY from the thingplus portal using the confirmed mac address.
    - I will explain it as an example that the confirmed mac address is `3C:D1:EF:1D:1D:2E`.

    - https://trial.sandbox.thingplus.net/#/login > sign in > Settings > Gateway Management
    ![Arduino Register](/assets/arduino_register.png)
<br/>

    - Select `Arduino-Developer` as Gateway Model.
    ![Arduino GW Model](/assets/arduino_developer.png)
<br/>


    - Enter the confirmed MAC address in the Gateway ID field.(If you copy from serial monitor, you can paste it.)

    - Select the `Get API KEY` button.
    ![Arduino Get APIKEY](/assets/NodeMCU_getapikey.png)
<br/>

    - API Key is issued. (The API key wil be expired in 30 days) **copy 'API KEY'**
    ![Arduino APIKEY](/assets/NodeMCU_regGW.png)
<br/>

    - Select a `Register Gateway` button.

    - Input `Gateway name`.

    - Select `grove startkit for Arduino` as the device model.

    - Input a `Device name`.
    ![Arduino  Register](/assets/NodeMCU_inputName.png)
<br/>

    - Select a `Register a Gateway, Device and Sensors` button.
    ![Arduino  Register Finish](/assets/arduino_reg_finish.png)
<br/>

    - [Move to Gateway Management in thingplus portal](https://trial.sandbox.thingplus.net/#/gatewaymgmt)

    - You can see the sensor ID.
    ![Arduino  Sensor ID](/assets/NodeMCU_sensorId.png)
<br/>

  - Update _Esp8266.ino_ file.

    - Paste the copied API KEY into the _Esp8266.ino_ file that you modified.
    - Change the sensor ID. (Enter the id you checked above.)
    ![Arduino APIKEY Register](/assets/NodeMCU_inoset.png)



 > Notice :
 > The `Gateway ID` and `API KEY` is just for help to understand.
 > Above ID and KEY is not available.


<div id='id-build'></div>

<br/>

#### 5. Firmware build and upload(execute)

1) build(compile) firmware.
![Arduino Verify](/assets/NodeMCU_complile.png)

<br/>
2) Upload Firmware on Arduino.

![Arduino Download](/assets/NodeMCU_upload.png)

<br/>
3) Check if the below message shown at IDE.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

4) Reay to use

  - now, you can use arduino Independently.


