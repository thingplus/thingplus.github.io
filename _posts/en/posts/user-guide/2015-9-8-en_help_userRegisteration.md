---
title: Hardware installation and service registration
tags: "user-guide"
published: true
permalink: /en/user-guide/registration.html
---

User guide for a progress as hardware synchronization and user sign up. 

* [Service Administrator](#id-serviceadmin)
* [User](#id-enduser) 
* [Gateway Registration](#id-gateway) 

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
    * [Go to shop to buy the GrovePi+ Starter Kit](http://www.seeedstudio.com/depot/GrovePi-Starter-Kit-for-Raspberry-Pi-p-2240.html)
    * [Grove Starter Kit for BeagleBone Green](http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-BeagleBone-Green-p-2526.html)
    * More Open H/W will be supported

<br>

---
<div id='id-enduser'></div>
### User
<br>

<!---
### Prerequestion for service 
  * Registor member in {serviceName}.thingplus.net 
  * Service administration approval and authorization 
-->

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
<br>

#### BeagleBone Black and Raspberry Pi 2

_This Guide is written for BeagleBone Green & Raspberry Pi 2, but a way to set other devices you is similar to following progress._

1) Connect to a BeagleBon Black/Raspberry Pi 2 over SSH and go to `scripts` directory under the path which Thing+ Embedded package is inalled on.

```bash
@shell:$ cd /opt/thingplus/'path_to_gateway'/scripts
```

   - Example


     ```bash
     @shell:$ cd /opt/thingplus/gateway/scripts
     ```

2) Get a MAC Address of the device and copy it to the clipboard.

```bash
@shell:$ ./getmac
Your MAC address is as below
xx:xx:xx:xx:xx:xx   <= Copy this line
```

3) Open the web browser on **YOUR PC** and sign in "[Service Website](https://www.thingplus.net)".
- We recommend to use the Chrome Browser


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

- For BeagleBone Green: `BeagleBone Green - Developer`
![select_gateway_model_get_apikey](/assets/select_gateway_getapikey_beagle_en.png)

- For Raspberry Pi: `Raspberry Pi - Developer`
![select_gateway_model_get_apikey](/assets/select_gateway_getapikey_raspberry_en.png)

<br/>
8) Input the MAC address you copied to the `Gateway ID` form and Click the `Get API Key`button.
![macaddress](/assets/macaddr_getapikey_en.png)

<br/>
9) Copy the generated API Key in the below green box.
![get_apikey](/assets/get_apikey_en.png)

<br/>
10) Run Thing+ Gateway S/W with the following commands on **the connected terminal with your device**.

```bash
@shell:$ sudo su
@shell:$ cd /opt/thingplus/'path_to_gateway'
@shell:$ APIKEY='Copied API Key' ./thingplus.sh start;
@shell:$ cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/'your_device'/grovePi-starter-kit;
@shell:$ node app.js > /dev/null &;
```

> Notice: The parameter name, 'APIKEY', should be all the capital letters. In case of 'Copied API Key', and, it should be in between Single Quotation Marks('), like `'copied_api_key'`.

> Noteice: `'your_device'` depends on your device. ex) "Raspberry Pi 2: raspberrypi", "BeagleBon Green: bbg"

   - Example for Raspberry Pi


   ```bash
   @shell:$ sudo su
   @shell:$ cd /opt/thingplus/gateway
   @shell:$ APIKEY='A7i3kT***-***Vk447-***' ./thingplus.sh start;
   @shell:$ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit;
   @shell:$ node app.js > /dev/null &;
   ```

<br/>
11) Open `/ect/rc.local` file and add the below 2 lines right ahead the `exit 0` line.

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /opt/thingplus/'path_to_gateway'; sudo ./thingplus.sh start;)
(cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/'your_device'/grovePi-starter-kit; sudo node app.js;)

exit 0
```

   - Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

   - Example for Raspberry Pi


    ```bash
    @shell:$ sudo nano /etc/rc.local
    ...
    (cd /opt/thingplus/'path_to_gateway'; sudo ./thingplus.sh start;)
    (cd /opt/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit; sudo node app.js;)

     exit 0
    ```

<br/>
12) Click the `Register Gateway`button.
![copy_apikey](/assets/copy_apikey_en.png)

<br/>
13) Input your gateway name to `Gateway Name` form.
![input_gateway_name](/assets/inputmac_name_en.png)

<br/>
14) Choose a `Device Model`.

- For BeagleBone Black: `Grove Starter Kit for BeagleBone Green`
![select_devicemodel](/assets/select_devicemodel_beagle_en.png)

- For Raspberry Pi 2: `GrovePi+ Starter Kit`
![select_devicemodel](/assets/select_devicemodel_raspberry_en.png)

<br/>

15) Choose a `Site` this gateway will be added, and then, Click the `Register a Gateway, Devices and Sensors` button.
![register](/assets/register_en.png)

<br/>

16) You can see the `Success` popup message when the registration is completed

<br>

17) You can see the registred Gateway from the `Sensor List` Menu

  - Sensor(s) is registered automatically by the Gateway(BeagleBone Black / Raspberry Pi 2) within 1 minute after you complete to register your gateway
  - Values your Sensor are periodically aggregated and delivered to Thing+ Cloud by the Thing+ Gateway Software. You can see the values from Thing+ Portal after several minutes.

<br>
