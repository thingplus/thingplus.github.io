---
title: 아두이노 사용자 가이드 - carousel
tags: "open-hardware"
published: false
image: "http://support.thingplus.net/assets/ogp/ogp_arduino.png"
img: ic-arduino.png
permalink: /ko/open-hardware/arduino-noSSL-user-guide-tst.html
---

Thing+ Guide for Arduino(Arduino with NoneSSL)

<br/>
<div id='id-ide'></div>

<span class='dw_content_table'>
1. [아두이노 IDE 설치](#dw_slide01)<br/>
2. [아두이노 단말 환경 세팅](#dw_slide02)<br/>
3. [아두이노 펌웨어 설치](#dw_slide03)<br/>
4. [게이트웨이 등록](#dw_slide04)<br/>
5. [펌웨어 빌드 및 실행](#dw_slide05)
<span>

<br/>

---
___이 가이드는 교육용/테스트용도로 제작되었습니다.
Arduino는 SSL을 사용할 수 없었기 때문에 ThingPlus Cloud와의 연동을 위해서는 PC와의 연결이 필요 했었습니다.
이에 대해 교육용으로 SSL 없이 Thingplus Cloud 와 연동을 할 수 있도록 버전을 배포합니다.
SSL을 사용하지 않기 때문에 모든 정보는 노출됩니다. 절대 상용으로는 사용하시지 않기를 당부드립니다.
Arduino None SSL 버전 사용을 위한 API KEY는 30일 사용가능한 key이며, 30일 이후에도 사용할 경우에는 30일 이전에 expire 기한을 연장 해야합니다.___

---



<span class="container" style="width: 100%">
  <span id="myCarousel" class="carousel slide" data-ride="carousel">
    <span class='indicators'></span>
    <span class="carousel-inner" role="listbox">
      <span class='item active'>
        <span class="carousel-caption">
          아두이노 IDE 설치
        </span>
        <span class='dw_md_item 0'></span>
      </span>
      <span class='item'>
        <span class="carousel-caption">
          아두이노 단말 환경 세팅
        </span>
        <span class='dw_md_item 1'></span>
      </span>
      <span class='item' >
        <span class="carousel-caption">
          아두이노 펌웨어 설치
        </span>
        <span class='dw_md_item 2'></span>
      </span>
      <span class='item' >
        <span class="carousel-caption">
          게이트웨이 등록
        </span>
        <span class='dw_md_item 3'></span>
      </span>
      <span class='item' >
        <span class="carousel-caption">
          펌웨어 빌드 및 실행
        </span>
        <span class='dw_md_item 4'></span>
      </span>
      <span class="dw_carousel_control"></span>
    </span>
  </span>
</span>


<div class="hidden"></div>

#### 1. 아두이노 IDE 설치

<div class='dw_carousel_item_md'></div>
1) 사용하는 PC OS버전에 맞는 아두이노 IDE를 설치합니다. 1.6.9 이상의 버전을 권장 합니다.

   - [다운로드링크](https://www.arduino.cc/en/Main/Software)
   ![arduino_ide_download](/assets/arduino_ide_download.png)

<div class='dw_carousel_item_md_close'></div>




<div class='dw_carousel_item_md'></div>
1) 아두이노와 PC를 USB로 연결 합니다.

  - 본 예제에서는 LED와 Temperature만 연결 합니다. Grove shield에 아래와 같이 연결 합니다.
  ![Arduino Select Port](/assets/arduino_hw2.png)

  - LED는 D8에, Temperature는 A0 에 연결 합니다.
  ![Arduino Select Port](/assets/arduino_hw1.png)

  - Ethernet Shield 후면에 있는 mac address를 확인합니다.
  ![Arduino Mac Address](/assets/arduino-mac-address.png)

  - Arduino Uno(Orange Board) 와 grove shield 연결 하고 그위에 Ethernet shield를 연결 합니다.
  ![Arduino Select Port](/assets/arduino_hw3.png)

  - Ethernet Port에 Lan 선을 연결하고, USB port를 PC와 연결 합니다.
  ![Arduino Select Port](/assets/arduino_hw4.png)

<br/>

2) 아누이노 IDE를 실행합니다.


<br/>
3) 아두이노 IDE에서 아두이노 포트를 USB로 선택합니다. (windows에서는 COMxx 입니다.)

   - Tools -> Port -> Arduino/Genuino Uno
![Arduino Select Port](/assets/arduino_port.png)

<div id='id-firmware'></div>

<div class='dw_carousel_item_md_close'></div>


<div class='dw_carousel_item_md'></div>
1) 아두이노에 다운로드 할 펌웨어를 선택합니다.

  - 설치할 펌웨어는 다음과 같습니다.
    - 아두이노 라이브러리
    - ArduinoJson
    - PubSubClient
    - Time
    - Timer

  - 아두이노 라이브러리
    [라이브러리 다운로드 받기](http://support.thingplus.net/download/install/Thingplus.zip)
    `Scketch -> Include Library -> Add.Zip Library`

    <p class="dwExpand">- download 받은 zip 파일 로드</p>
    ![Arduino Lib](/assets/arduino_lib.png)
    <div class="dwExpand2"></div>

  - ArduinoJson
    `Scketch -> Include Library -> Manage Libraries...`

    <p class="dwExpand">- 검색 > ArduinoJson > install</p>
    ![Arduino_json](/assets/arduino_json.png)
    ![Search Arduino_json](/assets/arduino_json_search.png)
    <div class="dwExpand2"></div>

  - PubSubClient
    `Scketch -> Include Library -> Manage Libraries...`

    <p class="dwExpand">- 검색 > PubSubClient > install</p>
    ![Arduino_json](/assets/arduino_json.png)
    ![Search Arduino_Pubsub](/assets/arduino_pubsub_search.png)
    <div class="dwExpand2"></div>

  - Time
    `Scketch -> Include Library -> Manage Libraries...`

    <p class="dwExpand">- 검색 > timekeep > install</p>
    ![Arduino_json](/assets/arduino_json.png)
    ![Search Arduino_Time](/assets/arduino_time_search.png)
    <div class="dwExpand2"></div>

  - Timer
    `Scketch -> Include Library -> Manage Libraries...`

    <p class="dwExpand">- 검색 > timekeep > install</p>
    ![Arduino_json](/assets/arduino_json.png)
    ![Search Arduino_Time](/assets/arduino_time_search.png)
    <div class="dwExpand2"></div>

<br/>
2) PubSubClient 의 header 파일 수정

  - Arduino Library Directory Path

    ``` bash
    Windows : My Documents\Arduino\libraries\
    Mac : ~/Documents/Arduino/libraries/
    Linux : /home/<your user name>/sketchbook/libraries
    ```

  - _**LibrayPath**/PubSubClient/src/PubSubClient.h_ 파일을 열어서 아래 부분을 수정합니다.
    - MQTT_MAX_PACKET_SIZE 196
    - MQTT_KEEPALIVE 120
    ![Arduino_Edit_Pubsub](/assets/arduino_edit_pubsub.png)

3) config 설정
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

<div class='dw_carousel_item_md_close'></div>


<div class='dw_carousel_item_md'></div>
1) 게이트웨이 키 발급 및 센서등록

  - _**LibrayPath**/Thingplus/examples/ReadTemperatureWriteLed/ReadTemperatureWriteLed.ino_ 을 선택하면 arduino SDK에서 열립니다.
    - 예제 파일에 led와 temperature 에 대한 내용을 추가했습니다. 다른 센서를 추가 하거나 다른 동작을 시키길 원하시면 해당 부분을 수정/추가 해주시면 됩니다.
    - 예제 에서는 온도센서는 A0에, LED는 GPIO8로 설정했습니다. **예제의 LED는 blink와 duration이 동작 하지 않습니다.**
<br/>

  - Ethernet Shield에서 확인한 mac address를 사용하여 thingplus portal에서 APIKEY를 발급 받습니다.
    - 확인된 mac address가 `11-FF-1F-F9-03-DF` 라는 예로 설명을 드리겠습니다.

    - https://trial.sadnbox.thingplus.net/#/login > 로그인 > 설정 > 게이트웨이 관리
    ![Arduino Register](/assets/arduino_register.png)
<br/>

    - Gateway Model은 `Arduino-Developer` 로 선택합니다.
    ![Arduino GW Model](/assets/arduino_developer.png)
<br/>


    - Gateway ID에 확인된 mac address를 입력합니다.

    - `API KEY 발급 받기` 버튼을 선택합니다.
    ![Arduino Get APIKEY](/assets/arduino_getAPIkey.png)
<br/>

    - 아래 30일 기한의 API KEY가 발급되었습니다. **API KEY를 복사 합니다.**
    ![Arduino APIKEY](/assets/arduino_apikey.png)
<br/>

    - `게이트웨이 등록` 버튼을 선택합니다.

    - 게이트웨이 이름을 적습니다.

    - device model은 `grove startkit for Arduino`로 선택합니다.

    - device 이름을 적습니다.
    ![Arduino  Register](/assets/arduino_Register_form.png)
<br/>

    - 하단의 `게이트웨이 등록하기` 버튼을 선택합니다.
    ![Arduino  Register Finish](/assets/arduino_reg_finish.png)
<br/>

    - [게이트웨이관리로 이동합니다.](https://trial.sandbox.thingplus.net/#/gatewaymgmt)

    - 아래와 같이 센서 아이디가 보입니다.
    ![Arduino  Sensor ID](/assets/arduino_sensor_id.png)
<br/>

  - _ReadTemperatureWriteLed.ino_ 파일에 해당 내용을 업데이트 합니다.
    - mac 부분에 mac address를 2자리씩 끊어서 `0x`와 함께 입력합니다.
    ![Arduino mac address input](/assets/arduino_id_input.png)

    - 복사한 API KEY를 수정하던 ReadTemperatureWriteLed.ino 파일에 붙여 넣습니다.
    ![Arduino APIKEY Register](/assets/arduino_key_reg.png)
    - 해당 센서 아이디를 변경 해줍니다.
    ![Arduino Setting](/assets/arduino_seonsor_id_input.png)

 > 주의 :
 > 위 예제의 gatewayID와 api key 등을 노출 한것은 이해를 돕기 위한것입니다.
 > 위의 ID와 key를 사용하시면 안됩니다.

<div class='dw_carousel_item_md_close'></div>
<div class='dw_carousel_item_md'></div>

1) 펌웨어를 빌드합니다.

![Arduino Verify](/assets/arduino_build.png)

<br/>
2) 펌웨어를 아두이노에 업로드 합니다.

![Arduino Download](/assets/arduino_upload.png)

<br/>
3) 펌웨어가 정상적으로 다운로드 되면 IDE 하단에 아래와 같은 메세지가 나옵니다.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

4) 모든 설정이 끝났습니다.

  - PC 와의 연결을 종료 하고 전원을 연결해서 독립적으로 사용 가능합니다.
<div class='dw_carousel_item_md_close'></div>
<div class="hidden_close"></div>