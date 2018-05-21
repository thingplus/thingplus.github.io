---
title: IR-Sensor examples
tags: "tutorial"
published: true
img : ic_ir.png
permalink: /en/help/code-share.html
---
### example contents 

1. [Air conditioner controller made with Raspberry pi](#tutorial-airconditioner)
2. [How to capture signals from my home air conditioner](#tutorial-aircon-capture)

---


<div id='tutorial-aircon-capture'></div>
<br/><br/>

### How to capture signals from my home air conditioner

---

- This example is an example of sharing the method of capturing another remote control signal which is not in lirc.sourceforge.net in the following `air conditioner controller made by Raspberry pi` example.

- materials 

  - [Raspberry pi](https://www.seeedstudio.com/Raspberry-Pi-3-Model-B-p-2625.html)
 
  - [Grove IR Emitter](https://www.seeedstudio.com/Grove-Infrared-Emitter-p-993.html)
  
  - [Grove IR Receiver](https://www.seeedstudio.com/Grove-Infrared-Receiver-p-994.html)
  
  - [Jumper](https://www.seeedstudio.com/1-Pin-Female-Male-Jumper-Wire-125mm-(50pcs-pack)-p-1319.html)
  
  - 리모콘

    ![sensors](/assets/tutorial-ir-capture-sensors.png)
    
---

1) Sensor connection

- IR Emitter

   IR Emitter pin     | Raspberry pin
   :-----------------:|:---------------------:
   GND                |         14
   VCC                |          4
   TX                 |         15

- IR Receiver

   IR Receiver pin      | Raspberry pin
   :-------------------:|:--------------------:
   GND                  |         39
   VCC                  |          1
   RX                   |         16

- Reference : [pin map](https://developer.microsoft.com/ko-kr/windows/iot/win10/samples/pinmappingsrpi2) 

<br/>

2) Signal capture

- Connect power and internet to Raspberry Pi.

- Place the IR emitter connected to Raspberry Pi in the direction of the air conditioner IR receiver so that the air conditioner can receive the signal.

- Put the following `ir-capture.sh` anywhere in Raspberry Pi.

  - When the temperature of the air conditioner is adjusted, there are devices that change to absolute values ​​and those that change to relative values.

  - The features we have identified are:

    - Samsung and LG were absolute value changes and carrier values ​​were relative value changes.
    - he device with the LCD on the remote control or the latest model was `absolute value`.

  - `Absolute value changing device`

    ```bash
    $ wget http://support.thingplus.net/download/install/ir-capture.sh
    $ chmod 755 ir-capture.sh
    ```

  - `Relative value changing device`

    ```bash
    $ wget http://support.thingplus.net/download/install/ir-capture-relative.sh
    $ chmod 755 ir-capture-relative.sh
    ```

- Enter the minimum and maximum temperature of the air conditioner as arguments when running ir-capture.sh.

  ```bash
  $ ./ir-capture.sh 18 30 
  //When the minimum temperature is 18 degrees and the maximum temperature is 30 degrees
  ```

- If you press the corresponding button on the remote control and type `Enter` according to the message, the IR emitter sends the air conditioner signal. At this time, confirm that the desired operation is performed, and if it works normally, press `y` (press the remote control toward the IR receiver)
  
  - Starting from the IR signal of `ON`,` IR signal of each temperature` and finally the IR signal of `OFF` are input.

  - Update the `/ etc / lirc / lircd.conf` file when you type.

  ```bash
  $ ./ir-capture.sh 18 30
  Push ON and Enter
  ./ir-capture.sh: line 29:  1174 Terminated              mode2 -d /dev/lirc0 -m > $1
  code works(y/n)?
  ```


- The remote control signal capture is complete. To control the air conditioner with the actual iot, refer to the [raspberry pie-making air conditioner controller] (# tutorial-aircontroller) below. 

> 주의

- The following is the difference when you configure [air conditioning controller made with raspberry pie] (# tutorial-aircontroller) below.

- `6) Downloading IR code of remote control` is skipped as we proceeded in this guide.


- The location of the evice agent is different (you must change it to airconditioner).

  - `8) Device agent installation`, please change the execution location as below.


    ```bash
    $ cd /opt/thingplus/openhardware/rasberrypi/airconditioner
    ```

  - `10) Device agent execution` Please change the execution location as below.

    ```bash
    $ /opt/thingplus/openhardware/raspberrypi/airconditioner/thingplus_device.sh start
    ```

<br/><br/>

---

<div id='tutorial-airconditioner'></div>
<br/><br/>

### Air conditioner controller made with raspberry Pi

---

- This example is an example to control the air conditioner for `LG air conditioner` using IoT.

- Temperature and humidity were added together in the example.

- materials

  - [Raspberry pi](https://www.seeedstudio.com/Raspberry-Pi-3-Model-B-p-2625.html)
  
  - [Grove high accuracy temperature/humidity](https://www.seeedstudio.com/Grove-Temperature%26Humidity-Sensor-(High-Accuracy-%26-Mini)-p-1921.html)
  
  - [Grove IR Emitter](https://www.seeedstudio.com/Grove-Infrared-Emitter-p-993.html)
  
  - [Jumper](https://www.seeedstudio.com/1-Pin-Female-Male-Jumper-Wire-125mm-(50pcs-pack)-p-1319.html)

    ![sensors](/assets/exam_ir_temp_sensor.png)

---

0) Sensor connection

- Temperature/humidity

   Func     | pin
   :-------:|:----------:
   GND      |          6
   VCC      |          2
   SDA      |          3
   SCL      |          5


- IR Emitter

   Func     | pin
   :-------:|:----------:
   GND      |         14
   VCC      |          4
   TX       |         15

-  Reference : [pin map](https://developer.microsoft.com/ko-kr/windows/iot/win10/samples/pinmappingsrpi2) 

<br/>

1) Install ThingPlus Gateway

  - [Reference](http://support.thingplus.net/ko/open-hardware/raspberry-pi-user-guide.html)

2) Install `lirc` on Raspberry Pi

```bash
pi$ sudo apt-get install lirc
```

3) Add a module to `/etc/modules`

```bash
lirc_dev
lirc_rpi gpio_in_pin=23 gpio_out_pin=22
```

4) Change `/etc/lirc/hardware.conf` to the following file

```bash
########################################################                                                                                                                                             
# /etc/lirc/hardware.conf                                                                                                                                                                            
# Arguments which will be used when launching lircd                                                                                                                                                  
LIRCD_ARGS="--uinput"                                                                                                                                                                                
# Don't start lircmd even if there seems to be a good config file                                                                                                                                    
# START_LIRCMD=false                                                                                                                                                                                 
# Don't start irexec, even if a good config file seems to exist.                                                                                                                                     
# START_IREXEC=false                                                                                                                                                                                 
# Try to load appropriate kernel modules                                                                                                                                                             
LOAD_MODULES=true                                                                                                                                                                                    
# Run "lircd --driver=help" for a list of supported drivers.                                                                                                                                         
DRIVER="default"                                                                                                                                                                                     
# usually /dev/lirc0 is the correct setting for systems using udev                                                                                                                                   
DEVICE="/dev/lirc0"                                                                                                                                                                                  
MODULES="lirc_rpi"                                                                                                                                                                                   
# Default configuration files for your hardware if any                                                                                                                                               
LIRCD_CONF=""                                                                                                                                                                                        
LIRCMD_CONF=""                                                                                                                                                                                       
######################################################## 
```

5) Add the following to `/ boot / config.txt`

```bash
dtoverlay=lirc-rpi,gpio_in_pin=23,gpio_out_pin=22
```

6) Downloading IR code of remote control

- The IR code for the remote control should be found in [HERE](http://lirc.sourceforge.net/remotes/).

```bash
sudo wget http://lirc.sourceforge.net/remotes/lg/6711A20015N -O  /etc/lirc/lircd.conf
```

7) Reboot

8) Device agent installation

```bash
sudo su
cd /opt/thingplus/openhardware/rasberrypi/house-monitor
npm install
```

9) Gateway registration

- Find the gateway ID and copy it.

```bash
pi$ /opt/thingplus/gateway/scripts/getGatewayID.sh 
```

- Make the gateway model `open source gateway`.

![Gateway](/assets/openhw_gw_model.png)

- Copy the returned API key (used in step-11).

10) Device agent execution

```bash
pi$ /opt/thingplus/openhardware/raspberrypi/house-monitor/thingplus_device.sh start

reference) The options for thingplus_device.sh are start, stop, and restart. 
```

11) API key registration and gateway execution

```bash
pi$ APIKEY='COPYED_API_KEY' /opt/thingplus/gateway/thingplus.sh start

reference) The options for thingplus_device.sh are start, stop, and restart.
```

12) Reference: How to view the log

```bash
* Device agent log
pi$ tail -F -n 300 /opt/thingplus/openhardware/raspberrypi/house-monitor/log/thingplus_device.log
* Gateway log
pi$ tail -F -n 300 /opt/thingplus/gateway/log/thingplus.log
```


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>