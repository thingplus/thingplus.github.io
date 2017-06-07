---
title: Arduino User Guide 
tags: "open-hardware"
published: true
image: "http://support.thingplus.net/assets/ogp/ogp_arduino.png"
img: ic-arduino.png
permalink: /en/open-hardware/arduino-noSSL-user-guide.html
---

Thing+ Guide for Arduino(Arduino with Non-SSL)<br/>
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
  ![Arduino Select Port](/assets/arduino_hw1.png)
  
  - Check mac address at bottom of Ethernet Shield 
  ![Arduino Mac Address](/assets/arduino-mac-address.png)

  - Connect Arduino Uno(Orange Board) with grove shield and then Connect Ethernet Shield on there. 
  ![Arduino Select Port](/assets/arduino_hw3.png)

  - Connect Lan cable on Ethernet Port, Connect USB port and PC.
  ![Arduino Select Port](/assets/arduino_hw4.png)

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

<div id='id-gateway'></div>

<br/>

#### 4. Gateway Registration


1) Get API key and register sensors

  - There are 3 examples in _**LibraryPath**/Thingplus/examples/_ (above thingplus library v1.0.7)
    - ArduinoEthernet : For Arduino + ethernet shield
    - ArduinoWizFi250 : For Arduino + WizFi250(wifi module of Wiznet)
    - ESP8266 : For ESP8266 (without Arduino board)
  - This guide is guide of Arduino+Ethernet, so we use `LibraryPath/Thingplus/examples/ArduinoEthernet/ArduinoEthernet.ino`.
  -  If you want to add `another sensors or another actions`, then modify/add the scripts. 

<br/>

  - Get API KEY in thingplus portal using mac address. (you might checked mac address on Ethernet Shield)
    - Assumed mac address is `11-FF-1F-F9-03-DF`

    - https://iot.thingplus.net/ > sign in > Settings > Gateway Management
    ![Arduino Register](/assets/arduino_register.png)
<br/>

    - Select `Arduino-Developer` as Gateway Model.
    ![Arduino GW Model](/assets/arduino_developer.png)
<br/>


    - Input mac address in Gateway ID field.

    - Select a `Get API key` button.
    ![Arduino Get APIKEY](/assets/arduino_getAPIkey.png)
<br/>

    - API Key is issued. (The API key wil be expired in 30 days) ** copy 'API KEY'**
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

    - [Move to Gateway Management in thingplus portal](https://iot.thingplus.net/#/gatewaymgmt)    
    
    - You can see the sensor ID.
    ![Arduino  Sensor ID](/assets/arduino_sensor_id.png)
<br/>

  - Update _ReadTemperatureWriteLed.ino_ file.
    - Update mac address : update each 2 digit of mac with `0x` .
    ![Arduino mac address input](/assets/arduino_id_input.png) 

    - Update api key : update using `Copied API KEY`. 
    ![Arduino APIKEY Register](/assets/arduino_key_reg.png)

    - Update sensor ID (input `mac address` in place of `00000000000`)
    ![Arduino Setting](/assets/arduino_sensor_id_input.png)
 
 > Notice : 
 > The `Gateway ID` and `API KEY` is just for help to understand.
 > Above ID and KEY is not available.
  

<div id='id-build'></div>

<br/>

#### 5. Firmware build and upload(execute)

1) build(compile) firmware.

![Arduino Verify](/assets/arduino_build.png)

<br/>
2) Upload Firmware on Arduino.

![Arduino Download](/assets/arduino_upload.png)

<br/>
3) Check if the below message shown at IDE.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

4) Reay to use

  - now, you can use arduino Independently.


