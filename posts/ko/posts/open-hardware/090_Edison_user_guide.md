---
title: 에디슨 사용자 가이드
tags: "open-hardware"
published: false
img: ic-edison.png
permalink: /ko/open-hardware/edison-user-guide.html
---

Thing+ 연동가이드(에디슨)
<div id='id-setting'></div>

1. [환경설정](#id-setting)
2. [ThingPlus Package download 및 install](#id-package)
3. [기타 설정](#id-hostname)
4. [에디슨 등록](#id-register)

<br/>
---

#### 1. 환경 설정

0) [아두이노 Grove 스타터 센서 키트](https://www.icbanq.com/P005710113/)

<br/>
1) 하드웨어 연결

   - [참조](https://software.intel.com/en-us/articles/assemble-intel-edison-on-the-arduino-board)
   - 아래 그림과 같이 전원과 USB 두개를 연결 합니다. (USB 는 두개 모두 PC와 연결합니다.)
    ![connection](/assets/edison_connect.png)

   - USB connector 사이의 micro-switch 가 있습니다. 그림 아래 방향으로 switching 합니다. 
    ![switch](/assets/edison_ext.png) 

<br/>
2) 그로브 베이스 쉴드를 연결 합니다.

![Edison + Grove kit](/assets/edison_base.png)
   

<br/>
3) 센서를 연결합니다. 

<p class="dwExpand"> LED 극성 </p>

![LED 극성](/assets/led.png)

<div class="dwExpand2"></div>

![Edison + Grove Starter kit](/assets/edison_sensor.png)

<br/>
4) 에디슨의 펌웨어를 업데이트 합니다.
  
   - 구버전의 펌웨어의 경우 WiFi 연경이 불안정 하기 때문에 최신 펌웨어로 업데이트가 필요 합니다.
   - [펌웨어 인스톨러 다운로드 및 설치](https://software.intel.com/en-us/iot/software/installers)
   
   ![installer](/assets/intel_installer.png)

   ![installer](/assets/intel_installer2.png)

<br/>
5) USB를 통해 에디슨에 접속 합니다.

   - Mac 또는 Linux 사용자일 경우 기본 터미널을 사용하시면 됩니다.
   - 윈도우 사용자일 경우, Putty 클라이언트 사용을 권장합니다.
   - [Putty 다운로드 링크](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

<p class="dwExpand"> For Mac OSX and Linux</p>

- Linux 환경일 경우 screen을 설치 합니다.
   - apt-get install screen

   ```
   screen -L /dev/cu.usbserial_XXXXXX 115200 (MAC)
   ```

- 만약 /dev/cb.usbserial_XXXX 없으면 Edison reboot 합니다.
- 터미널 화면이 바뀌면 Enter 입력합니다.
- 계정 : root, 비밀 번호는 없습니다.

<div class="dwExpand2"></div>

<p class="dwExpand"> For windows</p>

- `Serial` 로 선택을 하고 `serial line`과 `speed`를 설정 합니다. speed는 `115200` 입니다.
![LED 극성](/assets/putty.png)

- `Serial line`은 PC에서 장치가 설치된 COM port, `COMXX` 을 입력해주시면 됩니다.
- 터미널 화면이 바뀌면 Enter 입력합니다.
- 계정 : root, 비밀 번호는 없습니다.

<div class="dwExpand2"></div>


<br/>
6) 비밀 번호를 설정 합니다.

``` bash
configure_edison --password
```

<br/>
7) WiFi를 설정 합니다.

```
configure_edison --wifi
```

   - 접속 가능한 Wifi 스캔 후 목록이 출력됩니다. 
   - 접속 할 Wifi AP 선택 후 비밀번호 입력
   - 접속하면 IP가 출력됩니다. IP 주소는 메모 해둡니다.

<div id='id-package'></div>
 
<br/>

---

#### 2. ThingPlus Package download 및 install

1) 설치할 위치를 설정합니다.
   
```bash
edison:~/# mkdir /opt/thingplus
edison:~/# cd /opt/thingplus
```

2) 인스톨 스크립를 다운로드 합니다. ([wget 설치](/ko/help/faq.html#install_wget))

```
wget http://support.thingplus.net/download/install/thingplus_embedded_sdk_edison_install.sh
```

3) 다운로드한 스크립트 파일에 실행권한을 부여하고 Thing+ Embedded 패키지를 설치합니다.

- Thing+ Embedded 패키지를 설치하는데 네트워크 상태에 따라 수분이 소요될 수 있습니다.

```bash
edison:/opt/thingplus# chmod 755 thingplus_embedded_sdk_edison_install.sh
edison:/opt/thingplus# ./thingplus_embedded_sdk_edison_install.sh
```

<div id='id-hostname'></div>

<br/>

---

#### 3. 기타 설정

1) 장치 구분을 위해 에디슨의 호스트명 변경이 필요합니다.

> 주의: Termianl/Putty에서는 마우스로 커서이동이 불가능하므로, 키보드의 화살표 키를 사용해야 합니다.

- `/etc/hostname`을 수정합니다.

  ```bash
  edison:~/# vi /etc/hostname
  ```

- 파일 내부의 `edison`을 아래 그림과 같이 원하는 이름(알파벳 및 숫자, -만 허용)으로 변경합니다.
![Modify hostname](/assets/vi_hostname.png)

- 파일 수정 후 저장은 `ESC`+`wq!`+`Enter` 

<br/>

2) 변경한 호스트명 적용을 위해 Edison을 재시작합니다.

```bash
edison:~/# reboot
```


<div id='id-register'></div>

---

#### 4. 에디슨 등록
[게이트웨이 등록 방법](/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
