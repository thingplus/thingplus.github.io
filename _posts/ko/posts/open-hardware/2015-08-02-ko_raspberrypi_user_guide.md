---
title: 라즈베리파이 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/raspberry-pi-user-guide.html
---

Thing+ 연동가이드(라즈베리파이)

<br/>
#### 1. 환경 설정

0) [GrovePi+ Starter Kit 구매 바로가기](http://www.icbanq.com/P005700239)

<br/>
1) Micro SD card(8GB 이상)을 준비한다.

<br/>
2) 아래의 다운로드 페이지에서 Raspbian image를 다운로드 한다.

   - https://www.raspberrypi.org/downloads/raspbian/
   - `RASPBIAN JESSIE` 이미지 권장

<br/>
3) 아래의 웹페이지를 참조하여 Micro SD card에 다운로드 받은 이미지로 OS를 설치한다.

   - Raspbian image를 Micor SD card에 설치하는데 수분이 소요됩니다.
   - https://www.raspberrypi.org/documentation/installation/installing-images/

<br/>
4) 라즈베리파이를 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - Putty 다운로드 링크 - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

<br/>
5) Raspbian을 설치한 Micro SD card를 라즈베리파이 아래 그림과 같이 **뒷면**의 Micro SD card 슬롯에 꽂는다.
   ![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)

<br/>
6) 라즈베리파이에 Ethernet(LAN 케이블), Power Cable을 연결한다.
   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)

<br/>
<div id='id-pi-setting-seventh'></div>
7) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 접한다

   - IP address를 찾기 힘들 경우 [`문제 해결 방법`](#id-pi-troubleshooting)을 참고한다.

   - 아이디: **pi**
   - 비밀번호: **raspberry**

    ```bash
    $ ssh pi@<IP Address>
    pi@<IP Address>'s password: raspberry
    ```

     - Mac & Linux 예제

        ```bash
        $ ssh pi@192.168.1.XXX
        pi@<IP Address>'s password: raspberry
        ```

     - Windows 예제

       - putty 실행 후, 아래 그림과 같이 IP주소를 입력 후, `Open`버튼을 클릭하고 비밀번호를 입력한다.
       ![Raspberry Pi putty login](/assets/putty_login.png)
       ![Raspberry Pi putty login](/assets/putty_login_2.png)

> 주의: Windows의 경우, 라즈베리파이를 재부팅할 때마다, putty를 새로 실행해야함.

<br/>
8) 장치 구분을 위해 라즈베리파이의 호스트명 변경이 필요합니다.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 함.

 - `/etc/hostname`을 수정한다.

    ```bash
    @Pi2:$ sudo nano /etc/hostname
    ```

   - 파일 내부의 `raspberrypi`를 아래 그림과 같이 원하는 이름(알파벳 및 숫자, -만 허용)으로 변경한다.
   ![Raspberry Pi Modify hostname](/assets/modify_hostname.png)

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

<br/>

 - `/etc/hosts`를 수정한다.

    ```bash
    @Pi2:$ sudo nano /etc/hosts
    ```

   - 파일 내부의 `raspberrypi`를 아래 그림과 같이 위와 동일한 이름으로 변경한다.
   ![Raspberry Pi Modify hosts](/assets/modify_hostname_2.png)

 - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

<br/>

- 변경한 호스트명 적용을 위해 라즈베리파이를 재시작한다.

    ```bash
    @Pi2:$ sudo reboot
    ```

<br/>
9) 재부팅이 완료된 라즈베리파이에 재접속한다. ([`7번 과정`](#id-pi-setting-seventh) 참고)

<br/>
10) 4GB 이상의 SD card를 사용하기 위해서, `raspi-config`를 실행한다.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   <br/>
   a. 4GB 이상의 SD card를 사용하기 위해서 `1. Expand Filesystem`을 선택한다.
   ![Raspberry Pi Setting File sytsem](/assets/expand_file_system.png)

   <br/>
   b. I2C를 사용하기 위해서 `8. Advanced Options` --> `A7. I2C`을 선택하고 이후 물음에 모두 `Yes`를 선택한다.
   ![Raspberry Pi Setting advanced options](/assets/advanced_options.png)

   ![Raspberry Pi Setting choose i2c](/assets/choose_i2c.png)

   <br/>
   c. Tab키를 누르고 Finish를 선택한 후 Reboot할 것이냐는 물음에 `No`를 선택한다.
   ![Raspberry Pi Choose Finish](/assets/choose_finish.png)

   ![Raspberry Pi Choose Finish](/assets/choose_finish_2.png)

   <br/>
   d. /etc/modules에 `i2c-dev`와 `i2c-bcm2708`을 추가한다.

```bash
@Pi2:$ nano /etc/modules   
```

   ![Raspberry Pi Add i2c settings](/assets/add_i2c_lines.png)

   - `i2c-dev`는 Raspbian의 버전에 따라서 이미 추가되어 있을 수 있음.
   - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

<br/><br/>
#### 2. Thing+ Embedded 패키지 설치

1) 라즈베리파이에 Grove Pi+ shield와 센서를, Ethernet(LAN 케이블)과 Power Cable을 분리한 상태에서 연결한다.
   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.png)

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi_2.jpg)

<br/>
2) 라즈베리파이에 Ethernet(LAN 케이블), Power Cable을 연결한다.
![Raspberry Pi + Grove Pi + Power + Ethernet](/assets/rasp_grovePi_power_ethernet.png)

<br/>
3) 라즈베리파이에 접속한다.

<br/>
4) [nodejs](https://nodejs.org)를 다운로드 후 설치한다.

```bash
@Pi2:$ sudo su
@Pi2:$ wget http://nodejs.org/dist/v0.10.16/node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ tar xvfz node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ cd node-v0.10.16-linux-arm-pi
@Pi2:$ rsync -a bin lib share /usr/local/
@Pi2:$ node --version
v0.10.16
```

<br/>
5) Thing+ Embedded 패키지를 설치할 폴더를 만들고 이동한다.

```bash
@Pi2:$ mkdir /opt/thingplus
@Pi2:$ cd /opt/thingplus
```

<br/>
6) 인스톨 스크립트 파일을 다운로드한다.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_install.sh
```

<br/>
7) 다운로드한 스크립트 파일에 실행권한을 부여하고 실행한다.

```bash
@Pi2:$ sudo chmod 755 thingplus_embedded_sdk_install.sh
@Pi2:$ sudo ./thingplus_embedded_sdk_install.sh
```

<br/>
8) Thing+ Embedded 패키지를 설치한다.

```bash
@Pi2:$ sudo su
@Pi2:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
@Pi2:$ npm install
@Pi2:$ sudo reboot
```

<br/><br/>
#### 3. 라즈베리파이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.

--------------------
<div id='id-pi-troubleshooting'></div>
### 문제 해결 방법

* `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우

  - 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
  - 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 라즈베리파이에 접속하여 아래 명령을 실행하여 내용을 확인한다.

    ```
    @PC:$ ssh pi@<IP Address>
    @Pi2:$ cd thingplus/gateway
    @Pi2:$ ./thingplus.sh restart
    @Pi2:$ cd log
    @Pi2:$ tail -F -n 300 thingplus.log
    ```

<br/>

* 한 개 이상의 센서가 등록되지 않았을 경우

 - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.

<br/>

* 라즈베리파이의 IP address를 확인하는 방법

 - 스마트폰의 app store에서 `Fing` app을 설치한다. ([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - 라즈베리파이가 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
  - 이 중 `raspberrypi`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.
