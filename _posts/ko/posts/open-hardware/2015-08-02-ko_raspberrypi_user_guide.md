---
title: 라즈베리파이 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/raspberry-pi-user-guide.html
---

Thing+ 연동가이드(라즈베리파이)
<div id='id-setting'></div>

1. [환경설정](#id-setting)
2. [Thing+ Embedded 패키지 설치](#id-package)
3. [라즈베리파이 등록](#id-register)
4. [WIFI 동글 설정](#id-wifi-set)



<br/>

---
#### 1. 환경 설정

0) [GrovePi+ Starter Kit 구매 바로가기](http://www.icbanq.com/P005700239)

<br/>
1) Micro SD card(8GB 이상)을 준비한다.

<br/>
2) 아래의 다운로드 페이지에서 Raspbian image를 다운로드 한다.

   - Raspbian Image 다운로드 링크 - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2015-09-28/2015-09-24-raspbian-jessie.zip)
   - `2015-09-24-RASPBIAN JESSIE` 이미지 권장

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

   - IP address를 찾기 힘들 경우 [`문제 해결 방법`](/ko/help/troubleshooting.html)을 참고한다.

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
8) 라즈베리파이의 시스템 시간을 업데이트한다.

- 진행 중, 설치를 확인하는 질문에서는 `y`를 입력한다.

```bash
@Pi2:$ sudo su
@Pi2:$ apt-get update
@Pi2:$ apt-get install -y --force-yes ntp ntpdate
@Pi2:$ ntpdate -u ntp.ubuntu.com
```

- 만약, 시스템 시간 업데이트에 실패할 경우, 직접 시간을 갱신한다.

  - UTC 시간 기준 [(링크)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): 2015년 01월 01일 00:00:00 경우, 2015-01-01 00:00:00

    ```bash
    @Pi2:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

<br/>
9) 장치 구분을 위해 라즈베리파이의 호스트명 변경이 필요합니다.

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
10) 재부팅이 완료된 라즈베리파이에 재접속한다. ([`7번 과정`](#id-pi-setting-seventh) 참고)

<br/>
11) 4GB 이상의 SD card를 사용하기 위해서, `raspi-config`를 실행한다.

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

<br/>
12) 라즈베리파이를 재시작한다.

```bash
@Pi2:$ sudo reboot
```
<div id='id-package'></div>

<br/><br/>

---
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
4) 인스톨 스크립트 파일을 다운로드한다.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install.sh
```

<br/>
5) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치한다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

    ```bash
    @Pi2:$ sudo su
    @Pi2:$ chmod 755 thingplus_embedded_sdk_pi_install.sh
    @Pi2:$ ./thingplus_embedded_sdk_pi_install.sh
    ```

<br/>
6) 라즈베리파이를 재시작한다.

```bash
@Pi2:$ sudo reboot
```
<div id='id-register'></div>

<br/><br/>

---
#### 3. 라즈베리파이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.

<div id='id-wifi-set'></div>

--------------------

### WiFi 동글 설정

_본 가이드는 **TP-LINK TL-WN727N**을 기준으로 작성되었으나, 다른 WiFi 동글도 비슷한 과정으로 진행하면 됩니다._

- 본 문서에서 테스트한 WiFi 동글 : [TP-LINK TL-WN727N](http://www.tp-link.co.kr/products/details/?model=TL-WN727N)

- 라즈베리파이에서 지원하는 WiFi 동글 목록은 아래 URL을 참조하세요.
  - [라즈베리파이 지원 WiFi 동글 리스트](http://elinux.org/RPi_USB_Wi-Fi_Adapters)
  - WiFi 공유기가 5GHz WiFi 채널을 지원한다면 WiFi 동글이 해당 스펙을 지원하는지 확인이 필요합니다.

> 주의: WiFi 동글을 장치에 연결한 후 반드시 재시작해야 한다.

<br/>

---
#### 1. WiFi 동글 설정 방법

<br/>
1) WiFi 동글을 장치의 USB 포트에 꽂은 후, 장치를 재시작한다.

<br/>
2) 터미널/Putty를 사용하여 장치에 접속한다.

<br/>
3) 터미널에서 `WiFi 인터페이스명`을 확인한다.

```bash
@shell:$ iwconfig
wlan0

lo        no wireless extensions.

eth0      no wireless extensions.

usb0      no wireless extensions.
```

- 위의 경우, WiFI 인터페이스명은 `wlan0`이다. WiFi 동글에 따라 `wlan#`나 `ra#` (#은 숫자를 의미함) 등으로 이름이 달라질 수 있다.

<br/>
4) 네트워크 설정

a) nano 에디터를 이용하여, `/etc/network/interfaces` 파일을 연다.

```bash
@shell:$ sudo nano /etc/network/interfaces
```

<br/>
b) `auto wlan0` 단락의 `wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf`줄 아랫부분에 WiFi SSID와 비밀번호를 설정한다.

- 여기서 `wlan0`은 위에서 확인한 `WiFi 인터페이스명`을 말한다.

```bash
...

auto wlan0                    # WiFi 인터페이스 명이 'ra0'일 경우,
allow-hotplug wlan0           # 단락 내의 'wlan0'을 모두 'ra0' 으로 변경한다.
iface wlan0 inet manual
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
  wpa-ssid "WiFi SSID"        # WiFi SSID와 WiFi password를 사용자의 SSID와
  wpa-psk  "WiFI password"    # password로 입력한다.

...

```

 - 파일을 수정한 후, `CTRL-O` and `Enter` 키를 눌러 저장하고, `CTRL-X` 키를 눌러 종료한다.

<br/>
5) 장치를 재시작한다.

> 주의: WiFi 동글을 이용할 경우 전원을 많이 사용하므로, 반드시 DC 5V 전원 어댑터를 연결하여 사용해야 한다.

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
