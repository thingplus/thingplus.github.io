---
title: BeagleBone Green User Guide
tags: "open-hardware"
published: true
img: ic-bbg.png
permalink: /en/open-hardware/bbb-user-guide.html
---

Thing+ Integration Guide for BeagleBone Green
<div id='id-setting'></div>

1. [Environment Setting](#id-setting)
2. [Install Thing+ Embedded Package](#id-package)
3. [Gatway Registration](#id-register)
4. [How to configure the Wifi Dongle](#id-wifi-set)
5. [How to connect your Beagle Bone Green with your computer](#id-usb-set)

<br/>

---

#### 1. Environment Setting

0) [Go to shop to buy the Grove Starter Kit](http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-BeagleBone-Green-p-2526.html)

<br/>
1) Telnet/SSH Client is required for controlling the BeagleBone Green from your PC.

- If you are a Mac or Linux user, please use the default terminal utility.
- If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
- [Putty Download link](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)
- [Putty Manual](http://the.earth.li/~sgtatham/putty/0.58/htmldoc/)

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

> Notice : BeagleBone Green is possible to connect with PC and USB cable. Please refer the [`How to connect with USB on Beaglebone Green`](#id-bbg-usbconnect) section.

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

- Change the `BeagleBone` in the file to your own name(letter, number and hyphen(-) allowed only) like the below image. 
  ![BBG Modify hostname](/assets/modify_hostname.png)

  - When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor


- To apply your modification, please reboot your BeagleBone Green.

  ```bash
  @BBG:$ reboot
  ```

<div id='id-package'></div>

<br/><br/>

---

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
<div id='id-register'></div>

<br/><br/>

---

#### 3. Gatway Registration
Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)

<div id='id-wifi-set'></div>

--------------------

### [Optional] WiFi Dongle Setting

_This docuement is based on **NEXT-201N MINI** but you can refer this for other kinds of Wifi dongle._

- The Wifi Dongle Model used for this Guide : <a href="http://www.ez-net.co.kr/new_2012/product/view.php?cid=1&sid=78&q=&seq=127&page=&q=&PHPSESSID=865a3c26f3fc4c2368f385ca06602846" target="_blank">NEXT-201N MINI</a>

- You can get the list of Wifi Dongles supported by BeagleBone Green from below URL
  - <a href="http://www.elinux.org/Beagleboard:BeagleBoneBlack#WIFI_Adapters" target="_blank">list of Wifi Dongles supported by BeagleBone Green</a>
  - If your Wifi router can support the 5GHz Wifi Channel, your Wifi dongle should support the same spec

> Remark: BeagleBone Green should be restarted after the Wifi Dongle is plugged in

<br/>

---

#### How to configure the Wifi Dongle

<br/>
1) BeagleBone Green should be restarted after the Wifi Dongle is plugged in

<br/>
2) Connect to your device over SSH.
(You should use the telnet/ssh client applicatin like putty or the default terminal client on Mac OS. We recommend to use the Putty Client for Windows Users)

<br/>
3) Check the Wifi Interface name after connect to BeagleBone Green over ssh.

```bash
@shell:$ ifconfig

wlan0
lo        no wireless extensions.
eth0      no wireless extensions.
usb0      no wireless extensions.
```

- In this example, The Wifi Interface name is ‘ra0`. It is possible that the Wifi Interface has a different name like ‘wlan0’

<br/>
4) Network Setting

- Open `/etc/network/interfaces` file from the Nano editor

  ```bash
  @shell:$ sudo nano /etc/network/interfaces
  ```

- Uncomment 2 lines under `# The primary network interface` and 4 lines under `# WiFi Example` (Delete ‘#’). Modify the wifi interface name, wifi SSID and password, properly

  ```bash
  ...

  # The primary network interface
  auto eth0       :# remove ‘#’ from the beginning of this line
                  :# It is possible that you can see ‘allow-hotplug eth0’ instead of ‘auto eth0’_
  iface eth0 inet dhcp  :# remove ‘#’ from the beginning of this line
  # Example to keep MAC address between reboots
  #hwaddress ether DE:AD:BE:EF:CA:FE

  ...

  # WiFi Example
  auto wlan0                    :# Change ‘ra0’ to the interface name which you used(In this example, we used ‘wlan0’ and changed ‘ra0’ to ‘wlan0’)
  iface wlan0 inet dhcp         :# remove ‘#’ from the beginning of this line. If you still use ‘ra0’ as the interface name, you should use it at this line
      wpa-ssid "WiFi SSID"      :# Input your Wifi SSID name
      wpa-psk  "WiFI password"  :# Input your Wifi password at here and remove ‘#’ from the beginning 
  ...

  ```

- When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor.

<br/>
5) Reboot the device.

<div id='id-bbg-usbconnect'></div>
> Remark: Connection between your device and DC 5V Power Adaptor is required for using the Wifi Dongle because a Wifi Dongle consumes much more power than normal

<div id='id-usb-set'></div>

----------------------------------

### How to connect your Beagle Bone Green with your computer

_Curretnly, the Beagle Bone Green Driver for Mac OS X El Capitan is not available(**we checked on 12/3/2015**)_
<br/>

Please refer to  <a href="http://joshuawise.com/horndis" target="_blank">here</a>.

1) Download and Install the proper Beagle Bone Green Driver. You can download the driver from below links for your OS

- [For Windows 64bit](http://beagleboard.org/static/Drivers/Windows/BONE_D64.exe)
- [For Windows 32bit](http://beagleboard.org/static/Drivers/Windows/BONE_DRV.exe)
- [For Linux](http://beagleboard.org/static/Drivers/Linux/FTDI/mkudevrule.sh)
- Serial Driver for Mac OS X 글
  - [Serial Driver for Mac OS X 10.3 ~ 10.4 32bit](http://www.ftdichip.com/drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_2_18.dmg)
  - [Serial Driver for Mac OS X 10.3 ~ 10.8 64bit](http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_2_18.dmg)
  - [Serial Driver for Mac OS X 10.9 ~ 현재 64bit Serial Driver](http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_3.dmg)
- [Network Driver for Mac OS X](http://joshuawise.com/downloads/HoRNDIS-rel7.pkg)

<br/>
2) Telnet/SSH Client Application is requried for controlling the Beagle Bone Green Device

- You can use your default terminal client for the Mac and/or Linux OS
- We recommend to use ‘Putty’ Client App for the Windows Users
- [Putty Donwload Link](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)
- [Putty Manual](http://the.earth.li/~sgtatham/putty/0.58/htmldoc/)

<br/>
3) Connect your Beagle Bone Green with your Computer. You can use the USB Micro 5pin Cable provided with your Beagle Bone Green 

![BBG + USB Cable](/assets/bbg_usb_cable.png)

<br/>
4) Connect to your your device over SSH after your device is booted completely.(In general, it takes 2~3 minutes.)

- For Mac & Linux

  ```
  $ ssh root@192.168.7.2
  ```

- For Windows
  - Run the putty, and Insert IP Address, and then, Click the button `Open` and Enter a password. 
  ![BBG putty login](/assets/putty_usb_login_bbg.png)

> Remark: In case of Windows OS, You should close and run your putty clinet every time when you reboot your Beagle Bone Green Device

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>