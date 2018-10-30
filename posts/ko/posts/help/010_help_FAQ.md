---
title: 자주 묻는 질문
tags: "help"
published: true
img: ic-faq.png
image: "http://support.thingplus.net/assets/ogp/ogp_faq.png"
permalink: /ko/help/faq.html
---

자주 질문하시는 내용에 대한 답변을 준비했습니다.

---

<p class="dwfqExpand" id="faq_dashboard_01">  대시보드 라인차트 기간 설정 변경은 어떻게 할 수 있나요?</p>

변경하고자 하는 위젯의 우측 상단 <i class="fa fa-cog fa-lg"></i> 설정 아이콘을 클릭하세요

`위젯설정` 화면에서 "기간" 항목의 우측을 클릭하여 원하는 시간 범위를 선택하세요. 최대 24시간까지 선택할 수 있습니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_sensorData"> 센서의 과거 데이터를 어떻게 조회하나요?</p>

1. 상단 메뉴 중 <i class="fa fd-menu_analysis fa-lg"></i> 센서분석 선택
2. 게이트웨이를 선택
3. 센서 종류를 선택
4. 1시간 전 ~ 7일 전 중 기간을 선택
5. 조회 시작 날짜를 선택(기본은 현재 날짜이며, 선택한 날짜 기준으로 선택한 기간까지 조회됩니다.)
6. 하단 주황색으로 표시된 영역만큼 상단 그래프 영역에 표시됩니다.(주황색 영역을 드래그하면 이전 그래프를 상단 그래프영역에서 볼 수 있습니다.)
7. 위에서 설정한 기간 전체의 데이터는 <i class="fa fa-fw fa-download fa-lg"></i> 아이콘을 클릭하면 CSV파일로 다운로드가 가능합니다.(엑셀로 확인 가능)

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_compare_sensorData"> 센서데이터 비교하는 방법</p>

1. <i class="fa fa-fw fa-plus fa-lg"></i> 아이콘을 클릭하면 센서 선택창을 추가할 수 있습니다.
2. 이후 데이터 조회하는 방법과 동일하게 설정하여 여러 센서데이터를 비교할 수 있습니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_install_wget"> Mac 에서 wget 설치 방법</p>

wget을 설치 하기 위해서는 brew가 설치 되어 있어야 합니다.

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

brew 명령어를 사용하여 wget을 설치 합니다.

```
brew install wget
```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_not_grove"> guide에 있는 것처럼 Gove sensor kit 만 사용해야 하나요? </p>

아닙니다.

참고용으로 예제는 Grove kit을 사용해서 배포 하였지만 약간만 소스를 수정하시면 다른 센서들도 사용 가능 하십니다.
추후 관련한 내용을 update 할 예정이지만, 아래의 link에서 임시로 해당 내용에 대해 확인 가능하십니다.

[다양한 센서 연결 가이드](../arduinoSensor.html)를 참고하세요

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_useWifi"> Ethernet이 아닌 WiFi 동글을 붙여서도 Thing+ Portal에 등록이 가능한가요?</p>

네 가능합니다.

Ethernet이나 WiFi는 모두 인터넷에 연결하기 위한 도구일 뿐이기에, 인터넷이 연결되어 있고, Thing+ Embedded가 설치되어 있다면, Thing+ Portal에 바로 붙여서 사용하실 수 있습니다.
또한 해당 하드웨어의 가이드 내용 안에 WiFi 동글을 연결하는 방법을 안내해드리고 있습니다.
해당 내용 참고하셔서 연결하시면 됩니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_sensor_port"> 가이드에는 GrovePi+ 쉴드의 특정 포트에 특정 센서를 연결해야 하는데 가이드를 따라서 꽂아야 하나요? </p>

네 그렇습니다.

현재로써는 저희의 가이드 문서에 나와있는 것과 같은 포트에 같은 센서를 연결하셔야 합니다.
다만, Thing+ Embedded 내에 설치되어 있는 Openhardware디렉토리(/opt/thingplus/openhardware/) 내의 샘플을 수정하시면 다른 포트에 연결하실 수 있습니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_oauth2"> OAuth2 가 뭔가요?</p>

웹, 모바일 앱 등 어플리케이션에서 권한 인증을 수행할 수 있는 표준 방법인 오픈 프로토콜입니다.
불특정인의 접근을 방지하기 위한 보안 도구이며, Facebook, Twitter 등에서도 사용하고 있는 방법입니다.
관련 내용은 [여기](https://thingplus.api-docs.io/2.0/oauth2)에서도 확인가능 합니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id="faq_thingplus_infra"> ThingPlus의 서버가 AWS를 이용한 한것인가요? </p>

AWS를 IaaS로만 이용해서 thing+ 소프트웨어를 구축 구조가 맞구요.
최근에 AWS에서도 PaaS 형태로 lambda를 이용한 연동 솔루션을 내놓고 있습니다.
저희도 그와 시너지를 낼 요소를 고민 하고 있는 중입니다.
Infra 만을 쓰고 사용자와 서비스 관리 기능들이 포함된 SaaS이면서 실제로 REST API 를 제공하는 플랫폼적인 PaaS로써의 서비스도 함께 개발 및 제공하고 있습니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_service_type"> IaaS, PaaS, SaaS란 무엇인가요?</p>

- `IaaS(Infrastructure as a Service)` : 서버를 운영하기 위해서는 서버 자원, IP, Network, Storage, 전력 등등 인프라를 구축하기 위해 여러가지가 필요합니다. Iaas는 이러한 것들을 가상의 환경에서 쉽고 편하게 이용할 수 있게 서비스 형태로 제공합니다. Iass를 서비스로 제공하기 위해 기존 서버 호스팅보다 H/W 확장성이 좋고 탄력적이며 빠른 제공을 할 수 있는 가상화 기술을 이용합니다. Iass는 Pass, Saas의 기반이 되는 기술입니다.

- `PasS(Platform as a Service)` : 서비스를 개발 할 수 있는 안정적인 환경(Platform)과 그 환경을 이용하는 응용 프로그램을 개발 할 수 있는 API까지 제공하는 형태를 Paas라고 합니다.

- `SaaS(Software as a Service)` : Cloud환경에서 동작하는 응용프로그램을 서비스 형태로 제공하는 것을 Saas라고 합니다. 예를들어 메일 서비스를 들 수 있습니다. 사용자는 이 시스템이 무엇으로 이루어져 있고 어떻게 동작 하고 있는지 그리고 메일을 백업을 어떻게 하는지 알 필요가 없습니다. 그저 서비스 형태로 원하는 단말기(PC, Tablet, SmartPhone 등등)에서 메일을 주고 받으며, 필요하면 언제든지 공간도 늘려서 서비스를 받을 수 있기 때문입니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id ="faq_gatewayID"> 게이트웨이 ID가 컴퓨터 맥주소인것 같은데 왜 게이트웨이 ID라고 명명하는지 궁금합니다 </p>

꼭 게이트웨이 ID가 mac address이어야 하는 것은 아닙니다.

게이트웨이를 구별 할 수 있는 unique 한 ID를 사용한 건데요.
UUID나 IMEI등, 단말이 unique 한 구분이 가능하다면 id로 사용할것입니다.
현재 오픈하드웨어는 모두 mac address를 id로 사용하고 있습니다.
그리고 그러한 혼란을 막기 위해 getmac이라는 script를 getGatewayId로 변경했습니다. guide에서도 mac adress라는 단어를 지양하려고 합니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_raspberry_b"> 라즈베리파이 1 B+ 을 사용하고 싶습니다.</p>

- `라즈베리파이 1 B+`를 사용하기 위해서는 [Guide](http://support.thingplus.net/ko/open-hardware/raspberry-pi-user-guide.html)를 참고하세요.

- `2-4` 에서 thingplus install script를 다운받을 때 아래의 script를 다운로드 받으시면 나머지는 동일합니다.

  ```
  $ wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_install_PI1B.sh
  ```

<p class="dwfqExpand2"></p>

<!-- <p class="dwfqExpand" id = "faq_raspberry_3"> 라즈베리파이 3를 사용하고 싶습니다.</p>
<p class="dwfqExpand2"></p>

<p class="dwfqExpand"  id = "faq_use_other_sensor"> 가이드 되어 있는 센서외에 다른 센서를 연동하고 싶습니다.</p>
<p class="dwfqExpand2"></p>-->

<p class="dwfqExpand" id = "faq_contact"> 문의 하기</p>

- 상용으로 서비스를 사용하고 싶으시면 `biz@daliworks.net` 으로 메일을 주세요
- 하드웨어 연동 관련해서 문의가 있으시다면, [Inquiry guide](../inquiryguide.html)을 참고하셔서 `support@thingplus.net` 로 메일을 주세요.



<p class="dwfqExpand2"></p>


<p class="dwfqExpand" id = "faq_arduino_esp8266"> Arduino에 ESP8266을 연결해서 thingplus와 연동하고 싶습니다.</p>

- 통신 모듈로서 ESP8266을 쓰고 Arduino를 게이트웨이로써 연동하고자 한다면 [Guide](http://support.thingplus.net/ko/esp8266.html)를 참고하세요

<p class="dwfqExpand2"></p>


<p class="dwfqExpand" id = "faq_check_log"> log 확인 방법을 알고 싶습니다.</p>

- 오픈하드웨어를 연동하였는데 어떤 문제가 발행하였을 경우, 문제의 원인을 찾기 위해 로그를 확인 할 수 있습니다.

- 로그는 두가지로 `게이트웨이 로그`와 `센서디바이스 로그`를 제공합니다.
  - 게이트웨이로그는 센서로 부터 전달받은 센서 값을 thingplus 서버로 전송하는 MQTT 로그 등을 포함합니다.
  - 센서디바이스 로그는 센서가 일정 주기로 수집하는 센서 값에 대해 확인 가능합니다.

- 그래서 센서에서 센서값이 없는지 비정상적인것인지, 서버로 전송할때 error가 발생하는 것인지를 로그를 통해 확인할 수 있습니다.

- 게이트웨이로그

  ```
  $ cd /opt/thingplus/gateway/
  $ tail -f -n 300 log/thingplus.log
  ```

- 센서 디바이스 로그

  ```
  #./thingplus_device.sh 를 실행했던 경로로 이동
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ 동
  $ tail -f -n 300 log/thingplus_device.log
  ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_update"> 오픈하드웨어 update 방법을 알고 싶습니다.</p>
- Thingplus는 개발자 분들의 이해를 돕기 위해 오픈하드웨어의 오픈 소스를 제공 하고 있습니다.

- 현재는 Raspberry Pi, BeagleBone Green, Edison, Arduino를 지원하고 있습니다.

- Device Agent의 update 방법

  ```bash
  # cd /opt/thingplus/openhardware
  # git pull
  ```

- Gateway update 방법

  - Gateway의 버전을 먼저 확인합니다.

  ```bash
  # cat /opt/thingplus/gateway/VERSION
  ```

  - ***현재 최신 버전은 0.4.2 입니다.***

    - v0.4.2  보다 하위 버전에서는 아래 경로에서 update script를 다운로드 받아서 실행합니다.

    ```bash
    # cd /opt/thingplus/gateway

    (Raspberry PI의 경우)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_pi_update.sh
    (BBG의 경우)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_bbg_update.sh
    (Edison의 경우)
    # wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_edison_update.sh

    # chmod 755 ./thingplus_embedded_sdk_xxx_update.sh
    # ./thingplus_embedded_sdk_xxx_update.sh
    ```

    - update가 끝난뒤 Gateway는 재실행되며, devicve agent는 원래 상태 그대로입니다. update 하기전에 `thingplus_device.sh status`가 `stopped` 였다면, 재실행 (`thingplus_device.sh restart`) 해주어야 합니다.

    - v0.4.2 이후 버전 부터는 아래와 같이 실행하시면 됩니다.

    ```bash
    # cd /opt/thingplus/gateway
    # ./thingplus.sh update
    ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_whatis_gw_device"> 디바이스와 게이트웨이의 차이가 무엇인가요?</p>
- Gateway는 Thing+와 인터넷으로 연결되는 장치이고, Device는 이 게이트웨이와 센서 사이에서 센서네트워크(시리얼, 지그비, BLE등)로 연결되는 장치. 경우에 따라서 Gateway, Device, Sensor 각각은 하나의 장비에 같이 구성될수도 있습니다.

- 자세한 내용은 아래 저희 support site의 [기본가이드](http://support.thingplus.net/ko/user-guide/preparation.html#id-term)에서 참고해주세요.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand" id = "faq_sensorAct"> 다른 서버나 서비스에 command나 value를 전달 할 수는 없나요?</p>

- 네, 가능합니다. string-actuator를 사용하면 원하는 값이나 command를 작성하여 전달 하실수 있습니다.

- device agent에서 string-actuator를 등록합니다. 현재 `/opt/thingplus/openhardware`에서 `git pull` 하시면 적용됩니다.

  - [참고](https://github.com/daliworks/openhardware/commit/10c4cdf81bbe3098d496fdc2a77512314d84ae44)

- gateway model은 `open souce hardware` 를 선택하셔서 게이트웨이 등록을 합니다.

  ![register-open_source_hardware](/assets/openSourceHW_reg.png)

- device agent 에서 string-actuator.js 부분을 수정합니다. 아래 예제 코드를 참고해주세요

  - option.text가 actuator를 실행할때 입력했던 문자를 받아옵니다.

  - 아래 예제는 입력한 값을 `slack`에 보내주는 예제입니다.

```javascript
StringActuator.prototype.doCommand = function(name, cmd, options) {
  if (options.text) {
    console.log('YOUR TEXT IS');
    console.log(options.text);

    var username = 'Thingplus',
        channel = '#random',
        emo_icon = ':ghost:',
        webHookURL = 'https://hooks.slack.com/services/xxxxxxxxxxxx';

    var cmd = 'curl -X POST --data-urlencode \'payload={"channel": "'+channel+'", "username": "'+username+'", "text": "'+options.text+'", "icon_emoji": "'+emo_icon+'"}\' '+webHookURL ;
    console.log(cmd);
  exec(cmd);

  }
};
```

- `thingplus_device.sh restart` 와 `thingplus.sh restart`를 실행해줍니다.

<p class="dwfqExpand2"></p>

<!-- <p class="dwfqExpand" id = "faq_Withdrawal"> 회원 탈퇴는 어떻게 할 수 있나요?</p>
<p class="dwfqExpand2"></p> -->
<br>
<br>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<br/>
<br/>
<br/>
<br/>