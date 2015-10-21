---
title: BBB User Guide
tags: "open-hardware"
published: true
permalink: /en/open-hardware/bbb-user-guide.html
---

Thing+ 연동가이드(BeagleBone Black)

#### 1. 환경 설정


1) BeagleBone Black에 5V 전원 어댑터를 연결한 후, 아래 URL을 참조하여 BeagleBone Black과 사용자의 PC를 USB 케이블로 연결하고(Step 1), 드라이버를 설치한다.(Step 2)

   - http://beagleboard.org/getting-started#step1 참조
   - http://beagleboard.org/getting-started#step2 참조

2) 윈도우즈 사용자의 경우 아래의 URL에서 putty를 다운받아 설치한다.
   - http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

3) 인터넷 연결을 위하여 Ethernet(LAN 케이블)이나 WiFi USB 동글을 BeagleBone Black에 연결한다.

   - BeagleBone Black은 기본적으로 DHCP를 지원한다.
   - WiFi를 사용할 경우, 본 문서의 `WiFi 동글 설정` 부분을 참조한다.

4) BeagleBone Black을 재시작한다.
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
@BBB:$ wget https://www.sp1.sktiot.com/asset/download/tp_sktiot_armhf.deb
```

2) 데비안 패키지를 설치한다. (반드시 root 계정을 이용해야 한다.)

```bash
@BBB:$ dpkg -i tp_sktiot_armhf.deb
```

3) BeagleBone Black을 재시작한다.

```bash
@BBB:$ reboot -f
```

#### 3. BeagleBone Black 등록

1) 재접속 후 패키지가 설치된 디렉토리의 `scripts` 디렉토리로 이동한다.

```bash
@BBB:$ cd /usr/local/tp/scripts
```

2) BeagleBone Black의 MAC 어드레스를 얻어 클립보드에 복사한다.

```bash
@BBB:$ ./getmac
Your MAC address is as below
xx:xx:xx:xx:xx:xx
```

3) **사용자 PC**의 크롬브라우저를 열고 "[서비스 웹사이트](http://www.sp1.sktiot.com)"에 로그인한다.

4) `설정` --> `게이트웨이 관리` 버튼을 누른다.
![gateway_management](/assets/open-hw/gateway_management_ko.png)

5) `(+)` 버튼을 누른다.
![register_gateway](/assets/open-hw/register_gateway_ko.png)

6) `게이트웨이 API 키 발급받기` 버튼을 누른다.
![register_with_apikey](/assets/open-hw/register_with_apikey_ko.png)

7) 클립보드에 복사했던 MAC 어드레스를 `게이트웨이 아이디`에 붙여넣기 하고 `게이트웨이 API 키 등록 진행` 버튼을 누른다.
![macaddress](/assets/open-hw/macaddr_getapikey_ko.png)

8) API 키를 클립보드에 복사한다.
![get_apikey](/assets/open-hw/get_apikey_ko.png)

9) **BeagleBone Black에 로그인했던 터미널**에서 아래처럼 게이트웨이를 실행한다.

```bash
@BBB:$ cd /usr/local/tp
@BBB:$ APIKEY='복사한 API 키' ./tp.sh start; ./driver.sh start
```

- 예제

```bash
@BBB:$ cd /usr/local/tp
@BBB:$ APIKEY='A7i3kT9w1-9xWVk447-oJ=' ./tp.sh start; ./driver.sh start
```

> 주의: APIKEY는 모두 대문자로 써야하며, `복사한 API 키`는 앞뒤를 작은따옴표(')로 감싸야 한다.

10) BeagleBone Black의 `/etc/rc.local`의 `exit 0` 명령 바로 위에 아래처럼 추가한다.

```bash
@BBB:$ nano /etc/rc.local
...
(cd /usr/local/tp; ./driver.sh start)         # 추가
(cd /usr/local/tp; ./tp.sh start)             # 추가

exit 0
```

   - 파일 수정 후 저장은 `CTRL-O`키를 누른 후, 엔터키를 누르고, 종료할 때는 `CTRL-X`키를 누른다.

### 4. 게이트웨이 모델 선택
1) **크롬 브라우저**에서 다시 MAC 어드레스를 복사한다.

   - 페이지를 다른 곳으로 이동하여 MAC 어드레스를 복사할 수 없는 경우는 `3. BeagleBone Black 등록`의 방법을 통해 다시 MAC 어드레스를 복사한다.

2) `게이트웨이 등록하기`버튼을 누른다.
![copy_apikey](/assets/open-hw/copy_apikey_ko.png)

2) `게이트웨이 모델`에서 `Neuromeka Rev2.1`을 선택한다.
![select_gwmodel](/assets/open-hw/select_gwmodel_ko.png)

3) `게이트웨이 아이디`에 MAC 어드레스를 붙여넣기 하고 게이트웨이 이름을 입력한다.
![select_gwmodel](/assets/open-hw/inputmac_name_ko.png)

4) `디바이스 모델`에서 `Basic Model Rev2.1`을 선택한다.
![select_devicemodel](/assets/open-hw/select_devicemodel_ko.png)

5) `게이트웨이, 디바이스, 센서 등록 진행` 버튼을 누른다.
![register](/assets/open-hw/register_ko.png)

6) 등록 성공 시 `Success` 팝업 메시지가 화면에 출력된다.

7) `센서목록` 메뉴에서 등록된 게이트웨이를 확인할 수 있다.

  - 센서는 게이트웨이(BeagelBone Black)에 의해 자동적으로 등록되며, 게이트웨이 등록 후 1분 이내에  최종 등록 완료된다.
  - 센서값은 게이트웨이에서 수집되고 주기적으로 서버에 전송하기 때문에 센서값을 서비스 사이트에서 볼 수 있기까지 몇 분이 소요된다.

--------------------

### [선택사항] WiFi 동글 설정 - TP-LINK TL-WN727N
- BeagleBone Black에서 지원하는 WiFi 동글 목록은 아래 URL을 참조한다.

  - http://www.elinux.org/Beagleboard:BeagleBoneBlack#WIFI_Adapters

- 본 문서에서 테스트한 WiFi 동글: TP-LINK TL-WN727N

  - http://beagleboneblacksurya.blogspot.kr/2014/10/connecting-to-wireless-module-tp-link.html

> 주의: WiFi 동글을 BeagleBone Black에 연결한 수 반드시 재시작해야 한다.

- WiFi 동글 설정을 위해서는 **터미널**에서 아래의 단계를 수행한다.

1) WiFi 동글을 BeagleBone Black의 USB 포트에 꽂은 후, BeagleBone Black을 재시작한다.

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

4) BeagleBone Black을 재시작한다.

> 주의: WiFi 동글을 이용할 경우 전원을 많이 사용하므로, 반드시 DC 5V 전원 어댑터를 연결하여 사용해야 한다.

----------------------------------
### 문제 해결 방법

* `센서목록` 페이지에서 등록한 게이트웨이나 센서가 보이지 않을 경우:

  - 등록 절차를 수행하는데 수십 초 정도가 소요되므로, 1분 정도 대기한 후 페이지를 리프레쉬한다
  - 몇 분이 지난 후에도 해당 증상이 계속되면, 터미널에서 BeagleBone Black에 접속한 후 아래 명령을 실행하여 내용을 확인한다.

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

  - Cape manager 설정을 확인한 후, BB-W1이 없을 경우 BeagleBone Black을 재시작한다.

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
