---
title: 아두이노 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/arduino-user-guide.html
---

Thing+ 연동가이드(아두이노)<br/>
<div id='id-setting'></div>

* [아두이노 하드웨어 연결](#id-setting)
* [아두이노 펌웨어 설치](#id-firmware)
* [ThingPlus Embedded 패키지 설치](#id-package)
* [게이트웨이 등록](#id-register)


_현재는 `Mac OS`에서만 지원하고 있습니다._

<br/>
#### 1. 아두이노 하드웨어 연결 

0) <a href="https://www.icbanq.com/P005710113/S" target="_blank"> Grove Starter Kit for Arduino 구매 바로가기</a>

<br/>
1) 아두이노와 Grove Sensor Board를 연결한다.
![Arduino + Grove Starter kit](/assets/arduino_grove_board.png)

<br/>
2) Grove Sensor Board에 센서를 연결한다.<br/>
  참고 : <a href="#" class="ledtip" data-tooltip="">LED의 극성</a>

![Arduino + Grove Sensor Board + Sensors](/assets/arduino_sensors.png)

<br/>
3) 아두이노에 USB Cable을 PC와 연결한다.
![Arduino + USB Cable](/assets/arduino_usb.png)

<div id='id-firmware'></div>
<br/><br/>
#### 2. 아두이노 펌웨어 설치
1) 사용하는 PC OS버전에 맞는 아두이노 IDE를 설치한다.

   - <a href="https://www.arduino.cc/en/Main/Software" target="_blank"> 다운로드 링크 </a>

<br/>
2) 아누이노 IDE를 실행한다.


<br/>
3) 아두이노 IDE에서 아두이노 포트를 USB로 선택한다.

   - Tools -> Port -> Arduino/Genuino Uno
![Arduino Select Port](/assets/arduino_ide_select_port.png)

<br/>
4) 아두이노에 다운로드 할 펌웨어를 선택한다.

   - File -> Examples -> Firmata -> StandardFirmata
![Arduino Select Firmware](/assets/arduino_ide_select_firmare.png)

<br/>
5) 펌웨어를 빌드한다.

![Arduino Verify](/assets/arduino_ide_verify.png)

<br/>
6) 펌웨어를 아두이노에 다운로드한다.

![Arduino Download](/assets/arduino_ide_upload.png)

<br/>
7) 펌웨어가 정상적으로 다운로드 되면 IDE 하단에 아래와 같은 메세지가 나온다.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

<div id='id-package'></div>
<br/><br/>
#### 3. ThingPlus Embedded 패키지 설치

1) Thing+ Embedded 패키지를 설치할 폴더를 만들고 이동한다.

```bash
@PC:$ mkdir $HOME/thingplus
@PC:$ cd $HOME/thingplus
```

5) 인스톨 스크립트 파일을 다운로드한다.

```bash
@PC:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_osx_install.sh
```

6) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치한다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

    ```bash
    @PC:$ chmod 755 thingplus_embedded_sdk_osx_install.sh
    @PC:$ ./thingplus_embedded_sdk_osx_install.sh
    ```

<div id='id-register'></div>

<br/><br/>
#### 4. 게이트웨이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.
