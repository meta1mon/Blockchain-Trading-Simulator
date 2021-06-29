<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<!-- 스타일 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<title>BTS</title>
<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/loadingajax.js"></script>
</head>
<body>
<jsp:include page="../loadingajax.jsp"></jsp:include>
	<div class="contents shadow">
		<table class="w100">
			<tr>
				<td class="w21px">
					<span class="left"><img class="back" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTQ5OC4xOTUzMTIgMjIyLjY5NTMxMmMtLjAxMTcxOC0uMDExNzE4LS4wMjM0MzctLjAyMzQzNy0uMDM1MTU2LS4wMzUxNTZsLTIwOC44NTU0NjgtMjA4Ljg0NzY1NmMtOC45MDIzNDQtOC45MDYyNS0yMC43MzgyODItMTMuODEyNS0zMy4zMjgxMjYtMTMuODEyNS0xMi41ODk4NDMgMC0yNC40MjU3ODEgNC45MDIzNDQtMzMuMzMyMDMxIDEzLjgwODU5NGwtMjA4Ljc0NjA5MyAyMDguNzQyMTg3Yy0uMDcwMzEzLjA3MDMxMy0uMTQwNjI2LjE0NDUzMS0uMjEwOTM4LjIxNDg0NC0xOC4yODEyNSAxOC4zODY3MTktMTguMjUgNDguMjE4NzUuMDg5ODQ0IDY2LjU1ODU5NCA4LjM3ODkwNiA4LjM4MjgxMiAxOS40NDUzMTIgMTMuMjM4MjgxIDMxLjI3NzM0NCAxMy43NDYwOTMuNDgwNDY4LjA0Njg3Ni45NjQ4NDMuMDcwMzEzIDEuNDUzMTI0LjA3MDMxM2g4LjMyNDIxOXYxNTMuNjk5MjE5YzAgMzAuNDE0MDYyIDI0Ljc0NjA5NCA1NS4xNjAxNTYgNTUuMTY3OTY5IDU1LjE2MDE1Nmg4MS43MTA5MzhjOC4yODEyNSAwIDE1LTYuNzE0ODQ0IDE1LTE1di0xMjAuNWMwLTEzLjg3ODkwNiAxMS4yODkwNjItMjUuMTY3OTY5IDI1LjE2Nzk2OC0yNS4xNjc5NjloNDguMTk1MzEzYzEzLjg3ODkwNiAwIDI1LjE2Nzk2OSAxMS4yODkwNjMgMjUuMTY3OTY5IDI1LjE2Nzk2OXYxMjAuNWMwIDguMjg1MTU2IDYuNzE0ODQzIDE1IDE1IDE1aDgxLjcxMDkzN2MzMC40MjE4NzUgMCA1NS4xNjc5NjktMjQuNzQ2MDk0IDU1LjE2Nzk2OS01NS4xNjAxNTZ2LTE1My42OTkyMTloNy43MTg3NWMxMi41ODU5MzcgMCAyNC40MjE4NzUtNC45MDIzNDQgMzMuMzMyMDMxLTEzLjgwODU5NCAxOC4zNTkzNzUtMTguMzcxMDkzIDE4LjM2NzE4Ny00OC4yNTM5MDYuMDIzNDM3LTY2LjYzNjcxOXptMCAwIiBmaWxsPSIjOGM2NmM4IiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+PC9nPjwvc3ZnPg==" /></span>
				</td>
				<td colspan="2">
					<h1 class="center">회원가입</h1>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p>
						<span class="star">*</span>는 필수 입력 사항입니다.
					</p>
				</td>
			</tr>
		</table>
		<div class="center">
			<table class="w100 center .font1">
				<tr>
					<td rowspan="2" class="right w100px"><i
						class="far fa-check-circle step1"></i> <span class="agreement">약관동의</span>
					</td>
					<td class="barTop">&nbsp;</td>
					<td rowspan="2" class="left w100px"><i
						class="far fa-check-circle yet step2"></i> <span>회원정보</span></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<form id="frmJoin">
			<div class="terms">
				<table>
					<tr>
						<td><input type="checkbox" id="checkAll"> <label
							for="checkAll">아래 모든 항목에 동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p>
								이용약관<span class="star">*</span>
							</p>
							<div class="termsDetail .font1">
								<p>기본 약관의 주요 내용 고지</p>

							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="termAgr" class="termCheck req"><label
							for="termAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p>
								개인정보 수집 및 이용<span class="star">*</span>
							</p>
							<div class="termsDetail .font1">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="reqAgr" class="termCheck req"><label
							for="reqAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p>이벤트 및 정보 수신</p>
							<div class="termsDetail .font1">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="optAgr" class="termCheck"
							name="mailing"><label for="optAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td class="red"><i class="fas fa-exclamation-triangle"></i>19세
							미만은 가입 및 서비스 이용이 제한됩니다.</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><input type="button" value="다음" id="next" class="btn1"></td>
					</tr>
				</table>
			</div>
			<div class="insertInfo">
				<table class="w100">
					<tr>
						<td colspan="2">이메일<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="email" id="email"
							class="reqInfo" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert emailReg emailICh emailCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">닉네임<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="nickname"
							id="nickname" class="reqInfo" placeholder="닉네임을 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert nickReg nickCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pw" id="pw"
							class="reqInfo" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwReg pwICh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호 확인<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pwCh" id="pwCh"
							class="reqInfo" placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">계좌 비밀번호<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="bankPw"
							id="bankPw" class="pin1 reqInfo" placeholder="계좌 비밀번호를 입력해주세요."
							readonly></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td><label for="gender">성별</label></td>
						<td><label for="birthdate">생년월일</label><span class="star">*</span><span class="alert"
							id="bdlabel"> 만 19세 이상만 가입할 수 있습니다.</span></td>
					</tr>
					<tr>
						<td><select name="gender" id="gender">
								<option value="">선택안함</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select></td>
						<td><input type="date" name="birthdate" id="birthdate"></td>
					</tr>
					<tr>
						<td><p>&nbsp;</p></td>
						<td><p class="alert ageCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">연락처</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="phone" id="phone"
							placeholder="연락처를 숫자로만 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert phoneReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2"><button type="button" id="insert"
								class="btn1">회원 가입</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script>
	//pinpad 생성
	new pinpad({
		ref : {
			el : '.pin1'
		},
		immediate : false,
		maxLength : 4,
		close : '<i class="far fa-times-circle"></i>',
		desc : 'ACCOUNT PASSWORD',
		passcode : true,
		letterReplace : {
			'del' : '<i class="fas fa-times delete"></i>',
			'done' : '<i class="fas fa-check done"></i>',
		}
	});
</script>
</html>