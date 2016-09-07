---
title: Troubleshooting
tags: "help"
published: true
img: ic-troubleshooting.png
permalink: /en/help/troubleshooting.html
---
<div id='id-trouble1'></div>
Troubleshooting

1. [When you can NOT find a new sensor and/or gateway from the`Sensor` page after you have registered it](#id-trouble1)
2. [When you can NOT find specific sensors](#id-trouble2)
3. [When you do NOT know the IP Address of your Device](#id-trouble3)
4. [Even though your device is registered at the Thing+ Portal and turned on, the status at the Portal is `OFF`](#id-trouble4)

---

### When you can NOT find a new sensor and/or gateway from the`Sensor` page after you have registered it:

 - It takes a few minutes to register sensors and gateways. Please continue refreshing the page - your sensors/gateways should appear eventually.
 - If you still can NOT find them after a few minutes, please Connect to your Device, and Try running the below commands.

    ```
    @shell:$ cd /opt/thingplus/gateway
    @shell:$ ./thingplus.sh restart
    @shell:$ cd log
    @shell:$ tail -F -n 300 thingplus.log
    ```

<div id='id-trouble2'></div>
<br/>

### When you can NOT find specific sensors:

  - Unregistered snesors will be added automatically when you reboot your Device - please try rebooting.

<div id='id-trouble3'></div>
<br/>

### When you do NOT know the IP Address of your Device:

  - Install the `Fing` App on your mobile phone([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - Connect to the WiFi network of the router that your Device is connected.
  - Run `Fing`. You will see all devices with IP Adresses in the same Network.
    - Case of Raspberry Pi : You can find the name, `raspberrypi`. It is the IP Address of your Device, and you can connect to your device using it.
    - Case of BeagleBoard : You can find the name, `beaglebone`. It is the IP Address of your Device, and you can connect to your device using it.

<div id='id-trouble4'></div>
<br/>

### Even though your device is registered at the Thing+ Portal and turned on, the status at the Portal is `OFF`:

- Connect to your Device using Terminal/Putty, and please enter the below commands to check the system clock of your Device.

- Please comapare the System Clock with UTC Time[(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx) and confirm that both times are the same.

  ```bash
  @shell:$ date
  Thu 26 Nov 00:00:00 UTC 2015    #Display current system Clock
  ```

- If both times are not the same, please Update the system clock of your Device.

  ```bash
  @shell:$ ntpdate -u ntp.ubuntu.com
  @shell:$ hwclock -w -u
  ```

- If you cannot update the time in this way, update it directly.

  - UTC Time zone [(Link)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): ex) 2015/01/01 00:00:00 => 2015-01-01 00:00:00

    ```bash
    @shell:$ date --set '20XX-XX-XX XX:XX:XX'
    ```

- Reboot your Device.

  ```bash
  @shell:$ reboot
  ```
