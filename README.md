# 2022_10_jbyun

# 모두하나 - K-Contents 소액투자 플랫폼

[프로젝트 홈페이지](https://koposoftware.github.io/2022_8_ykseo/)

# 1. 프로젝트 개요
<img src="summary.png" style="width:100%"/>

## 1-1. 프로젝트 배경
- 상대적으로 위험부담이 적은 소액투자의 인기가 증가함에 따라 크라우드 펀딩 시장이 성장하고 있습니다. 세계은행(WB)에 따르면 전세계 크라우드펀딩 시장규모는 2015년 40조원에서 2020년 100조원대까지 확대된 것으로 나타났습니다. [출처 : 2022.06.12. 이뉴스투데이]
- 한국 콘텐츠 10개 분야가 차지하는 비중이 전년보다 5.9%포인트 증가(평균 27.4%)되며, 해외 시장에서의 한국문화컨텐츠의 비중이 확대되고 있습니다. [출처 : 2022.02.14. 연합뉴스]

## 1-2. 프로젝트 개요 및 목적
- 모두하나는 K-Contents를 주력 상품으로 투자자와 크리에이터를 연결하는 크라우드 펀딩 플랫폼입니다.
- 투자를 받기 원하는 크리에이터가 투자 상품을 업로드하면, 투자자는 마음에 드는 투자 상품에 투자할 수 있습니다. 프로젝트가 종료되어 수익금이 반환되면 수익금을 정산하는 서비스를 제공합니다.
- 모두하나는 하나은행과 연계되어 계좌 개설 및 이체 등 은행 서비스 이용이 가능합니다.
- 프로젝트를 확장하여 해외 투자자를 유치하는 것이 목표입니다. 

# 2. 프로젝트 제안서
[제안서<img src="발표자료-001.png"/>](/2260341011_서유경_제안서.pdf)<br>


# 3. 프로젝트 결과

## 3-1. 모두하나 투자 프로세스
<img src="fund_process.png" style="width:100%"/><br>
모두하나의 투자 프로세스 입니다.
다음과 같이 크게 5가지의 과정을 통해 하나의 프로젝트가 완성됩니다.

1. 투자를 받고 싶어하는 크리에이터가 프로젝트를 신청합니다.
2. 관리자는 프로젝트 내용을 심사하고 승인합니다.
3. 승인된 프로젝트는 투자자를 모집합니다.
4. 모집이 성공하면 투자금으로 프로젝트를 진행을 합니다.
5. 그에 따른 수익금을 반환하면, 관리자가 투자금을 정산합니다.

## 3-2. 서비스 아키텍처
<img src="service_architecture.png" style="width:100%"/><br>
- 하나은행과 Open API로 연계되어 운영됩니다.
- 사용자 역할 별 서비스가 구분됩니다.
- 투자자는 예치금 계좌의 생성과 조회, 이체 서비스를 사용할 수 있습니다.
- 투자자는 프로젝트(투자상품)에 투자할 수 있습니다.
- 투자자는 투자 내역 및 현황을 포함한 회원정보를 확인할 수 있습니다.
- 크리에이터는 투자받고 싶은 프로젝트를 신창할 수 있습니다.
- 관리자는 프로젝트를 관리할 수 있으며, 수익금을 정산할 수 있습니다.


## 3-3. 하나은행 OPEN API 문서
[문서링크 - https://summer-run-769.notion.site/HanaBank-2b896d4edcd641c584db929fc8341848 <img src="api_doc.png"/>](https://summer-run-769.notion.site/HanaBank-2b896d4edcd641c584db929fc8341848)

## 3-4. 발표자료
[발표자료<img src="발표자료-001.png"/>](/2260341011_서유경_발표자료.pdf)<br>

## 3-5. 시연 동영상 
<iframe width="828" height="480" src="https://www.youtube.com/embed/kIhcEC27FOY" title="한국폴리텍대학 광명융합기술교육원 2260341011 서유경 - 최종 프로젝트 시연영상" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




# 4. 프로젝트 상세

## 4-1. 사용기술
- OpenAPI 서버 제작 및 사용
- PL/SQL package 작성, Exception Log 기록
- Spring Framework 사용
- Spring Scheduler를 사용하여 프로젝트 변동사항 관리
- MyBatis롤 이용한 DBMS와 Application 통신
- Bootstrap을 이용한 웹 디자인
- 카카오, 네이버 API 사용
- CoolSMS 메시지 전송
- Java Mail Sender 사용

## 4-2. 개발환경
- OS : Window10, Linux Ubuntu 22.04
- JDK : java 1.8
- Language : Java, jsp, html, css, javascript, SQL, PL/SQL
- IDE : Eclipse, Sql Developer
- Framework : Spring, Mybatis
- Server : Tomcat9, Oracle 19c
- SVN : Git

## 4-3. ERD
<img src="erd.png" style="width:100%"/><br>

## 4-4. 프로젝트 아키텍처
<img src="project_architecture.png" style="width:100%"/><br>
- 2개의 DB Server는 Oracle 클라우드에 Oracle RDBMS 19c를 설치하여 구축하였습니다.
- 하나은행 API는 AWS 클라우드에 Apache2 WS, Tomcat9 WAS를 구축하여 deploy하였습니다.

## 4-5. 프로젝트 일정
2022.09.16 ~ 2022.10.24
<img src="gantt_chart.png" style="width:100%"/><br>


# 5. 본인 소개

|이름      |서유경    |<img src="ykseo.jpg" style="width:25%"/>|
|연락처     |이메일    |syk322(@)naver.com|
|skill set|Language|Java, Python, C, JavaScript, HTML, SQL, PL/SQL|
|         |TOOLS   |Spring, Mybatis|
|         |Database|Oracle, MySQL|
|         |Etc     |Git, Oracle Cloud, AWS, Cuda|
|자격증     |2019년   |SQLD|
|         |2022년   |정보처리기사|
|수상      |2022년   |교내 프로젝트작품 경진대회 은상 (광명융합기술교육원) |
|         |2022년   |한국폴리텍대학 벤처창업아이템경진대회 입선 (고용노동부 후원)  |
