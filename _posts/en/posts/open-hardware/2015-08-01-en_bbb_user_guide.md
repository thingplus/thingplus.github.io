---
title: BeagleBone Green User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/bbb-user-guide.html
---

Thing+ Integration Guide for BeagleBone Green

<br/>
#### 1. Environment Setting

0) [Go to shop to buy the Grove Starter Kit](http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-BeagleBone-Green-p-2526.html)

<br/>
1) Telnet/SSH Client is required for controlling the BeagleBone Green from your PC.

   - If you are a Mac or Linux user, please use the default terminal utility.
   - If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
   - [Putty Download link](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

<br/>
2) For the communication over the internet, connect the ethernet cable or plug in a Wifi USB Dongle 

![BBG + Ehternet + USB Cable](/assets/bbg_ethernet_usb.png)

<br/>
3) After the BeagleBone is booted up completely, connect to it over SSH. The booting process takes 2~3 minutes

 - If you can't found IP address, please refer the [`Troubleshooting`](/en/help/troubleshooting.html) section.

    ```bash
    $ ssh root@<IP Address>
    ```

   - Example for Mac & Linux

        ```bash
        $ ssh root@192.168.1.XXX
        ```
   
   - Example for Windows
     - Run the putty, and Insert your IP Address, and then, Click the button `Open` and Enter a password.
     ![BBG putty login](/assets/putty_login_bbg.png)

<br/>

 - Notice : BeagleBone Green is possible to connect with PC and USB cable. Please refer the [`How to connect with USB on Beaglebone Green`](#id-bbg-usbconnect) section.

> Notice: In case of Windows, you have to re-launch putty, when BeagleBone Green is rebooted.

<br/>
4) Update and synchronize your BBG’s system time with a NTP server

- While installing an application, please Enter y for installation questions.

```bash
@BBG:$ apt-get update
@BBG:$ apt-get install ntp ntpdate
@BBG:$ ntpdate -u ntp.ubuntu.com
@BBG:$ hwclock -w -u
```

- If you failed to update the time, Update it directly

  - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @BBG:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

<br/>
5) Change the hostname of your BBG for identifying it.

> Remark: You can’t move the cursor on the Terminal and/or Putty with your mouse. please use your keyboard to move it.

 - Modify `/etc/hostname`.

    ```bash
    @BBG:$ nano /etc/hostname
    ```

   - Change the `BeagleBone' in the file to your own name(letter, number and hyphen(-) allowed only) like the below image. 
   ![BBG Modify hostname](/assets/modify_hostname.png)

     - When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor

<br/>

 - To apply your modification, please reboot your BeagleBone Green.

    ```bash
    @BBG:$ reboot
    ```

<br/><br/>
#### 2. Install Thing+ Embedded Package

1) Connect Grove Starter kit sensor to BeagleBone Green without Ethernet(LAN cable) and Power Cable.

- As the following image : How to Connection BeagleBone Green with I2C hub
![BBG + Grove](/assets/bbg_grove.png)

![BBG + Grove](/assets/bbg_grove_2_en.png)

- In case of RGB LED, connect to `IN` slot.
![BBG + Grove](/assets/bbg_grove_3.png)

<br/>
2) Connect Ethernet(LAN cable), and Power Cable to BeagleBone Green.
![BBG + Grove + Ehternet + Power](/assets/bbg_grove_ethernet_power.png)

<br/>
3) Connect to your BeagleBone Green.  

<br/>
4) Make folder to be install Thing+ Embedded Package and move that folder.

```bash
@BBG:$ mkdir /opt/thingplus
@BBG:$ cd /opt/thingplus
```

<br/>
5) Download a install script file.

```bash
@BBG:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bbg_install.sh
```

<br/>
6) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

    ```bash
    @BBG:$ chmod 755 thingplus_embedded_sdk_bbg_install.sh
    @BBG:$ ./thingplus_embedded_sdk_bbg_install.sh
    ```

<br/>
7) Reboot BeagleBone Green.

```bash
@BBG:$ reboot
```

<br/><br/>
#### 3. Gatway Registration
Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)


--------------------

### [Optional] WiFi Dongle Setting

_본 가이드는 **NEXT-201N MINI**를 기준으로 작성되었으나, 다른 WiFi 동글도 비슷한 과정으로 진행하면 됩니다._

- 본 문서에서 테스트한 WiFi 동글 : [NEXT-201N MINI](http://www.ez-net.co.kr/new_2012/product/view.php?cid=1&sid=78&q=&seq=127&page=&q=&PHPSESSID=865a3c26f3fc4c2368f385ca06602846)

- You can get the list of Wifi Dongles supported by BeagleBone Green from below URL
  - [비글본 보드 지원 WiFi 동글 리스트](http://www.elinux.org/Beagleboard:BeagleBoneBlack#WIFI_Adapters)
  - WiFi 공유기가 5GHz WiFi 채널을 지원한다면 WiFi 동글이 해당 스펙을 지원하는지 확인이 필요합니다.

> Remark: BeagleBone Green should be restarted after the Wifi Dongle is plugged in

<br/>
#### 1. WiFi 동글 설정 방법

<br/>
1) BeagleBone Green should be restarted after the Wifi Dongle is plugged in

<br/>
2) 터미널/Putty를 사용하여 장치에 접속한다.

<br/>
3) Check the Wifi Interface name after connect to BeagleBone Green over ssh.

```bash
@shell:$ iwconfig
wlan0

lo        no wireless extensions.

eth0      no wireless extensions.

usb0      no wireless extensions.
```

- In this example, The Wifi Interface name is ‘ra0`. It is possible that the Wifi Interface has a different name like ‘wlan0’

<br/>
4) Network Setting

a) Open `/etc/network/interfaces` file from the Nano editor

```bash
@shell:$ sudo nano /etc/network/interfaces
```

<br/>
b) Uncomment 2 lines under `# The primary network interface` and 4 lines under `# WiFi Example` (Delete ‘#’). Modify the wifi interface name, wifi SSID and password, properly

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

 - When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor.

<br/>
5) Reboot the device.

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

----------------------------------
<div id='id-bbg-troubleshooting'></div>
### Troubleshooting

* When you can’t find a new sensor and/or gateway from the`Sensor List` page after you register it:

  - It takes about a minute to complete a sensor and/or gateway. So, refresh the “Sensor List” Page 1~2 minutes after you register your sensor and/or gateway
  - If you can’t see your sensor and/or gateway several minutes after you register it, execute below commands on the terminal connected to BeagleBone Green over SSH

    ```bash
    @PC:$ ssh root@<IP Address>
    @BBG:$ cd /opt/thingplus/gateway
    @BBG:$ ./thingplus.sh restart
    @BBG:$ cd log
    @BBG:$ tail -F -n 300 thingplus.log
    ```

<br/>

* When one or more sensors are not registered properly

  - Unregistered sensors will be registered automatically when you reboot your BeagleBone Green


<br/>

* 비글본그린의 IP address를 확인하는 방법

 - 스마트폰의 app store에서 `Fing` app을 설치한다. ([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - 비글본그린이 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
  - 이 중 `beaglebone`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.

