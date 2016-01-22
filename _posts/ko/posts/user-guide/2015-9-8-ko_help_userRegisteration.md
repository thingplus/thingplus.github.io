---
title: 하드웨어 설치와 회원가입
tags: "user-guide"
published: true
permalink: /ko/user-guide/registration.html
---

서비스를 사용하기 위해 필요한 하드웨어 연동 및 회원가입에 대한 가이드입니다.

1. [서비스 관리자](#id-serviceadmin)
2. [일반 사용자](#id-enduser) 
3. [게이트웨이 등록](#id-gateway) 

---
<div id='id-serviceadmin'></div>
### 서비스 관리자
<br>
#### 가입 및 사용
  * Thing+ 포털 사용을 위해서는 하드웨어 구입과 설치가 필요합니다. 귀사의 맞춤형 하드웨어 구입과 설치를 위해 [iot@daliworks.net](mailto:iot@daliworks.net)으로 연락바랍니다. 최고의 IoT 전문가가 친절히 도와 드리겠습니다.
  * 하드웨어에 대해 알아보기
    * 귀사의 IoT 서비스 구축을 위한 하드웨어에 대해 알아보세요.
    * Thing+에 연결가능한 [하드웨어 목록](http://www.daliworks.net/?page_id=11441)을 참고하시길 바랍니다.
  * 이미 하드웨어를 가지고 있습니까? 새로운 IoT 하드웨어를 계획하고 있습니까?
    * [hw@daliworks.net](mailto:hw@daliworks.net)으로 연락주시면 하드웨어와 Thing+ 연동에 대해 안내해 드리겠습니다.
  * **오픈하드웨어 기반으로 서비스 이용하기**
    * [Grove Starter Kit for BeagleBone Green 구매 바로가기](http://www.icbanq.com/P005716600)
    * [GrovePi+ Starter Kit 구매 바로가기](http://www.icbanq.com/P005700239)
    * 더 많은 오픈하드웨어를 준비중에 있습니다.

<br>

---
<div id='id-enduser'></div>
### 일반 사용자
<br>

#### 해당 서비스 회원가입
  * 인터넷 브라우저의 주소창에 서비스 주소를 입력합니다.
![](/assets/2_address.png)

  * 상단에 위치한 ![](/assets/2_register.png) 회원가입 버튼을 통해 회원가입 페이지로 이동합니다.
  * 아이디, 이메일(입력 및 확인), 암호(입력 및 확인)를 입력하고, 이용약관에 동의를 하면, “등록 성공” 메세지가 나옵니다.
  * 회원가입 시 입력했던 이메일 주소로 본인 확인용 이메일이 전송됩니다.
  * 이메일 수신을 확인하시고, 아래와 같이 이메일 본문의 이메일 인증 버튼을 누르면, 인증이 완료됩니다.
![email](/assets/2_email.png)


#### 서비스 관리자의 가입승인 및 사용권한
  * **iot.thingplus.net** 사용자의 경우 자동 가입처리 됩니다.
  * 이메일 인증 성공 후, 해당 서비스 관리자의 가입 승인 절차가 이뤄지게 됩니다.
  * 관리자의 가입 승인이 확인되면, 승인 안내 이메일이 전송됩니다정.
  * 관리자의 가입 승인 안내 이메일은 몇초에서부터 몇분까지 걸릴 수 있습니다. 만약 승인 안내 이메일을 받지 못했다면 다음을 확인해주세요.
    * 이메일을 올바르게 입력하셨습니까?
    * 스팸메일함을 확인하셨습니까?
  * 관리자의 승인 안내 이메일을 받은 후에 로그인창에 아이디와 비밀번호를 입력하여 로그인 할 수 있습니다.

<br>

---
<div id='id-gateway'></div>
### 게이트웨이 등록
_아직 보유한 게이트웨장비가 없다면, [Thing+ Portal](https://www.thingplus.net/)의 [센서 시뮬레이터](/ko/open-hardware/sensor-simulator-user-guide.html)를 사용해서 가상 게이트웨이를 등록하실 수 있습니다._

<br>


_본 가이드는 비글본그린, 라즈베리파이, 아두이노, 에디슨 기준으로 작성되었으나, 다른 게이트웨이 장비도 비슷한 과정으로 진행하면 됩니다._

_아직 라즈베리파이/비글본그린/아두이노/에디슨에 **Thing+ Embedded 패키지**가 설치되어 있지 않다면 [**라즈베리파이 가이드**](/ko/open-hardware/raspberry-pi-user-guide.html)/[**비글본그린 가이드**](/ko/open-hardware/bbb-user-guide.html)/[**아두이노 가이드**](/ko/open-hardware/arduino-user-guide.html)/[**에디슨 가이드**](/ko/open-hardware/edison-user-guide.html)를 참고하세요._

_라즈베리파이&아두이노의 경우, 라즈베리가 게이트웨이, 아두이노가 device 입니다. 참고하세요_

<br/>
1) Thing+ Embedded 패키지가 설치된 디렉토리의 `scripts` 디렉토리로 이동한다.

<p class="dwExpand" > 비글본그린/라즈베리파이/에디슨의 경우 타겟보드의 접속 후에 이동</p>

```bash
@shell:$ cd /opt/thingplus/gateway/scripts
```
<div class="dwExpand2"></div>
<p class="dwExpand" > 아두이노의 경우 PC에서 이동</p> 

```bash
@shell:$ cd $HOME/thingplus/gateway/scripts
```
<div class="dwExpand2"></div>
<br/>

2) 장치의 MAC 어드레스를 얻어 클립보드에 복사한다.

```bash
@shell:$ ./getmac
Your MAC address is as below
xx:xx:xx:xx:xx:xx
```

<br/>
3) **사용자 PC**의 웹브라우저를 열고 "[서비스 웹사이트](https://www.thingplus.net)"에 로그인한다.

 - `Chrom 브라우저`([크롬 브라우저 설치](https://www.google.com/chrome)) 사용을 권장합니다.

<br/>
4) `설정` --> `게이트웨이 관리` 버튼을 누른다.
![gateway_management](/assets/gateway_management_ko.png)

<br/>
5) `(+)` 버튼을 누른다.
![register_gateway](/assets/register_gateway_ko.png)

<br/>
6) `게이트웨이 API 키 발급받기` 버튼을 누른다.
![register_with_apikey](/assets/register_with_apikey_ko.png)

<br/>
7) 새로 추가할 `게이트웨이 모델`을 선택한다.

<p class="dwExpand" > 라즈베리파이의 경우: <b>Raspberry Pi - Developer</b></p>

![select_gateway_model_get_apikey](/assets/pi_gw_model.png)

<div class="dwExpand2"></div>
<p class="dwExpand" > 비글본그린의 경우: <b>BeagleBone Green - Developer</b></p>

![select_gateway_model_get_apikey](/assets/bbg_gw_model.png)

<div class="dwExpand2"></div>
<p class="dwExpand" > 아두이노의 경우: <b>Arduino, PC - Developer</b></p>

![select_gateway_model_get_apikey](/assets/arduino_gw_model.png)

<div class="dwExpand2"></div>

<p class="dwExpand" > 에디슨의 경우: <b>Edison Kit for Arduino</b></p>

![select_gateway_model_get_apikey](/assets/edison_gw_model.png)

<div class="dwExpand2"></div>

<br/>
8) 클립보드에 복사했던 MAC 어드레스를 `게이트웨이 아이디`에 붙여넣기 하고 `게이트웨이 API 키 등록 진행` 버튼을 누른다.
![macaddress](/assets/macaddr_getapikey_ko.png)

<div id="id-run-gateway"></div>
<br/>
9) API 키를 클립보드에 복사한다.
![get_apikey](/assets/get_apikey_ko.png)



<br/>
10) 아래처럼 게이트웨이를 실행한다.

> 주의: `복사한 API 키`는 앞뒤를 작은따옴표(')로 감싸야 한다.

<p class="dwExpand" > 라즈베리파이의 경우 (<b>장치에 로그인했던 터미널</b>)</p>

   
```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > 라즈베리파이 + 아두이노 의 경우 (<b>라즈베리파이 장치에 로그인했던 터미널</b>)</p>

   
```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/openhardware/arduino/grovePi-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > 비글본그린의 경우 (<b>장치에 로그인했던 터미널</b>)</p>
    
```bash
@shell:$ cd /opt/thingplus/openhardware/beaglebonegreen/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > 아두이노의 경우 (<b>Mac PC</b>)</p>

```bash
@shell:$ cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd $HOME/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.sh start
```

<div class="dwExpand2"></div>
<p class="dwExpand" > 아두이노의 경우 (<b>windows PC</b>)</p>

```bash
@shell:$ cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd $HOME/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.bat start
```
<div class="dwExpand2"></div>
<p class="dwExpand" > 에디슨의 경우 (<b>장치에 로그인했던 터미널</b>)</p>

   
```bash
@shell:$ cd /opt/thingplus/openhardware/edison/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='복사한 API 키' ./thingplus.sh start
```

> 주의 : 현재 reboot 시에 자동 실행이 되지 않습니다. rebooting 후에는 아래의 command를 입력해주세요

```bash
@shell:$ cd /opt/thingplus/openhardware/edison/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ ./thingplus.sh start
```

<div class="dwExpand2"></div>

<br/>
11) 장치의 `/etc/rc.local` 파일의 `exit 0` 명령 바로 위에 아래처럼 추가한다.

- 아두이노 유저일 경우, `이 과정이 필요 없습니다`. 다음으로 넘어가세요.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 함.

<p class="dwExpand" > 라즈베리파이의 경우 </p>

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)  
 
exit 0
```

- 파일 수정 후 저장은 CTRL-O키를 누른 후, 엔터키를 누르고, 종료할 때는 CTRL-X키를 누른다.

<div class="dwExpand2"></div>
<p class="dwExpand" > 비글본그린의 경우 </p>


```bash
@shell:$ nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/beaglebonegreen/grove-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)    
 
exit 0
```

- 파일 수정 후 저장은 CTRL-O키를 누른 후, 엔터키를 누르고, 종료할 때는 CTRL-X키를 누른다.

<div class="dwExpand2"></div>

<p class="dwExpand" > 라즈베리파이 + 아두이노 의 경우 </p>

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/arduino/grove-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)  
 
exit 0
```
- 파일 수정 후 저장은 CTRL-O키를 누른 후, 엔터키를 누르고, 종료할 때는 CTRL-X키를 누른다.

<div class="dwExpand2"></div>

<br/>
12) `게이트웨이 등록하기`버튼을 누른다.
![register_gwmodel](/assets/copy_apikey_ko.png)

<br/>
13) `게이트웨이 이름`을 입력한다.
![input_gateway_name](/assets/inputmac_name_ko.png)

<br/>
14) `디바이스 모델`을 선택한다.

<p class="dwExpand" > 라즈베리파이의 경우: <b>GrovePi+ Starter Kit</b></p>
![select_devicemodel](/assets/select_devicemodel_rapberry_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > 라즈베리파이의 의경우: <b>Grove Starter Kit for arduino</b></p>
![select_devicemodel](/assets/select_devicemodel_arduinopi_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > 비글본그린의 경우: <b>Grove Starter Kit for BeagleBone Green</b></p>
![select_devicemodel](/assets/select_devicemodel_beagle_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > 아두이노의 경우: <b>Grove Starter Kit for arduino </b></p>
![select_devicemodel](/assets/select_devicemodel_arduino_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > 에디슨의 경우: <b>Grove Starter Kit for arduino </b></p>
![select_devicemodel](/assets/edison_device_model.png)
<div class="dwExpand2"></div>

<br/>

15) 게이트웨이가 추가될 `사이트`를 선택한 후, `게이트웨이, 디바이스, 센서 등록 진행` 버튼을 누른다.
![register](/assets/register_ko.png)

<br/>
16) 등록 성공 시 `Success` 팝업 메시지가 화면에 출력된다.

<br/>
17) `센서목록` 메뉴에서 등록된 게이트웨이를 확인할 수 있다.

  - 센서는 게이트웨이에 의해 자동적으로 등록되며, 게이트웨이 등록 후 1분 이내에  최종 등록 완료된다.
  - 센서값은 게이트웨이에서 수집되고 주기적으로 서버에 전송하기 때문에 센서값을 서비스 사이트에서 볼 수 있기까지 몇 분이 소요된다.

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
