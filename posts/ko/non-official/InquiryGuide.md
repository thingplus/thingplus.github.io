---
title: 문의전에 잠깐! 꼭 확인해보세요
published: true
img: ic-troubleshooting.png
permalink: /ko/InquiryGuide.html
---

신속하고 정확한 답변을 위해 문의 하기 전 참고할 수 있는 가이드입니다.

1. [문의하기](#id-inquiry)
2. [문제 발생시 확인사항](#id-check) 
3. [자주 묻는 질문](#id-faq)

---

___본 가이드는 게이트웨이 등록 및 정상적인 데이터를 얻기까지 문제가 발생할 경우 빠른 시간내 해결할 수 있도록 도움을 주고자 제작되었습니다. 가이드를 참고하여 문의를 주실 경우 문제를 빨리 해결하는데 도움이 될 것 입니다. 다만 문의에 대한 대응원칙상 센서값을 가져오는 프로그램(디바이스 에이전트) 부분의 코드 리뷰나 디버깅에 대한 서비스는 제공하지 못 하는 점 양해 부탁드립니다.___

---

__`HELP`의 [자주 묻는 질문](http://support.thingplus.net/ko/help/faq.html), [문제 해결 방법](http://support.thingplus.net/ko/help/troubleshooting.html)에서 더 다양한 사례를 찾아 볼 수 있습니다. 먼저 참고 후 문의사항 가이드를 이용해보세요.__

<div id='id-inquiry'></div>

### 문의하기
신속하고 정확한 답변을 위해 문의사항 양식에 맞춰 문의해주시기 바랍니다.
<br>
* 상용 서비스 관련 문의는`biz@daliworks.net` 으로 메일을 주세요.
* 하드웨어 연동 관련해서 문의가 있으시다면, `contact@thingplus.net` 로 메일을 주시거나, thingplus.net 에서 로그인 후 우측 하단에 보이는 icon을 눌러서 intercom 문의를 해주세요.

* 문의를 주실 때는 아래 내용을 포함 해서 문의 부탁드립니다.

<div id='id-inquirytable'></div>
#### 문의사항 양식

|      `작성목록`       |                         `작성 내용`                         
| ---------------- | :-----------------------------------------------------------------------------:
| 소속            | `ex) 개발자(회사명), 학생`
| Thing+와 연동하는 목적         | `ex) 개발(POC), 교육, 스터디, 신규서비스 런칭 ...`
| 사용할 하드웨어   | `ex) 라즈베리파이, 비글보드, 아두이노, 안드로이드, 센서시뮬레이터 ...` 
| 사용할 센서           | `ex) 온도센서, 습도센서, LED ...`
| 소스코드 받은 출처    | `ex) support site, 개인적 요청으로 수령, 그 외 출처 ...` 
| 게이트웨이 버젼     | `ex) openhardware-pi-v0.4.4`

<br>

#### 게이트웨이 버젼 확인
  ```
  $ cd /opt/thingplus/gateway/
  $ cat VERSION
  ```

---
<div id='id-check'></div>

### 문제 발생시 확인사항
아래 내용의 확인사항을 체크 후, 그래도 원인이 파악되지 않을 경우 위에 [문의사항 양식](#id-inquirytable)과 함께 로그를 보내주시면 좀 더 신속하고 정확한 답변을 드릴 수 있습니다.

<br>

#### 게이트웨이, 센서디바이스 실행 상태 확인
* 게이트웨이

  ```
  #./thingplus.sh 를 실행했던 경로로 이동
  $ cd /opt/thingplus/gateway/
  $ ./thingplus.sh status //running이 아닌 경우 restart
  $ ./thingplus.sh restart
  ```

* 센서 디바이스

  ```
  #./thingplus_device.sh 를 실행했던 경로로 이동 
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ //ex)라즈베리파이
  $ ./thingplus_device.sh status //running이 아닌 경우 restart
  $ ./thingplus_device.sh restart
  ```
<br>

#### log 확인 방법
* 오픈하드웨어를 연동하였는데 어떤 문제가 발생하였을 경우, 문제의 원인을 찾기 위해 로그를 확인 할 수 있습니다.
* 로그는 두가지로 게이트웨이 로그와 센서디바이스 로그를 제공합니다.
  - 게이트웨이로그 : 센서로 부터 전달받은 센서 값을 thingplus 서버로 전송하는 MQTT 로그 등을 포함합니다.
  - 센서디바이스 로그 : 센서가 일정 주기로 수집하는 센서 값에 대해 확인 가능합니다.
* 센서에서 센서값이 없는지 비정상적인것인지, 서버로 전송할때 error가 발생하는 것인지를 로그를 통해 확인할 수 있습니다.

* 게이트웨이로그

  ```
  #./thingplus.sh 를 실행했던 경로로 이동
  $ cd /opt/thingplus/gateway/
  $ tail -f -n 500 log/thingplus.log
  ```

* 센서 디바이스 로그

  ```
  #./thingplus_device.sh 를 실행했던 경로로 이동 
  $ cd /opt/thingplus/openhardware/raspberrypi/grovePi-starter-kit/ //ex)라즈베리파이
  $ tail -f -n 500 log/thingplus_device.log
  ```

* 이 두가지 로그를 보시고 디버깅 해보시거나 저희에게 보내주시면 확인해드리겠습니다.

---
<div id='id-faq'></div>

### 자주 묻는 질문
자주 묻는 질문입니다. 해당사항에 포함되는 경우 확인해보시길 바랍니다.

<br>

#### 게이트웨이 등록시 400 error 또는 409 error
* 사용하려는 게이트웨이가 다른 서비스에서 이미 등록되어 있는 상태일 수 있습니다.
* 이미 등록되어 있는 게이트웨이를 삭제 후 다시 등록하여야 합니다. [문의사항 양식](#id-inquirytable)과 함께 `게이트웨이 아이디`를 포함하여 Intercom으로 문의해주시면 확인 후 답변을 드릴 수 있습니다.

<br>

#### 게이트웨이 등록 실패
* 상단 메뉴에서 `센서목록`에 가서 등록하려던 Gateway가 이미 등록 되어 있는지 확인합니다.
* 이미 등록이 되어 있고 정상동작을 하지 않는다면, `게이트웨이관리`에서 해당 gateway를 삭제 합니다.
* APIKEY 부분이 발급받은 APIKEY와 같은지 확인 합니다.

  ```
  cd [thingplus가 설치된 위치]/gateway/thingplus-gateway/device/config/
  cat runtime.json
  ```
  runtime.json 파일을 열면 현재 등록되어 있는 게이트웨이의 APIKEY를 다음과 같이 확인할 수 있습니다.
  ```
  ...

  "Gateway": {
  "name": "Gateway name"
  },
  "Server": {
     "APIKEY": "uL0................00r4="
   ...

  ```
* copy and paste를 했다면 문제가 없을 텐데 직접 typing 하신 경우 소문자`ㅣ` 과 대문자 `I` 가 혼동 될 수 있습니다.  






























