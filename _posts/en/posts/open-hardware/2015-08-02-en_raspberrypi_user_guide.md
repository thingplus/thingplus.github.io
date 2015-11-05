---
title: Raspberry PI User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/raspberry-pi-user-guide.html
---

Thing+ Integragtion Guide for Raspberry Pi

#### 1. Environment Setting

0) [Go to shop to buy the GrovePi+ Starter Kit](http://www.seeedstudio.com/depot/GrovePi-Starter-Kit-for-Raspberry-Pi-p-2240.html)

1) Micro SD card(8GB+ storage) is required.

2) Download Raspbian image from below link.

   - https://www.raspberrypi.org/downloads/raspbian/
   - We recommend `RASPBIAN JESSIE` version one.

3) Intall OS on the micro SD card with the donwloaded image. Please refer the below link for more deails about the OS installation.

   - https://www.raspberrypi.org/documentation/installation/installing-images/

4) Telnet/SSH Client is required for controlling the Raspberry Pi from your PC.

   - If you are a Mac or Linux user, please use the default terminal utility.
   - If you are a Windows user, we recommend that you use the "Putty" client to access your Raspberry Pi.
   - Putty Download link - http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

5) Insert the micro SD card into your Raspberry Pi.

   ![Raspberry Pi + Micro SD card](/assets/insert_sdcard.png)

6) Connect Ethernet(LAN cable), and Power Cable to Raspberry Pi.

   ![Raspberry Pi + Ethernet & power cable](/assets/rasp_power_ethernet.jpg)

7) Please wait your Raspberry Pi is booted up completely, and then Connect to it by using SSH Client(for Windows, the Putty)

   - When you can NOT get the IP Address of your device, please refer the `Troubleshooting` section.

```bash
$ ssh pi@<IP Address>
pi@<IP Address>'s password: raspberry
```

8) To distinguish your Raspberry Pi, you need to modify the hostname of it.
  
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

 - To apply your modification, please reboot your Raspberry Pi.

   ```bash
   @Pi2:$ sudo reboot
   ```

9) To use micro SD card which has storage bigger than 4GB, Run `raspi-config`.

```bash
@Pi2:$ sudo su
@Pi2:$ raspi-config
```

   a. To use micro SD card which has storage bigger than 4GB, Choose `1. Expand Filesystem`.

   ![Raspberry Pi + Grove Pi](/assets/expand_file_system.png)

   b. To use I2C, Choose `8. Advanced Options` --> `A7. I2C`, and then please Select `Yes` for all the following questions.

   ![Raspberry Pi + Grove Pi](/assets/advanced_options.png)

   ![Raspberry Pi + Grove Pi](/assets/choose_i2c.png)

   c. Press Tab key on your keyboard and choose `Finish`, and then please Select `No` for the question about Rebooting the device.

   d. Open /etc/modules file and add two new lines(`i2c-dev`, `i2c-bcm2708`) on that file.

   ```bash
   @Pi2:$ nano /etc/modules
   ...
   i2c-dev
   i2c-bcm2708
   ```

   - `i2c-dev` could be already added, because it depends on Raspbian's version.

   - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

#### 2. Install Thingplus application

1) Connect Grove Pi+ shield, Sensors, Ethernet(LAN cable), and power cable to Raspberry Pi.

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi.jpg)

   ![Raspberry Pi + Grove Pi](/assets/rasp_grovePi_2.jpg)

2) Download nodejs and Install it.

```bash
@Pi2:$ sudo su
@Pi2:$ wget http://nodejs.org/dist/v0.10.16/node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ tar xvfz node-v0.10.16-linux-arm-pi.tar.gz
@Pi2:$ cd node-v0.10.16-linux-arm-pi
@Pi2:$ rsync -a bin lib share /usr/local/
@Pi2:$ node --version
v0.10.16
```

3) Make a new folder where the thingplus application will be installed and Move to it.

```bash
@Pi2:$ mkdir /opt/thingplus
@Pi2:$ cd /opt/thingplus
```

4) Download a install script file.

```bash
@Pi2:$ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_install.sh
```

5) Set two paths for components of the thingplus application.

```bash
@Pi2:$ nano thingplus_embedded_sdk_install.sh
```

   - Add paths you want to use after both `USER_THINGPLUS_GATEWAY_DEST=` and `USER_SDK_DEST=`.

     ```bash
     #Destination directory for Thing+ Gateway
     USER_THINGPLUS_GATEWAY_DEST='path_to_gateway'

     #Destination directory for Open Hardware SDK
     USER_SDK_DEST='path_to_open_hw_sdk'
     ```

     - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

     - Example

       ```bash
       #Destination directory for Thing+ Gateway
       USER_THINGPLUS_GATEWAY_DEST=./gateway

       #Destination directory for Open Hardware SDK
       USER_SDK_DEST=.
       ```

6) Grant a run permission to the script you downloaded and Run it.

```bash
@Pi2:$ sudo chmod 755 thingplus_embedded_sdk_install.sh
@Pi2:$ sudo ./thingplus_embedded_sdk_install.sh
```

7) Reboot your Raspberry Pi.

```bash
@Pi2:$ sudo reboot
```

8) Connect to your Raspberry Pi and Install the thingplus application.

```bash
@Pi2:$ sudo su
@Pi2:$ cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit
@Pi2:$ npm install
@Pi2:$ sudo reboot
```

 - Example
   
   ```bash
   @Pi2:$ sudo su
   @Pi2:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
   @Pi2:$ npm install
   @Pi2:$ sudo reboot
   ```

#### 3. Raspberry Pi Registration

1) Register your Raspberry Pi to Thing+ Portal, for more inforamtion, please refer [`Gateway Registration`](/en/user-guide/registration.html#id-gateway).

   - When you select `Gateway Model`, Choose `Raspberry Pi - Developer`.

   - When you select `Device Model`, Choose `GrovePi+ Starter Kit`.

   - Way to get your MAC Address is below

     ```bash
     @Pi2:$ cd /opt/thingplus/'path_to_gateway'/scripts
     @Pi2:$ ./getmac
     Your MAC address is as below
     xx:xx:xx:xx:xx:xx
     ```

     - Example

       ```bash
       @Pi2:$ cd /opt/thingplus/gateway/scripts
       @Pi2:$ ./getmac
       Your MAC address is as below
       xx:xx:xx:xx:xx:xx
       ```

   - You can start Thing+ Gateway S/W with following commands. In case of `API Key`, and, it should be in between Single Quotation Marks('), like `'API Key'`.

     ```bash
     @Pi2:$ sudo su
     @Pi2:$ cd /opt/thingplus/'path_to_gateway'
     @Pi2:$ APIKEY='API Key' ./thingplus.sh start;
     @Pi2:$ cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit;
     @Pi2:$ node app.js > /dev/null &;
     ```

     - Example

       ```bash
       @Pi2:$ sudo su
       @Pi2:$ cd /home/pi/thingplus/gateway
       @Pi2:$ APIKEY='A7i3kT***-***Vk447-***' ./thingplus.sh start;
       @Pi2:$ cd /home/pi/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit;
       @Pi2:$ node app.js;
       ```

    - After running Thingplus application, please Click the button, ``

#### 4. Optional Settings

   - If you want to start Thing+ S/W when Raspberry Pi is always booted completely, please Open `/etc/rc.local` file, and Add new two lines right above the `exit 0`.

     ```bash
     @Pi2:$ sudo nano /etc/rc.local
     ...
     (cd /opt/thingplus/'path_to_gateway'; sudo ./thingplus.sh start;)
     (cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit; sudo node app.js;)

     exit 0
     ```

     - Press `CTRL-O` and press `ENTER` to save the changes and press `CTRL-X` to close the current file you opened and modified.

     - Example

       ```bash
       @Pi2:$ sudo nano /etc/rc.local
       ...
       (cd /opt/thingplus/gateway; sudo ./thingplus.sh start;)
       (cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit; sudo node app.js;)

       exit 0
       ```

--------------------

### Troubleshooting

* When you can NOT find a new sensor and/or gateway from the`Sensor` page after you registered it:

  - It takes few minutes to register sensors and gateways, so please Refresh the Sensor page after 1~2 minutes.
  - If you still can NOT find them after few minutes, please Connect to your Raspberry Pi, and Try run below commands.

    ```
    @PC:$ ssh pi@<IP Address>
    @Pi2:$ thingplus/'path_to_gateway'
    @Pi2:$ ./thingplus.sh restart
    @Pi2:$ cd log
    @Pi2:$ tail -F -n 300 thingplus.log
    ```

* When you can NOT find some sensors:

  - Unregistered snesors will be added automatically, when you reboot your Raspberry Pi.

* Wehn you can NOT know the IP Address of your Raspberry Pi:

  - Install `Fing` App on your mobile phone([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - Connect to WiFi network of your router that your Raspberry Pi is connected.
  - Run `Fing`. You can sell all the devices with the IP Adresses in the same Network.
  - You can find the name, `raspberrypi`. It is the IP Address of your Raspberry, and you can connect to your device using it.
