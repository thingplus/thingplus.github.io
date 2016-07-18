---
title: Hardware installation and service registration
tags: "user-guide"
published: true
img : ic-hwinstall.png
permalink: /en/user-guide/registration.html
---

User guide for a progress as hardware synchronization and user sign up. 

1. [Service Administrator](#id-serviceadmin)
2. [User](#id-enduser) 
3. [Gateway Registration](#id-gateway) 

---
<div id='id-serviceadmin'></div>

### Service Manager
<br>

#### Sign in and how to use
  * Requires purchasing hardware and installation for Thing+ portal. Please, contact iot@daliworks.net for detail. World best IoT professional will kindly help you.
  * **Hardware for IoT service**
    * Your hardware for IoT service installation.
    * Available [Hardware List](http://www.daliworks.net/?page_id=11441&lang=en) for Thnig+ access
  * **Got a hardware? Any plan for new IoT hardware?**
    * Mail to hw@daliworks.net if you need Hardware and Thing+ synchronization.
  * **Open Hardware for IoT service**
    * [Go to  Supported Open Hardware list ](/en/open-hardware/openhardware-list.html)

<br>

---
<div id='id-enduser'></div>

### User
<br>

#### Sing in Thing+ portal 
  * Put service address in internet browser.
![](/assets/2_address.png)

  * Push ![](/assets/en_2_register.png) sign up button on top for redirecting Sign in page.
  * Put your ID, e-mail(2 times for confirmation), passwords (2time for confirmation), and agree on access term. Then it return registration success message.
  * Will receive e-mail on your registered e-maill address for confirmation.
  * Click on e-mail confirmation and registration process to be done.
![](/assets/en_2_email.png)

#### Sign up and Authorization progress for service administrator
  * No more process required for **iot.thingplus.net** user.
  * After confirmation on e-mail, follow sign up progress for service administrator
  * Get confirmation e-mail after authorization from the service manager.
  * Will take few seconds to minutes for authorization. If you did not receive any e-mail, please check below.
    * Put re-check your e-mail address again.
    * Check your spam mail box.
  * After receive confirmation, put ID and Password to log in.

<br>

---
<div id='id-gateway'></div>

### Gateway Registration
_If you DO NOT have any devices, you can register a virtual gateway at [Thing+ Portal](https://www.thingplus.net/) by using [Sensor Simulator](/en/open-hardware/sensor-simulator-user-guide.html)._

<br>


_This Guide is written for BeagleBone Green & Raspberry Pi 2, but a way to set other devices you is similar to following progress._

_If you DO NOT install **Thing+ Embedded Pakcage** on your Raspberry Pi/BeagleBone Green, Please refer the followings._

- [**Guide for Raspberry Pi**](/en/open-hardware/raspberry-pi-user-guide.html) 
- [**Guide for Beaglebone Green**](/en/open-hardware/bbb-user-guide.html) 
- [**Guide for Arduino**](/en/open-hardware/arduino-user-guide.html) 
- [**Guide for Edison**](/ko/open-hardware/edison-user-guide.html)

_In case of raspberry pi & Arduino, Raspberry Pi is Gateway, Arduino is Device._

--- 

<br/>
1) Go to the `scripts`directory of a directory where Thing+ Embedded package was installed.

<p class="dwExpand" > For BeagleBon Black/Raspberry Pi 2 / Edison</p>

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
2) Get a Gateway ID of the device and copy it to the clipboard.

```bash
@shell:$ ./getGatewayID.sh
Your Gateway ID is as below
xx:xx:xx:xx:xx:xx
```

<br/>
3) Open the web browser on **YOUR PC** and sign in "[Service Website](https://www.thingplus.net)".

- We recommend to use the `Chrome Browser`([Link](https://www.google.com/chrome))

<br/>
4) Click the `Settings`button and `Gateway Management`button.
![gateway_management](/assets/gateway_management_en.png)

<br/>
5) Click the `(+)`button.
![register_gateway](/assets/register_gateway_en.png)

<br/>
6) Click teh `Request for Gateway Certificates or API Key`button.
![register_with_apikey](/assets/register_with_apikey_en.png)

<br/>
7) Choose a `Gateway Model` you have

<p class="dwExpand" > For Raspberry Pi: <b>Raspberry Pi - Developer</b></p>

![select_gateway_model_pi](/assets/pi_gw_model.png)

<div class="dwExpand2"></div>
<p class="dwExpand" > For Raspberry Pi + Camera: <b>Open Source Gateway</b></p>

![select_gateway_model_open](/assets/openhw_gw_model.png)

<div class="dwExpand2"></div>
<p class="dwExpand" > For BeagleBone Green: <b>BeagleBone Green - Developer</b></p>

![select_gateway_model_bbg](/assets/bbg_gw_model.png)

<div class="dwExpand2"></div>

<p class="dwExpand" > For Arduino: <b>Arduino, PC - Developer</b></p>

![select_gateway_model_Arduino](/assets/arduino_gw_model.png)

<div class="dwExpand2"></div>

<p class="dwExpand" > For Edison: <b>Edison Kit for Arduino</b></p>

![select_gateway_model_Edison](/assets/edison_gw_model.png)

<div class="dwExpand2"></div>
<br/>
8) Input the MAC address you copied to the `Gateway ID` form and Click the `Get API Key`button.
![macaddress](/assets/macaddr_getapikey_en.png)

<div id="id-run-gateway"></div>
<br/>
9) Copy the generated API Key in the below green box.
![get_apikey](/assets/get_apikey_en.png)

<br/>
10) Run Thing+ Gateway S/W with the following commands on **the connected terminal with your device**.

> Notice: In case of 'Copied API Key', and, it should be in between Single Quotation Marks('), like `'copied_api_key'`.

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

> remark : When reboot the device, automatically run is not available now. After reboot, Please type below command.

```bash
@shell:$ cd /opt/thingplus/openhardware/edison/grove-starter-kit
@shell:$ ./thingplus_device.sh start
@shell:$ cd /opt/thingplus/gateway
@shell:$ ./thingplus.sh start
```

<div class="dwExpand2"></div>

<br/>
11) Open `/ect/rc.local` file and add the below 2 lines right ahead the `exit 0` line.

- If you are an Arduino user, you can `SKIP THIS SECTION`. Please Move to next.

> Notice: You MUST use arrow buttons on your keyboard, when you want to move a cursor

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
<p class="dwExpand" > For BeagleBone Black: <b>Grove Starter Kit for BeagleBone Green</b></p>
![select_devicemodel](/assets/select_devicemodel_beagle_en.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For Arduino: <b>Grove Kit</b></p>
![select_devicemodel](/assets/select_devicemodel_arduino_ko.png)
<div class="dwExpand2"></div>
<p class="dwExpand" > For Edison: <b>Grove Starter Kit for arduino </b></p>
![select_devicemodel](/assets/edison_device_model.png)
<div class="dwExpand2"></div>

<br/>
15) Choose a `Site` this gateway will be added, and then, Click the `Register a Gateway, Devices and Sensors` button.
![register](/assets/register_en.png)

<br/>
16) You can see the `Success` popup message when the registration is completed

<br/>
17) You can see the registred Gateway from the `Sensor List` Menu

  - Sensor(s) is registered automatically by the Gateway(BeagleBone Black / Raspberry Pi 2) within 1 minute after you complete to register your gateway
  - Values your Sensor are periodically aggregated and delivered to Thing+ Cloud by the Thing+ Gateway Software. You can see the values from Thing+ Portal after several minutes.

<br/>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
