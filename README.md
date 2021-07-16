# Blockchain Trading Simulator(BTS)
## [시연 영상 바로 보기](https://youtu.be/ZX5bDemHHXQ) 
##### 팀원 : 강수목, 김도영, 김연준, 정재훈, 제승하
---
## Contents
1. [프로젝트 소개](#프로젝트-소개)
2. [설계의 주안점](#설계목표와-기대효과)
3. [개발환경](#개발환경)
4. [프로젝트 기능구현](#프로젝트-기능구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
---
## 프로젝트 소개
- 사용자에게 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼
- 가상자산에 투자하려는 사람들에게 위험부담 없는 투자 기회와 경험을 제공
- 주식은 모의투자 개념의 프로그램이 이미 많이 활성화 되어있으나 암호화폐는 투자를 연습할 공간이 없는 실정이므로, 이에 암호화폐 모의투자 사이트를 기획하게 됨

---
## 설계목표와 기대효과
* 설계의 주안점
- 적시성 : 현재 사회의 시대적 흐름을 반영한다
- 실용성 : 현실에서 의미있게 사용되도록 한다
- 다양한 경험 : 여러 API, 특히 RESTful API를 경험한다

* 기대효과
- 코인 거래 시장에 대한 이해 증진
- 투자의 Risk와 Return에 대한 이해 증진
- 경제현상에 대한 분석능력 및 종합 사고력 향상

---
## 개발환경
![environment](https://user-images.githubusercontent.com/82936574/125957241-02971626-a1f4-400a-95b4-8219c22470b7.png)


|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JavaScript, CSS3, JQuery, Bootstrap|
|BackEnd|Java(JDK 1.8), Servlet, JSP, Spring, MyBatis|
|OS|Windows 10|
|Libray&API|Apache Commons FileUpload, Imgscalr|
|IDE|Eclipse, VisualStudio, Spring Tool Suite|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, diagrams.net|
|CI|Github|
|DateBase|SQL Developer, Oracle(11g)|
|API|Investment Widget, Iamport Payment, Trading View, CKeditor5, Java.Mail.Sender, <br>Talk Plus, KaKao Channel, Cryptonews, Bithumb, Upbit

---
## 프로젝트 기능구현
- 강수목
  - 시스템분석, 마이페이지, 공지사항 관리, 뉴스 페이지, CSS 전반!
- 김도영
  - 각종 API, 논리모델 구축, 채팅, 위젯, 관리자-어사이드, 1:1문의, 모의투자!
- 김연준
  - UI 설계, 공지사항, 커뮤니티-글목록/글상세/글등록, 부트스트랩, 각종 템플릿
- 정재훈
  - 프로젝트 총괄, 시스템설계, 마이페이지-회원정보, 커뮤니티-글목록/글등록, 모의투자, 랭킹
- 제승하
  - 시스템설계, 회원가입, 로그인, 비밀번호찾기, 거래내역 페이지, 관리자 페이지, CSS 및 시스템 전반

---
## 주요기능
**1. 로그인**
<p align="center">
    <img src = "ReadMe/01.png", width="700px">
</p>

**8888. 랭킹**
<p align="center">
    <img src = "https://user-images.githubusercontent.com/82925724/125972371-b938481a-50f6-4803-8120-5a5e97600d82.gif", width="100%">
</p>

---
## Document
### 1. 개발일정
![schedule](https://user-images.githubusercontent.com/82936574/125962840-a5019046-daa8-4b37-9baf-523ee7572f41.png) <br>
[개발일정 전체보기](https://github.com/meta1mon/final01/files/6831288/_.xlsx)

### 2. 유스케이스
![usecase](https://user-images.githubusercontent.com/82936574/125957196-0a2b51df-9a06-4433-8781-34aae77a0c35.gif)

### 3. ERD
![erd_board](https://user-images.githubusercontent.com/82936574/125958624-6300c3fa-1a4d-480f-98a1-d4cc5b9a5677.png)
![erd_investment](https://user-images.githubusercontent.com/82936574/125958638-54ebf113-c747-4b82-bcb9-8e816cb6034d.png)
