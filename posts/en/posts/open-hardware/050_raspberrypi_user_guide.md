---
title: Raspberry PI User Guide
tags: "open-hardware"
published: true
img: ic-raspberrypi.png
permalink: /en/open-hardware/raspberry-pi-user-guide.html
---

Thing+ Integragtion Guide for Raspberry Pi
<div id='id-setting'></div>

1. [Environment Setting](#id-setting)
2. [Install Thing+ Embedded Package](#id-package)
3. [Gatway Registration](#id-register)
4. [How to configure the Wifi Dongle](#id-wifi-set)

<br/>

---

#### 1. Environment Setting
<br/>

0) [Go to shop to buy the GrovePi+ Starter Kit](http://www.seeedstudio.com/depot/GrovePi-Starter-Kit-for-Raspberry-Pi-CE-certified-p-2572.html)

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
   
   ***For stable Power supply, we recommend that you connect the power cable not USB hub.If the power supply is unstable, the file resource can be broken.*** 
   
   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)

<br/>
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

<br/>
8) Update time of Raspberry Pi.

- While installing an application, please Enter `y` for installation questions.

  ```bash
  @Pi:$ sudo su
  @Pi:$ apt-get update
  @Pi:$ apt-get install -y --force-yes ntp ntpdate
  @Pi:$ ntpdate -u ntp.ubuntu.com
  ```

- If you failed to update the time, Update it directly.

  - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @Pi:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

<br/>
9) To distinguish your Raspberry Pi, you need to modify the hostname of it.

> Notice: You MUST use arrow buttons on your keyboard, when you want to move a cursor
  
- Modify `/etc/hostname`.

  ```bash
  @Pi:$ sudo nano /etc/hostname
  ```

- Change the `raspberrypi` in the file to your own name(letter, number and hyphen(-) allowed only) like the below image.
  ![Raspberry Pi Modify hostname](/assets/modify_hostname.png)

  - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

<br/>

- Modify `/etc/hosts`.

  ```bash
  @Pi:$ sudo nano /etc/hosts
  ```

- Change the `raspberrypi` in the file to the same name you changed at before step.
  ![Raspberry Pi Modify hosts](/assets/modify_hostname_2.png)

  - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.


- To apply your modification, please reboot your Raspberry Pi.

  ```bash
  @Pi:$ sudo reboot
  ```

10) Re-connect to your Raspberry Pi. (Refer [`#7 step`](#id-pi-setting-seventh))

11) To use micro SD card which has storage bigger than 4GB, Run `raspi-config`.

```bash
@Pi:$ sudo su
@Pi:$ raspi-config
```
 
- To use micro SD card which has storage bigger than 4GB, Choose `1. Expand Filesystem`.
![Raspberry Pi + Grove Pi](/assets/expand_file_system.png)


- To use I2C, Choose `8. Advanced Options` --> `A7. I2C`, and then please Select `Yes` for all the following questions.
![Raspberry Pi + Grove Pi](/assets/advanced_options.png)
![Raspberry Pi + Grove Pi](/assets/choose_i2c.png)


- Press Tab key on your keyboard and choose `Finish`, and then please Select `No` for the question about Rebooting the device.
![Raspberry Pi Choose Finish](/assets/choose_finish.png)
![Raspberry Pi Choose Finish](/assets/choose_finish_2.png)

- Open /etc/modules file and add two new lines(`i2c-dev`, `i2c-bcm2708`) on that file.

  ```bash
  @Pi:$ nano /etc/modules
  ```

  ![Raspberry Pi Add i2c settings](/assets/add_i2c_lines.png)

  - `i2c-dev` could be already added, because it depends on Raspbian's version.
  - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

12) Reboot Raspberry Pi

```bash
@Pi:$ sudo reboot
```
<div id='id-package'></div>

<br/>

---

#### 2. Install Thing+ Embedded Package

1) Connect Grove Pi+ shield, Sensors to Raspberry Pi without Ethernet(LAN cable) and Power Cable.
<p class="dwExpand"> Reference : LED polarity</p>

![LED polarity](/assets/led.png)

<div class="dwExpand2"></div>

![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.png)
![Raspberry Pi + Grove Pi](/assets/rasp_grovePi_2.jpg)

2) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.
![Raspberry Pi + Grove Pi + Power + Ethernet](/assets/rasp_grovePi_power_ethernet.png)

3) Connect to your Raspberry Pi.

4) Download a install script file.

```bash
@Pi:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install.sh
```

5) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

  ```bash
  @Pi:$ sudo su
  @Pi:$ chmod 755 thingplus_embedded_sdk_pi_install.sh
  @Pi:$ ./thingplus_embedded_sdk_pi_install.sh
  ```


6) Reboot Raspberry Pi

```bash
@Pi:$ sudo reboot
```
<div id='id-register'></div>


---

#### 3. Gateway Registration

Plesase refer [Gateway Registration](/en/user-guide/registration.html#id-gateway)

<div id='id-wifi-set'></div>

--------------------


<p class="dwExpand"> [Optional] How to configure the Wifi Dongle</p>

### How to configure the Wifi Dongle

_This docuement is based on **TP-LINK TL-WN727N** but you can refer this for other kinds of Wifi dongle_

- The Wifi Dongle Model used for this Guide : [TP-LINK TL-WN727N](http://www.tp-link.co.kr/products/details/?model=TL-WN727N)

- You can find out the list of Wifi Dongles supported by Raspberry Pi from the below URL
  - [The list of Wifi Dongles supported by Raspberry Pi](http://elinux.org/RPi_USB_Wi-Fi_Adapters)
  - If your Wifi router can support the 5GHz Wifi Channel, your Wifi dongle should support the same spec

> Remark: You should reboot your Raspberry Pi after you plug the Wifi dongle into the Raspberry Pi

<br/>

---

#### 1. How to configure the Wifi Dongle

<br/>
1) reboot your Raspberry Pi after you plug the Wifi dongle into the Raspberry Pi

<br/>
2) Connect to your Raspberry Pi over SSH

<br/>
3) Check `Wifi Interface Name`

```bash
@shell:$ iwconfig
wlan0

lo        no wireless extensions.

eth0      no wireless extensions.

usb0      no wireless extensions.
```

- In this guide, The Wifi Interface Name is `wlan0`. The interface name can be different per each Wifi Dongle like `wlan#`or `ra#` (‘#’ stands for Number)

<br/>
4) Network Configuration

- open `/etc/network/interfaces` with nano editor

  ```bash
  @shell:$ sudo nano /etc/network/interfaces 
  ```

- Configure the Wifi SSID and password at the next line of `wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf` in `auto wlan0` paragraph

- `wlan0` is the `WiFi interface name`

  ```bash
  ...

  auto wlan0                    # If WiFi interface name is 'ra0',
  allow-hotplug wlan0           # Change 'wlan0' to 'ra0' in this paragraph
  iface wlan0 inet manual
  wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
  wpa-ssid "WiFi SSID"        # Input your Wifi SSID Name 
  wpa-psk  "WiFI password"    # Input your Wifi Password

  ...

  ```

- When you complete the edit task, press `CTRL-O` and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor.

<br/>
5) Reboot your device

> Remark: Connection between your device and DC 5V Power Adaptor is required for using the Wifi Dongle because a Wifi Dongle consumes much more power than normal


<div class="dwExpand2"></div>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
