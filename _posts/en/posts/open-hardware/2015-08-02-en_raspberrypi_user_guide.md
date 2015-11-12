---
title: Raspberry PI User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/raspberry-pi-user-guide.html
---

Thing+ Integragtion Guide for Raspberry Pi

<br/>
#### 1. Environment Setting

0) [Go to shop to buy the GrovePi+ Starter Kit](http://www.seeedstudio.com/depot/GrovePi-Starter-Kit-for-Raspberry-Pi-p-2240.html)

<br/>
1) Micro SD card(8GB+ storage) is required.

<br/>
2) Download Raspbian image from below link.

   - https://www.raspberrypi.org/downloads/raspbian/
   - We recommend `RASPBIAN JESSIE` version one.

<br/>
3) Intall OS on the micro SD card with the donwloaded image. Please refer the below link for more deails about the OS installation.

   - It can take few minutes to install the Raspbian image to the Micro SD card
   - https://www.raspberrypi.org/documentation/installation/installing-images/

<br/>
4) Telnet/SSH Client is required for controlling the Raspberry Pi from your PC.

   - If you are a Mac or Linux user, please use the default terminal utility.
   - If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
   - Putty Download link - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

<br/>
5) Insert the Micro SD card into the Micro SD card slot of the **back panel** of your Raspberry Pi.
   ![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)

<br/>
6) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.
   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)

<br/>
<div id='id-pi-setting-seventh'></div>
7) Please wait your Raspberry Pi is booted up completely, and then Connect to it by using SSH Client(for Windows, the Putty)

   - When you can NOT get the IP Address of your device, please refer the [`Troubleshooting`](#id-pi-troubleshooting) section.

   - ID: **pi**
   - Password: **raspberry**

    ```bash
    $ ssh pi@<IP Address>
    pi@<IP Address>'s password: raspberry
    ```

     - Example for Mac & Linux

        ```bash
        $ ssh pi@192.168.1.XXX
        pi@<IP Address>'s password: raspberry
        ```

     - Example for Windows

       - Run the putty, and Insert your IP Address, and then, Click the button `Open` and Enter a password.
       ![Raspberry Pi putty login](/assets/putty_login.png)
       ![Raspberry Pi putty login](/assets/putty_login_2.png)

> Notice: In case of Windows, you have to re-launch putty, when Raspberry Pi is rebooted.

<br/>
8) Update time of Raspberry Pi.

- While installing an application, please Enter `y` for installation questions.

```bash
@Pi2:$ sudo su
@Pi2:$ apt-get update
@Pi2:$ apt-get install ntp ntpdate
@Pi2:$ ntpdate -u ntp.ubuntu.com
```

- If you failed to update the time, Update it directly.

 - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @Pi2:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

<br/>
9) To distinguish your Raspberry Pi, you need to modify the hostname of it.

> Notice: You MUST use arrow buttons on your keyboard, when you want to move a cursor
  
  - Modify `/etc/hostname`.

    ```bash
    @Pi2:$ sudo nano /etc/hostname
    ```

   - Change the `raspberrypi` in the file to your own name(letter, number and hyphen(-) allowed only) like the below image.
   ![Raspberry Pi Modify hostname](/assets/modify_hostname.png)

     - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

<br/>

 - Modify `/etc/hosts`.

    ```bash
    @Pi2:$ sudo nano /etc/hosts
    ```

   - Change the `raspberrypi` in the file to the same name you changed at before step.
   ![Raspberry Pi Modify hosts](/assets/modify_hostname_2.png)

 - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

<br/>

 - To apply your modification, please reboot your Raspberry Pi.

    ```bash
    @Pi2:$ sudo reboot
    ```

<br/>
10) Re-connect to your Raspberry Pi. (Refer [`#7 step`](#id-pi-setting-seventh))

<br/>
11) To use micro SD card which has storage bigger than 4GB, Run `raspi-config`.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   <br/>
   a. To use micro SD card which has storage bigger than 4GB, Choose `1. Expand Filesystem`.
   ![Raspberry Pi + Grove Pi](/assets/expand_file_system.png)

   <br/>
   b. To use I2C, Choose `8. Advanced Options` --> `A7. I2C`, and then please Select `Yes` for all the following questions.
   ![Raspberry Pi + Grove Pi](/assets/advanced_options.png)

   ![Raspberry Pi + Grove Pi](/assets/choose_i2c.png)

   <br/>
   c. Press Tab key on your keyboard and choose `Finish`, and then please Select `No` for the question about Rebooting the device.
   ![Raspberry Pi Choose Finish](/assets/choose_finish.png)

   ![Raspberry Pi Choose Finish](/assets/choose_finish_2.png)

   <br/>
   d. Open /etc/modules file and add two new lines(`i2c-dev`, `i2c-bcm2708`) on that file.

```bash
@Pi2:$ nano /etc/modules
```

   ![Raspberry Pi Add i2c settings](/assets/add_i2c_lines.png)

   - `i2c-dev` could be already added, because it depends on Raspbian's version.
   - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

<br/>
12) Reboot Raspberry Pi

```bash
@Pi2:$ sudo reboot
```

<br/><br/>
#### 2. Install Thing+ Embedded Package

1) Connect Grove Pi+ shield, Sensors to Raspberry Pi without Ethernet(LAN cable) and Power Cable.
   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.png)

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi_2.jpg)

<br/>
2) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.
![Raspberry Pi + Grove Pi + Power + Ethernet](/assets/rasp_grovePi_power_ethernet.png)

<br/>
3) Connect to your Raspberry Pi.

<br/>
4) Download [nodejs](https://nodejs.org) and Install it.

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
5) Make a new folder where the Thing+ Embedded Package will be installed and Move to it.

```bash
@Pi2:$ mkdir /opt/thingplus
@Pi2:$ cd /opt/thingplus
```

<br/>
6) Download a install script file.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_install.sh
```

<br/>
7) Grant a run permission to the script you downloaded and Run it.

```bash
@Pi2:$ sudo chmod 755 thingplus_embedded_sdk_install.sh
@Pi2:$ sudo ./thingplus_embedded_sdk_install.sh
```

<br/>
8) Install the Thing+ Embedded Package.

```bash
@Pi2:$ sudo su
@Pi2:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
@Pi2:$ npm install
@Pi2:$ sudo reboot
```

<br/><br/>
#### 3. Raspberry Pi Registration
Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)

--------------------
<div id='id-pi-troubleshooting'></div>
### Troubleshooting

* When you can NOT find a new sensor and/or gateway from the`Sensor` page after you registered it:

 - It takes few minutes to register sensors and gateways, so please Refresh the Sensor page after 1~2 minutes.
 - If you still can NOT find them after few minutes, please Connect to your Raspberry Pi, and Try run below commands.

    ```
    @PC:$ ssh pi@<IP Address>
    @Pi2:$ cd /opt/thingplus/gateway
    @Pi2:$ ./thingplus.sh restart
    @Pi2:$ cd log
    @Pi2:$ tail -F -n 300 thingplus.log
    ```

<br/>

* When you can NOT find some sensors:

  - Unregistered snesors will be added automatically, when you reboot your Raspberry Pi.

<br/>

* Wehn you can NOT know the IP Address of your Raspberry Pi:

  - Install `Fing` App on your mobile phone([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - Connect to WiFi network of your router that your Raspberry Pi is connected.
  - Run `Fing`. You can sell all the devices with the IP Adresses in the same Network.
  - You can find the name, `raspberrypi`. It is the IP Address of your Raspberry, and you can connect to your device using it.
