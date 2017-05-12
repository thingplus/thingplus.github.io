---
title: ArduinoSensor
published: true
img: ic-troubleshooting.png
permalink: /en/arduinoSensor.html
---


### Thing+ Arduino Overview

Internet connection is mandatory to send sensor values to Thing+ Platform. But a general arudino board doesn’t have the interface for the internet connection. because of that, Ethernet/Wifi Shield or a gateway having the internet connection interface is required.

<br>

Thing+ supports the gateway model which uses a PC as a gateway for sending sensor values from an Arduino board with the option, “Arduino, PC-Developer” on Thing+ Portal.
2 agent applications will run on your PC, Thing+ Gateway and Device Agent.
Thing+ Gateway communicates with Thing+ cloud and Device Agent collect the sensor values.
These 2 applications communicates with each other over TCP/IP with JSONRPC Format.

<br>

Thing+ Gateway is provided as the binary format. Device Agent is provided as the JavaScript format running on node.js environment and users can easily modify the Device Agent code for supporting various sensors and actuators.

<br>

"Arduino, PC-Developer" model supports the "Grove Kit" device model. 
And “Open hardware - Custom” Mdoel also can use. This model allow any kinds of Open H/W with developing Device Agent which can communicates with Thing+ Gateway over TCP/IP with JSONRPC Format.

<br>

![](/assets/arduinoSensor1.png)
The red part on the picture can be modified.

<br/>

____

### Sensor Integration with Arduino
The easiest way to integrate a Arduino and Sensors to Thing+ Cloud is that,

i. Install Thing+ Embedded package.<br>
ii. Modify the Device Agent source on ‘openhardware/arduino/grove-starter-kit’ path.

Please refer the below guides and integrate your own Arduino and Device Agent App with Thing+ Cloud.


#### 1. Johnny-five
Device Agent uses johnny-five which is the open source code for contorlling Arduino.

[http://johnny-five.io](http://johnny-five.io)<br/>
[https://github.com/rwaldron/johnny-five](https://github.com/rwaldron/johnny-five)<br/>
(You can get more information about johnny-five from the above links)

In general, Arduino Program is written on Arduino IDE with C Language and uploaded to the Arduino board but johnny-five uses the Standard Firmata on Example. After uploading the Standard Firmata to Arduino, you can write the arduino program on your PC connected to the Arduino Board and excute your program.

Please refer the johnny-five example code for the sensors which will be attached to your Arduino board.

<br/>

#### 2. Device Agent

Device Agent is the application to collect the sensor values and send them to Thing+ Gateway Application which is the application communicates with Thing+ cloud directly.

You can find the Device Agent Sample code from Thing+ Embedded Package and modify it for adding various sensors and actuators.

Currently, The ‘Grove Kit” model of “Arduino, PC - Developer” on Thing+ Package doesn’t have the temperature nor humidity sensor. **We’d like to explain how to use HTU21D Sensor with Arduino which can gather the temperature and humidity data.** This guide includes how to modify the Device Agent code for using the HTU21D Sensor.

<br/>

##### 1) app.js (`~/thingplus/openhardware/arduino/grove-starter-kit/app.js`)
app.js is the core of Device agent. It includes the basic information of sensors and behavior of them.

```javascript
function _lcdActuating(sensor, cmd, options, cb)
function _buzzerActuating(sensor, cmd, options, cb)
function _ledActuating(sensor, cmd, options, cb)
function _relayActuating(sensor, cmd, options, cb)
function _analogConstructor(sensor)
function Device(id)
function getSensorById(sensors, id)
Device.prototype.sensing = function ()
Device.prototype.discovering = function (result)
Device.prototype._init = function ()
Device.prototype._serverInit = function ()
```

It has these functions. the first step of the modification is to edit `function Device(id)`.
<!-- ![](/assets/arduinoSensor2.png) -->
```javascript
function Device(id) {
  this.sensors = [{
  name: 'relay',
  type: 'powerSwitch',
  notification: false,
  constructor: Relay,
  actuating: _relayActuating,
  pin: '4'
  },{
  name: 'Button',
  type: 'onoff',
  notification: true,
  constructor: ToggleSensor,
  pin: '5'
  }, {
  name: 'touch',
  type: 'onoff',
  notification: true,
  constructor: Relay,
  pin: '6'
  }, {
  name: 'light',
  type: 'light',
  notification: false,
  constructor: Light,
  pin: 'A0'
  }, {
    .
    .
    .
```
<br>
This is the code inclduing the sensor information.
Currently, it only has the informatin about 10 sensors supported by Grove Kit Model. 
At this time, we will add only HTU21D sensor. So Delete the existing codes and wirte codes as the below.

<!-- ![](/assets/arduinoSensor3.png) -->
```javascript
this.sensors = [{
  name: ’temperature',
  type: ’temperature',
  notification: false,
  constructor: Temperature
}, {
  name: ’humidity',
  type: ‘humidity',
  notification: false,
  constructor: Humidity
}];
```
<br>
and remove below functions which are related to the removed sensors.
```javascript
function _lcdActuating(sensor, cmd, options, cb)
function _buzzerActuating(sensor, cmd, options, cb)
function _ledActuating(sensor, cmd, options, cb)
function _relayActuating(sensor, cmd, options, cb)
function _analogConstructor(sensor)
```


<br/>
![](/assets/arduinoSensor4.png)

this.sensors are the method to get the list of soensors. It returns the set of objects that each object has 4 properties, name, type, notification, constructor.

- name: Name of the Sensor which will be used on Thing+ Cloud. It is used for Sensor ID, too. So, it should be properly named in english.
- type: Currently, Thing+ supports 41 sensors for open hardware. it has one of the 41 sensor types as the value. unless you can find the proper sensor type, you can choose number or string based on the actual sensor value
- notification: If the sensor value should be reported periodically(i.e. Temperature, Humidity), the value of this property should be false. otherwise(i.e. detect a movement, button), it should be true.
- constructor: It is the function to create sensor driver for the initialization.


<br>

You can get the full list of sensor types from the link, [http://support.thingplus.net/en/open-hardware/](http://support.thingplus.net/ko/open-hardware/openhardware-list.html#Extra-sensors) 
![](/assets/arduinoSensor5.png)

If you complete the list of sensor part, you should implement the driver for each sensor.

You can get the below code from the beginning part of app.js
<!-- ![](/assets/arduinoSensor6.png) -->
```javascript
var ToggleSensor = require('./toggleSensor'),
    Light = require('./light'),
    Analog = require('./analog'),
    Relay = require('./relay'),
    Led = require('./led'),
    ToggleActuator = require('./toggleActuator'),
    Lcd = require('./lcd'),
    Temperature = require('./temperature');
```

This is for loading the driver module for each sensor. You should modify them like below because you already remove the codes for other sensors.
<br>
<!-- ![](/assets/arduinoSensor7.png) -->
```javascript
var Humidity = require(‘./humidity’),
    Temperature = require('./temperature');
```
<br/>

Each module should exist on the same directory with app.js and they should be named as ‘humidity.js’ and ‘temperature.js’

In case of ‘temperature.js’, you can see it from the original code but you should modify it for using HTU21D Sensor and create ‘humidity.js’.
<br>
![](/assets/arduinoSensor8.png)
<br/>

##### 2) temperature.js
The original ‘temperature.js’ code has below functions.

```javascript
function Temperature(pin)
Temperature.prototype.getValue = function (cb)
Temperature.prototype.statusSync = function ()
Temperature.prototype.trigger = function (cb)
```

<br>
__a)__ HTU21D is connected to Arduino with the I2C interface. So, the confiration for Pin is not required. Please modify the constructor like below.
(This code is based on [Thermometer - HTU21D - johnny-five example](https://github.com/rwaldron/johnny-five/blob/master/docs/temperature-htu21d.md))
<!-- ![](/assets/arduinoSensor9.png)  -->
```bash
node eg/temperature-htu21d.js
```


```javascript
var five = require("johnny-five");
var board = new five.Board();

board.on("ready", function() {
  var thermometer = new five.Thermometer({
    controller: "HTU21D" 
  });

  thermometer.on("change", function() {
    console.log(this.celsius + "°C", this.fahrenheit + "°F");
  });
});
```

<br>

Modify the `controller`(refer the picture)

If pin value exists, input function Temperature Pin

Case : If Pin Exists
<!-- ![](/assets/arduinoSensor10.png) -->
<!-- ![](/assets/arduinoSensor11.png)
<br/> -->
```javascript
board.on("ready", function() {
  var thermometer = new five.Thermometer({
    controller: "GROVE",
    pin: "A0"
  });
```
<br>
In case of the latest version, it supports both `five.Thermometer` and `five.Temperature` but the older version doesn’t support `five.Thermometer`. so, please use `five.Temperature`. 
```javascript
function Temperature() {
  this.temperature = new five.Temperature({controller: 'HTU21D'});
}
```

<br>
__b)__ Temperature value will be reported periodically. <br>So, remove `Temperature.prototype.trigger = function (cb)`
![](/assets/arduinoSensor12_en.png)
<br/>
You can use ‘Temperature.js’ as driver for HTU21D Sensor after completes these modification

<br/>

#### 3) humidity.js
The example of johnny-five for humidity is very similar with the example for temperature.

[Thermometer - HTU21D](https://github.com/rwaldron/johnny-five/blob/master/docs/temperature-htu21d.md)<br>
[Hygrometer - HTU21D](https://github.com/rwaldron/johnny-five/blob/master/docs/hygrometer-htu21d.md)

The difference between the examples,
![](/assets/arduinoSensor13.png)
- In case of temperature sensor, it uses `five.Thermometer`(or `five.Temperature`). But it uses `five.Hygrometer` for Humidity sensor

- When it gets the sensor value for temperature, it reads the value of celsius property. but it reads the value of relativieHumidity property for Humidity.

Except these 2 differences, all parts are same. So, you can write humidity.js like below.
```javascript
'use strict';

var five = require('johnny-five');

function Humidity() {
  this.humidity = new five.Hygrometer({controller: 'HTU21D'});
}

Humidity.prototype.getValue = function (cb) {
  var self = this;

  if (cb) {
    process.nextTick(function () {
      cb(null, self.humidity.relativeHumidity.toFixed(2));
    });
  }
```

If you’d like to use any other sensors, please refer the [Johnny-Five examples](https://github.com/rwaldron/johnny-five#example-programs) and use the proper example.



































