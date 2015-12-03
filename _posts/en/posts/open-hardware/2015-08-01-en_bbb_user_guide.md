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





