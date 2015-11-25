---
title: 비글본그린 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/bbb-user-guide.html
---

Thing+ 연동가이드(비글본그린)

<br/>
#### 1. 환경 설정

0) [Grove Starter Kit for BeagleBone Green 구매 바로가기](http://www.icbanq.com/P005716600)

<br/>
1) 비글본그린을 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - Putty 다운로드 링크 - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

<br/>
2) 비글본그린을 Ethernet(LAN 케이블), Power Cable을 연결한다.

![BBG + Ehternet + USB Cable](/assets/bbg_ethernet_usb.png)

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
4) 비글본그린의 시스템 시간을 업데이트한다.

- 진행 중, 설치를 확인하는 질문에서는 `y`를 입력한다.

```bash
@BBG:$ apt-get update
@BBG:$ apt-get install ntp ntpdate
@BBG:$ ntpdate -u ntp.ubuntu.com
@BBG:$ hwclock -w -u
```

- 만약, 시스템 시간 업데이트에 실패할 경우, 직접 시간을 갱신한다.

  - UTC 시간 기준 [(링크)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): 2015년 01월 01일 00:00:00 경우, 2015-01-01 00:00:00

    ```bash
    @BBG:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

<br/>
5) 장치 구분을 위해 비글본그린의 호스트명 변경이 필요합니다.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 함.

 - `/etc/hostname`을 수정한다.

    ```bash
    @BBG:$ nano /etc/hostname
    ```

   - 파일 내부의 `beaglebone`을 아래 그림과 같이 원하는 이름(알파벳 및 숫자, -만 허용)으로 변경한다.
   ![BBG Modify hostname](/assets/modify_hostname.png)

     - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

<br/>

 - 변경한 호스트명 적용을 위해 비글본그린을 재시작한다.

    ```bash
    @BBG:$ reboot
    ```

<br/><br/>
#### 2. Thing+ Embedded 패키지 설치

1) BBG에 Grove Starter Kit센서를 Power Cable을 분리한 상태에서 연결한다.

- I2C HUB: 비글본그린과 I2C HUB를 연결하는 선
![BBG + Grove](/assets/bbg_grove.png)

- BBG: 비글본그린과 I2C HUB를 연결하는 선을 의미한다.
![BBG + Grove](/assets/bbg_grove_2_ko.png)

- RGB LED 백패널의 `IN`이라 표시된 쪽에 꽃는다.
![BBG + Grove](/assets/bbg_grove_3.png)

<br/>
2) 비글본그린에 Ethernet(LAN 케이블), Power Cable을 연결한다.
![BBG + Grove + Ehternet + Power](/assets/bbg_grove_ethernet_power.png)

<br/>
3) 비글본그린에 접속한다.

<br/>
4) Thing+ Embedded 패키지를 설치할 폴더를 만들고 이동한다.

```bash
@BBG:$ mkdir /opt/thingplus
@BBG:$ cd /opt/thingplus
```

<br/>
5) 인스톨 스크립트 파일을 다운로드한다.

```bash
@BBG:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bbg_install.sh
```

<br/>
6) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치한다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

    ```bash
    @BBG:$ chmod 755 thingplus_embedded_sdk_bbg_install.sh
    @BBG:$ ./thingplus_embedded_sdk_bbg_install.sh
    ```

<br/>
7) 비글본그린을 재시작한다.

```bash
@BBG:$ reboot
```

<br/><br/>
#### 3. 게이트웨이 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.


--------------------

### WiFi 동글 설정

_본 가이드는 **NEXT-201N MINI**를 기준으로 작성되었으나, 다른 WiFi 동글도 비슷한 과정으로 진행하면 됩니다._

- 본 문서에서 테스트한 WiFi 동글 : [NEXT-201N MINI](http://www.ez-net.co.kr/new_2012/product/view.php?cid=1&sid=78&q=&seq=127&page=&q=&PHPSESSID=865a3c26f3fc4c2368f385ca06602846)

- 비글본 보드에서 지원하는 WiFi 동글 목록은 아래 URL을 참조하세요.
  - [비글본 보드 지원 WiFi 동글 리스트](http://www.elinux.org/Beagleboard:BeagleBoneBlack#WIFI_Adapters)
  - WiFi 공유기가 5GHz WiFi 채널을 지원한다면 WiFi 동글이 해당 스펙을 지원하는지 확인이 필요합니다.

> 주의: WiFi 동글을 장치에 연결한 후 반드시 재시작해야 한다.

<br/>
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
b) `# The primary network interface` 아랫부분과 `# WiFi Example` 아랫부분의 앞에 있는 `#`을 삭제하고, WiFi 인터페이스명, WiFi SSID와 비밀번호를 설정한다.

```bash
...

# The primary network interface
auto eth0       # 이 줄의 앞에 있는 #을 삭제한다.
                # 'auto eth0' 대신 'allow-hotplug eth0'가 있을 수 있다.
iface eth0 inet dhcp  # 이 줄의 앞에 있는 #을 삭제한다.
# Example to keep MAC address between reboots
#hwaddress ether DE:AD:BE:EF:CA:FE

...

# WiFi Example
auto wlan0                    # ra0를 위에서 사용자가 확인했던 인터페이스 명으로 수정하고
iface wlan0 inet dhcp         # 앞에 있는 #을 삭제한다. 'ra0'이면 'wlan0'을 'ra0'으로 변경한다.
    wpa-ssid "WiFi SSID"      # WiFi SSID와 WiFi password를 사용자의 SSID와
    wpa-psk  "WiFI password"  # password로 수정하고 #을 삭제한다.
...

```

 - 파일을 수정한 후, `CTRL-O` and `Enter` 키를 눌러 저장하고, `CTRL-X` 키를 눌러 종료한다.

<br/>
5) 장치를 재시작한다.

<div id='id-bbg-usbconnect'></div>
> 주의: WiFi 동글을 이용할 경우 전원을 많이 사용하므로, 반드시 DC 5V 전원 어댑터를 연결하여 사용해야 한다.

----------------------------------
### 비글본그린 USB로 연결하기

_Mac OS X El Capitan은 현재 드라이버 미지원(**2015-11-14 기준**)이기에 연결이 불가능 합니다._

1) 아래 URL을 참조하여 비글본그린 드라이버를 설치한다.

- [Windows 64bit 드라이버](http://beagleboard.org/static/Drivers/Windows/BONE_D64.exe)
- [Windows 32bit 드라이버](http://beagleboard.org/static/Drivers/Windows/BONE_DRV.exe)
- [Linux 드라이버](http://beagleboard.org/static/Drivers/Linux/FTDI/mkudevrule.sh)
- Mac OS X 시리얼 드라이버
 - [Mac OS X 10.3 ~ 10.4 32bit 시리얼 드라이버](http://www.ftdichip.com/drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_2_18.dmg)
 - [Mac OS X 10.3 ~ 10.8 64bit 시리얼 드라이버](http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_2_18.dmg)
 - [Mac OS X 10.9 ~ 현재 64bit 시리얼 드라이버](http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_3.dmg)
- [Mac OS X 네트워크 드라이버](http://joshuawise.com/downloads/HoRNDIS-rel7.pkg)

<br/>
2) 비글본그린을 제어하기 위해서는 Telnet/SSH 클라이언트가 필요합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - Putty 다운로드 링크 - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

<br/>
3) 비글본그린을 동봉된 USB Micro 5pin 케이블을 사용하여 PC와 연결한다.

![BBG + USB Cable](/assets/bbg_usb_cable.png)

<br/>
4) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 접한다.

   - Mac & Linux의 경우

        ```bash
        $ ssh root@192.168.7.2
        ```
   
   - Windows의 경우
     - putty 실행 후, 아래 그림과 같이 IP주소를 입력 후, `Open`버튼을 클릭하고 비밀번호를 입력한다.
     ![BBG putty login](/assets/putty_usb_login_bbg.png)

> 주의: Windows의 경우, 비글본그린을 재부팅할 때마다, putty를 새로 실행해야함.
