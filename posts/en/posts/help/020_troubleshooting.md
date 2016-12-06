---
title: Troubleshooting
tags: "help"
published: true
img: ic-troubleshooting.png
permalink: /en/help/troubleshooting.html
---

We have listed some of the issues that are associated with the ThingPlus IoT.

---

<p class="dwfqExpand" id= "trbs_invisible_sensors">&nbsp;If the registered gateway or sensor is not visible on the page</p>

Because it takes several tens of seconds to perform the registration procedure, the page is refreshed after waiting for about one minute
If the symptom persists after a few minutes, use Terminal/Putty to connect to the device and check the contents by executing the following command.

```
@shell:$ tail -F -n 300 /opt/thingplus/gateway/log/thingplus.log
```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_discover_sensors"> If more than one sensor is not registered</p>

Restarting the gateway automatically registers the unregistered sensor.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_time_sync"> Even though the devices registered in Thing + Portal are powered on,  If the status is <b> OFF </b> </p>

Connect to the device using terminal / Putty and check the contents by executing the following command.
Verify that the device's current time is the same as UTC time reference [(link)] (http://www.worldtimeserver.com/current_time_in_UTC.aspx).

```bash
@shell:$ date
Thu 26 Nov 00:00:00 UTC 2015    # The system time of the current device is displayed.
```

If the time on the device is different from the UTC time, update the time.

```bash
@shell:$ ntpdate -u ntp.ubuntu.com
@shell:$ hwclock -w -u
```

If the system time update fails, update the time directly.

UTC timeframe [(link)] (http://www.worldtimeserver.com/current_time_in_UTC.aspx): January 01, 2015 00:00:00, 2015-01-01 00:00:00

```bash
@shell:$ date --set '20XX-XX-XX XX:XX:XX'
```

Reboot the device.

```bash
@shell:$ reboot
```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_arduino_start_error"> [Windows][Arduino] Error on <b>./thingplus.sh start</b>  </p>


Version issues with node: Issue the following command to check the version.
_node js must be v0.10.16._

```
node --version
```

Make sure `app.min.exe` is running with the command below.
     
```
tasklist | grep app.min  
```

If you see running `app.min.exe`, kill the process and run it again.

```
tasklist /f /pid [pid of app.min.exe] 

cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
./thingplus_device.sh restart
cd $HOME/thingplus/gateway
./thingplus.bat restart
```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_error_gw_register">&nbsp;<b>Failure </b> message occurred when registering gateway. </p> 
    
Make sure Gateway is pre-registered.

- Go to `Sensor List` in the upper menu and check whether the gateway you have registered is already registered.

- If it is already registered and does not operate normally, delete the gateway from `Gateway Management`.

- `./getmac`` to get the API KEY and make sure that APIKEY is entered at first execution.

  ```
  cd [Location where thingplus is installed]/gateway/thingplus-gateway/device/config
  cat runtime.json
  ```

- You will see something like this: Make sure the APIKEY part is the same as the APIKEY you have been issued.
- If you do copy and paste, typing directly will result in confusion between the lower case I and upper case I.
        
  ```
  ...

  "Gateway": {
  "name": "Gateway name"
  },
  "Server": {
     "APIKEY": "uL0................00r4="
   ...

  ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand"  id= "trbs_led_blink"> I configured the open hardware gateway, but the LED blinking does not work.</p>

- Make sure that the duration and flash time are not set incorrectly.

- Duration means the whole flashing time.

- For example, if the duration is set to 10 seconds and the flashing interval is set to 1 second, it means the following. It will be lit 5 ~ 6 times actually.
  
```
1 second on - 1 second off - 1 second on - 1 second off - 1 second on - 1 second off - 1 second on - 1 second off - 1 second on - 1 second off
```

In the source, the durationMs in `~/thingplus/openhardware/arduino/grove-starter-kit/led.js` is part of the duration.
![led.js](/assets/arduino_led_js.png)

If the setting is greater than the blink interval, the blinking should be activated.  If it still does not work, please see below.

In the case of Aduino,
It is recommended that you run it as an example of arduino except ThingPlus.
![arduino ide](/assets/arduino_led_ide.png)

Select `File> Example> 01.Basics> Blink` and upload after compile, you can see that led blink.

If this does not blink, it may be a device problem.

If blink works, please contact us at contact@thingplus.net.

If the connection is not by the base shield, the LED should be plugged to + 13 and GND to +.
![arduino_led](/assets/arduino_led.png)

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_error_rpc"> Rpc error occurs when registering gateway.</p>

- If rpc timeout occurs during gateway registration, gateway and cloud are not communicating.

  1. If APIKEY is not entered normally
  
  2. Thingplus_device.sh or thingplus.sh did not run
  
  3. This is probably one of the cases where no network is connected to the gateway.

- Here's how to check the logs to see if there are any problems.

  ```bash
  $ tail -F -n 300 /opt/thingplus/gateway/log/thingplus.log
  ```

- If you find it difficult to find the problem, please send us the log and we will check it.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_arduino_actuator"> I am following the arduino guide but the LED does not light up.</p>

- In PubSubClient, make sure to change the settings of `MQTT_MAX_PACKET_SIZE` and `MQTT_KEEPALIVE`.

- [reference](../open-hardware/arduino-noSSL-user-guide.html#id-pubsub)

<p class="dwfqExpand2"></p>

<!-- <p class="dwfqExpand" id= "trbs_error_key"> key 발급 에러 Key issue error</p>
<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_error_rspi"> 라즈베리파이 등록시 에러 Error in registering raspberry pie : <code>/usr/local/bin/node: not found</code> </p>
<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id= "trbs_error_install"> 설치시 에러 Installation error: <code>./thingplus_embedded_sdk_pi_install.sh: pushd: not found</code> </p>
<p class="dwfqExpand2"></p>
 -->
<!-- <p class="dwfqExpand"></p>
<p class="dwfqExpand2"></p> -->

<!-- [![arduino ide](/assets/arduino_led_ide.png)](javascript:open_youtube('https://www.youtube.com/embed/IdA3_FA9wLU?enablejsapi=1&amp;origin=http://thingplus.net'))

<div id='Utube' class="video-contianer drag ui-draggable ui-draggable-handle"></div>
 -->



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>