---
title: 비글본그린 사용자 가이드
tags: "open-hardware"
published: true
permalink: /ko/open-hardware/bbb-user-guide.html
---

Thing+ 연동가이드(BeagleBone Green)

#### 1. 환경 설정

0) [Grove Starter Kit for BeagleBone Green 구매 바로가기](http://www.icbanq.com/P005716600)

1) BeagleBone Green(이하 BBG)에 5V 전원 어댑터를 연결한 후, 아래 URL을 참조하여 BBG와 사용자의 PC를 USB 케이블로 연결하고(Step 1), 드라이버를 설치한다.(Step 2)

   - http://beagleboard.org/getting-started#step1 참조
   - http://beagleboard.org/getting-started#step2 참조

2) 윈도우즈 사용자의 경우 아래의 URL에서 putty를 다운받아 설치한다.
   - http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

3) 인터넷 연결을 위하여 Ethernet(LAN 케이블)이나 WiFi USB 동글을 BeagleBone Black에 연결한다.

   - BBG는 기본적으로 DHCP를 지원한다.
   - WiFi를 사용할 경우, 본 문서의 `WiFi 동글 설정` 부분을 참조한다.

4) BBG를 재시작한다.
   - PC와 연결된 USB 케이블과 전원 어댑터를 모두 뺐다가 다시 꽂아야 한다.

5) 부팅이 완전히 이루어지도록 2~3분 정도 대기한 후, 터미널(윈도우즈 PC에서는 putty)을 열고 아래처럼 로그인한다.

```bash
$ ssh root@192.168.7.2
```

- 주의: 로그인 후 비밀번호를 설정할 것을 강력히 권장함.


```bash
$ passwd
Enter new UNIX password:
```


#### 2. 설치

1) 데비안 패키지 파일을 다운로드한다.

```bash
@BBB:$ wget https://www.thingplus.net/asset/download/tp_bbb_armhf.deb
```

2) 데비안 패키지를 설치한다. (반드시 root 계정을 이용)

```bash
@BBB:$ dpkg -i tp_bbb_armhf.deb
```

3) BBG를 재시작한다.

```bash
@BBB:$ reboot -f
```


#### 3. 게이트웨이 등록
[게이트웨이 등록 방법](http://support.thingplus.net/ko/user-guide/registration.html#id-gateway) 의 절차를 따르면 됩니다.


--------------------

### [선택사항] WiFi 동글 설정 - TP-LINK TL-WN727N
- BBG에서 지원하는 WiFi 동글 목록은 아래 URL을 참조한다.

  - http://www.elinux.org/Beagleboard:BeagleBoneBlack#WIFI_Adapters

- 본 문서에서 테스트한 WiFi 동글: TP-LINK TL-WN727N

  - http://beagleboneblacksurya.blogspot.kr/2014/10/connecting-to-wireless-module-tp-link.html

> 주의: WiFi 동글을 BBG에 연결한 수 반드시 재시작해야 한다.

- WiFi 동글 설정을 위해서는 **터미널**에서 아래의 단계를 수행한다.

1) WiFi 동글을 BBG의 USB 포트에 꽂은 후, BeagleBone Black을 재시작한다.

2) 터미널에서 WiFi 인터페이스명을 확인한다.

```bash
@PC:$ ssh root@192.168.7.2

@BBB:$ iwconfig
ra0

lo        no wireless extensions.

eth0      no wireless extensions.

usb0      no wireless extensions.
```
   - 위의 경우, WiFI 인터페이스명은 `ra0`이다. WiFi 동글에 따라 `ra0`나 `wlan0` 등으로 이름이 달라질 수 있다.

3) 네트워크 설정

   a. nano 에디터를 이용하여, `/etc/network/interfaces` 파일을 연다.

   b. `# The primary network interface` 아랫부분과 `# WiFi Example` 아랫부분의 주석을 해제(#를 삭제)하고, WiFi 인터페이스명, WiFi essid와 비밀번호를 설정한다.

   c. 파일을 수정한 후, `CTRL-O` and `Enter` 키를 눌러 저장하고, `CTRL-X` 키를 눌러 종료한다.

```bash
@PC:$ ssh root@192.168.7.2

@BBB:$ nano /etc/network/interfaces

...
# The primary network interface
allow-hotplug eth0        # 이 부분의 주석을 해제한다.
iface eth0 inet dhcp      # 이 부분의 주석을 해제한다.

...

# WiFi Example
auto ra0                  # ra0를 위에서 사용자가 확인했던 인터페이스 명으로 수정하고
iface ra0 inet dhcp       # 주석을 해제한다.
    wpa-ssid "WiFi SSID"      # WiFi SSID와 WiFi password를 사용자의 SSID와
    wpa-psk  "WiFI password"  # password로 수정하고 주석을 해제한다.
...

```

4) BBG를 재시작한다.

> 주의: WiFi 동글을 이용할 경우 전원을 많이 사용하므로, 반드시 DC 5V 전원 어댑터를 연결하여 사용해야 한다.

----------------------------------
### 문제 해결 방법

* `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우:

  - 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
  - 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 BBG에 접속한 후 아래 명령을 실행하여 내용을 확인한다.

  ```
  @PC:$ ssh root@192.168.7.2
  @BBB:$ cd /usr/local/tp
  @BBB:$ ./tp.sh restart
  @BBB:$ cd log
  @BBB:$ tail -F -n 300 thingplus.log
  ```

* 한 개 이상의 센서가 등록되지 않았을 경우:

  - 게이트웨이를 재시작하면 자동적으로 미등록 센서를 등록한다.


* 1-Wire 온도센서가 등록되지 않았을 경우:

  - Cape manager 설정을 확인한 후, BB-W1이 없을 경우 BBG를 재시작한다.

  ```
  @PC:$ ssh root@192.168.7.2
  @BBB:$ cd /sys/devices/bone_capemgr.9
  @BBB:$ cat slots
  0: 54:PF---
  1: 55:PF---
  2: 56:PF---
  3: 57:PF---
  4: ff:P-O-L Bone-LT-eMMC-2G,00A0,Texas Instrument,BB-BONE-EMMC-2G
  5: ff:P-O-L Bone-Black-HDMI,00A0,Texas Instrument,BB-BONELT-HDMI
  7: ff:P-O-L Override Board Name,00A0,Override Manuf,BB-W1
  8: ff:P-O-L Override Board Name,00A0,Override Manuf,BB-IGOT-GPIO
  ```
