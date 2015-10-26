---
title: Raspberry PI 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/raspberry-pi-user-guide.html
---

Thing+ 연동가이드(Raspberry Pi)

#### 1. 환경 설정


1) Micro SD card(8GB 이상)을 준비한다.

2) 아래의 다운로드 페이지에서 Raspbian image를 다운로드 한다.

   - https://www.raspberrypi.org/downloads/

3) 아래의 웹페이지를 참조하여 Micro SD card에 다운로드 받은 이미지로 OS를 설치한다.

   - https://www.raspberrypi.org/documentation/installation/installing-images/

4) 윈도우즈 사용자의 경우 아래의 URL에서 putty를 다운받아 설치한다.

   - http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

5) Micro SD card를 Raspberry Pi에 꽂는다.

6) Raspbeery Pi에 GrovePi shield와 센서, Ethernet(LAN 케이블), power cable을 연결한다.

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.jpg)

7) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 로그인한다

   - IP address를 찾기 힘들 경우 `문제 해결 방법`을 참고한다.

```bash
$ ssh pi@<IP Address>
pi@<IP Address>'s password: raspberry
```

8) 4GB 이상의 SD card를 사용하기 위해서, raspi-config를 실행한다.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   a. 4GB 이상의 SD card를 사용하기 위해서 `1. Expand Filesystem`을 선택한다.

   b. I2C를 사용하기 위해서 `8. Advanced Options` --> `A7. I2C`을 선택하고 이후 물음에 모두 `Yes`를 선택한다.

   c. Tab키를 누르고 Finish를 선택한 후 Reboot할 것이냐는 물음에 `No`를 선택한다.

   d. /etc/modules에 `i2c-dev`와 `i2c-bcm2708`을 추가한다.

   ```bash
   @Pi2:$ nano /etc/modules
   ...
   i2c-dev
   i2c-bcm2708
   ```

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

#### 2. 설치

1) nodejs를 다운로드 후 설치한다.

```bash
@Pi2:$ sudo su
@Pi2:$ wget http://nodejs.org/dist/v0.10.16/node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ tar xvfz node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ cd node-v0.10.16-linux-arm-pi
@Pi2:$ rsync -a bin lib share /usr/local/
@Pi2:$ node --version
v0.10.16
```

2) 데비안 패키지 파일을 다운로드한다.

```bash
@Pi2:$ wget https://support.thingplus.net/download/deb/tp_raspberryPi2.deb
```

3) 데비안 패키지를 설치한다. (반드시 root 계정을 이용해야 한다.)

```bash
@Pi2:$ dpkg -i tp_raspberryPi2.deb
```

4) Raspberry Pi를 재시작한다.

```bash
@Pi2:$ reboot
```

#### 3. Raspberry Pi 등록

1) `Gateway 등록 가이드`를 참고하여 Raspberry Pi를 등록한다.

   - `게이트웨이 모델` 선택 시 `Raspberry Pi - Developer`를 선택한다.

   - `디바이스 모델` 선택 시 `GrovePi+`를 선택한다.

   - MAC 어드레스를 얻는 방법은 아래와 같다.

     ```bash
     @Pi2:$ cd /usr/local/tp/scripts
     @Pi2:$ ./getmac
     Your MAC address is as below
     xx:xx:xx:xx:xx:xx
     ```

   - 처음 실행 방법은 아래와 같다. 이 때, `API 키`는 앞뒤를 작은 따옴표(')로 감싸야 한다.

     ```bash
     @Pi2:$ sudo su
     @Pi2:$ cd /usr/local/tp
     @Pi2:$ APIKEY='API 키' ./tp.sh start; ./driver.sh start
     ```

     - 예제

       ```bash
       @Pi2:$ sudo su
       @Pi2:$ cd /usr/local/tp
       @Pi2:$ APIKEY='A7i3kT***-***Vk447-***' ./tp.sh start; ./driver.sh start
       ```

   - Raspberry Pi가 켜질 때마다 자동으로 실행되도록 하기 위해서는 `/etc/rc.local`의 `exit 0` 명령 바로 위에 아래처럼 추가한다.

     ```bash
     @Pi2:$ sudo nano /etc/rc.local
     ...
     (cd /usr/local/tp; ./driver.sh start)         # 추가
     (cd /usr/local/tp; ./tp.sh start)             # 추가
     
     exit 0
     ```

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.


--------------------

### 문제 해결 방법

* `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우:

  - 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
  - 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 Raspberry Pi에 접속하여 아래 명령을 실행하여 내용을 확인한다.

  ```
  @PC:$ ssh pi@<IP Address>
  @Pi2:$ cd /usr/local/tp
  @Pi2:$ ./tp.sh restart
  @Pi2:$ cd log
  @Pi2:$ tail -F -n 300 thingplus.log
  ```

* 한 개 이상의 센서가 등록되지 않았을 경우:

  - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.

* Raspberry Pi의 IP address를 확인하는 방법

  - 스마트폰의 app store에서 `Fing` app을 설치한다. (Android, iPhone 모두 가능)
  - Raspberry Pi가 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
  - 이 중 `raspberrypi`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.
