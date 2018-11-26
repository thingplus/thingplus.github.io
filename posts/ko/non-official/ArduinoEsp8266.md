---
title: Arduino+ESP8266
published: true
img: ic-troubleshooting.png
permalink: /ko/esp8266.html
---

### Arduino+ESP8266과 Thing+ 연동 가이드

※ 주의 : ESP8266은 구동전압이 3.3V입니다. 본 가이드에서는 ESP8266의 RX, TX핀에 5V를 인가하기 때문에, ESP8266 보드가 고장날 수 있습니다.
※ WiFiEsp 라이브러리의 버그로 인해, 센서 데이터 전송은 가능하지만, 액츄에이터 명령은 수신할 수 없습니다.

준비물 : Arduino, Arduino AC 전원, ESP8266

> Arduino에 꼭 AC 전원을 인가해주시기 바랍니다.


#### 1. ESP8266 F/W 업데이트

1.1 회로 구성

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

  - FLASH_TOOL_DIR/ESPFlashDownloadTool_V3.4.4.exe를 실행한다.

    ![FlashTool](/assets/esp8266FlashFirmware.png)

  - Flash Tool의 "Download Patch Config"창을 아래와 같이 설정한다.

    |File|Address|
    |---|---|
    |SDK_DIR/bin/esp_init_data_default.bin| 0xfc000
    |SDK_DIR/bin/boot_v1.6.bin|0x00000
    |SDK_DIR/bin/blank.bin|0xfe000
    |SDK_DIR/bin/at/1024+1024/user1.2048.new.5.bin|0x01000

  - 선택한 후 아래쪽의 `Start`를 누른다.
  - 만약 다운로드가 되자 않으면, BaudRate 설정을 115200으로 변경해서 시도해본다.
  - 계속 안된다면, Arduino, Esp8266을 모두 끈 후 5분정도 기다렸다가 다시 시도해본다.

  - FlashTool의 좌측 아래에 표시된 MAC 주소를 기억해 둔다. 나중에 Gateway 등록시에 사용할것이다.

<br/>

1.4 Verify flashing and Baudrate set

- ESP8266의 GPIO0핀을 Open상태(연결이 안된 상태)로 둔 후, 보드를 껐다가 켠다.
- 아두이노 IDE를 실행한 후 시리얼 모니터를 켠다.

- 시리얼 모니터의 오른쪽 하단에 설정부분을 `Both NL & CR`, `115200` BaudRate로 변경한다.

  ![SerialMonitor](/assets/esp8266SerialMonitor.png)

  - ESP8266이 정상부팅 되었는지 확인하기 위해서 "AT"명령어를 전송하여 "OK"응답이 오는지 확인한다.
  - 펌웨어 버전을 확인 하기 위하여 `AT+GMR` 명령어를 전송한다.
  - 마지막으로 ESP8266의 Baudrate를 9600으로 설정하기 위해 `AT+UART_DEF=9600,8,1,0,0`를 전송한다. 9600으로 정상적으로 설정이 되었다면, 시리얼 모니터의 보드레이트로 9600으로 재설정해야 한다.

  > 모든 AT 명령어는 대문자로 적어야 한다.

  |명령어|응답|설명|
  |---|---|
  |AT|OK|AT명령어 정상동작 확인
  |AT+GMR|AT version:1.3.0.0(Jul 14 2016 18:54:01)<br>SDK version:2.0.0(656edbf)<br>compile time:Jul 19 2016 18:44:22<br>OK|펌웨어 버전 확인
  |AT+UART_DEF=9600,8,1,0,0|OK|Baudrate 설정

<br/>

#### 2. Arduino, ESP8266과 Thing+ 연동

2.1 회로 구성

  ![RunningCircuit](/assets/esp8266ArduinoRunningCircuit.png)

  |Esp8266|Arduino
  |---|---
  |Rx|GPIO7
  |Tx|GPIO6
  |CH_PD|3.3V
  |VCC|3.3V
  |GND|GND

<br/>

2.2 라이브러리 설치

  - Scketch -> Include Library -> Manage Libraries -> `WiFiEsp` 검색 후 설치
  - Scketch -> Include Library -> Manage Libraries -> `Thingplus` 검색 후 설치
  - Scketch -> Include Library -> Manage Libraries -> `ArduinoJson` 검색 후 설치
  - Scketch -> Include Library -> Manage Libraries -> `PubSubClient` 검색 후 설치
  - Scketch -> Include Library -> Manage Libraries -> `Time` 검색 후 설치
  - Scketch -> Include Library -> Manage Libraries -> `Timer` 검색 후 설치

참조 : [아두이노 펌웨어 설치](/ko/open-hardware/arduino-noSSL-user-guide.html#id-firmware)

<br/>

2.2.1 PubSubClient의 Header파일 수정

  - Arduino Library Directory Path

    ``` bash
    Windows : My Documents\Arduino\libraries\
    Mac : ~/Documents/Arduino/libraries/
    Linux : /home/<your user name>/sketchbook/libraries
    ```

  - _**LibrayPath**/PubSubClient/src/PubSubClient.h_ 파일을 열어서 아래 부분을 수정합니다.

  - `MQTT_MAX_PACKET_SIZE 196`
  - `MQTT_KEEPALIVE 120`

    ![Arduino_Edit_Pubsub](/assets/arduino_edit_pubsub.png)


2.2.2 config 설정
  - **_LibraryPath_/Thingplus/src/Thingplus.cpp** 파일을 아래와 같이 수정합니다..(at line: 230)
    - `mqtt.thingplus.net` -> `mqtt.sandbox.thingplus.net`

```c++
void ThingplusClass::begin(Client& client, byte mac[], const char *apikey) {
	const char *server = "mqtt.sandbox.thingplus.net";
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

#### 3. 게이트웨이 등록

참조 : [게이트웨이 등록](/ko/open-hardware/arduino-noSSL-user-guide.html#id-gateway)

- 본 가이드에서는 Arduino board에 esp8266 연결 예제 이므로 `LibrayPath/Thingplus/examples/ArduinoEsp8266/ArduinoEsp8266.ino` 를 사용 합니다.

<br/>
<br/>
<br/>