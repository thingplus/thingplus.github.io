---
title: 오픈하드웨어 지원 리스트
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/openhardware-list.html
---
<div class='thetop'></div>
오픈하드웨어 지원 리스트
<div id='id-simulator-guide'></div>

1. [센서 시뮬레이터](#id-simulator-guide)
2. [라즈베리파이](#id-pi-guide)
3. [비글보드](#id-beagle-guide)
4. [아두이노](#id-arduino-guide)
5. [지원센서 목록](#id-sensor-list)
6. [추가 생성할 수 있는 센서 목록](#Extra-sensors)


<br/>
#### ***잠깐! 아직 ThingPlus 회원이 아니세요? [여기](https://thingplus.net/signup/)에서 무료가입을 할 수 있습니다.***
<hr>

<div id='id-pi-guide'></div>
### 0. 센서 시뮬레이터
- [연동가이드 바로가기](/ko/open-hardware/sensor-simulator-user-guide.html)

<br/>

### 1. 라즈베리파이
- 라즈베리파이 I, II 지원
- 센서 구입경로
 - [라즈베리파이 GrovePi+ 센서 키트 (**쉴드 및 10종 센서 포함**)](http://www.icbanq.com/P005700239)
 - [라즈베리파이 GrovePi+ 쉴드 별도 구매](http://www.icbanq.com/P005700248/S)
 - [지원 센서 목록 바로가기](#available-sensor-list-pi)
- [연동가이드 바로가기](/ko/open-hardware/raspberry-pi-user-guide.html)

<div id='id-beagle-guide'></div>
<br/>
### 2. 비글보드
- 비글본 블랙, 그린 지원
- 센서 구입경로
 - [비글본그린 Grove 스타터 센서 키트 (**I2C Hub, ADC 및 8종 센서 포함**)](http://www.icbanq.com/P005716600)
 - [비글본그린 Grove I2C Hub 별도 구매](http://www.icbanq.com/P005719742/S)
 - [비글본그린 Grove I2C ADC 별도 구매](http://www.icbanq.com/P005716571)
 - [지원 센서 목록 바로가기](#available-sensor-list-bbg)
- [연동가이드 바로가기](/ko/open-hardware/bbb-user-guide.html)

<div id='id-arduino-guide'></div>
<br/>
### 3. 아두이노
- 아두이노(우노, 오렌지보드 등) 지원
- 센서 구입경로
 - [아두이노 Grove 스타터 센서 키트](https://www.icbanq.com/P005710113/)
 - [Grove 호환 베이스 쉴드 별도 구매](https://www.icbanq.com/P005700460/)
 - [지원 센서 목록 바로가기](#available-sensor-list-arduino)
- [연동가이드 바로가기](/ko/open-hardware/arduino-user-guide.html)

<br/>
### 4. 추가 예정
- 에디슨

<br/>
<div id='id-sensor-list'></div>
### 5. 지원 센서 목록
- **센서는 계속 추가될 예정입니다.**

<div id='available-sensor-list-pi'></div>
- 라즈베리파이
 - [버튼 센서 (Button Sensor)](http://www.icbanq.com/P005604580)
 - [조도 센서 (Light Sensor)](http://www.icbanq.com/P005700527)
 - [소리 센서 (Sound Sensor)](http://www.icbanq.com/P005713936)
 - [회전각 센서 (Rotary Angle Sensor)](http://www.icbanq.com/P005604574)
 - [온도/습도 센서 (Temperature and Humidity Sensor)](http://www.icbanq.com/P005700533)
 - [초음파 센서 (Ultrasonic Ranger)](http://www.icbanq.com/P005700488)
 - [버저 (Buzzer)](http://www.icbanq.com/P005604566)
 - [LED](http://www.icbanq.com/P005604557)
 - [LCD (LCD RGB Backlight)](http://www.icbanq.com/P005604576)
 - [파워 릴레이 (Relay)](http://www.icbanq.com/P005604584)

<div id='available-sensor-list-bbg'></div>
- 비글보드
 - [버튼 센서 (Button Sensor)](http://www.icbanq.com/P005604580)
 - [3축 센서 (3-Axis Digital Accelerometer)](http://www.icbanq.com/P005700487)
 - [RGB LED (Chainable RGB LED)](http://www.icbanq.com/P005604536)
 - [OLED 디스플레이 (OLED Display)](http://www.icbanq.com/P005700456)

<div id='available-sensor-list-arduino'></div>
- 아두이노
 - [터치 센서 (Touch Sensor)](https://www.icbanq.com/P005604590/)
 - [버저 (Buzzer)](http://www.icbanq.com/P005604566)
 - [버튼 센서 (Button Sensor)](http://www.icbanq.com/P005604580)
 - [LED](http://www.icbanq.com/P005604557)
 - [LCD (LCD RGB Backlight)](http://www.icbanq.com/P005604576)
 - [파워 릴레이 (Relay)](http://www.icbanq.com/P005604584)
 - [소리 센서 (Sound Sensor)](http://www.icbanq.com/P005713936)
 - [회전각 센서 (Rotary Angle Sensor)](http://www.icbanq.com/P005604574)
 - [조도 센서 (Light Sensor)](http://www.icbanq.com/P005700527)
 - [온도센서 (Temperature Sensor)](https://www.icbanq.com/P005713933/)

<div id='Extra-sensors'></div>
<br><br>
### 6. 추가 생성할 수 있 센서 목록

|icon                                                   |Type       | Model                |Categrory         
|-------------------------------------------------------|-----------|----------------------|----------
|![7colorLED](/assets/icon/icon-7colorRGBLed-small.png) |7색 컬러 LED | jsonrpc7colorRGBLed |actuator              
|![accelerometer](/assets/icon/icon-accelerometer-small.png) |가속도 | jsonrpcAccelerometer |sensor
|![aircondition](/assets/icon/icon-airConditioner-small.png)|에어컨|jsonrpcAirConditioner|actuator
|![battery](/assets/icon/icon-batteryGauge-small.png)|배터리|jsonrpcBatteryGauge|sensor
|![buzzer](/assets/icon/icon-buzzer-small.png)|버저|jsonrpcBuzzer|actuator
|![co](/assets/icon/icon-co-small.png)|일산화탄소|jsonrpcCo|sensor
|![co2](/assets/icon/icon-co2-small.png)|이산화탄소|jsonrpcCo2|sensor
|![color](/assets/icon/icon-color-small.png)|색상|jsonrpcColor|sensor
|![count](/assets/icon/icon-count-small.png)|횟수|jsonrpcCount|sensor
|![countevent](/assets/icon/icon-countEvent-small.png)|횟수(이벤트)|jsonrpcCountEvent|sensor
|![current](/assets/icon/icon-current-small.png)|전류|jsonrpcCurrent|sensor
|![door](/assets/icon/icon-door-small.png)|문열림|jsonrpcDoor|sensor
|![dust](/assets/icon/icon-dust-small.png)|먼지|jsonrpcDust|sensor
|![fan](/assets/icon/icon-electricFan-small.png)|선풍기|jsonrpcElectricFan|actuator
|![humi](/assets/icon/icon-humidity-small.png)|습도|jsonrpcHumi|sensor
|![lcd](/assets/icon/icon-lcd-small.png)|LCD|jsonrpcLcd|actuator
|![led](/assets/icon/icon-led-small.png)|LED|jsonrpcLed|actuator
|![light](/assets/icon/icon-light-small.png)|조도|jsonrpcLight|sensor
|![motion](/assets/icon/icon-motion-small.png)|동작|jsonrpcMotion|sensor
|![noise](/assets/icon/icon-noise-small.png)|소음|jsonrpcNoise|sensor
|![number](/assets/icon/icon-number-small.png)|일반(숫자)|jsonrpcNumber|sensor
|![onoff](/assets/icon/icon-onoff-small.png)|온오프|jsonrpcDi|sensor
|![percent](/assets/icon/icon-percent-small.png)|퍼센트|jsonrpcPercent|sensor
|![power](/assets/icon/icon-power-small.png)|전력량|jsonrpcPower|sensor
|![switch](/assets/icon/icon-powerSwitch-small.png)|스위치|jsonrpcDo|actuator
|![pressure](/assets/icon/icon-pressure-small.png)|압력|jsonrpcPressure|sensor
|![reader](/assets/icon/icon-reader-small.png)|리더|jsonrpcReader|sensor
|![colorLed](/assets/icon/icon-rgbLed-small.png)|컬러 LED|jsonrpcRGBLed|actuator
|![rotaryAngle](/assets/icon/icon-rotaryAngle-small.png)|회전각|jsonrpcRotaryAngle|sensor
|![sleepStage](/assets/icon/icon-sleepStage-small.png)|수면단계|jsonrpcSleepStage|sensor
|![speed](/assets/icon/icon-speed-small.png)|속도|jsonrpcSpeed|sensor
|![stepCount](/assets/icon/icon-stepCount-small.png)|걸음수|jsonrpcStepCount|sensor
|![string](/assets/icon/icon-string-small.png)|일반(문자)|jsonrpcString|sensor
|![tag](/assets/icon/icon-tag-small.png)|태그|jsonrpcTag|sensor
|![televistion](/assets/icon/icon-television-small.png)|TV|jsonrpcTelevision|actuator
|![temp](/assets/icon/icon-temperature-small.png)|온도|jsonrpcTemp|sensor
|![tempCrt](/assets/icon/icon-temperatureController-small.png)|온도 조절기|jsonrpcTempCtrl|actuator
|![vibration](/assets/icon/icon-vibration-small.png)|진동수|jsonrpcVibration|sensor
|![voc](/assets/icon/icon-voc-small.png)|휘발성 유기 화합물|jsonrpcVoc|sensor
|![voltage](/assets/icon/icon-voltage-small.png)|전압|jsonrpcVoltage|sensor
|![weight](/assets/icon/icon-weight-small.png)|무게|jsonrpcWeight|sensor




<!-- <a href="#" class="back-to-top" id="up" style="display: block;"><i class="fa fa-arrow-circle-up"></i></a> -->
<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>

