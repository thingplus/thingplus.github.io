---
title: Raspberry Pi with camera module - User Guide
tags: "open-hardware"
image: "http://support.thingplus.net/assets/ogp/ogp_raspi_cam.png"
published: true
img: ic-raspberrypiwithcamera.png
permalink: /en/open-hardware/raspberry-camera-user-guide.html
---


Thing+ Integragtion Guide for Raspberry Pi
<div id='id-setting'></div>


1. [Environment Setting](#id-setting)
2. [Install Thing+ Embedded Package](#id-package)
3. [Integration with dropbox](#id-dropbox)
4. [Gatway Registration](#id-register)

---
___This guide will be explain for IOT with Raspberry Pi and Camera module.
A Photo is a part of privacy. So in this guide, We will use private storage as the dropbox. 
Before you try to do as this guide. you must have account for dropbox.___

---

#### 1. Environment Setting

0) [Go to shop to buy the `Raspberry Pi Camera Module`](http://www.seeedstudio.com/depot/Raspberry-Pi-Camera-Module-p-1659.html?cPath=122_154_158)

1) Micro SD card(8GB+ storage) is required.

2) Download Raspbian image from below link.

- Raspbian Image Download Link - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2015-09-28/2015-09-24-raspbian-jessie.zip)
- We recommend `2015-09-24-RASPBIAN JESSIE` version one.

3) Intall OS on the micro SD card with the donwloaded image. Please refer the below link for more deails about the OS installation.

- It can take few minutes to install the Raspbian image to the Micro SD card
- https://www.raspberrypi.org/documentation/installation/installing-images/

4) Telnet/SSH Client is required for controlling the Raspberry Pi from your PC.

- If you are a Mac or Linux user, please use the default terminal utility.
- If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
- Putty Download link - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

5) Insert the Micro SD card into the Micro SD card slot of the **back panel** of your Raspberry Pi.
![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)

6) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.
![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)


<div id='id-pi-setting-seventh'></div>
7) Please wait your Raspberry Pi is booted up completely, and then Connect to it by using SSH Client(for Windows, the Putty)

- When you can NOT get the IP Address of your device, please refer the [`Troubleshooting`](en/help/troubleshooting.html) section.

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

8) Update time of Raspberry Pi.

- While installing an application, please Enter `y` for installation questions.

  ```bash
  @Pi2:$ sudo su
  @Pi2:$ apt-get update
  @Pi2:$ apt-get install -y --force-yes ntp ntpdate
  @Pi2:$ ntpdate -u ntp.ubuntu.com
  ```

- If you failed to update the time, Update it directly.

  - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @Pi2:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

9) To distinguish your Raspberry Pi, you need to modify the hostname of it.

> Notice: You MUST use arrow buttons on your keyboard, when you want to move a cursor
  
- Modify `/etc/hostname`.

  ```bash
  @Pi2:$ sudo nano /etc/hostname
  ```

- Change the `raspberrypi` in the file to your own name(letter, number and hyphen(-) allowed only) like the below image.
  ![Raspberry Pi Modify hostname](/assets/modify_hostname.png)

  - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.


- Modify `/etc/hosts`.

  ```bash
  @Pi2:$ sudo nano /etc/hosts
  ```

- Change the `raspberrypi` in the file to the same name you changed at before step.
  ![Raspberry Pi Modify hosts](/assets/modify_hostname_2.png)

  - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.


- To apply your modification, please reboot your Raspberry Pi.

  ```bash
  @Pi2:$ sudo reboot
  ```

10) Re-connect to your Raspberry Pi. (Refer [`#7 step`](#id-pi-setting-seventh))

11) For configration of Environments for Raspberry, Run the `raspi-config`

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   
- To use micro SD card which has storage bigger than 4GB, Choose `1. Expand Filesystem`.
  ![Raspberry Pi + Grove Pi](/assets/expand_file_system.png)

   
- To Use Camera module, Choose `5. Enable Camera` 
  ![Raspberry Pi Setting Enable camera](/assets/pi-cam-01.png)
  ![Raspberry Pi Setting confirm](/assets/pi-cam-02.png)

   
- Press Tab key on your keyboard and choose `Finish`, and then please Select `Yes` for the question about Rebooting the device.
  ![Raspberry Pi Choose Finish](/assets/choose_finish.png)
  ![Raspberry Pi Choose Finish](/assets/choose_finish_2.png)


<div id='id-package'></div>

---

#### 2. Install Thing+ Embedded Package

1) Connect Camera module on Raspberry Pi

![Raspberry Pi + Camera](/assets/pi-cam-03.png)

![Raspberry Pi + Camera](/assets/pi-cam-04.png)


2) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.


3) Connect to your Raspberry Pi.


4) Download a install script file.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install.sh
```

5) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

  ```bash
  @Pi2:$ sudo su
  @Pi2:$ chmod 755 thingplus_embedded_sdk_pi_install.sh
  @Pi2:$ ./thingplus_embedded_sdk_pi_install.sh
  ```

6) Reboot Raspberry Pi

```bash
@Pi2:$ sudo reboot
```

<div id='id-dropbox'></div>

---

#### 3. Integration with dropbox
_To interation with dropbox, please set up as the following._

1) Create app key

``` bash
@Pi2:$ cd /usr/local/bin
@Pi2:$ ./dropbox_uploader.sh
```
  - Create `app key` as the following.
  ![uploader.sh](/assets/pi-cam-05.png)
  
  - [Connect dropbox](https://www.dropbox.com/developers/apps) and lon-in
  - Press `Create App` button.
  ![dropbox](/assets/pi-cam-06.png)

  - Press `Create app` after input some configration factor.
  ![dropbox config](/assets/pi-cam-07.png)
  
  - `app key` and `app secret` is created
  ![dropbox key](/assets/pi-cam-08.png)

  - Authorization through OAth. please input the created `app key` and `app secrete`

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

  - Confirm `OAuth Ahthorization prompt`
  ![dropbox](/assets/pi-cam-09.png)  
  ![dropbox](/assets/pi-cam-10.png)


<div id='id-register'></div>

---

#### 3. Gateway Registration

Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)

<div id='id-wifi-set'></div>



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
