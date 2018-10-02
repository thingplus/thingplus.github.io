---
title: Thingplus Test Gateway on Linux
published: true
img: ic-troubleshooting.png
permalink: /en/thingplusgw.html
---


### What is host name?

- Take a closer look at the url of the "thingplus" you are access to.
- Service code is the lowest domain name we usually call the sub-domain.
- And note the domain part. This is related to the mqtt host name and api hostname you will use.
  - If you can see the "sandbox.thingplus.net", that service is "sandbox" we called
  - If just you can see only the "thingplus.net", that service is "comercial (tokyo data hub)" we called

![](/assets/hostname.png)

- MQTT host name
  - When push the data, it should be push using mqtt protocol.
    - In case of `sandbox` : mqtt.sandbox.thingplus.net
    - In case of `commercial` : mqtt.thingplus.net
- API Host name
  - You can use the api to query data or create a third party app.
    - In case of `sandbox` : api.sandbox.thingplus.net
    - In case of `commercial` : api.thingplus.net

### Test data push on thingplus using thingplus gateway
> This guide is only shared with companies that have an MOU with daliworks.

- I will try to test at `https://trial.sandbox.thingplus.net/`. So my test host name is sandbox.

- Download thingplus library file
```bash
wget https://s3.ap-northeast-2.amazonaws.com/thingplus.public.files/general_lib/general-linux-v0.0.3.1.tgz
```

- Uncompress the file
```bash
ex>
tar -xvzf general-linux-v0.0.3.1.tgz
```

- Go To `~/general-linux-v0.0.3.1/thingplus-gateway/device/config`

- Open `runtime.json` and Edit as the following
  - In case of sandbox
```json
{
  "Server": {
    "mqtt": {
       "host": "mqtt.sandbox.thingplus.net"
    },
    "service": {
       "host": "api.sandbox.thingplus.net"
    }
  }
}
```
  - In case of commercial
```json
{
  "Server": {
    "mqtt": {
       "host": "mqtt.thingplus.net"
    },
    "service": {
       "host": "api.thingplus.net"
    }
  }
}
```

- You should be get `APIKEY` at `thingplus portal`
  - Settings > Gateway Management > click `+` button > Request For Gateway Certificates Or API Key
![](/assets/register_gateway_en.png)
![](/assets/register_with_apikey_en.png)
  - Select "Open Source Gateway" as the Gateway Model
![](/assets/openhw_gw_model.png)
  - Input the gatewayId of your device.(generally we use mac address of `eth0`)
![](/assets/macaddr_getapikey_en.png)
  - Click `Get APIKEY` and copy `APIKEY`
![](/assets/get_apikey_en.png)

- Register Gateway
  - After got `APIKEY` , you can see the button as `REGISTER GATEWAY`, click please.
  - Input the `Gateway Name` you want.
  - Select `Open Source Device` as Device Model
  - Click `Register a gateway, Devices and sensors` Button

- Run `thingplus Gateway` on your linux machine
```bash
~/general-linux-v0.0.3.1# APIKEY='S7h(copied_APIKEY)IBrwDTvf8w=' ./thingplus.sh start
```

- Run example device agent
```bash
cd device-agent-example
node device-agent.js &
```


> This guide is an example for pushing sensor data using the thingplus gateway.

> Coding of the part that takes data from the sensor and sends it to the thingplus gateway should be done by the developer himself.


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>






























