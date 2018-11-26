---
title: 비글본에어 사용자 가이드
tags: "open-hardware"
published: true
img: ic-bbair.png
image: "http://support.thingplus.net/assets/ogp/ogp_bbair.png"
permalink: /ko/open-hardware/bba-user-guide.html
---

Thing+ 연동가이드(비글본에어)
<div id='id-setting'></div>

1. [환경 설정](#id-setting)
2. [Thing+ Embedded 패키지 설치](#id-package)
3. [게이트웨이 등록](#id-register)

<br/>

---

#### 1. 환경 설정

1) 비글본에어를 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - [Putty 다운로드 링크](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)
   - [Putty 사용자 설명서](http://suhjin.tistory.com/37)

<br/>
2) 이번 가이드의 example 구성은 아래와 같습니다.

  - BBA, OLED display, Temperature&Humidity sensor

![BBG + Ehternet + USB Cable](/assets/bba_board_sensors.png)

<br/>
3) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 접한다.

 - IP address를 찾기 힘들 경우 [`문제 해결 방법`](/ko/help/troubleshooting.html)을 참고한다.

   ```bash
   $ ssh root@<IP Address>
   ```

   - Mac & Linux의 경우

     ```bash
     $ ssh root@192.168.1.XXX
     ```

   - Windows의 경우
     - putty 실행 후, 아래 그림과 같이 IP주소를 입력 후, `Open`버튼을 클릭하고 비밀번호를 입력한다.
     ![BBG putty login](/assets/putty_login_bbg.png)

<br/>

 - 참고: PC와 USB 케이블만으로도 접속이 가능합니다. 방법은 [`비글본그린 USB로 연결하기`](#id-bbg-usbconnect) 참조하세요.

> 주의: Windows의 경우, 비글본그린을 재부팅할 때마다, putty를 새로 실행해야함.

<br/>

4) 장치 구분을 위해 비글본그린의 호스트명 변경이 필요합니다.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 함.

- `/etc/hostname`을 수정한다.

  ```bash
  @BBA:$ nano /etc/hostname
  ```

  - 파일 내부의 `beaglebone`을 아래 그림과 같이 원하는 이름(알파벳 및 숫자, -만 허용)으로 변경한다.
    ![BBG Modify hostname](/assets/modify_hostname.png)

  - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

<br/>

- 변경한 호스트명 적용을 위해 비글본그린을 재시작한다.

  ```bash
  @BBA:$ reboot
  ```

<div id='id-package'></div>
<br/><br/>

---

#### 2. Thing+ Embedded 패키지 설치

1) BBA에 Grove Starter Kit센서를 Power Cable을 분리한 상태에서 연결한다.

- I2C HUB: 비글본에어 I2C HUB를 연결하는 선
![BBG + Grove](/assets/bba_i2chub.png)

- J4: 비글본에어와 I2C HUB를 연결하는 선을 의미한다.
![BBG + Grove](/assets/bba_sensor_connect.png)

<br/>
2) 비글본에어 Ethernet(LAN 케이블), Power Cable을 연결한다.

<br/>
3) 비글본에어에 접속한다.

<br/>
4) Thing+ Embedded 패키지를 설치할 폴더를 만들고 이동한다.

```bash
@BBA:$ mkdir /opt/thingplus
@BBA:$ cd /opt/thingplus
```

<br/>
5) 인스톨 스크립트 파일을 다운로드한다.

```bash
@BBA:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bba_install.sh
```


<br/>
6) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치한다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

  ```bash
  @BBA:$ chmod 755 thingplus_embedded_sdk_bba_install.sh
  @BBA:$ ./thingplus_embedded_sdk_bba_install.sh
  ```

<br/>
7) 비글본그린을 재시작한다.

```bash
@BBA:$ reboot
```

8) config 설정
- mqtt와 api 의 host 설정을 위해 `/opt/thingplus/gateway/thingplus-gateway/device/config`경로에 `runetim.json` 파일을 아래와 같이 만들거나 수정합니다.

```
{
  "Server": {
    "mqtt": {
      "host": "mqtt.sandbox.thingplus.net"
    },
    "service": {
      "host": "api.sandbox.thingplus.net"
    }
  }
}
```


<div id='id-register'></div>
<br/><br/>

---

#### 3. 게이트웨이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.




<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>