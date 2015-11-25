---
title: Troubleshooting
tags: "help"
published: true
permalink: /en/help/troubleshooting.html
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

<br/>
### When you can NOT find some sensors:

  - Unregistered snesors will be added automatically, when you reboot your Device.

<br/>
### Wehn you can NOT know the IP Address of your Device:

  - Install `Fing` App on your mobile phone([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - Connect to WiFi network of your router that your Device is connected.
  - Run `Fing`. You can sell all the devices with the IP Adresses in the same Network.
    - Case of Raspberry Pi : You can find the name, `raspberrypi`. It is the IP Address of your Device, and you can connect to your device using it.
    - Case of BeagleBoard : You can find the name, `beaglebone`. It is the IP Address of your Device, and you can connect to your device using it.