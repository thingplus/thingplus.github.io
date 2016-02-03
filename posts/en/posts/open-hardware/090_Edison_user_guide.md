---
title: Edison User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/edison-user-guide.html
---

Thing+ Integration Guide for Edison
<div id='id-setting'></div>

1. [Environment Setting](#id-setting)
2. [Install ThingPlus Package](#id-package)
3. [Set Hostname](#id-hostname)
4. [Gateway Registration](#id-register)

<br/>

---

#### 1. Environment Setting

0) [Grove starter sensor kit](http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-Arduino-p-1855.html)

<br/>
1) Assemble your board

- [Reference](https://software.intel.com/en-us/articles/assemble-intel-edison-on-the-arduino-board)
- Plug in the power supply. 
- Plug in 2 micro-USB cable to the USB connector on the expansion board. (Plug the other end of the USB cable in to your computer.)
  ![connection](/assets/edison_connect.png)

- Find the microswitch in between the USB ports on the expansion board. Switch the microswitch down towards the micro-USB ports, if it isn't already.
  ![switch](/assets/edison_ext.png)

<br/>
2) Connect with Grove base shield.

![Edison + Grove kit](/assets/edison_base.png)
   
<br/>
3) Connect with Sensors. 

<p class="dwExpand"> LED Polarity </p>

![LED Polarity](/assets/led.png)

<div class="dwExpand2"></div>

![Edison + Grove Starter kit](/assets/edison_sensor.png)

<br/>
4) Update firmware of Edison.
  
- In case of old version, connecing of WiFi is unstable.
- [Install "Firmware Installer"](https://software.intel.com/en-us/iot/software/installers)
  ![installer](/assets/intel_installer.png)
  ![installer](/assets/intel_installer2.png)

<br/>
5) Connect to Edison by using USB.

- If you are a Mac or Linux user, please use the default terminal utility.
- If you are a Windows user, we recommend that you use the "Putty" client.
- [Install Putty](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

<p class="dwExpand"> For Mac OSX and Linux</p>

- In case of Linux, you should be install "screen".
  - apt-get install screen

  ```
  screen -L /dev/cu.usbserial_XXXXXX 115200 (MAC)
  ```

- if you can't find "/dev/cb.usbserial_XXXX", then reboot device.
- When Termianl screen is changed, Press `Enter`.
- account : root, Password is none.

<div class="dwExpand2"></div>

<p class="dwExpand"> For windows</p>

- Select to `Serial` then set to `serial line` and `speed`. speed set to `115200`.
![putty](/assets/putty.png)

- `Serial line` is COM port for Edison , `COMXX`.
- account : root, Password is none.

<div class="dwExpand2"></div>


<br/>
6) Set To Password.

``` bash
configure_edison --password
```

<br/>
7) Connect to WiFi

```
configure_edison --wifi
```

- Your board will scan for Wi-Fi networks for approximately 10 seconds. When it is finished, a list of available networks will be displayed. If you don’t see any networks, enter 0 to rescan.
- Choose the network you would like to connect to, type the corresponding number from the list, and press Enter. To confirm your entry, type Y and press Enter.
- When you see a Done message, your board is connected to a Wi-Fi network.
- Note the IP Address. This is your board’s IP Address

<div id='id-package'></div>
 
<br/>

---

#### 2. Install ThingPlus Package

1) Make folder to be install Thing+ Embedded Package and move that folder.
   
```bash
edison:~/# mkdir /opt/thingplus
edison:~/# cd /opt/thingplus
```

2) Download a install script file. ([Install wget](/en/help/faq.html#install_wget))

```
wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_edison_install.sh
```

3) Grant a run permission to the script you downloaded and Install the Thing+ Embedded Package.

- It can take few minutes to install the Thing+ Embedded Package.

  ```bash
  edison:/opt/thingplus# chmod 755 thingplus_embedded_sdk_edison_install.sh
  edison:/opt/thingplus# ./thingplus_embedded_sdk_edison_install.sh
  ```

<div id='id-hostname'></div>

<br/>

---

#### 3. Set Host name

1) Change the hostname of your Edison for identifying it.

> Remark: You can’t move the cursor on the Terminal and/or Putty with your mouse. please use your keyboard to move it.

- Modify `/etc/hostname`

  ```bash
  edison:~/# vi /etc/hostname
  ```

- Change the `Edison' in the file to your own name(letter, number and hyphen(-) allowed only) like the below image.
  ![Modify hostname](/assets/vi_hostname.png)

  - When you complete the edit task, press `CTRL-O`and `Enter` for saving the updates. Press `CTRL-X` to close the nano editor.

<br/>

2) To apply your modification, please reboot your Edison.

```
edison:~/# reboot
```


<div id='id-register'></div>

---

#### 4. Gateway Registration

- Please Refer[Gateway Registration](/en/user-guide/registration.html#id-gateway) 


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
