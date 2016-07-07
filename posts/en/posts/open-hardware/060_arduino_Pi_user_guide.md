---
title: Raspberry Pi + Arduino User Guide
tags: "open-hardware"
published: true
img: ic-raspberrypi-arduino.png
permalink: /en/open-hardware/arduinoPi-user-guide.html
---

Thing+ Guide for Raspberry Pi & Arduino<br/>
<div id='win-setting'></div>

1. [Arduino Firmware install](#id-firmware)
2. [Environment Setting for Devices](#id-setting)
3. [Environment Setting for Raspberry Pi](#id-pi)
4. [Install ThingPlus Embedded package](#id-package)
5. [Gatway Registration](#id-register)


<br/>

---
_It needs connect internetwork to transfer got sensor data from Arduino. but Arduion, itself, can not connect Internet. so arduino is needed Gateway to connect internetwork as PC. This guide will be explained how to integrate arduino using raspberry pi as Gateway_

<br/>

---

#### 1. Arduino Firmware install
1) connect Arduino with PC

<br/>
2) Install Arduino IDE upon PC OS environment.

   - <a href="https://www.arduino.cc/en/Main/Software" target="_blank">Download Link</a>

<br/>
3) Run Arduino IDE.


<br/>
4) Select USB for Arduino Port in IDE. (for windows, COMxx)

   - Tools -> Port -> Arduino/Genuino Uno
![Arduino Select Port](/assets/arduino_ide_select_port.png)

<br/>
5) Select Firmware to download into Arduino.

- File -> Examples -> Firmata -> StandardFirmata
![Arduino Select Firmware](/assets/arduino_ide_select_firmare.png)

<br/>
6) Build Firmware.

![Arduino Verify](/assets/arduino_ide_verify.png)

<br/>
7) upload Firmware to Arduino.

![Arduino upload](/assets/arduino_ide_upload.png)

<br/>
8) Check if the below message shown at IDE.

![Arduino upload Success](/assets/arduino_ide_upload_done.png)


<div id='id-setting'></div>
<br/><br/>

---

#### 2. Environment Setting for Devices

1) <a href="http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-Arduino-p-1855.html" target="_blank">Grove Starter Kit for Arduino</a>

<br/>
2) Connect Arduino and Grove Sensor Board.
![Arduino + Grove Starter kit](/assets/arduino_grove_board.png)

<br/>
3) Connect sensors to the Grove Sensor Board.<br/>

<p class="dwExpand"> Reference : LED polarity</p>

![LED polarity](/assets/led.png)

<div class="dwExpand2"></div>

![Arduino + Grove Sensor Board + Sensors](/assets/arduino_sensors.png)

<br/>

4) Connect cables.

1. Power off (detach power cable).
2. Connect Raspberry Pi with sensors of arduino through USB calble. 
3. Connect USB powser cable and Ethernet(Lan cable) on Raspberry Pi board.

  ![Raspberry Pi + arduino](/assets/adupi1.png)
  ![Raspberry Pi + arduino](/assets/adupi2.png)

<div id='id-pi'></div>
<br/>

---

#### 3. Environment Setting for Raspberry Pi

_ThingPlus Embeded will be installed on Raspberry pi. This guide will be explain about preparation for install_

<br/>
1) Micro SD card(8GB+ storage) is required.

<br/>
2) Download Raspbian image from below link.

   - In case of RaspberryPi 2
     - Raspbian Image Download Link - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2015-09-28/2015-09-24-raspbian-jessie.zip)
     - We recommend `2015-09-24-RASPBIAN JESSIE` version one.
   - In case of RaspberryPi 3
     - Raspbian Image Download Link - [Raspbian Image](https://downloads.raspberrypi.org/raspbian/images/raspbian-2016-05-31/2016-05-27-raspbian-jessie.zip)
     - We recommend `2016-05-27-RASPBIAN JESSIE` version one.


<br/>
3) Intall OS on the micro SD card with the donwloaded image. Please refer the below link for more deails about the OS installation.

- It can take few minutes to install the Raspbian image to the Micro SD card
- [Reference](https://www.raspberrypi.org/documentation/installation/installing-images/)

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
   
   ***For stable Power supply, we recommend that you connect the power cable not USB hub.If the power supply is unstable, the file resource can be broken.*** 

<div id='id-pi-setting-seventh'></div>
<br/>

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

<br/>
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

<br/>
10) Re-connect to your Raspberry Pi. (Refer [`#7 step`](#id-pi-setting-seventh))

<br/>
11) To use micro SD card which has storage bigger than 4GB, Run `raspi-config`.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

<br/>

- To use micro SD card which has storage bigger than 4GB, Choose `1. Expand Filesystem`.
   ![Raspberry Pi + Grove Pi](/assets/expand_file_system.png)

- Press Tab key on your keyboard and choose `Finish`, and then please Select `Yes` for the question about Rebooting the device.
  ![Raspberry Pi Choose Finish](/assets/choose_finish.png)
  ![Raspberry Pi Choose Finish2](/assets/choose_finish_2.png)

<br/>

<div id='id-package'></div>

<br/><br/>

---

#### 4. Install ThingPlus Embedded package

1) Run the `Terminal` to Raspberry Pi

2) Download the install script file.

- In case of RaspberryPi2

  ```bash
  @Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install.sh
  ```

- In case of RaspberryPi3

  ```bash
  @Pi3:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi3_install.sh
  ```

3) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

  - In case of RaspberryPi2

  ```bash
  @Pi2:$ sudo su
  @Pi2:$ chmod 755 thingplus_embedded_sdk_pi_install.sh
  @Pi2:$ ./thingplus_embedded_sdk_pi_install.sh
  ```

  - In case of RaspberryPi3
  
  ```bash
  @Pi3:$ sudo su
  @Pi3:$ chmod 755 thingplus_embedded_sdk_pi3_install.sh
  @Pi3:$ ./thingplus_embedded_sdk_pi3_install.sh
  ```


4) reboot raspberry pi

```bash
@Pi2:$ sudo rebooted
```


<div id='id-register'></div>
<br/>

---

#### 5. Gateway Registration
Follow the [Guide to register a gateway](/en/user-guide/registration.html#id-gateway)

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div> 
