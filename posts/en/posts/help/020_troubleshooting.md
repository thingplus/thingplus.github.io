---
title: Troubleshooting
tags: "help"
published: true
permalink: /en/help/troubleshooting.html
---
<div id='id-trouble1'></div>
Troubleshooting

1. [When you can NOT find a new sensor and/or gateway from the`Sensor` page after you registered it](#id-trouble1)
2. [When you can NOT find some sensors](#id-trouble2)
3. [When you can NOT know the IP Address of your Device](#id-trouble3)
4. [Even though your device is registered at Thing+ Portal and turned on, Status at the Portal is `OFF`](#id-trouble4)

---

### When you can NOT find a new sensor and/or gateway from the`Sensor` page after you registered it:

 - It takes few minutes to register sensors and gateways, so please Refresh the Sensor page after 1~2 minutes.
 - If you still can NOT find them after few minutes, please Connect to your Device, and Try run below commands.

    ```
    @shell:$ cd /opt/thingplus/gateway
    @shell:$ ./thingplus.sh restart
    @shell:$ cd log
    @shell:$ tail -F -n 300 thingplus.log
    ```

<div id='id-trouble2'></div>
<br/>

### When you can NOT find some sensors:

  - Unregistered snesors will be added automatically, when you reboot your Device.

<div id='id-trouble3'></div>
<br/>

### When you can NOT know the IP Address of your Device:

  - Install `Fing` App on your mobile phone([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - Connect to WiFi network of your router that your Device is connected.
  - Run `Fing`. You can sell all the devices with the IP Adresses in the same Network.
    - Case of Raspberry Pi : You can find the name, `raspberrypi`. It is the IP Address of your Device, and you can connect to your device using it.
    - Case of BeagleBoard : You can find the name, `beaglebone`. It is the IP Address of your Device, and you can connect to your device using it.

<div id='id-trouble4'></div>
<br/>

### Even though your device is registered at Thing+ Portal and turned on, Status at the Portal is `OFF`:

- Connect to your Device using Terminal/Putty, and please Enter the below command to check system clock of your Device.

- Please comapare the System Clock with UTC Time[(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx) whether both times are same or not.

  ```bash
  @shell:$ date
  Thu 26 Nov 00:00:00 UTC 2015    #Display current system Clock
  ```

- If both times are not same, please Update the system clock of your Device.

  ```bash
  @shell:$ ntpdate -u ntp.ubuntu.com
  @shell:$ hwclock -w -u
  ```

- If you failed to update the time, Update it directly.

  - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @shell:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

- Reboot your Device.

  ```bash
  @shell:$ reboot
  ```
