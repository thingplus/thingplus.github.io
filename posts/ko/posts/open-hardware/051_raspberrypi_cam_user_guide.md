---
title: 라즈베리파이+Camera 사용자 가이드
tags: "open-hardware"
image: "http://support.thingplus.net/assets/ogp/ogp_raspi_cam.png"
published: true
img: ic-raspberrypiwithcamera.png
permalink: /ko/open-hardware/raspberry-camera-user-guide.html
---

Thing+ 연동가이드(라즈베리파이)
<div id='id-setting'></div>

1. [환경설정](#id-setting)
2. [Thing+ Embedded 패키지 설치](#id-package)
3. [드롭박스 연동](#id-dropbox)
4. [라즈베리파이 등록](#id-register)


---
___이 가이드는 Raspberry pi와 Camera 모듈을 연동한 IOT 사용 가이드 입니다. 
사진은 개인적인 부분이므로 개인이 소유하고 있는 dropbox에 저장 하는 것으로 가이드 합니다. 
그러므로 dropbox에 계정이 있으셔야 합니다.___

---

#### 1. 환경 설정

0) [Raspberry Pi Camera Module 구매 바로가기](http://www.icbanq.com/P006477908)


1) Micro SD card(8GB 이상)을 준비한다.


2) 아래의 다운로드 페이지에서 Raspbian image를 다운로드 한다.

   - RaspberryPi 2
     - Raspbian Image 다운로드 링크 - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2015-09-28/2015-09-24-raspbian-jessie.zip)
     - `2015-09-24-RASPBIAN JESSIE` 이미지 권장
   - RaspberryPi 3
     - Raspbian Image 다운로드 링크 - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2016-05-31/2016-05-27-raspbian-jessie.zip)
     - `2016-05-27-RASPBIAN JESSIE` 이미지 권장


3) 아래의 웹페이지를 참조하여 Micro SD card에 다운로드 받은 이미지로 OS를 설치한다.

   - Raspbian image를 Micor SD card에 설치하는데 수분이 소요됩니다.
   - [참조](https://www.raspberrypi.org/documentation/installation/installing-images/)


4) 라즈베리파이를 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - [Putty 다운로드 링크](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)


5) Raspbian을 설치한 Micro SD card를 라즈베리파이 아래 그림과 같이 **뒷면**의 Micro SD card 슬롯에 꽂는다.
   ![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)


6) 라즈베리파이에 Ethernet(LAN 케이블), Power Cable을 연결한다.
  
  ***안정적인 전원 공급을 위해 power cable에 연결하는 것을 권장합니다. USB 허브등에 연결했을때 file resource가 broken 되는 현상이 관찰되었습니다.*** 
   
   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)


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


9) 장치 구분을 위해 라즈베리파이의 호스트명 변경이 필요합니다.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 함.

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

- 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

- 변경한 호스트명 적용을 위해 라즈베리파이를 재시작한다.

  ```bash
  @Pi2:$ sudo reboot
  ```

10) 재부팅이 완료된 라즈베리파이에 재접속한다. ([`7번 과정`](#id-pi-setting-seventh) 참고)


11) Raspberry의 환경설정 설정을 위해서, `raspi-config`를 실행한다.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   
- 4GB 이상의 SD card를 사용하기 위해서 `1. Expand Filesystem`을 선택한다.
  ![Raspberry Pi Setting File sytsem](/assets/expand_file_system.png)

   
- Camera 모듈을 사용하기 위해서 `5. Enable Camera` 
  ![Raspberry Pi Setting Enable camera](/assets/pi-cam-01.png)
  ![Raspberry Pi Setting confirm](/assets/pi-cam-02.png)

   
- Tab키를 누르고 Finish를 선택한 후 Reboot할 것이냐는 물음에 `Yes`를 선택한다.
  ![Raspberry Pi Choose Finish](/assets/choose_finish.png)
  ![Raspberry Pi Choose Finish](/assets/choose_finish_2.png)


<div id='id-package'></div>



---

#### 2. Thing+ Embedded 패키지 설치

1) 라즈베리파이에 Camera module을 연결 한다.

![Raspberry Pi + Camera](/assets/pi-cam-03.png)

![Raspberry Pi + Camera](/assets/pi-cam-04.png)


2) 라즈베리파이에 Ethernet(LAN 케이블), Power Cable을 연결한다.


3) 라즈베리파이에 접속한다.


4) 인스톨 스크립트 파일을 다운로드한다. ([wget 설치](/ko/help/faq.html#faq_install_wget))

- RaspberryPi2

  ```bash
  @Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install.sh
  ```

- RaspberryPi3

  ```bash
  @Pi3:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi3_install.sh
  ```

5) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치한다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

  - RaspberryPi2

  ```bash
  @Pi2:$ sudo su
  @Pi2:$ chmod 755 thingplus_embedded_sdk_pi_install.sh
  @Pi2:$ ./thingplus_embedded_sdk_pi_install.sh
  ```

  - RaspberryPi3
  
  ```bash
  @Pi3:$ sudo su
  @Pi3:$ chmod 755 thingplus_embedded_sdk_pi3_install.sh
  @Pi3:$ ./thingplus_embedded_sdk_pi3_install.sh
  ```

6) 라즈베리파이를 재시작한다.

```bash
@Pi2:$ sudo reboot
```

<div id='id-dropbox'></div>

---

#### 3. 드롭박스 연동
_드롭 박스 업로더와 연동 하기 위해 다음의 절차로 설정 한다._

1) key 발급 및 설정

``` bash
@Pi2:$ cd /usr/local/bin
@Pi2:$ ./dropbox_uploader.sh
```
  - 아래의 가이드 대로 따라 하여 key를 발급 받는다.
  ![uploader.sh](/assets/pi-cam-05.png)
  
  - [Browser 접속](https://www.dropbox.com/developers/apps) 후에 로그인을 한다.
  - `Create App` button을 누른다.
  ![dropbox](/assets/pi-cam-06.png)

  - 아래 스크린샷을 참조하여 설정하고 `Create app` 버튼을 누른다.
  ![dropbox config](/assets/pi-cam-07.png)
  
  - 아래와 같이 app key와 app secret가 발급 되었다.
  ![dropbox key](/assets/pi-cam-08.png)

  - 터미널창에서 요구 하고 있는 key와 secret을 입력하고 가이드 된 url로 브라우저 접속후에 OAuth 인증 한다.

    ```bash
    # App key: xxxxxxxx 
    # App secret: yyyyyyyy
    
    Permission type:
    App folder [a]: If you choose that the app only needs access to files it creates
    Full Dropbox [f]: If you choose that the app needs access to files already on Dropbox
    
    # Permission type [a/f]: a

    > App key is xxxxxxxx, App secret is yyyyyyyy and Access level is App Folder. Looks ok? [y/n]: y
    > Token request... OK

    Please open the following URL in your browser, and allow Dropbox Uploader
    to access your DropBox folder:

    --> https://www.dropbox.com/1/oauth/authorize?oauth_token=zzzzxxxxyyyy

    Press enter when done...
    ```

  - OAuth 인증 허용
  ![dropbox](/assets/pi-cam-09.png)  
  ![dropbox](/assets/pi-cam-10.png)


<div id='id-register'></div>

---

#### 4. 라즈베리파이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.

<div id='id-wifi-set'></div>



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
