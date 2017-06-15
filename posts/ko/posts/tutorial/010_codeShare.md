---
title: IR-Sensor 활용 예제
tags: "tutorial"
published: true
img : ic_codeshare.png
permalink: /ko/help/code-share.html
---
### 예제 목차 

1. [라즈베리파이로 만들어보는 에어컨 컨트롤러](#tutorial-airconditioner)
2. [우리집 에어컨의 신호 캡쳐 방법](#tutorial-aircon-capture)

---


<div id='tutorial-aircon-capture'></div>
<br/><br/>

### 우리집 에어컨의 신호 캡쳐 방법

---

- 본 예제는 아래의 `라즈베리파이로 만들어보는 에어컨 컨트롤러` 예제에서 `lirc.sourceforge.net`에 없는 다른 리모콘 신호를 캡쳐하는 방법을 공유하기 위한 예제 입니다.

- 준비물 

  - [라즈베리파이](http://www.icbanq.com/P007115245/?LType=B)
  
  - [Grove high accuracy temperature/humidity](http://www.icbanq.com/P005700448/S)
  
  - [Grove IR Emitter](http://www.icbanq.com/P006960963/S)
  
  - [Grove IR Receiver](http://www.icbanq.com/P006960961/S)
  
  - [점퍼](http://www.icbanq.com/P006176337/S)
  
  - 리모콘

    ![sensors](/assets/tutorial-ir-capture-sensors.png)
    
---

1) 센서 연결

- IR Emitter

   IR Emitter pin     | Raspberry pin
   :-----------------:|:---------------------:
   GND                |         14
   VCC                |          4
   TX                 |         15

- IR Receiver

   IR Receiver pin      | Raspberry pin
   :-------------------:|:--------------------:
   GND                  |         39
   VCC                  |          1
   RX                   |         15

- Raspberry pi Pin map 참조 : [pin map](https://developer.microsoft.com/ko-kr/windows/iot/win10/samples/pinmappingsrpi2) 

<br/>

2) IR 신호 캡쳐

- Raspberry Pi 에 전원과 인터넷을 연결 합니다.

- Raspberry Pi 에 연결된 IR emitter를 에어컨 IR 수신부 방향으로 놓아 에어컨이 신호를 수신 할 수 있게 합니다.

- 아래의 `ir-capture.sh` 을 Raspberry의 임의의 위치에 넣습니다.

  - 에어컨의 온도 조절시 절대값으로 변경되는 기기와 상대값으로 변경되는 기기가 있습니다.

  - 저희가 확인한 기기의 특징은 

    - 삼성, LG는 절대값 변화, carrier 등은 상대값 변화였었습니다.

    - 리모콘에 LCD가 붙은 기기나 최신 기종은 `절대값` 이었습니다. 

  - `절대값 변화 기기`

    ```bash
    $ wget http://support.thingplus.net/download/install/ir-capture.sh
    $ chmod 755 ir-capture.sh
    ```

  - `상대값 변화 기기`

    ```bash
    $ wget http://support.thingplus.net/download/install/ir-capture-relative.sh
    $ chmod 755 ir-capture-relative.sh
    ```

- ir-capture.sh 실행시 에어컨의 최저온도와 최고 온도를 인수로 입력합니다.

  ```bash
  $ ./ir-capture.sh 18 30 //최저온도 18도, 최고 온도 30도 의 경우,
  ```

- 메세지에 따라 리모컨의 해당 버튼을 누르고 `Enter`를 입력하면, IR emitter에서 에어컨 신호를 보냅니다. 이때 원하는 동작을 수행하는지 확인하고 정상 동작하면 `y`를 누릅니다.(리모콘은 IR receiver 향해 눌러주세요)
  
  - `ON` 의 IR 신호부터 시작하여, `각 온도별 IR 신호`, 마지막으로 `OFF`의 IR 신호를 입력 받습니다.

  -  입력시 `/etc/lirc/lircd.conf` 파일을 업데이트 합니다.

  ```bash
  $ ./ir-capture.sh 18 30
  Push ON and Enter
  ./ir-capture.sh: line 29:  1174 Terminated              mode2 -d /dev/lirc0 -m > $1
  code works(y/n)?
  ```


- 리모콘 신호 캡쳐는 모두 끝났습니다. 실제 iot로 에어컨을 제어 하기 위해선 아래의 [라즈베리파이로 만들어보는 에어컨 컨트롤러](#tutorial-aircontroller)를 참조해서 구성 하시면 됩니다.

> 주의

- 아래 [라즈베리파이로 만들어보는 에어컨 컨트롤러](#tutorial-aircontroller)로 구성하실때 다음의 내용의 차이가 있습니다.

- `6) 리모콘 IR 코드 다운로드`는 이 가이드에서 진행했으므로 skip 합니다.

- device agent의 위치가 다릅니다.(airconditioner 로 변경해야 합니다.)

  - `8) 디바이스 에이전트 설치` 에서 실행 위치를 아래와 같이 변경해주세요.

    ```bash
    $ cd /opt/thingplus/openhardware/rasberrypi/airconditioner
    ```

  - `10) Device agent 실행` 에서 실행 위치를 아래와 같이 변경해주세요.

    ```bash
    $ /opt/thingplus/openhardware/raspberrypi/airconditioner/thingplus_device.sh start
    ```

<br/><br/>

---

<div id='tutorial-airconditioner'></div>
<br/><br/>

### 라즈베리파이로 만들어보는 에어컨 컨트롤러

---

- 본 예제는 `LG 에어컨`에 대한 에어컨을 IoT를 이용해 제어하기 위한 예제 입니다.

- 온도와 습도도 함께 예제 안에 추가 했습니다.

- 준비물

  - [라즈베리파이](http://www.icbanq.com/P007115245/?LType=B)
  - [Grove high accuracy temperature/humidity](http://www.icbanq.com/P005700448/S)
  - [Grove IR Emitter](http://www.icbanq.com/P006960963/S)
  - [점퍼](http://www.icbanq.com/P006176337/S)

    ![sensors](/assets/exam_ir_temp_sensor.png)

---

0) 센서 연결

- Temperature/humidity

   Func     | pin
   :-------:|:----------:
   GND      |          6
   VCC      |          2
   SDA      |          3
   SCL      |          5


- IR Emitter

   Func     | pin
   :-------:|:----------:
   GND      |         14
   VCC      |          4
   TX       |         15

- Raspberry pi Pin map 참조 : [pin map](https://developer.microsoft.com/ko-kr/windows/iot/win10/samples/pinmappingsrpi2) 

<br/>

1) ThingPlus Gateway 설치

  - [참조](http://support.thingplus.net/ko/open-hardware/raspberry-pi-user-guide.html)

2) 라즈베리파이에 `lirc` 설치

```bash
pi$ sudo apt-get install lirc
```

3) `/etc/modules`에 모듈 추가

```bash
lirc_dev
lirc_rpi gpio_in_pin=23 gpio_out_pin=22
```

4) `/etc/lirc/hardware.conf`를 아래 파일로 변경

```bash
########################################################                                                                                                                                             
# /etc/lirc/hardware.conf                                                                                                                                                                            
# Arguments which will be used when launching lircd                                                                                                                                                  
LIRCD_ARGS="--uinput"                                                                                                                                                                                
# Don't start lircmd even if there seems to be a good config file                                                                                                                                    
# START_LIRCMD=false                                                                                                                                                                                 
# Don't start irexec, even if a good config file seems to exist.                                                                                                                                     
# START_IREXEC=false                                                                                                                                                                                 
# Try to load appropriate kernel modules                                                                                                                                                             
LOAD_MODULES=true                                                                                                                                                                                    
# Run "lircd --driver=help" for a list of supported drivers.                                                                                                                                         
DRIVER="default"                                                                                                                                                                                     
# usually /dev/lirc0 is the correct setting for systems using udev                                                                                                                                   
DEVICE="/dev/lirc0"                                                                                                                                                                                  
MODULES="lirc_rpi"                                                                                                                                                                                   
# Default configuration files for your hardware if any                                                                                                                                               
LIRCD_CONF=""                                                                                                                                                                                        
LIRCMD_CONF=""                                                                                                                                                                                       
######################################################## 
```

5) `/boot/config.txt`에 아래 내용 추가

```bash
dtoverlay=lirc-rpi,gpio_in_pin=23,gpio_out_pin=22
```

6) 리모콘 IR 코드 다운로드

- 리모콘 IR code는 [다음](http://lirc.sourceforge.net/remotes/)에서 가지고 계신 기기의 코드르 찾아보셔야 합니다.  

```bash
sudo wget http://lirc.sourceforge.net/remotes/lg/6711A20015N -O  /etc/lirc/lircd.conf
```

7) Reboot

8) 디바이스 에이전트 설치

```bash
sudo su
cd /opt/thingplus/openhardware/rasberrypi/house-monitor
npm install
```

9) 게이트웨이 등록

- gateway ID를 찾아서 복사 합니다.

```bash
pi$ /opt/thingplus/gateway/scripts/getGatewayID.sh 
```

- 게이트웨이 모델을 `open source gateway` 로 합니다.

![Gateway](/assets/openhw_gw_model.png)

- 반환된 API KEY를 복사해둡니다.(step-11 에서 사용)

10) Device agent 실행

```bash
pi$ /opt/thingplus/openhardware/raspberrypi/house-monitor/thingplus_device.sh start

참조) thingplus_device.sh의 옵션은 start, stop, restart 가 있습니다.  
```

11) API KEY 등록 및 Gateway 실행

```bash
pi$ APIKEY='복사한 API 키' /opt/thingplus/gateway/thingplus.sh start

참조) thingplus.sh의 옵션은 start, stop, restart 가 있습니다.
```

12) 참조 : log 보는 방법

```bash
* Device agent log
pi$ tail -F -n 300 /opt/thingplus/openhardware/raspberrypi/house-monitor/log/thingplus_device.log
* Gateway log
pi$ tail -F -n 300 /opt/thingplus/gateway/log/thingplus.log
```


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>