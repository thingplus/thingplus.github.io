---
title: Arduino User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/arduino-user-guide.html
---

Thing+ Guide for Arduino<br/>
<div id='win-setting'></div>

1. [Environment Setting for window](#win-setting)
2. [Arduino Firmware install](#id-firmware)
3. [Environment Setting](#id-setting)
4. [Install ThingPlus Embedded package](#id-package)
5. [Gatway Registration](#id-register)


<br/>

---
#### 1. Environment Setting for Windows 

<p class="dwExpand"> View environment setting for Windows</p>

<br/>
1) install Node Js
- install Node JS(v0.10.16)

- <a href="https://nodejs.org/dist/v0.10.16/node-v0.10.16-x86.msi" target="_blank"> 32bit download</a>
- <a href="https://nodejs.org/dist/v0.10.16/x64/node-v0.10.16-x64.msi" target="_blank"> 64bit download</a>

  - `For 64bit` after install `Node Js, then download and run as the follow file.
     - <a href="http://support.thingplus.net/download/install/x86_64_env_set.bat" target="_blank"> download for Environment setting of 64bit </a>

<br/>
2) install Cygwin 

- <a href="https://cygwin.com/setup-x86.exe" target="_blank"> 32bit download</a>
- <a href="https://cygwin.com/setup-x86_64.exe" target="_blank"> 64bit download</a>

- If `Choose Download site` for Cygwin is shown, select `ftp://ftp.kaist.ac.kr`
![Cygwin select ftp site](/assets/cygwin_site_select.png)

- If `Select Package` for Cygwin is shown, select 'wget'

  - Input 'wget' in `Search` field -> Web -> select 1.16.3-1 
![Cygwin wget package select](/assets/cygwin_wget.png)

<br/>

- When installation is completed, then you can show as the follow icon on your desktop.

![Cygwin Icon](/assets/cygwin_icon.png)

<p class="dwExpand2"></p>

* `Mac OS` user is not requierd this process. Go to [Environment Setting](#id-setting)

<div id='id-firmware'></div>
<br/>

---
#### 2. Arduino Firmware install
1) Install Arduino IDE upon PC OS environment.

   - <a href="https://www.arduino.cc/en/Main/Software" target="_blank">Download Link</a>

<br/>
2) Run Arduino IDE.


<br/>
3) Select USB for Arduino Port in IDE. (for windows, COMxx)

   - Tools -> Port -> Arduino/Genuino Uno
![Arduino Select Port](/assets/arduino_ide_select_port.png)

<br/>
4) Select Firmware to download into Arduino.

   - File -> Examples -> Firmata -> StandardFirmata
![Arduino Select Firmware](/assets/arduino_ide_select_firmare.png)

<br/>
5) Build Firmware.

![Arduino Verify](/assets/arduino_ide_verify.png)

<br/>
6) upload Firmware to Arduino.

![Arduino upload](/assets/arduino_ide_upload.png)

<br/>
7) Check if the below message shown at IDE.

![Arduino upload Success](/assets/arduino_ide_upload_done.png)


<div id='id-setting'></div>
<br/><br/>

---
#### 3. Environment Setting

0) <a href="http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-Arduino-p-1855.html" target="_blank">Grove Starter Kit for Arduino</a>

<br/>
1) Connect Arduino and Grove Sensor Board.
![Arduino + Grove Starter kit](/assets/arduino_grove_board.png)

<br/>
2) Connect sensors to the Grove Sensor Board.<br/>

<p class="dwExpand"> Reference : LED polarity</p>

![LED polarity](/assets/led.png)

<div class="dwExpand2"></div>

![Arduino + Grove Sensor Board + Sensors](/assets/arduino_sensors.png)

<br/>
3) Connect Arduino and PC via USB cable.
![Arduino + USB Cable](/assets/arduino_usb.png)

<div id='id-package'></div>
<br/><br/>
<br/><br/>


---
#### 4. Install ThingPlus Embedded package
1) Run the `Terminal`

 - Windows : Run the 'Cygwin Terminal'.

 - Mac OS : Run the 'Terminal'.

2) Prepare to download.

```bash
@PC:$ mkdir $HOME/thingplus
@PC:$ cd $HOME/thingplus
```

3) Download the install script file.

<p class="dwExpand"> For Windows</p>

```bash
@PC:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_win_install.sh
```

<div class="dwExpand2"></div>

<p class="dwExpand"> For Mac OS</p>

```bash
@PC:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_osx_install.sh
```
<div class="dwExpand2"></div>
<br/>

4) Add excution permission on the script file then Install it.

- It may take some minutes upon network performance.

<p class="dwExpand"> For Windows</p>

```
@PC:$ chmod 755 thingplus_embedded_sdk_win_install.sh
@PC:$ ./thingplus_embedded_sdk_win_install.sh
```
<div class="dwExpand2"></div>

<p class="dwExpand"> For Mac OS</p>

```
@PC:$ chmod 755 thingplus_embedded_sdk_osx_install.sh
@PC:$ ./thingplus_embedded_sdk_osx_install.sh
```
<div class="dwExpand2"></div>

<div id='id-register'></div>
<br/><br/>

---
#### 5. Gateway Registration
Follow the [Guide to register a gateway](/en/user-guide/registration.html#id-gateway)

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div> 
