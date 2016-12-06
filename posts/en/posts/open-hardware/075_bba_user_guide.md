---
title: BeagleBone Air User Guide
tags: "open-hardware"
published: true
img: ic-bbair.png
image: "http://support.thingplus.net/assets/ogp/ogp_bbair.png"
permalink: /en/open-hardware/bba-user-guide.html
---

Thing+ Integration Guide for BeagleBone Air
<div id='id-setting'></div>

1. [Environment Setting](#id-setting)
2. [Install Thing+ Embedded Package](#id-package)
3. [Gatway Registration](#id-register)

<br/>

---

#### 1. Environment Setting

1) Telnet/SSH Client is required for controlling the BeagleBone Green from your PC.

- If you are a Mac or Linux user, please use the default terminal utility.
- If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
- [Putty Download link](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)
- [Putty Manual](http://the.earth.li/~sgtatham/putty/0.58/htmldoc/)

<br/>
2) The example configuration of this guide is as follows.

  - BBA, OLED display, Temperature&Humidity sensor

![BBG + Ehternet + USB Cable](/assets/bba_board_sensors.png)

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

4) Change the hostname of your BBG for identifying it.

> Remark: You can’t move the cursor on the Terminal and/or Putty with your mouse. please use your keyboard to move it.

- Modify `/etc/hostname`.

  ```bash
  @BBA:$ nano /etc/hostname
  ```

- Change the `BeagleBone` in the file to your own name(letter, number and hyphen(-) allowed only) like the below image. 
  ![BBG Modify hostname](/assets/modify_hostname.png)

  - When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor


- To apply your modification, please reboot your BeagleBone Air.

  ```bash
  @BBA:$ reboot
  ```

<div id='id-package'></div>
<br/><br/>

---

#### 2. Install Thing+ Embedded Package

1) Connect Grove Starter kit sensor to BeagleBone Air without Ethernet(LAN cable) and Power Cable.

- I2C HUB: How to Connection BeagleBone Air with I2C hub
![BBG + Grove](/assets/bba_i2chub.png)

- J4: Means a line connecting Beagle Bon Air and I2C HUB.
![BBG + Grove](/assets/bba_sensor_connect.png)

<br/>
2) Connect Ethernet(LAN cable), and Power Cable to BeagleBone Air.

<br/>
3) Connect to your BeagleBone Air

<br/>
4) Make folder to be install Thing+ Embedded Package and move that folder.

```bash
@BBA:$ mkdir /opt/thingplus
@BBA:$ cd /opt/thingplus
```

<br/>
5) Download a install script file.

```bash
@BBA:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bba_install.sh
```


<br/>
6) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

  ```bash
  @BBA:$ chmod 755 thingplus_embedded_sdk_bba_install.sh
  @BBA:$ ./thingplus_embedded_sdk_bba_install.sh
  ```

<br/>
7) Reboot BeagleBone Air.

```bash
@BBA:$ reboot
```

<div id='id-register'></div>
<br/><br/>

---

#### 3. Gatway Registration
Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)




<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>