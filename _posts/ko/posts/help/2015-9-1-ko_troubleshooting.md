---
title: 문제 해결 방법
tags: "help"
published: true
permalink: /ko/help/troubleshooting.html
---

### `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우

- 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
- 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 장치에 접속하여 아래 명령을 실행하여 내용을 확인한다.

    ```
    @shell:$ cd /opt/thingplus/gateway
    @shell:$ ./thingplus.sh restart
    @shell:$ cd log
    @shell:$ tail -F -n 300 thingplus.log
    ```

<br/>
### 한 개 이상의 센서가 등록되지 않았을 경우

 - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.

<br/>
### 장치의 IP address를 확인하는 방법

 - 스마트폰의 app store에서 `Fing` app을 설치한다. ([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - 장치가 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
     - 라즈베리파이의 경우 : `raspberrypi`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.
     - 비글본 보드의 경우 : `beaglebone`이라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.