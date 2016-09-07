---
title: FAQ
tags: "help"
published: true
img: ic-faq.png
permalink: /en/help/faq.html
---

* Q. I don't know anything about IoT, can I use Thing+?

* Q. Who built Thing+?

* Q. How long can Thing+ be used for?

* Q. How much does Thing+ cost?

* Q. How do I set up a line chart to appear on the Dash board? 
  - Click set icon for upper side <i class="fa fa-cog fa-lg"></i> of widget.
  - Click "time zone" on right side of "Set widget" screen. Can set up to 24 hours. 

* Q. How to monitor old data?
  - Click sensor analysis on menu <i class="fa fd-menu_analysis fa-lg"></i> on top.
  - Select Gateway. 
  - Select sensor type.
  - select from 1 hour to 7days. 
  - choose initial date to monitor (Without adjustment, initial day is today)
  - As selected time zone on orrange color, upper graph will display data.   (Drag orange colored area for previous graph on chart)
  - Get CSV file to use excel in setting term of data by click <i class="fa fa-fw fa-download fa-lg"></i>. 

* Q. Compare sensor data 
  - Add sensor selection by click <i class="fa fa-fw fa-plus fa-lg"></i> icon.  
  - Then, compare other sensor data by use of data analysis.  

* Q. How to update Openhardware package

  - Thingplus offer opensoruce for open-hardware.

  - Now, we support Raspberry Pi, BeagleBone Green, Edison, Arduino

  - How to update `Device Agent`

    ```bash
    # cd /opt/thingplus/openhardware 
    $ git pull
    ```

  - How to update `Gateway` 

    - first, please check version of Gateway.

    ```bash
    # cat /opt/thingplus/gateway/VERSION
    ```

    - ***latest version is v0.4.2***

      - in case of under than v0.4.2

      ```bash
      # cd /opt/thingplus/gateway

      (In case of Raspberry PI)
      # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_update.sh
      (In case of BBG) 
      # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bbg_update.sh
      (In case of Edison) 
      # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_edison_update.sh

      # chmod 755 ./thingplus_embedded_sdk_xxx_update.sh
      # ./thingplus_embedded_sdk_xxx_update.sh
      ```

      - After update is done, Gateway will be re-run and device agent is the privious status intact.

      - In case of later than v0.4.2 

      ```bash
      # cd /opt/thingplus/gateway
      # ./thingplus.sh update
      ```


<br>

