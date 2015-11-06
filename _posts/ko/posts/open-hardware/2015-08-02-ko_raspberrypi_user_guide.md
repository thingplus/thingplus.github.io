---
title: 라즈베리파이 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/raspberry-pi-user-guide.html
---

Thing+ 연동가이드(라즈베리파이)

#### 1. 환경 설정

0) [GrovePi+ Starter Kit 구매 바로가기](http://www.icbanq.com/P005700239)

1) Micro SD card(8GB 이상)을 준비한다.

2) 아래의 다운로드 페이지에서 Raspbian image를 다운로드 한다.

   - https://www.raspberrypi.org/downloads/raspbian/
   - `RASPBIAN JESSIE` 이미지 권장

3) 아래의 웹페이지를 참조하여 Micro SD card에 다운로드 받은 이미지로 OS를 설치한다.

   - https://www.raspberrypi.org/documentation/installation/installing-images/

4) 라즈베리파이를 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - Putty 다운로드 링크 - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

5) Raspbian을 설치한 Micro SD card를 라즈베리파이에 꽂는다.

   ![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)

6) 라즈베리파이에 Ethernet(LAN 케이블), Power cable을 연결한다.

   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)

7) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 로그인한다

   - IP address를 찾기 힘들 경우 `문제 해결 방법`을 참고한다.

     ```bash
     $ ssh pi@<IP Address>
     pi@<IP Address>'s password: raspberry
     ```

8) 장치 구분을 위해 라즈베리파이의 호스트명 변경이 필요합니다.

 - `/etc/hostname`을 수정한다.

   ```bash
   @Pi2:$ sudo nano /etc/hostname
   ```

   - 파일 내부의 `raspberrypi`를 아래 그림과 같이 원하는 이름(알파벳 및 숫자, -만 허용)으로 변경한다.

   ![Raspberry Pi Modify hostname](/assets/modify_hostname.png)

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

 - `/etc/hosts`를 수정한다.

   ```bash
   @Pi2:$ sudo nano /etc/hosts
   ```

   - 파일 내부의 `raspberrypi`를 아래 그림과 같이 위와 동일한 이름으로 변경한다.

   ![Raspberry Pi Modify hosts](/assets/modify_hostname_2.png)

 - 변경한 호스트명 적용을 위해 라즈베리파이를 재시작한다.

   ```bash
   @Pi2:$ sudo reboot
   ```

9) 4GB 이상의 SD card를 사용하기 위해서, `raspi-config`를 실행한다.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   a. 4GB 이상의 SD card를 사용하기 위해서 `1. Expand Filesystem`을 선택한다.

   ![Raspberry Pi Setting File sytsem](/assets/expand_file_system.png)

   b. I2C를 사용하기 위해서 `8. Advanced Options` --> `A7. I2C`을 선택하고 이후 물음에 모두 `Yes`를 선택한다.

   ![Raspberry Pi Setting advanced options](/assets/advanced_options.png)

   ![Raspberry Pi Setting choose i2c](/assets/choose_i2c.png)

   c. Tab키를 누르고 Finish를 선택한 후 Reboot할 것이냐는 물음에 `No`를 선택한다.

   d. /etc/modules에 `i2c-dev`와 `i2c-bcm2708`을 추가한다.

   ```bash
   @Pi2:$ nano /etc/modules
   ...
   i2c-dev
   i2c-bcm2708
   ```

   - `i2c-dev`는 Raspbian의 버전에 따라서 이미 추가되어 있을 수 있음.

   - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

#### 2. Thingplus 어플리케이션 설치

1) 라즈베리파이에 Grove Pi+ shield와 센서, Ethernet(LAN 케이블), Power cable을 연결한다.

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.jpg)

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi_2.jpg)

2) nodejs를 다운로드 후 설치한다.

```bash
@Pi2:$ sudo su
@Pi2:$ wget http://nodejs.org/dist/v0.10.16/node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ tar xvfz node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ cd node-v0.10.16-linux-arm-pi
@Pi2:$ rsync -a bin lib share /usr/local/
@Pi2:$ node --version
v0.10.16
```

3) thingplus 어플리케이션을 설치할 폴더를 만들고 이동한다.

```bash
@Pi2:$ mkdir /opt/thingplus
@Pi2:$ cd /opt/thingplus
```

4) 인스톨 스크립트 파일을 다운로드한다.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_install.sh
```

5) thingplus 어플리케이션의 구성요소들이 설치될 경로를 지정한다.

```bash
@Pi2:$ nano thingplus_embedded_sdk_install.sh
```

   - 화면상단의 `USER_THINGPLUS_GATEWAY_DEST=`와 `USER_SDK_DEST=`의 뒤에 원하는 경로를 입력한다.

     ```bash
     #Destination directory for Thing+ Gateway
     USER_THINGPLUS_GATEWAY_DEST='게이트웨이 경로'

     #Destination directory for Open Hardware SDK
     USER_SDK_DEST='하드웨어 SDK 경로'
     ```

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

     - 예제

       ```bash
       #Destination directory for Thing+ Gateway
       USER_THINGPLUS_GATEWAY_DEST=./gateway

       #Destination directory for Open Hardware SDK
       USER_SDK_DEST=.
       ```

6) 다운로드한 스크립트 파일에 실행권한을 부여하고 실행한다.

```bash
@Pi2:$ sudo chmod 755 thingplus_embedded_sdk_install.sh
@Pi2:$ sudo ./thingplus_embedded_sdk_install.sh
```

7) 라즈베리파이를 재시작한다.

```bash
@Pi2:$ sudo reboot
```

8) 라즈베리파이에 재접속후, thingplus 어플리케이션을 설치한다.

```bash
@Pi2:$ sudo su
@Pi2:$ cd /opt/thingplus/'하드웨어 SDK 경로'/openhardware/raspberrypi/grovePi-starter-kit
@Pi2:$ npm install
@Pi2:$ sudo reboot
```

 - 예제

   ```bash
   @Pi2:$ sudo su
   @Pi2:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
   @Pi2:$ npm install
   @Pi2:$ sudo reboot
   ```

#### 3. 라즈베리파이 등록

1) [`Gateway 등록 가이드`](/ko/user-guide/registration.html#id-gateway)를 참고하여 라즈베리파이를 등록한다.

   - `게이트웨이 모델` 선택 시 `Raspberry Pi - Developer`를 선택한다.

   - `디바이스 모델` 선택 시 `GrovePi+ Starter Kit`을 선택한다.

   - MAC 어드레스를 얻는 방법은 아래와 같다.

     ```bash
     @Pi2:$ sudo su
     @Pi2:$ cd /opt/thingplus/'게이트웨이 경로'/scripts
     @Pi2:$ ./getmac
     Your MAC address is as below
     xx:xx:xx:xx:xx:xx
     ```

     - 예제

       ```bash
       @Pi2:$ sudo su
       @Pi2:$ cd /opt/thingplus/gateway/scripts
       @Pi2:$ ./getmac
       Your MAC address is as below
       xx:xx:xx:xx:xx:xx
       ```

   - 처음 실행 방법은 아래와 같다. 이 때, `API 키`는 앞뒤를 작은 따옴표(')로 감싸야 한다.

     ```bash
     @Pi2:$ sudo su
     @Pi2:$ cd /opt/thingplus/'게이트웨이 경로'
     @Pi2:$ APIKEY='API 키' ./thingplus.sh start;
     @Pi2:$ cd /opt/thingplus/'하드웨어 SDK 경로'/openhardware/raspberrypi/grovePi-starter-kit;
     @Pi2:$ node app.js;
     ```

     - 예제

       ```bash
       @Pi2:$ sudo su
       @Pi2:$ cd /opt/thingplus/gateway
       @Pi2:$ APIKEY='A7i3kT***-***Vk447-***' ./thingplus.sh start;
       @Pi2:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit;
       @Pi2:$ node app.js > /dev/null &;
       ```
   - 어플리케이션 실행 후, Thingplus 포탈 게이트웨이 등록화면의 `게이트웨이, 디바이스, 센서 등록 진행` 버튼을 클릭하면 라즈베리파이가 등록된다.

#### 4. 추가 설정

- 라즈베리파이가 켜질 때마다 자동으로 Thingplus 앱이 실행되도록 하기 위해서는 `/etc/rc.local`의 `exit 0` 명령 바로 위에 아래처럼 추가한다.

 ```bash
 @Pi2:$ sudo nano /etc/rc.local
 ...
 (cd /opt/thingplus/'게이트웨이 경로'; sudo ./thingplus.sh start;)
 (cd /opt/thingplus/'하드웨어 SDK 경로'/openhardware/raspberrypi/grovePi-starter-kit; sudo node app.js;)

 exit 0
 ```

 - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

 - 예제

   ```bash
   @Pi2:$ sudo nano /etc/rc.local
   ...
   (cd /opt/thingplus/gateway; sudo ./thingplus.sh start;)
   (cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit; sudo node app.js;)

   exit 0
   ```

--------------------

### 문제 해결 방법

* `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우

  - 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
  - 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 Raspberry Pi에 접속하여 아래 명령을 실행하여 내용을 확인한다.

    ```
    @PC:$ ssh pi@<IP Address>
    @Pi2:$ thingplus/'게이트웨이 경로'
    @Pi2:$ ./thingplus.sh restart
    @Pi2:$ cd log
    @Pi2:$ tail -F -n 300 thingplus.log
    ```

* 한 개 이상의 센서가 등록되지 않았을 경우

  - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.

* 라즈베리파이의 IP address를 확인하는 방법

  - 스마트폰의 app store에서 `Fing` app을 설치한다. ([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - 라즈베리파이가 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
  - 이 중 `raspberrypi`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.
