---
title: FAQ
tags: "help"
published: true
img: ic-faq.png
image: "http://support.thingplus.net/assets/ogp/ogp_faq.png"
permalink: /en/help/faq.html
---

We have prepared answers to your frequently asked questions.

---

<p class="dwfqExpand" id="faq_dashboard_01"> How can I change the Dashboard Line Chart Period setting?</p>

Click on the top right <i class = "fa fa-cog fa-lg"> </i> setting icon of the widget you want to change

On the `Widget Setting` screen, click the right side of the" Period "item and select the desired time range. You can choose up to 24 hours.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_sensorData"> How can I view historical data from sensors?</p>
1. Select `sensor analysis` <i class = "fa fd-menu_analysis fa-lg"> </i> among the top menu
2. Select gateway
3. Select sensor type
4. Select a time period from 1 hour ago to 7 days ago
5. Select the start date of the query (default is the current date. The selected date will be displayed for the selected period.)
6. It is displayed in the upper graph area as much as the lower orange area (If you drag the orange area, you can see the previous graph in the upper graph area.)
7. If you click on the <i class = "fa fa-fa fa-download fa-lg"> </i> icon, you can download it as a CSV file. (Can be confirmed by Excel)

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_compare_sensorData"> How to Compare Sensor Data</p>  How to Compare Sensor Data

1. <i class="fa fa-fw fa-plus fa-lg"></i> Click the icon to add a sensor selection window.
2. You can compare multiple sensor data by setting it the same as how you query data later.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_install_wget"> How to install wget on Mac</p>

To install wget, brew must be installed.

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install wget using the brew command.

```
brew install wget
```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_not_grove"> Should I use only the Gove sensor kit as in the guide? </p>

No.

For reference, the example was distributed using the Grove kit, but other sensors can be used if you modify the source slightly.
We will update the information in the future, but you can temporarily check the contents at the link below.

[How to connect various sensors](../arduinoSensor.html)

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_useWifi"> Can I register with Thing + Portal even if I attach a WiFi dongle instead of Ethernet?</p>

Yes.

Ethernet and WiFi are all tools for connecting to the Internet, so if you have an Internet connection and have Thing + Embedded installed, you can connect to Thing + Portal directly.
We also show you how to connect your WiFi dongle in the guide of your hardware.
Please refer to the contents for connection.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_sensor_port"> Do I need to plug a specific sensor into a specific port on the GrovePi + shield? </p>

Yes

For now, you should connect the same sensor to the same port listed in our guide document.
However, if you modify the samples in the `Openhardware directory(/opt/thingplus/openhardware/)` installed in Thing + Embedded, you can connect to other ports.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_oauth2"> What is OAuth2?</p>

It is an open protocol that is the standard way to perform authorization authentication in applications such as web and mobile apps.
It is a security tool to prevent unauthorized access, and is also used in Facebook and Twitter.
For more information, please visit [here](https://thingplus.api-docs.io/2.0/oauth2).

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id="faq_thingplus_infra"> Does ThingPlus server use AWS?</p>

I use AWS only with IaaS, so I built the thing + software with this structure
Recently, AWS has also introduced an interoperation solution using lambda in the form of PaaS.
We are also considering the factors that will generate synergy with him.
We provides the service with Infra deployed and SaaS-typed with user and service management functions, as well as a platform PaaS that actually provides the REST API.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_service_type"> What is IaaS, PaaS, SaaS?</p>

- `IaaS(Infrastructure as a Service)` : In order to operate the server, various things are needed to build infrastructure such as server resources, IP, network, storage, power and so on. IaaS provides these services in a form that is easy and convenient to use in a virtual environment.  In order to provide IasS as a service, we use virtualization technology that can provide H / W scalability, resiliency and speed faster than existing server hosting. IasS is the underlying technology of Pass and Saas.

- `PasS(Platform as a Service)` : PaaS is a type that provides a stable environment (platform) for developing services and an API for developing applications that use the environment.

- `SaaS(Software as a Service)` : Providing an application that operates in a cloud environment as a service is called SaaS.  For example, a mail service. You do not need to know what this system is made of, how it works, and how to back up your mail. This is because you can send and receive e-mails from desired terminals (PC, Tablet, SmartPhone, etc.) in the form of service, and you can receive service by increasing the space at any time.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_gatewayID"> I wonder if the gateway ID is a computer MAC address and why is it called the gateway ID?</p>

The gateway ID does not have to be a mac address.
I used a unique ID to distinguish the gateway.
If the terminal has a unique identifier, such as UUID or IMEI, it will be used as an id.
Currently all open hardware uses mac address as id.
To prevent such confusion, I changed the getmac script to getGatewayId. I'm going to abandon the word mac adress.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_raspberry_b"> I would like to use raspberry pie 1 B +</p>

- To use `Raspberry Pie 1 B +`, please refer to  [Guide](http://support.thingplus.net/en/open-hardware/raspberry-pi-user-guide.html).

- In the `2-4`, Download the script below when downloading the thingplus install script

  ```
  $ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install_PI1B.sh
  ```

<p class="dwfqExpand2"></p>

<!-- <p class="dwfqExpand" id = "faq_raspberry_3"> 라즈베리파이 3를 사용하고 싶습니다.I would like to use Raspberry Pie 3.</p>
<p class="dwfqExpand2"></p>

<p class="dwfqExpand"  id = "faq_use_other_sensor"> 가이드 되어 있는 센서외에 다른 센서를 연동하고 싶습니다. I would like to link other sensor besides the guided sensor.</p>
<p class="dwfqExpand2"></p>-->

<p class="dwfqExpand" id = "faq_contact"> Contact us</p>

- If you want to use the service for commercial use, please send an e-mail to `biz@daliworks.net`
- If you have any questions, please refer to [Inquiry guide](../inquiryGuide.html) and please send email to `support@thingplus.net`.


<p class="dwfqExpand2"></p>


<p class="dwfqExpand" id = "faq_arduino_esp8266"> I want to connection ESP8266 and Arduino to thingplus.</p>

If you use ESP8266 as a WIFI module and want to connect Arduino as a gateway, please refer to [this guide](http://support.thingplus.net/en/esp8266.html).

<p class="dwfqExpand2"></p>


<p class="dwfqExpand" id = "faq_check_log"> I want to know how to check the log.</p>

- If you used open-hardware and have issued a problem, you can check the log to find the cause of the problem.

- The log provides two types of `gateway log` and `sensor device log`.
  - The gateway log includes MQTT log that sends the sensor value received from the sensor to the thingplus server.
  - The sensor device log can check the sensor value that the sensor collects at regular intervals.

- So, you can check whether the sensor is abnormal or not, or if the error occurs when sending it to the server.

- Gateway log

  ```
  $ cd /opt/thingplus/gateway/
  $ tail -f -n 300 log/thingplus.log
  ```

- Sensor device log

  ```
  # Navigate to the path where you ran ./thingplus_device.sh
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ 동
  $ tail -f -n 300 log/thingplus_device.log
  ```


<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_update"> I want to know how to update open hardware.</p>

- Thingplus provides open source of open hardware to help developers understand.

- We currently support Raspberry Pi, BeagleBone Green, Edison, and Arduino.

- How to update Device Agent

  ```bash
  # cd /opt/thingplus/openhardware
  # git pull
  ```

- Gateway update method

  - Check the version of Gateway first.

  ```bash
  # cat /opt/thingplus/gateway/VERSION
  ```

  - ***The current version is currently 0.4.2.***

    - In versions below v0.4.2, download the update script from the following path and execute it.

    ```bash
    # cd /opt/thingplus/gateway

    (For Raspberry PI)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_update.sh
    (For BBG)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bbg_update.sh
    (For Edison)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_edison_update.sh

    # chmod 755 ./thingplus_embedded_sdk_xxx_update.sh
    # ./thingplus_embedded_sdk_xxx_update.sh
    ```

    - After the update is finished, the Gateway is rerun, and the devicve agent is left as it is.
    - If `thingplus_device.sh status` was` stopped` before updating, you have to re-execute (`thingplus_device.sh restart`).

    - From v0.4.2 and later versions, you can do the following.

    ```bash
    # cd /opt/thingplus/gateway
    # ./thingplus.sh update
    ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_whatis_gw_device"> What is the difference between a device and a gateway?</p>
- Gateway is a device that connects to Thing + and Internet. Device is a device that connects sensor network (serial, ZigBee, BLE, etc.) between this gateway and sensor. In some cases, each of the Gateway, Device, and Sensor may be configured as a single device.

- For more information, please refer to the [Basic Guide](http://support.thingplus.net/en/user-guide/preparation.html#id-term) on our support site below.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_sensorAct"> Can I pass a command or value to another server or service?</p>

- Yes, it is possible. With string-actuator, you can create and pass the desired value or command.

- The device agent registers the string-actuator. Currently, `git pull` in `/opt/thingplus/openhardware`is applied.

  - [reference](https://github.com/daliworks/openhardware/commit/10c4cdf81bbe3098d496fdc2a77512314d84ae44)

- The gateway model registers with the gateway by selecting `open souce hardware`.

  ![register-open_source_hardware](/assets/openSourceHW_reg.png)

- Modify the string-actuator.js part in the device agent. Please refer to the sample code below.

  - Option.text accepts the character you typed when you executed the actuator.

  - The following example shows how to pass the value to `slack`.

```javascript
StringActuator.prototype.doCommand = function(name, cmd, options) {
  if (options.text) {
    console.log('YOUR TEXT IS');
    console.log(options.text);

    var username = 'Thingplus',
        channel = '#random',
        emo_icon = ':ghost:',
        webHookURL = 'https://hooks.slack.com/services/xxxxxxxxxxxx';

    var cmd = 'curl -X POST --data-urlencode \'payload={"channel": "'+channel+'", "username": "'+username+'", "text": "'+options.text+'", "icon_emoji": "'+emo_icon+'"}\' '+webHookURL ;
    console.log(cmd);
  exec(cmd);

  }
};
```

- Run `thingplus_device.sh restart` and `thingplus.sh restart`.

<p class="dwfqExpand2"></p>

<!-- <p class="dwfqExpand" id = "faq_Withdrawal"> 회원 탈퇴는 어떻게 할 수 있나요? How can I withdraw my membership?</p>
<p class="dwfqExpand2"></p> -->


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>