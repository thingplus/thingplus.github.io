---
title: 자주 묻는 질문
tags: "help"
published: true
permalink: /ko/help/faq.html
---

자주 질문하시는 내용에 대한 답변을 준비했습니다.

---

<p class="dwfqExpand">  대시보드 라인차트 기간 설정 변경은 어떻게 할 수 있나요?</p>

변경하고자 하는 위젯의 우측 상단 <i class="fa fa-cog fa-lg"></i> 설정 아이콘을 클릭하세요
<br/>
`위젯설정` 화면에서 "기간" 항목의 우측을 클릭하여 원하는 시간 범위를 선택하세요. 최대 24시간까지 선택할 수 있습니다.

<p class="dwfqExpand2"></p>

<p class="dwfqExpand"> 센서의 과거 데이터를 어떻게 조회하나요?</p>

1. 상단 메뉴 중 <i class="fa fd-menu_analysis fa-lg"></i> 센서분석 선택
2. 게이트웨이를 선택
3. 센서 종류를 선택
4. 1시간 전 ~ 7일 전 중 기간을 선택
5. 조회 시작 날짜를 선택(기본은 현재 날짜이며, 선택한 날짜 기준으로 선택한 기간까지 조회됩니다.)
6. 하단 주황색으로 표시된 영역만큼 상단 그래프 영역에 표시됩니다.(주황색 영역을 드래그하면 이전 그래프를 상단 그래프영역에서 볼 수 있습니다.)
7. 위에서 설정한 기간 전체의 데이터는 <i class="fa fa-fw fa-download fa-lg"></i> 아이콘을 클릭하면 CSV파일로 다운로드가 가능합니다.(엑셀로 확인 가능)

<p class="dwfqExpand2"></p>

<p class="dwfqExpand"> 센서데이터 비교하는 방법</p>

1. <i class="fa fa-fw fa-plus fa-lg"></i> 아이콘을 클릭하면 센서 선택창을 추가할 수 있습니다.
2. 이후 데이터 조회하는 방법과 동일하게 설정하여 여러 센서데이터를 비교할 수 있습니다.

<p class="dwfqExpand2"></p>

<div id='install_wget'></div>
<p class="dwfqExpand"> Mac 에서 wget 설치 방법</p>

wget을 설치 하기 위해서는 brew가 설치 되어 있어야 합니다.  
 
 ```
 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 ```

brew 명령어를 사용하여 wget을 설치 합니다.  
 
 ```
 brew install wget
 ```

<p class="dwfqExpand2"></p>

<p class="dwfqExpand"> guide에 있는 것처럼 Gove sensor kit 만 사용해야 하나요? </p>

아닙니다. 참고용으로 예제는 Grove kit을 사용해서 배포 하였지만 약간만 소스를 수정하시면 다른 센서들도 사용 가능 하십니다.
<br/>
추후 관련한 내용을 update 할 예정이지만, 아래의 link에서 임시로 해당 내용에 대해 확인 가능하십니다.
<br/>
[다양한 센서 연결 방법](https://docs.google.com/document/d/1gk1RsXvfbD9eOiHQblpBcIgyJ7cYqb9pHqNSgId1s7U/edit)

<p class="dwfqExpand2"></p>


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
