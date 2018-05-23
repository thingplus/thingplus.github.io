---
title: Advanced User and permission 'x'
published: true
image: "http://support.thingplus.net/assets/ogp/ogp_notice.png"
permalink: /ko/notice/20180511.html
---


# Upcoming New Release
## Release 일정
- sandbox 서버 : daliworks 파트너사가 thingplus 사용서버에 서비스를 개설하기 전에 연동테스트를 하기 위해 임시로 사용하는 테스트 서버
  - `https://*.sandbox.thingplus.net`
  - sandbox 서버 릴리즈 : 2018년 5월 23일
- 상용 서버 : 실제로 고객이 실 서비스를 제공하는 서버.
  - `https://*.thingplus.net` , `https://*.thingplus.eu` 
  - 상용 서버 릴리즈 : 미정

## Advanced User 추가
- thingplus는 `system admin`, `service admin`, `site admin`, `user`의  4개의 user group이  있습니다.
- user의 경우, site admin이나 service admin이 device에 대한 권한을 주지 않으면 아무것 도 볼수도, 할 수 없습니다. 
- admin이 많은 user에 대해 일일히 권한을 부여하는 것은 번거롭다는 의견이 많아서, site admin과 user 사이에 `advanced user` 라는 user group을 추가 할 것입니다.
- `advanced user(고급 사용자)`는 속한 site의 모든 devicse에 대해 read 권한과 excute 권한을 갖습니다.
  - 아래에서의 `update` 권한은 device(gateway/sensor)의 정보를 변경하는 권한을 의미합니다. 
![image](https://user-images.githubusercontent.com/15882679/39864491-ad1fca0a-5484-11e8-80c9-9d549d273aaf.png)
- site admin 과 다른 점은 update 권한과  post 권한이 없습니다.
- 서비스에서 필요하시면 릴리즈이후 사용자 관리에서 user의 권한을 변경해주면 됩니다.
![image](https://user-images.githubusercontent.com/15882679/39864316-2a7c2954-5484-11e8-90d3-760af26e9a29.png)


## device에 대한 권한 'x' 추가
- 기존에는 device에 대한 권한은 `c`, `r`, `u`, `d` 가 있었습니다.
- 그래서 `actuator를 실행`할때는 `POST` 이기 때문에 `c` 권한을 주어야 했습니다.
- 이것은 auth scope에서도 실행권한을 주기 위해 device를 추가하거나 변경할 수 있는 권한 까지 주어야 한다는 것이 부담이었습니다.
- 그 이유로 `x`권한을 추가하여 actuator를 실행 할 수 있도록 할것입니다.
- 위에서 언급한 `advanced user`는 속한 site의 device에 대해 `r`권한과 `x` 권한만을 갖는 다는 것을 의미합니다.


## auth scope 변경
- 기존의 gateway에 대한 auth scope은 `gateway`(gateway, gateway-update, gateway-read) 한가지였습니다.
- actuator 실행권한과, gateway자체에 대한 등록 및 update권한, device를 managing 할 수 있는 권한을 구분하려고 합니다.
- 그래서 gateway 라는 auth scope은 아래의 3가지로 구분됩니다.
  - `gateway` : 게이트웨이의 등록
  	 - gateway-update : 게이트웨이의 정보 수정
  	 - gateway-read : deivce의 status, value 를 읽을 수 있는 권한
  - `gateway-management` : gateway의 전송주기 변경, restart, 원격 update등의 gateway에게 어떤 실행이 가능한 권한
  - `actuator-command` : actuator를 실행 시키는 권한
- 기존에 발급된  `auth client` 중 `gateway`의 권한을 가지고 있는 auth client는 `gateway`, `gateway-command`, `gateway-management` , `gateway-update`, `gateway-read`를 모두 포함 하므로 이전과 동일하게 사용하시는데 지장이 없으십니다.
- 이전에 `u` 권한을 가졌던 user에게는 `x`권한을 추가 해주는 migration을 같이 진행하므로 thingplus portal에서도 이전과 동일하게 사용하실 수 있으십니다.


<br>
<br>
<br>
<br>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>