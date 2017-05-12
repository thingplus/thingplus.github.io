---
title: ArduinoSensor
published: true
img: ic-troubleshooting.png
permalink: /ko/arduinoSensor.html
---


### Thing+ Arduino Overview

Arduino에서 얻은 센서 데이터를 Thing+에 전송하기 위해서는 Internet 연결이 필요합니다. 그러나, 아두이노 자체만으로는 Internet에 연결할 수 없기 때문에, Ethernet / WiFi Shield나 Internet 연결이 가능한 gateway를 통해 데이터를 전송할 수 밖에 없습니다.
Thing+의 "Arduino, PC - Developer” 모델을 선택하여 게이트웨이를 등록하면 PC를 gateway로 삼아 Arduino에서 얻은 데이터를 PC를 통해 Thing+로 전송할 수 있습니다.

<br>

이를 위하여 PC에는 Thing+ Gateway와 Device Agent라는 2개의 app을 실행해야 합니다.
Thing+ Gateway는 Thing+ Cloud와 연동하여 센서 데이터를 서버로 전송하는 역할을 하고, Device Agent는 센서에서 얻어온 데이터를 수집하는 역할을 합니다.
이 두 app은 TCP/IP 통신을 이용하여 JSONRPC 규격으로 데이터를 주고 받습니다.

<br>

Thing+ Gateway는 binary형태로 제공되며, Device Agent는 사용자들이 원하는 센서와 드라이버를 추가 / 변경할 수 있도록 node.js 환경에서 실행되는 javascript 형태로 제공됩니다. 때문에, 프로그래밍이 가능한 개발자들의 경우 Device Agent를 수정 개발하거나 Thing+ Gateway에서 요구하는 JSONRPC 규격에 맞추어 별도 구현하여 사용자만의 Device Agent를 구현할 수 있습니다.

<br>

현재, “Arduino, PC - Developer” 모델은 "Grove Kit"라는 device model을 지원하고 있습니다. 그리고 “Open Hardware - Custom” 모델 역시 사용할 수 있습니다. “Open Hardware - Custom” 모델은 개발자들이 Device Agent를 구현하여 보다 많은 종류의 센서를 Open Hardware의 종류와 상관없이 연동할 수 있습니다.

<br>

![](/assets/arduinoSensor1.png)
위의 그림에서 적색 부분의 file 만을 수정 하여 구성 할 수 있습니다.

<br/>

____

### Arduino와 센서 연동 하기
가장 쉽게 자신만의 Arduino와 센서들을 연동시키는 방법은 저희가 제공하고 있는 Thing+ Embedded 패키지를 설치한 후 openhardware/arduino/grove-starter-kit 아래에 있는 Device Agent의 소스를 수정하는 것입니다. 
아래의 내용들을 참고하여 자신만의 Arduino와 Device Agent를 Thing+와 연동해 보시기 바랍니다.


#### 1. Johnny-five
Device Agent는 johnny-five라는 open source를 이용하여 Arduino를 제어 합니다.

[http://johnny-five.io](http://johnny-five.io)<br/>
[https://github.com/rwaldron/johnny-five](https://github.com/rwaldron/johnny-five)<br/>
(위의 링크를 참조하시면 johnny-five에 관련된 document와 예제를 볼 수 있습니다.)

일반적인 Arduino 프로그래밍은 Arduino IDE에서 C로 Arduino 프로그램을 작성하여 upload하지만, johnny-five는 Arduino 프로그램 대신 메뉴의 Example에 있는 Standard Firmata를 upload한 후, Arduino와 연결된 PC에서 프로그램을 개발하고 실행합니다.
개발자가 연동하려는 센서에 해당하는 Johnny-five 예제를 참고하여 Device Agent에 적용하여 보시기 바랍니다.

<br/>

#### 2. Device Agent

Thing+ Cloud에 데이터를 전송하는 Thing+ Gateway app에 Arduino에서 수집한 데이터를 전송하는 역할을 하는 App을 Device Agent라 부릅니다.
Thing+ Embedded 패키지의 openhardware directory에 저희가 예제로 제공하는 Device Agent의 소스가 있는데, 이 소스를 수정하면 보다 다양한 센서를 추가할 수 있습니다.

현재 thingplus.net 의 게이트웨이 생성에서 “Arduino, PC - Developer”의 “Grove Kit” 모델에는 온도, 습도 센서가 없는데, **Arduino에 온도와 습도를 얻을 수 있는 HTU21D 센서를 연결한 후 이를 Thing+ 연동하는 것을 목표**로 Device Agent를 수정해보도록 하겠습니다.

<br/>

##### 1) app.js (`~/thingplus/openhardware/arduino/grove-starter-kit/app.js`)
app.js는 Device Agent의 가장 중심이 되는 파일로 Arduino의 센서 구성에 관련된 정보와 기본 동작들이 구현되어 있습니다.

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

위와 같은 함수로 구성되어 있는데, 첫번째로 수정해야할 부분은 `function Device(id)` 부분입니다.
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
위의 코드가 센서 구성에 관련된 정보가 구현되어 있는 부분입니다
현재의 구현은 Grove Kit 모델에서 지원하는 10종 센서로 구성되어 있는데,
이번에는 HTU21D 센서를 이용하여 온도와 습도만 연동할 계획이므로 기존 내용을 삭제하고 아래와 같이 구성합니다.

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
그리고, 삭제된 센서의 동작에 해당하는
```javascript
function _lcdActuating(sensor, cmd, options, cb)
function _buzzerActuating(sensor, cmd, options, cb)
function _ledActuating(sensor, cmd, options, cb)
function _relayActuating(sensor, cmd, options, cb)
function _analogConstructor(sensor)
```
를 모두 삭제합니다.

<br/>
![](/assets/arduinoSensor4.png)

센서 목록에 해당하는 this.sensors를 보면 name, type, notification, constructor라는 4개의 property를 가진 object로 센서의 정보를 표현하고 있는데, 그 의미는 아래와 같습니다.

- name: Thing+에서 사용할 센서의 이름. 센서 ID에도 이용되므로 적절한 영문 이름을 사용하도록 합니다
- type: 현재 Thing+에서 open hardware에 지원하는 센서의 종류는 현재 총 41종이며(참조 1), 그 중 사용할 센서에 해당하는 종류의 센서 type을 명시한다. 만약 적절한 센서가 없으면 센서에서 올라오는 값에 따라 number나 string을 type으로 사용합니다.
- notification: 주기적으로 데이터를 전송할 센서(온도, 습도 등)는 false, event형 센서(움직임 감지, 버튼 등)일 경우 true로 설정합니다.
- constructor: 초기화 단계에서 센서 driver를 생성하는 함수. 초기화 과정에서 호출됩니다.

<br>

Type을  확인 하시려면 [http://support.thingplus.net/ko/open-hardware/](http://support.thingplus.net/ko/open-hardware/openhardware-list.html#Extra-sensors) 에서 확인 가능 합니다. 아래 이미지에서 type 부분입니다.
![](/assets/arduinoSensor5.png)

위와 같이 센서 목록을 구성하였으면, 각 센서의 driver를 구현해야 합니다.

app.js의 시작부분을 보면 아래와 같은 부분이 있습니다.
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

이 부분은 각 센서의 driver module을 load하는 부분으로 다른 센서들은 목록에서 모두 삭제하였으므로 아래와 같이 수정합니다.
<br>
<!-- ![](/assets/arduinoSensor7.png) -->
```javascript
var Humidity = require(‘./humidity’),
    Temperature = require('./temperature');
```
<br/>

각 모듈은 humidity.js와 temperature.js라는 이름으로 app.js과 같은 directory에 존재해야 한다. temperature.js는 기존 소스에 있으나, 다른 온도 센서(HTU21D)를 사용하므로 수정해야하며, humidity.js는 새로 만들어야 합니다.
<br>
![](/assets/arduinoSensor8.png)
<br/>

##### 2) temperature.js
기존 temperature.js는 아래와 같은 함수로 이루어져있습니다.

```javascript
function Temperature(pin)
Temperature.prototype.getValue = function (cb)
Temperature.prototype.statusSync = function ()
Temperature.prototype.trigger = function (cb)
```

<br>
__a)__ HTU21D는 I2C interface로 Arduino에 연결되어 있으므로 pin과 관련된 설정이 필요없고, johnny-five에 controller가 정의되어 있으므로 [Thermometer - HTU21D - johnny-five 예제](https://github.com/rwaldron/johnny-five/blob/master/docs/temperature-htu21d.md)를 참조하여 constructor를 아래와 같이 수정합니다.
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

위의 코드처럼 `controller`를 참조하여 `controller`를 수정합니다.
pin 값이 있는 경우는 아래에서 `function Temperature (pin)` 을 입력 해주면 됩니다.<br>
비교> pin 이 있는 경우의 예시
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
단, 최신 버전의 경우 `five.Thermometer`와 `five.Temperature`를 모두 지원하나, 과거 버전의 경우 `five.Thermometer`를 지원하지 않으므로 `five.Temperature`를 사용합니다. 
```javascript
function Temperature() {
  this.temperature = new five.Temperature({controller: 'HTU21D'});
}
```

<br>
__b)__ 주기적으로 데이터를 전송할 계획이므로 `Temperature.prototype.trigger = function (cb)`는 삭제합니다.
![](/assets/arduinoSensor12.png)
<br/>
이렇게 2곳을 수정하면 HTU21D용 temperature driver로 사용 가능합니다.

<br/>

#### 3) humidity.js
HTU21D를 온도 센서로 사용할 때와 습도 센서로 사용할 때의 예제를 보면 대동소이함을 알 수 있습니다.

[Thermometer - HTU21D](https://github.com/rwaldron/johnny-five/blob/master/docs/temperature-htu21d.md)<br>
[Hygrometer - HTU21D](https://github.com/rwaldron/johnny-five/blob/master/docs/hygrometer-htu21d.md)

차이점은,
![](/assets/arduinoSensor13.png)
- 온도 센서의 경우 `five.Thermometer` (혹은 `five.Temperature`)를 사용하지만, 습도 센서의 경우 `five.Hygrometer`를 사용합니다

- 센서 값을 읽을 때 온도 센서는 celsius property의 값을 읽지만, 습도 센서는 relativeHumidity property의 값을 읽습니다

이외에는 사용 방법이 같으므로 이를 감안하여 아래와 같이 humidity.js를 작성합니다
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

기타 다른 센서들을 붙이려고 할때는 [Johnny-Five examples](https://github.com/rwaldron/johnny-five#example-programs)에서 맞는 센서를 찾아서 동일한 방법으로 붙이면 됩니다.



































