---
title: Thing+ 연동 프로세스
tags: "user-guide"
img: ic_process.png
published: false
permalink: /ko/integation.html
---

Thing+ 연동 프로세스 가이드
<div id='id-sensor'></div>

1. [센서값 읽기](#id-sensor)
2. [인터넷 연결](#id-internet)
3. [ThingPlus 연결](#id-thingplus)

<br/>
---

### 1. 센서값 읽는 프로그램 작성
**ThingPlus 연동하기 전, 하드웨어에 센서를 연결하고, 센서값을 읽은 프로그램을 작성하세요.**<br/>
사용자의 환경에 맞게 센서를 연결하고, 센서값을 읽는 프로그램을 작성해서 터미널에 센서값을 출력하세요.<br/> 

![device](/assets/process01.png)

사용자 별로 하드웨어 구성이 모두 다르기 때문에 센서값을 읽은 프로그램은 사용자가 직접 작성하셔야 합니다.<br/>
하지만, 프로그램 작성이 어려운 분들을 위하여 Grove-Kit 센서를 읽는 [예제](https://github.com/daliworks/openhardware) 프로그램을 공개하고 있습니다. <br/>
Arduino의 Firmware를 작성하기 어렵다면 [Johnny-Five](http://http://johnny-five.io/)를 사용하셔도 됩니다.

<div id='id-internet'></div>

---

### 2. 인터넷 연결
센서값을 전송하기 위해선 인터넷 연결을 꼭 해야합니다. <br/>

![gateway](/assets/process02.png)

오픈 하드웨어의 인터넷 연결 방법은 각 보드의 사용자 가이드에 설명이 되어있습니다.<br/>
인터넷 연결 확인 방법은 아래와 같습니다. <br/>

- 라즈베리바이, 비글본그린, 에디슨<br/>

```bash
$ ping www.google.com
```

<div id='id-thingplus'></div>

---

### 3. ThingPlus 연결
저희가 배포하는 Thing+ GW 프로그램을 설치해여 ThingPlus와 연결해 보십시오. <br/>

![thingplus](/assets/process03.png)

각 보드별 사용자 가이드에 다운받아야 할 파일이 있습니다.<br/>
Thing+ GW를 설치하신 후 작성하신 센서값 읽는 프로그램을 Thing+ GW 프로그램과 연결하시면 됩니다. (관련 내용 추가 업데이트 예정)<br/>

- Arduino + PC의 [다양한 센서 연결 방법](https://docs.google.com/document/d/1gk1RsXvfbD9eOiHQblpBcIgyJ7cYqb9pHqNSgId1s7U/edit) <br/>

마지막으로 ThingPlus에서 게이트웨이 등록을 하연 센서값을 확인한 수 있습니다.  <br/>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>