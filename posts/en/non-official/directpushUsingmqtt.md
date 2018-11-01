---
title: Direct push data using mqtt
published: true
img: ic-troubleshooting.png
permalink: /en/directpush.html
---

> This guide is intended to be used when transferring data directly from a PC or device without using the thingplus gateway library.

### What is meant by "Host Name"?

- You can see it in the url of the "`thingplus`" service you have access to.
- The "service code" is the same as the service's sub-domain (XXXX.website.com, where XXXX is the sub-domain).
- The "domain" your service is running on is very important. This is related to the mqtt host and api hostname you will use (if using our API).
  - If you can see "`sandbox.thingplus.net`", that service is running on our "`sandbox`" domain, for example
  - If just you see only "`thingplus.net`", that service is on our "`commercial`" domain, located in the Tokyo region (additional regions are also available)

![](/assets/hostname.png)

- MQTT host name
  - When pushing your data, it should be push using mqtt as the protocol.
    - In the case of `sandbox` services: mqtt.sandbox.thingplus.net
    - In the case of `commercial` services : mqtt.thingplus.net
- API Host name
  - You can use the api to query data or create a third party app.
    - In the case of `sandbox` services: api.sandbox.thingplus.net
    - In the case of `commercial` services: api.thingplus.net

### Register Gateway
> A thingplus calls `gateway` what a physical device or program that can push sensor data to a thingplus cloud or receive a command from the cloud

- For communication with device and Thingplus cloud, you should got `APIKEY`.

#### How to got APIKEY

- You must now get an `APIKEY` via the `thingplus portal`
  - In your service's UI, go to: Settings > Gateway Management > click `+` button > Request For Gateway Certificates Or API Key
![](/assets/register_gateway_en.png)
![](/assets/register_with_apikey_en.png)
  - Select "Open Source Gateway `V2`" as the Gateway Model
![](/assets/opensourcegw01.png)
  - Input the gatewayId of your device. (generally we use the mac address of `eth0`, though you can use anything you want, as long as it is unique and long enough)
![](/assets/opensourcegw03.png)
  - Click `Get APIKEY` and copy the `APIKEY`
![](/assets/opensourcegw02.png)

### How to register Gateway
- Register your Gateway
  - After you have received your `APIKEY` , you can see the button called `REGISTER GATEWAY` - click the button.
  - Input the `Gateway Name` you want.
  - Select `Open Source Device` as Device Model
  - Check sensors you want to register.
![](/assets/opensourcegw04.png)
  - Click `Register a gateway, Devices and sensors` Button


### Push Data to Thingplus Cloud

- In thingplus, mqtt is recommended to transfer data.
- Refer to the [MQTT Guide](./mqttguide.html) for data transmission.



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>






























