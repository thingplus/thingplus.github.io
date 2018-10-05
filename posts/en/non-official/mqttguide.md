---
title: MQTT Guide
published: true
img: ic-troubleshooting.png
permalink: /en/mqttguide.html
---


### What is meant by "Host Name"?

- You can see it in the url of the `thingplus` service you have access to.
- The "service code" is the same as the service's sub-domain (XXXX.website.com, where XXXX is the sub-domain).
- The "domain" your service is running on is very important. This is related to the mqtt host and api hostname you will use (if using our API).
  - If you can see `sandbox.thingplus.net`, that service is running on our `sandbox` domain, for example
  - If just you see only `thingplus.net`, that service is on our `commercial` domain, located in the Tokyo region (additional regions are also available)

![](/assets/hostname.png)

- MQTT host name
  - When pushing your data, it should be push using mqtt as the protocol.
    - In the case of `sandbox` services: mqtt.sandbox.thingplus.net
    - In the case of `commercial` services : mqtt.thingplus.net
- API Host name
  - You can use the api to query data or create a third party app.
    - In the case of `sandbox` services: api.sandbox.thingplus.net
    - In the case of `commercial` services: api.thingplus.net

### Options

- protocol : mqtts
- host :
  - In the case of a service running on sandbox : `mqtt.sandbox.thingplus.net`
  - In the case of a service running on commercial : `mqtt.thingplus.net`
- port : 8883
- username : `gatewayId`
- clientId : `gatewayId`
- password : `APIKEY`
- rejectUnauthorized : `true`
- caFile : `~/ca-cert.pem` (You need to cert file, if you have MOU with daliworks, please request ca-cert.pem file)

### Topics

- v/a/g/`gatewayId` (for value)
- v/a/g/`gatewayId`/staus (for status)

### Payload(body)

- v/a/g/`gatewayId`
  - [Message for value](https://github.com/daliworks/thingplus-embedded/blob/master/docs/Thingplus_Embedded_Guide_EN.md#227-transmission-of-the-sensor-value-data-for-multiple-sensors)

    ```javascript
    {"__SENSOR_ID__":[__TIME__,__VALUE__,...(REPEAT FOR VALUES),__TIME__,__VALUE__],"__SENSOR_ID__":[__TIME__,__VALUE__,...,__TIME__,__VALUE__], ...(REPEAT FOR SENSORS)}


    __SENSOR_ID__: Sensor ID
    __TIME__: Sensing time. It is Unix time and its unit is msec.
    __VALUE__: Sensor value
    ```

  - Example for message of value

    ```javascript
    1> -t v/a/g/da11ef1234fe -m {"da11ef1234fe-temperature-0" :[153846953704, "30"], "da11ef1234fe-humidity-0:[153846953704, "50"], "da11ef1234fe-co2-0:[153846953704, "500"]}
    2> -t v/a/g/da11ef1234fe -m {"da11ef1234fe-temperature-0" :[153846953704, "30", 153846950704, "31"], "da11ef1234fe-humidity-0:[153846953704, "50", 153846950704, "48"], "da11ef1234fe-co2-0:[153846953704, "500", 153846950704, "550"]}
    ```

- v/a/g/`gatewayId`/status
  - [Message for status](https://github.com/daliworks/thingplus-embedded/blob/master/docs/Thingplus_Embedded_Guide_EN.md#225-transmission-of-the-hw-status-and-sensors-status-data)

    ```javascript
    __HW_STATUS__,__VALID_DURATION__,__SENSOR_ID__,__SENSOR_STATUS__,__VALID_DURATION__, ...(REPEAT FOR SENSOR), __SENSOR_ID__,__SENSOR_STATUS__,__VALID_DURATION__

    __HW_STATUS__: "on" or "off"
    __VALID_DURATION__: Unit is sec (we recommend 1.5~2 times of the transmission cycle)
    __SENSOR_STATUS__: "on" or "off"
    ```

  - Example for message of status

    ```
    -t v/a/g/da11ef1234fe/status -m "on, 90, da11ef1234fe-temperature-0, on, 90, da11ef1234fe-humidity-0, on, 90, da11ef1234fe-co2-0, on 90"
    ```



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>






























