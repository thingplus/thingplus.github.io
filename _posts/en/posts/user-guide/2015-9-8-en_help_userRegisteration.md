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

This Guide is written for BeagleBone Green & Raspberry Pi 2, but a way to set other devices you is similar to following progress.

1) Connect to a BeagleBon Black/Raspberry Pi 2 over SSH and go to `scripts` directory under the path which Thing+ Embedded package is inalled on.

```bash
@shell:$ cd /'your_device'/thingplus/'path_to_gateway'/scripts
```


    - Example for Raspberry Pi 2

    ```bash
    @shell:$ cd /home/pi/thingplus/gateway/scripts
    ```

>Notice: The `your_device` depends on your device type. ex) "Raspberry Pi2: /home/pi", "BBB/BBG: /root"

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
7) Input the MAC address you copied to the `Gateway ID` form and Click the `Get API Key`button.
![macaddress](/assets/macaddr_getapikey_en.png)

<br/>
8) Copy the generated API Key in the below green box.
![get_apikey](/assets/get_apikey_en.png)

<br/>
9) Run Thing+ Gateway S/W with the following commands on **the connected terminal with your device**.

```bash
@shell:$ cd /'your_device'/thingplus/'path_to_gateway'
@shell:$ APIKEY='Copied API Key' ./thingplus.sh start;
```

>Notice: The `your_device` depends on your device type. "Raspberry Pi2: /home/pi", "BBB/BBG: /root"

- Example for Raspberry Pi 2

```bash
@shell:$ cd /'your_device'/thingplus/gateway
@shell:$ APIKEY='A7i3kT***-***Vk447-***' ./thingplus.sh start;
```

> Notice: The parameter name, 'APIKEY', should be all the capital letters. In case of 'Copied API Key', and, it should be in between Single Quotation Marks('), like `'copied_api_key'`.

10) Open `/ect/rc.local` file and add the below 2 lines right ahead the `exit 0` line.

```bash
@shell:$ sudo nano /etc/rc.local
...
(cd /'your_device'/thingplus/'path_to_gateway'; ./thingplus.sh start;)
(cd /'your_device'/'path_to_open_hw_sdk'/openhardware/'your_device_name'/grovePi-starter-kit; node app.js;)

exit 0
```

    - Example for Raspberry Pi

    ```bash
    @shell:$ sudo nano /etc/rc.local
    ...
    (cd /home/pi/thingplus/'path_to_gateway'; ./thingplus.sh start;)
    (cd /home/pi/thingplus/'path_to_open_hw_sdk'/openhardware/raspberrypi/grovePi-starter-kit; node app.js;)

     exit 0
    ```


   - Press `CTRL-O` and Enter to overwrite the changes and press `CTRL-X` to close the file you've modified.

11) Copy the MAC Address from the **web browser** you got the API Key.

   - If you alread moved to another webpage and can NOT copy the MAC address, please refer `1) ~ 2) Get a MAC address` to get it again.

12) Click the `Register Gateway`button.
![copy_apikey](/assets/copy_apikey_en.png)

<br/>

13) Choose a gateway model.

- For BeagleBone Black: `Neuromeka Rev2.1`
![select_gwmodel](/assets/select_gwmodel_beagle_en.png)

- For Raspberry Pi 2: `Raspberry Pi - Developer`
![select_gwmodel](/assets/select_gwmodel_raspberry_en.png)

<br/>

14) Input the MAC address of your device to `Gateway ID` form and input your gateway name to `Gateway Name` form.
![select_gwmodel](/assets/inputmac_name_en.png)

<br/>

15) Choose a device model.

- For BeagleBone Black: `Basic Model Rev2.1`
![select_devicemodel](/assets/select_devicemodel_beagle_en.png)

- For Raspberry Pi 2: `GrovePi+ Starter Kit`
![select_devicemodel](/assets/select_devicemodel_raspberry_en.png)

<br/>

16) Click the `Register a Gateway, Devices and Sensors` button.
![register](/assets/register_en.png)

<br/>

17) You can see the `Success` popup message when the registration is completed

<br>

18) You can see the registred Gateway from the `Sensor List` Menu

  - Sensor(s) is registered automatically by the Gateway(BeagleBone Black / Raspberry Pi 2) within 1 minute after you complete to register your gateway
  - Values your Sensor are periodically aggregated and delivered to Thing+ Cloud by the Thing+ Gateway Software. You can see the values from Thing+ Portal after several minutes.

<br>
