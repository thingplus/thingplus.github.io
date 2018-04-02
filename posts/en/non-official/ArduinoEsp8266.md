---
title: Arduino+ESP8266
published: true
img: ic-troubleshooting.png
permalink: /en/esp8266.html
---

### Thing+ Guide for Arduino with ESP8266

※ Note: The ESP8266 has a 3.3V operating voltage. In this guide, 5V is applied to the RX and TX pins of the ESP8266, so the ESP8266 board may be broken.
※ Due to a bug in the `WiFiEsp` library, sensor data transmission is possible, but actuator commands can not be received at arduino side.

Arrangements: Arduino, Arduino AC power, ESP8266

> Please apply AC power to Arduino.


#### 1. ESP8266 F/W update

1.1 Circuit configuration

  ![FlashCircuit](/assets/esp8266ArduinoFlashCircuit.png)

  |Esp8266|Arduino
  |:---:|:---:
  |Rx|Rx
  |Tx|Tx
  |CH_PD|3.3V
  |VCC|3.3V
  |GND|GND
  |GPIO0|GND

  |Arduino|Arduino|
  |:---:|:---:|
  |RESET|GND|

<br/>

1.2 ESP8266 Flash Tool, SDK Download

  - Flash Tool : [Flash Download Tools (ESP8266 & ESP32)](https://www.espressif.com/en/support/download/other-tools)
  - SDK : [ESP8266 NONOS SDK V2.0.0 20160810](https://www.espressif.com/en/support/download/sdks-demos)

<br/>

1.3 Flash ESP8266 Firmware

  - Execute `FLASH_TOOL_DIR/ESPFlashDownloadTool_V3.4.4.exe`

    ![FlashTool](/assets/esp8266FlashFirmware.png)

  - Set the `Download Patch Config` window of Flash Tool as below.

    |File|Address|
    |---|---|
    |SDK_DIR/bin/esp_init_data_default.bin| 0xfc000
    |SDK_DIR/bin/boot_v1.6.bin|0x00000
    |SDK_DIR/bin/blank.bin|0xfe000
    |SDK_DIR/bin/at/1024+1024/user1.2048.new.5.bin|0x01000

  - After selecting, press `Start` at the bottom.
  - If downloading does not work, try setting BaudRate to 115200.
  - If it continues to fail, turn off both Arduino and Esp8266, wait 5 minutes and try again.

  - Remember the `MAC address` shown at the bottom left of FlashTool. We will use it later when registering the gateway.

<br/>

1.4 Verify flashing and Baudrate set

  - With nothing connected to the GPIO0 pin of the ESP8266, turn the board off and then on.
  - Runs the Adunino IDE and turns on the serial monitor.
  - Change the setting part to `Both NL & CR`,` 115200` BaudRate in the bottom-right of the serial monitor.
    ![SerialMonitor](/assets/esp8266SerialMonitor.png)

  - To check whether ESP8266 is booted normally, send `AT` command and check whether `OK` response is coming.
  - Send `AT + GMR` command to check the firmware version.
  - Finally, to set the Baudrate of the ESP8266 to `9600`, transmit `AT + UART_DEF = 9600,8,1,0,0`. 
  - If it is set to 9600 normally, it should be reset to 9600 as the baud rate of the serial monitor.
  
   > All `AT commands` must be capitalized.

  |command|response|description|
  |---|---|
  |AT|OK|Verify normal operation of AT command
  |AT+GMR|AT version:1.3.0.0(Jul 14 2016 18:54:01)<br>SDK version:2.0.0(656edbf)<br>compile time:Jul 19 2016 18:44:22<br>OK|Check to firmware version
  |AT+UART_DEF=9600,8,1,0,0|OK|setting of Baudrate

<br/>

#### 2. Thing+ Guide for Arduino with ESP8266

2.1 Circuit configuration

  ![RunningCircuit](/assets/esp8266ArduinoRunningCircuit.png)

  |Esp8266|Arduino
  |---|---
  |Rx|GPIO7
  |Tx|GPIO6
  |CH_PD|3.3V
  |VCC|3.3V
  |GND|GND

<br/>

2.2 Install libraries

  - Scketch -> Include Library -> Manage Libraries -> Search and Install `WiFiEsp` 
  - Scketch -> Include Library -> Manage Libraries -> Search and Install `Thingplus` 
  - Scketch -> Include Library -> Manage Libraries -> Search and Install `ArduinoJson` 
  - Scketch -> Include Library -> Manage Libraries -> Search and Install `PubSubClient` 
  - Scketch -> Include Library -> Manage Libraries -> Search and Install `Time` 
  - Scketch -> Include Library -> Manage Libraries -> Search and Install `Timer` 

Reference : [Install arduino firmware](/ko/open-hardware/arduino-noSSL-user-guide.html#id-firmware)

<br/>

2.2.1 Modifying the PubSubClient's Header File

  - Arduino Library Directory Path

    ``` bash
    Windows : My Documents\Arduino\libraries\
    Mac : ~/Documents/Arduino/libraries/
    Linux : /home/<your user name>/sketchbook/libraries
    ```

  - _**LibrayPath**/PubSubClient/src/PubSubClient.h_ Open the file and make the following changes.

  - `MQTT_MAX_PACKET_SIZE 196`
  - `MQTT_KEEPALIVE 120`

    ![Arduino_Edit_Pubsub](/assets/arduino_edit_pubsub.png)

#### 3. Register gateway

Reference : [Register Gateway](/ko/open-hardware/arduino-noSSL-user-guide.html#id-gateway)

- In this guide, we will use `LibrayPath/Thingplus/examples/ArduinoEsp8266/ArduinoEsp8266.ino` as it is an example of connecting the esp8266 to the Arduino board.
