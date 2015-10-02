---
layout: post
title: "Management guide"
tags: help
published: true
---

---
Guide for service, site, user and gateway.  

* [Service Management](#id-service-management)
* [Site Managment](#id-site-management)
* [User Management](#id-user-management)
* [gateway Management](#id-gateway-management)

---
<div id='id-service-management'/>
### Service Management
**Function for Service manager.**

#### Display informaton 
Can set service management.

#### Normal Setting
* Can set normal setting.
  - Name: Display name of service. Service name will be displayed on right upper side of portal. 
  - Contact: mail for web push alarm and related information. 
  - Detail Explanation: Put detail explanation of service.  

#### Dashboard setting
* Add/change widget list on dash board. 
* Selected widget list will be diplayed on bottom of dashboard page.  

#### Rule setting
* Add/change trigger and action list of rule command. 
* Rule creation page will display selected trigger and action.  
<br>

---
<div id='id-site-management'/>
### 사이트 관리
**사이트 관리자를 위한 기능입니다.**

#### 화면안내 
사이트를 만들고 관리할 수 있습니다.

* 전체 사이트 리스트를 볼 수 있습니다.
* 사이트를 선택하면 해당 사이트의 이름과 코드를 확인할 수 있습니다.

#### 사이트 선택
* 사이트 이름에서 사이트를 선택할 수 있습니다. 사이트를 선택하면 해당 사이트만 화면에 나타납니다.

#### 사이트 등록
* 우측 상단의 <i class="fa fa-plus-circle"></i> 버튼을 누르면 사이트 등록 페이지로 이동합니다.
* 사이트 이름과 사이트 코드를 입력하면 사이트를 등록할 수 있습니다.
* 사이트를 등록하면 생성된 사이트의 요금제를 선택할 수 있습니다.
* 요금제를 선택하면 해당 사이트의 요금제가 저장됩니다.

<br>

---
<div id='id-user-management'/>
### 사용자 관리
**서비스 및 사이트 관리자를 위한 기능입니다.**
![](/assets/5_m_user0.png)

#### 화면안내
![](/assets/5_user_m.png)

* 서비스의 전체 사이트의 리스트와 각 사이트의 사용자를 확인할 수 있습니다.

#### 사이트 선택
* 상단 ①사이트 이름에서 사이트를 선택할 수 있습니다. 사이트를 선택하면 해당 사이트에 속한 사용자 리스트만 화면에 나타납니다.

#### 사용자 목록
* ②각 사이트별로 사용자 리스트를 볼 수 있습니다.
* ③사용자 리스트에는 ④사용자 아이디, ⑤이메일, ⑥사용 권한을 확인 및 (권한이 있는 경우) 편집할 수 있습니다.

#### 사용자 권한
* 관리자가 부여하는 권한에 따라, 사용자는 접근할 수 있는 수준이 결정됩니다.
  -  예) 게이트웨이 보기 권한, 게이트웨이 설정 권한
* 암호 초기화
* 사용자 인증/비인증
* 사용자 지우기

<br>

---
<div id='id-gateway-management'/>
### 게이트웨이 관리
**서비스 및 사이트 관리자를 위한 기능입니다.**
![](/assets/5_m_gateway0.png)

#### 화면 안내
![](/assets/5_m_gateway.png)

#### 게이트웨이
* 사이트 이름
* 게이트웨이 이름

#### 게이트웨이 리스트
* 게이트웨이 기본정보
  - 아이디
  - 등록일
  - 이름
  - 데이터 전송주기
  - 검색 대상 자동 추가
    - 자동으로 센서 리스트를 게이트웨이가 획득할지 여부를 결정합니다.
* 추가 옵션
  - 위치
  - 이메일
  - 모바일
  - 상세설명
* 디바이스 및 센서 추가
* 게이트웨이/디바이스/센서 삭제
* 소프트웨어 관리
  - 소프트웨어 버전 정보
  - 소프트웨어 버전 업데이트
* 게이트웨이 재구동

<br>

#### 게이트웨이 등록하기
![](/assets/5_m_gateway2.png)

1. ①게이트웨이 모델과 디바이스 모델을 고르게 됩니다.
* ②게이트웨이 아이디, ③이름을 입력합니다.
* 사용할 센서를 확인하게 됩니다.
* ④등록할 사이트를 지정할 수도 있습니다.

<br>

---


<!---
1. 서비스 관리
* 사이트 관리
* 사용자 관리
* 게이트웨이 관리
* 태그 관리
* 규칙 관리
-->
