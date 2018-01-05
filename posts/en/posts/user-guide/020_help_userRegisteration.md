---
title: Gateway registration
tags: "user-guide"
published: true
img : ic-hwinstall.png
permalink: /en/user-guide/registration.html
---

User guide for setting up basic hardware synchronization and user credentials.

1. [Service Administrator](#id-serviceadmin)
2. [Users](#id-enduser) 
3. [Gateway Registration](#id-gateway) 

---
<div id='id-serviceadmin'></div>

### Service Manager
<br>

#### Signing in and Usage
  * Currently requires purchasing compatible hardware and an installation using the Thing+ portal. Please, contact iot@daliworks.net for details.
  * **Hardware for IoT service**
    * Hardware refers to the sensors/devices/etc.. used in your IoT service installation
    * Currently supported [Hardware List](http://www.daliworks.net/?page_id=11441&lang=en) enabling Thing+ access off the shelf
  * **Are you a hardware maker or planning to create new IoT hardware?**
    * Please mail us at hw@daliworks.net if you would like to enable Thing+ synchronization with your hardware.
  * **Open / Open-Source Hardware that can be used with Thing+ IoT services**
    * [Go to our Supported Open Hardware list ](/en/open-hardware/openhardware-list.html)

<br>

---
<div id='id-enduser'></div>

### For Users
<br>

#### Signing into the Thing+ portal 
  * Put your service address in your internet browser address bar.
![](/assets/2_address.png)

  * Push ![](/assets/en_2_register.png) on top to get to the Sign In page.
  * Input your ID, e-mail(2 times for confirmation), passwords (2 times as well), and agree to the access terms. You should see a "registration success" message.
  * You should promptly receive an e-mail on your registered e-mail address for confirmation.
  * Click on the e-mail confirmation and the registration process is complete.
![](/assets/en_2_email.png)

#### Sign up and Authorization progress for service administrators
  * Similarly to users, go to **iot.thingplus.net** and register using your email.
  * After confirmation of your e-mail, follow the included sign up instructions.
  * You should get a confirmation e-mail after authorization from your service manager.
  * It will take a few seconds to minutes for authorization as the data populates through our system. If you did not receive any e-mail, please:
    * Check that your entered email address is correct.
    * Check your spam mail box and trash.
  * After receiving confirmation, enter your ID and Password to log in.

<br>

---
<div id='id-gateway'></div>

### Gateway Registration
_If you DO NOT have any devices, you can register a virtual gateway at the [Thing+ Portal](https://www.thingplus.net/) by using [Sensor Simulator](/en/open-hardware/sensor-simulator-user-guide.html)._

<br>


_This Guide is written for BeagleBone Green & Raspberry Pi 2, but most devices should follow a similar procedure._

_If you DID NOT install the **Thing+ Embedded Package** on your Raspberry Pi/BeagleBone Green, please refer to the following:_

- [**Guide for Raspberry Pi**](/en/open-hardware/raspberry-pi-user-guide.html) 
- [**Guide for Beaglebone Green**](/en/open-hardware/bbb-user-guide.html) 
- [**Guide for Arduino**](/en/open-hardware/arduino-user-guide.html) 
- [**Guide for Edison**](/en/open-hardware/edison-user-guide.html)

_In the case of raspberry pi & Arduino, the Raspberry Pi is a "Gateway" and Arduino is a "Device"._

--- 

<br/>
1) Go to the `scripts`directory of the directory where your Thing+ Embedded package was installed.

<p class="dwExpand" > For BeagleBon Black/Raspberry Pi 2 / Edison / Beaglebone Air</p>

- Connect to your device over SSH and go to the `scripts` directory

  ```bash
  @shell:$ cd /opt/thingplus/gateway/scripts
  ```

<div class="dwExpand2"></div>
<p class="dwExpand" > For Arduino </p>
- Go to the `scripts` directory on your PC

  ```bash
  @shell:$ cd $HOME/thingplus/gateway/scripts
  ```

<div class="dwExpand2"></div>

<br/>
2) Get the Gateway ID of the device and copy it to the clipboard.

```bash
@shell:$ ./getGatewayID.sh
Your Gateway ID is as below
xx:xx:xx:xx:xx:xx
```

<br/>
3) Open the web browser on **YOUR PC** and sign into the "[Service Website](https://www.thingplus.net)".

- We recommend you use `Chrome`([Link](https://www.google.com/chrome))

<br/>
4) Click the `Settings` button and then the `Gateway Management` button.
![gateway_management](/assets/gateway_management_en.png)

<br/>
5) Click the `(+)` button.
![register_gateway](/assets/register_gateway_en.png)

<br/>
6) Click the `Request for Gateway Certificates or API Key` button.
![register_with_apikey](/assets/register_with_apikey_en.png)

<br/>
7) Choose the `Gateway Model` you are using

<!-- <p class="dwExpand" > For Raspberry Pi: <b>Raspberry Pi - Developer</b></p>

![select_gateway_model_pi](/assets/pi_gw_model.png)

<div class="dwExpand2"></div> -->
<p class="dwExpand" > For Raspberry Pi : <b>Open Source Gateway</b></p>

![select_gateway_model_open](/assets/openhw_gw_model.png)

<div class="dwExpand2"></div>
<p class="dwExpand" > For BeagleBone Green어/Beaglebone Air: <b>BeagleBone Green - Developer</b></p>

![select_gateway_model_bbg](/assets/bbg_gw_model.png)

<div class="dwExpand2"></div>

<p class="dwExpand" > For Arduino: <b>Arduino, PC - Developer</b></p>

![select_gateway_model_Arduino](/assets/arduino_gw_model.png)

<div class="dwExpand2"></div>

<p class="dwExpand" > For Edison: <b>Edison Kit for Arduino</b></p>

![select_gateway_model_Edison](/assets/edison_gw_model.png)

<div class="dwExpand2"></div>
<br/>
8) Input the MAC address you copied to the `Gateway ID` form and click the `Get API Key` button.
![macaddress](/assets/macaddr_getapikey_en.png)

<div id="id-run-gateway"></div>
<br/>
9) Copy the generated API Key into the below green box.
![get_apikey](/assets/get_apikey_en.png)

<br/>
10) Run Thing+ Gateway S/W with the following commands on **the terminal connected to your device**.

> Notice: In case of the 'Copied API Key', it should be in-between Single Quotation Marks('), eg. `'copied_api_key'`.

<p class="dwExpand" > For Raspberry Pi</p>

```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > For Raspberry Pi with Camera module</p>

   
```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/openhardware/raspberrypi/camera
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>


<p class="dwExpand" > For Raspberry Pi + Arduino</p>

   
```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/openhardware/arduino/grovePi-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > For BeagleBone Green</p>

```bash
@shell:$ cd /opt/thingplus/openhardware/beaglebonegreen/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > For BeagleBone Air</p>

```bash
@shell:$ cd /opt/thingplus/openhardware/bba/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>

<p class="dwExpand" > For Arduino (<b>Mac PC</b>)</p>

```bash
@shell:$ cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd $HOME/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

<div class="dwExpand2"></div>
<p class="dwExpand" > For Arduino (<b>Windows PC</b>)</p> 

```bash
@shell:$ cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd $HOME/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.bat start
```

<div class="dwExpand2"></div>
<p class="dwExpand" > For Edison </p>

   
```bash
@shell:$ cd /opt/thingplus/openhardware/edison/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ APIKEY='copied_api_key' ./thingplus.sh start
```

> remark : When rebooting the device, automatically launch/run is not available now. After rebooting, you must type the below commands.

```bash
@shell:$ cd /opt/thingplus/openhardware/edison/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ ./thingplus.sh start
```

<div class="dwExpand2"></div>

<br/>
11) Open the `/ect/rc.local` file and add the below 2 lines right ahead of the `exit 0` line.

- If you are an Arduino user, you can `SKIP THIS SECTION`. Please Move to next.

> Notice: You MUST use arrow buttons on your keyboard, when you want to move the cursor

<p class="dwExpand" > For Raspberry Pi</p>

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)


exit 0
```

- Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

<div class="dwExpand2"></div>
<p class="dwExpand" > For Raspberry Pi (with camera module)</p>

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/raspberrypi/camera; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)


exit 0
```

- Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

<div class="dwExpand2"></div>
<p class="dwExpand" >  For BeagleBone Green</p>

```bash
@shell:$ nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/beaglebonegreen/grove-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)    

exit 0
```

- Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

<div class="dwExpand2"></div>

<p class="dwExpand" >  For BeagleBone Air</p>

```bash
@shell:$ nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/bba/grove-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)    

exit 0
```

- Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

<div class="dwExpand2"></div>

<p class="dwExpand" >  For Raspberry Pi + Arduino</p>

```bash
@shell:$ nano /etc/rc.local
...
(cd /opt/thingplus/openhardware/arduino/grove-starter-kit; ./thingplus_device.sh restart)
(cd /opt/thingplus/gateway; ./thingplus.sh restart)    

exit 0
```

- Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

<div class="dwExpand2"></div>

<br/>
12) Click the `Register Gateway`button.
![copy_apikey](/assets/copy_apikey_en.png)

<br/>
13) Input your gateway name to `Gateway Name` form.
![input_gateway_name](/assets/inputmac_name_en.png)

<br/>
14) Choose a `Device Model`.

<p class="dwExpand" > For Raspberry Pi 2: <b>GrovePi+ Starter Kit</b></p>
![select_devicemodel](/assets/select_devicemodel_raspberry_en.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For Raspberry Pi 2: <b>Grove Starter Kit forArduino</b> </p>
![select_devicemodel](/assets/select_devicemodel_arduinopi_en.png)
<div class="dwExpand2"></div>
<div class="dwExpand2"></div>
<p class="dwExpand" > For Raspberry Pi 2: <b>With Camera module</b></p>
![select_devicemodel](/assets/rasp_cam_dm.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For BeagleBone Green/Beaglebone Air: <b>Grove Starter Kit for BeagleBone Green</b></p>
![select_devicemodel](/assets/select_devicemodel_beagle_en.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For Arduino: <b>Grove Kit</b></p>
![select_devicemodel](/assets/select_devicemodel_arduino_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For Edison: <b>Grove Starter Kit for arduino </b></p>
![select_devicemodel](/assets/edison_device_model.png)
<div class="dwExpand2"></div>

<br/>
15) Choose a `Site` for this gateway to be added to, and then, click the `Register a Gateway, Devices and Sensors` button.
![register](/assets/register_en.png)

<br/>
16) You can see the `Success` popup message when the registration is completed

<br/>
17) You can see the registred Gateway from the `Sensor List` Menu

  - Sensor(s) are registered automatically by the Gateway(BeagleBone Black / Raspberry Pi 2) within 1 minute after you complete registering your gateway
  - Values from your Sensor are periodically aggregated and delivered to the Thing+ Cloud by the Thing+ Gateway Software. You can see the values from Thing+ Portal after several minutes usually.

<br/>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
