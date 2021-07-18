# Blockchain Trading Simulator(BTS)
## [BTS 바로 가기](http://112.221.156.36:8090/bts)
## [시연 영상 바로 보기](https://youtu.be/FZKFqH7ZHAs) 
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
**1. 메인페이지**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923946/126055504-58c75312-4389-4831-97f7-ea82cc0b4b0f.gif"  width="700" height="400" /></left>
- 뉴스 플로팅 메뉴 제공(Cryptonews API 사용)
- 표, 차트로 주요 코인 실시간 조회(bithumb, upbit, Trading View API 사용)
- BTMI, BTAI 지수 조회(Highcharts API 사용)
- 커뮤니티 인기 게시글 조회

**2. 회원가입**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923903/126059410-dc4224d9-a028-4e8e-93df-7f7a60bce22b.gif"  width="700" height="400" /></left>

- 체크 박스 전체 선택, 전체 해제
- 입력 사항에 대한 정규식 적용
- 이메일, 닉네임 중복확인
- 생년월일 만 19세 이상 판별

**3. 로그인**<br>
----
<left>
    <img src = "https://user-images.githubusercontent.com/82923903/126059418-84c9c660-c8a5-4300-a7e3-fee2a5d2736e.gif", width="700px">
</left>

- 입력 사항에 대한 정규식 적용
- 비밀번호 확인

**4. 비밀번호 찾기**
---
<p>
  <img src="https://user-images.githubusercontent.com/82923903/126059447-3530e112-cb0b-4712-82d3-a1d5f4afa2b3.gif" width="700" height="400">
  <img src="https://user-images.githubusercontent.com/82923903/126059456-4a319326-f0f8-479e-a02b-544292c5fa9c.png" width="700" height="400">
</p>

- 입력사항에 대한 정규식 적용
- Java Mail Sender 사용

**5. About Us**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923946/126055327-58d436fa-c3a0-4469-a531-0dc886630e8f.gif"  width="700" height="400" /></left>
- Bootstrap API 사용
- 사이트, 서비스, 개발팀 소개
- 카카오톡 채널을 통해 상담, 피드백 기능 제공

**6. 뉴스**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923926/126056835-c1129338-7b43-4e1c-9c49-7cbd83b0a838.gif"  width="700" height="400" /></left>

 - Cryptonews API 사용
 - '비트코인'에 관련된 최신 뉴스 15일 기준으로 조회
 - CSS marquee(플로팅)기능 사용

**7. 커뮤니티**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923926/126056839-548d0992-47c3-4f72-a697-e9d404a295c7.gif"  width="700" height="400" /></left>

- CK Editor API 사용
- 글 (등록, 수정, 삭제, 신고, 좋아요, 싫어요), 댓글(등록, 삭제, 신고) 기능
- 비동기 방식을 활용한 조회기능
- @를 사용한 태그검색 기능
- 일간랭킹, 누적랭킹 (1위~10위) 조회
- 파일첨부기능 common.io(1.4) 라이브러리 사용
- 실시간 댓글수 조회


**8. 결제**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923926/126056832-54cb2e01-461d-4217-9ecd-55c9dbbfbb71.gif"  width="700" height="400" /></left>

- Iamport API 사용
- 결제 완료시 DB 추가
- 충전상품 조회
- 실제로 결제

**9. 랭킹**<br>
---
<left><img src="https://user-images.githubusercontent.com/82925724/126061270-404b767e-2986-4b0b-ac9e-41bfb269e5f6.gif"  width="700" height="400" /></left>

- 4 종류의 랭킹(누적/일간/주간/월간) 표시
- 수익률 순위 1위 ~ 10위까지 표시
- 비 로그인 시, 로그인 페이지 이동 태그 추가
- 로그인 시, 자신의 닉네임과 등수와 수익률을 표시
- 정해진 시간에 자동으로 수익률 재산정 후, 반영이 이루어짐

**10. 마이페이지**<br>
---
<left><img src="https://user-images.githubusercontent.com/82936574/126061088-b0f5d13c-7d79-469f-8eb6-b964e6376bd6.gif"  width="700" height="400" /></left>

- 마이페이지 진입 시 비밀번호 재확인 후 진행 가능하도록 보안강화
- 4가지 메뉴로 구성 : 나의 정보 / 비밀번호 변경 / 나의 자산 / 나의 커뮤니티
- 나의 정보
  - 닉네임, 연락처, 수신 동의 정보 변경 기능
- 비밀번호 변경
  - 비밀번호 변경시 자동 로그아웃
  - 게좌 비밀번호 변경시 보안을 위해 마우스로만 입력이 가능한 별도의 핀패드 제공
  - 계좌 비밀번호 변경시 기존 계좌 비밀번호를 확인해야 변경 가능
- 나의 자산
  - 보유 코인 목록, 체결, 미체결, 충전 내역 조회 기능
- 나의 커뮤니티
  - 나의 게시글, 댓글 내역 조회 
  - 나의 게시글 (수정, 삭제), 댓글(등록, 삭제, 신고) 기능

**11. 프로차트**<br>
---
<left><img src="https://user-images.githubusercontent.com/82936574/126059120-06144804-56a1-4d2f-91ff-853fe9ebdd1c.gif"  width="700" height="400" /></left>

- Trading View API 사용
- 동시작업의 편의를 위해 팝업창으로 제공
- 차트 드로잉 기능, 종목, 시간, 영역 변경 기능, 비교 지표 기능 등 사용 가능
- 차트의 공유, 캡쳐 기능
- 위젯, 핫리스트, 달력 기능

**12. 모의투자**
---
<left>
  <img src="https://user-images.githubusercontent.com/82923903/126059466-84362948-22cd-44a4-878e-60c68981cc13.gif" width="700" height="400">
</left>

- bithumb, upbit API 사용
- 코인 검색 기능
- 현재가, 등락률, 거래대금에 대하여 각각 오름차순/내림차순 기능
- 매수, 매도 체결시 알림 팝업과 소리 출력

**13. 공지사항**<br>
---
<left><img src="https://user-images.githubusercontent.com/82936574/126067372-360596d0-0361-44e3-91d1-30c1e5628b78.gif"  width="700" height="400" /></left>

- CK Editor API 사용
- 글 (조회수, 좋아요, 싫어요), 댓글(등록, 삭제, 신고) 기능
- 관리자 계정으로 로그인 시에만 글 등록, 수정, 삭제 가능

**14. 에러페이지**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923946/126055894-674e653f-1af0-4341-93bf-423716bfb662.gif"  width="700" height="400" /></left>

- 오류 발생 시 에러페이지로 이동
- 메인페이지, 이전 페이지로 이동 가능

**15. 위젯**<br>
---
<left><img src="https://user-images.githubusercontent.com/82923946/126069700-6d230250-a97a-490d-9e75-eafe125a7dd9.gif"  width="700" height="400" /></left>
- Chat : 실시간 채팅 위젯(Talk Plus API 사용)
- Quick : 실시간 코인 가격 표시 위젯(Investment Widget API 사용)
- 환율계산 : 실시간 환율 계산기 위젯(Investment Widget API 사용)
- 환율 : 화폐별 실시간 환율 표 위젯(Investment Widget API 사용)

**16. 관리자 페이지**
---
<left>
  <img src="https://user-images.githubusercontent.com/82925724/126067727-68f2e265-316a-4b93-8cf8-792960b3313e.gif" width="700" height="400">
</left>

- 관리자 계정(admin)으로 로그인 시에만 관리자 페이지 접근 가능(POST)
- 회원 정보 관리 : 회원 정보 검색, 조회, 삭제
- 랭킹 보상 관리 : 주간/월간 랭킹 1~3위에게 보상 기능, Java Mail Sender로 제공
- 신고 게시글/댓글 관리 : 수리(해당 게시글/댓글 삭제), 반려(유지)
- 충전소 관리 : 충전 상품 등록, 조회, 수정, 삭제
- 1:1문의 관리 : 카카오톡 채널 페이지로 이동

## Document
### 1. 개발일정
![schedule](https://user-images.githubusercontent.com/82936574/125962840-a5019046-daa8-4b37-9baf-523ee7572f41.png) <br>
[개발일정 전체보기](https://github.com/meta1mon/final01/files/6831288/_.xlsx)

### 2. 유스케이스
![usecase](https://user-images.githubusercontent.com/82936574/125957196-0a2b51df-9a06-4433-8781-34aae77a0c35.gif)

### 3. ERD
![erd_board](https://user-images.githubusercontent.com/82936574/125958624-6300c3fa-1a4d-480f-98a1-d4cc5b9a5677.png)
![erd_investment](https://user-images.githubusercontent.com/82936574/125958638-54ebf113-c747-4b82-bcb9-8e816cb6034d.png)






