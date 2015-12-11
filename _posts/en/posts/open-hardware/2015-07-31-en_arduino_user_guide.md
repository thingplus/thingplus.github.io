---
title: Arduino User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/arduino-user-guide.html
---

Thing+ Guide for Arduino<br/>
<div id='id-setting'></div>

* [Arduino connection](#id-setting)
* [Arduino Firmware install](#id-firmware)
* [Install ThingPlus Embedded package](#id-package)
* [게이트웨이 등록](#id-register)

_Windows version will be added soon._

<br/>
#### 1. Arduino connection

0) <a href="http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-Arduino-p-1855.html" target="_blank">Grove Starter Kit for Arduino</a>

<br/>
1) Connect Arduino and Grove Sensor Board.
![Arduino + Grove Starter kit](/assets/arduino_grove_board.png)

<br/>
2) Connect sensors to the Grove Sensor Board.<br/>
  Reference : <a href="#" class="ledtip" data-tooltip="">LED polarity</a>

![Arduino + Grove Sensor Board + Sensors](/assets/arduino_sensors.png)

<br/>
3) Connect Arduino and PC via USB cable.
![Arduino + USB Cable](/assets/arduino_usb.png)

<div id='id-firmware'></div>
<br/><br/>
#### 2. Arduino Firmware install
1) Install Arduino IDE upon PC OS environment.

   - <a href="https://www.arduino.cc/en/Main/Software" target="_blank">Download Link</a>

<br/>
2) Run Arduino IDE.


<br/>
3) Select USB for Arduino Port in IDE.

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
6) Download Firmwaare to Arduino.

![Arduino Download](/assets/arduino_ide_upload.png)

<br/>
7) Check if the below message shown at IDE.

![Arduino Download Success](/assets/arduino_ide_upload_done.png)

<div id='id-package'></div>
<br/><br/>
#### 3. Install ThingPlus Embedded package

1) Prepare to download.

```bash
@PC:$ mkdir $HOME/thingplus
@PC:$ cd $HOME/thingplus
```

5) Download the install script file.

```bash
@PC:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_osx_install.sh
```

6) Add excution permission on the script file then Install it.

- It may take some minutes upon network performance.

    ```bash
    @PC:$ chmod 755 thingplus_embedded_sdk_osx_install.sh
    @PC:$ ./thingplus_embedded_sdk_osx_install.sh
    ```

<div id='id-register'></div>
<br/><br/>
#### 4. Gateway Registration
Follow the [Guide to register a gateway](/en/user-guide/registration.html#id-gateway) 
