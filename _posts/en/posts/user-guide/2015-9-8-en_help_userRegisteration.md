---
title: Hardware installation and service registration
tags: "user-guide"
published: true
permalink: /en/user-guide/registration.html
---

User guide for a progress as hardware synchronization and user sign up. 

* [Service Administrator](#id-serviceadmin)
* [User](#id-enduser) 
* [Gateway Registration](#id-gateway) 

---
<div id='id-serviceadmin'></div>
### Service Manager
<br>
#### Sign in and how to use
  * Requires purchasing hardware and installation for Thing+ portal. Please, contact iot@daliworks.net for detail. World best IoT professional will kindly help you.
  * **Hardware for IoT service**
    * Your hardware for IoT service installation.
    * Available [Hardware List](http://www.daliworks.net/?page_id=11441&lang=en) for Thnig+ access
  * **Got a hardware? Any plan for new IoT hardware?**
    * Mail to hw@daliworks.net if you need Hardware and Thing+ synchronization.

<br>

---
<div id='id-enduser'></div>
### User
<br>

<!---
### Prerequestion for service 
  * Registor member in {serviceName}.thingplus.net 
  * Service administration approval and authorization 
-->

#### Sing in Thing+ portal 
  * Put service address in internet browser.
![](/assets/2_address.png)

  * Push ![](/assets/en_2_register.png) sign up button on top for redirecting Sign in page.
  * Put your ID, e-mail(2 times for confirmation), passwords (2time for confirmation), and agree on access term. Then it return registration success message.
  * Will receive e-mail on your registered e-maill address for confirmation.
  * Click on e-mail confirmation and registration process to be done.
![](/assets/en_2_email.png)

#### Sign up and Authorization progress for service administrator
  * After confirmation on e-mail, follow sign up progress for service administrator
  * Get confirmation e-mail after authorization from the service manager.
  * Will take few seconds to minutes for authorization. If you did not receive any e-mail, please check below.
    * Put re-check your e-mail address again.
    * Check your spam mail box.
  * After receive confirmation, put ID and Password to log in.


<br>

---
<div id='id-gateway'></div>
### Gateway Registration
<br>

#### BeagleBone Black

1) BeagleBone Black에 접속 후 Thing+ Embedded 패키지가 설치된 디렉토리의 `scripts` 디렉토리로 이동한다.

```bash
@BBB:$ cd /usr/local/tp/scripts
```

2) BeagleBone Black의 MAC 어드레스를 얻어 클립보드에 복사한다.

```bash
@BBB:$ ./getmac
Your MAC address is as below
xx:xx:xx:xx:xx:xx
```

3) **사용자 PC**의 크롬브라우저를 열고 "[서비스 웹사이트](https://www.thingplus.net)"에 로그인한다.


4) `설정` --> `게이트웨이 관리` 버튼을 누른다.
![gateway_management](/assets/gateway_management_ko.png)

<br/>
5) `(+)` 버튼을 누른다.
![register_gateway](/assets/register_gateway_ko.png)

<br/>
6) `게이트웨이 API 키 발급받기` 버튼을 누른다.
![register_with_apikey](/assets/register_with_apikey_ko.png)

<br/>
7) 클립보드에 복사했던 MAC 어드레스를 `게이트웨이 아이디`에 붙여넣기 하고 `게이트웨이 API 키 등록 진행` 버튼을 누른다.
![macaddress](/assets/macaddr_getapikey_ko.png)

<br/>
8) API 키를 클립보드에 복사한다.
![get_apikey](/assets/get_apikey_ko.png)

<br/>
9) **BeagleBone Black에 로그인했던 터미널**에서 아래처럼 게이트웨이를 실행한다.

```bash
@BBB:$ cd /usr/local/tp
@BBB:$ APIKEY='복사한 API 키' ./tp.sh start; ./driver.sh start
```

- 예제

```bash
@BBB:$ cd /usr/local/tp
@BBB:$ APIKEY='A7i3kT9w1-9xWVk447-oJ=' ./tp.sh start; ./driver.sh start
```

> 주의: APIKEY는 모두 대문자로 써야하며, `복사한 API 키`는 앞뒤를 작은따옴표(')로 감싸야 한다.

10) BeagleBone Black의 `/etc/rc.local`의 `exit 0` 명령 바로 위에 아래처럼 추가한다.

```bash
@BBB:$ nano /etc/rc.local
...
(cd /usr/local/tp; ./driver.sh start)         # 추가
(cd /usr/local/tp; ./tp.sh start)             # 추가

exit 0
```

   - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

11) **크롬 브라우저**에서 다시 MAC 어드레스를 복사한다.

   - 페이지를 다른 곳으로 이동하여 MAC 어드레스를 복사할 수 없는 경우는 `3. BeagleBone Black 등록`의 방법을 통해 다시 MAC 어드레스를 복사한다.

12) `게이트웨이 등록하기`버튼을 누른다.
![copy_apikey](/assets/copy_apikey_ko.png)

<br/>

13) `게이트웨이 모델`에서 `Neuromeka Rev2.1`을 선택한다.
![select_gwmodel](/assets/select_gwmodel_ko.png)

<br/>

14) `게이트웨이 아이디`에 MAC 어드레스를 붙여넣기 하고 게이트웨이 이름을 입력한다.
![select_gwmodel](/assets/inputmac_name_ko.png)

<br/>

15) `디바이스 모델`에서 `Basic Model Rev2.1`을 선택한다.
![select_devicemodel](/assets/select_devicemodel_ko.png)

<br/>

16) `게이트웨이, 디바이스, 센서 등록 진행` 버튼을 누른다.
![register](/assets/register_ko.png)

<br/>

17) 등록 성공 시 `Success` 팝업 메시지가 화면에 출력된다.

<br>

18) `센서목록` 메뉴에서 등록된 게이트웨이를 확인할 수 있다.

  - 센서는 게이트웨이(BeagelBone Black)에 의해 자동적으로 등록되며, 게이트웨이 등록 후 1분 이내에  최종 등록 완료된다.
  - 센서값은 게이트웨이에서 수집되고 주기적으로 서버에 전송하기 때문에 센서값을 서비스 사이트에서 볼 수 있기까지 몇 분이 소요된다.

<br>
