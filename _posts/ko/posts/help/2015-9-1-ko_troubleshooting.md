---
title: 문제 해결 방법
tags: "help"
published: true
permalink: /ko/help/troubleshooting.html
---

장비와 ThingPlus IOT를 연동 하실 때 문제가 되시는 부분을 정리 했습니다.

---

<p class="dwfqExpand"> <i class="fa fa-question-circle"></i> <b>센서목록</b> 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우</p>

- 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
- 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널/Putty를 사용해 장치에 접속하여 아래 명령을 실행하여 내용을 확인한다.

    ```
    @shell:$ cd /opt/thingplus/gateway
    @shell:$ ./thingplus.sh restart
    @shell:$ cd log
    @shell:$ tail -F -n 300 thingplus.log
    ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand">  <i class="fa fa-question-circle"></i> 한 개 이상의 센서가 등록되지 않았을 경우</p>

 - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.

<p class="dwfqExpand2"></p>
<p class="dwfqExpand">  <i class="fa fa-question-circle"></i> 장치의 IP address를 확인하는 방법</p>

 - 스마트폰의 app store에서 `Fing` app을 설치한다. ([Google Play](https://play.google.com/store/apps/details?id=com.overlook.android.fing) / [Apple AppStore](https://itunes.apple.com/kr/app/fing-network-scanner/id430921107?mt=8))
  - 장치가 연결된 공유기에 WiFi를 이용하여 스마트폰을 연결한다.
  - `Fing`을 실행하면 공유기에 연결되어 있는 장비의 IP address의 목록이 표시된다.
     - 라즈베리파이의 경우 : `raspberrypi`라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.
     - 비글본 보드의 경우 : `beaglebone`이라는 이름의 장비의 IP address로 `ssh`를 이용하여 접속하면 된다.

<p class="dwfqExpand2"></p>
<p class="dwfqExpand">  <i class="fa fa-question-circle"></i> Thing+ Portal에 등록되어 있는 장치가 전원이 들어와 있음에도 불구하고, 상태가 <b>OFF</b> 일 경우</p>

- 터미널/Putty를 사용해 장치에 접속하여 아래 명령을 실행하여 내용을 확인한다.

- 장치의 현재 시각이 UTC 시간 기준[(링크)](http://www.worldtimeserver.com/current_time_in_UTC.aspx)과 동일한지 확인한다.

    ```bash
    @shell:$ date
    Thu 26 Nov 00:00:00 UTC 2015    #현재 장치의 시스템 시간이 출력된다.
    ```

- 만약, 장치의 시간이 UTC 시간과 다르다면 시간을 업데이트 한다.

    ```bash
    @shell:$ ntpdate -u ntp.ubuntu.com
    @shell:$ hwclock -w -u
    ```

- 만약, 시스템 시간 업데이트에 실패할 경우, 직접 시간을 갱신한다.

  - UTC 시간 기준 [(링크)](http://www.worldtimeserver.com/current_time_in_UTC.aspx): 2015년 01월 01일 00:00:00 경우, 2015-01-01 00:00:00

        ```bash
        @shell:$ date --set '20XX-XX-XX XX:XX:XX'
        ```

- 장치를 재부팅한다.

    ```bash
    @shell:$ reboot
    ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand">  <i class="fa fa-question-circle"></i> [Windows][Arduino] <b>./thingplus_device.sh start</b> 에서의 오류 발생 </p>

  - node의 버전 문제 : 아래의 command를 실행하여 버전을 확인합니다.
     - node js는 v0.10.16 이어야 합니다.

          ```
          node --version
          ```

  - node가 이미 실행중인 상태 : 아래의 command로 `app.min.exe`가 실행중인 상태인지 확인합니다.
     
     ```
     tasklist | grep app.min  
     ```
    - 실행중인 `app.min.exe`가 보이면 process 를 kill 하고 재 실행해줍니다.

        ```
        tasklist /f /pid [app.min.exe 의 pid]

        cd $HOME/thingplus/openhardware/arduino/grove-starter-kit
        ./thingplus_device.sh restart
        cd $HOME/thingplus/gateway
        ./thingplus.bat restart
        ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand">  <i class="fa fa-question-circle"></i> Gateway 등록시 <b>실패</b> 메세지가 발생했습니다. </p>
    
  - Gateway가 기등록 되었는지 확인 합니다.
     - 상단 메뉴에서 `센서목록`에 가서 등록하려던 Gateway가 이미 등록 되어 있는지 확인합니다.
     - 이미 등록이 되어 있고 정상동작을 하지 않는다면, `게이트웨이관리`에서 해당 gateway를 삭제 합니다.
  - `./getmac` 으로 받아온 값을 이용해서 API KEY를 받고 최초 실행시 APIKEY를 입력 했는지 확인합니다. 

     ```
     cd [thingplus가 설치된 위치]/gateway/thingplus-gateway/device/config
     cat runtime.json
     ```
     - 아래와 같이 보일것인데, APIKEY 부분이 발급받은 APIKEY와 같은지 확인 합니다.
     - copy and paste를 했다면 문제가 없을 텐데 직접 typing 하신경우 소문자ㅣ 과 대문자 I 가 혼동 될 수 있습니다.  
        
         ```
         ...

         "Gateway": {
            "name": "Gateway name"
          },
         "Server": {
            "APIKEY": "uL0................00r4="

         ...
 
         ```

<p class="dwfqExpand2"></p>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>