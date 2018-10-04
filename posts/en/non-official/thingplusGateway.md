---
title: Thingplus Test Gateway on Linux
published: true
img: ic-troubleshooting.png
permalink: /en/thingplusgw.html
---


### What is meant by "Host Name"?

- You can see it in the url of the "thingplus" service you have access to.
- The "service code" is the same as the service's sub-domain (XXXX.website.com, where XXXX is the sub-domain).
- The "domain" your service is running on is very important. This is related to the mqtt host and api hostname you will use (if using our API).
  - If you can see "sandbox.thingplus.net", that service is running on our "sandbox" domain, for example
  - If just you see only "thingplus.net", that service is on our "commercial" domain, located in the Tokyo region (additional regions are also available)

![](/assets/hostname.png)

- MQTT host name
  - When pushing your data, it should be push using mqtt as the protocol.
    - In the case of `sandbox` services: mqtt.sandbox.thingplus.net
    - In the case of `commercial` services : mqtt.thingplus.net
- API Host name
  - You can use the api to query data or create a third party app.
    - In the case of `sandbox` services: api.sandbox.thingplus.net
    - In the case of `commercial` services: api.thingplus.net

### Test data push on Thingplus using a Thingplus gateway
> This guide can only currently be used with companies that have an MOU for doing POC or commercial work with Thing+.

- we recommend node v0.10.29
- We will test using the following service: `https://trial.sandbox.thingplus.net/`. In this case, my test host name is sandbox.

- First, download the thingplus library file
```bash
wget https://s3.ap-northeast-2.amazonaws.com/thingplus.public.files/general_lib/general-linux-v0.0.3.1.tgz
```

- Uncompress the file
```bash
ex>
tar -xvzf general-linux-v0.0.3.1.tgz
```

- Go To `~/general-linux-v0.0.3.1/thingplus-gateway/device/config`

- Open `runtime.json` and Edit it to the following
  - In the case of a service running on sandbox
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
  - In the case of a service running on commercial
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

- We are using a service located on the Sandbox host, so we use the code containing "sandbox.thingplus.net"

- You must now get an `APIKEY` via the `thingplus portal`
  - In your service's UI, go to: Settings > Gateway Management > click `+` button > Request For Gateway Certificates Or API Key
![](/assets/register_gateway_en.png)
![](/assets/register_with_apikey_en.png)
  - Select "Open Source Gateway" as the Gateway Model
![](/assets/openhw_gw_model.png)
  -  - Input the gatewayId of your device. (generally we use the mac address of `eth0`, though you can use anything you want, as long as it is unique and long enough)
![](/assets/macaddr_getapikey_en.png)
  - Click `Get APIKEY` and copy the `APIKEY`
![](/assets/get_apikey_en.png)

- Register your Gateway
  - After you have received your `APIKEY` , you can see the button called `REGISTER GATEWAY` - click the button.
  - Input the `Gateway Name` you want.
  - Select `Open Source Device` as Device Model
  - Click `Register a gateway, Devices and sensors` Button

- Run the `thingplus Gateway` shell script on your linux machine
```bash
~/general-linux-v0.0.3.1# APIKEY='S7h(copied_APIKEY)IBrwDTvf8w=' ./thingplus.sh start
```

- Run the example device agent
```bash
cd device-agent-example
node device-agent.js &
```


> This guide is an example for pushing sensor data to the Thing+ dashboard/UI using the Thingplus gateway example code and the API.

> Coding of the part that takes data from the sensor and sends it to the thingplus gateway should be done by the developer himself, depending on what data you are sending.


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>






























