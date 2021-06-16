<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<title>회원 가입</title>
</head>
<body class="content">
	<div>
		<h1>회원가입</h1>
		<div class="progress">
		<table>
		
		</table>
			<div class="terms">
			<i class="far fa-check-circle yet1"></i>
			<i class="far fa-check-circle yet2"></i>
			</div>
			<div class="insertInfo">
			<i class="fas fa-check-circle done"></i>
			<i class="far fa-check-circle yet2"></i>
			</div>
		</div>
		<form id="frmJoin">
			<div class="terms">
				<table>
					<tr>
						<td><input type="checkbox" id="checkAll"> <label
							for="checkAll">모든 항목에 동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>이용약관</p>
							<div class="termsDetail">
								<p>기본 약관의 주요 내용 고지</p>

							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="termAgr" class="termCheck req"><label
							for="termAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>개인정보 수집 및 이용</p>
							<div class="termsDetail">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="reqAgr" class="termCheck req"><label
							for="reqAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>
							<p>이벤트 및 정보 수신</p>
							<div class="termsDetail">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="optAgr" class="termCheck"
							name="mailing"><label for="optAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td>19세 미만은 회원 자격이 없으며, 서비스 이용이 제한됩니다.</td>
					</tr>
					<tr>
						<td><input type="button" value="다음" id="next"></td>
					</tr>
				</table>
			</div>
			<div class="insertInfo">
				<p>*는 필수 입력 사항입니다.</p>
				<table>
					<tr>
						<td>이메일*</td>
					</tr>
					<tr>
						<td><input type="text" name="email" id="email"
							placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert emailReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>닉네임*</td>
					</tr>
					<tr>
						<td><input type="text" name="nickname" id="nickname" 
							placeholder="닉네임을 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert nickReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>비밀번호*</td>
					</tr>
					<tr>
						<td><input type="password" name="pw" id="pw" 
							placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert pwReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>비밀번호 확인*</td>
					</tr>
					<tr>
						<td><input type="password" name="pwCh" id="pwCh" 
							placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
					</tr>
					<tr>
						<td><p class="alert pwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td>계좌 비밀번호*</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="bankPw" id="bankPw" class="pin1" placeholder="_ _ _ _">
						</td>
					</tr>
					<tr>
					<td>
						<p class="alert bankPwCh">&nbsp;</p>
					</td>
					</tr>
					<tr>
						<td>성별</td>
					</tr>
					<tr>
						<td><select name="gender">
								<option value="">선택안함</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select></td>
					</tr>
					<tr>
						<td>생년월일</td>
					</tr>
					<tr>
						<td><input type="date" name="birthdate"></td>
					</tr>
					<tr>
						<td>연락처</td>
					</tr>
					<tr>
						<td><input type="text" name="phone" id="phone"></td>
					</tr>
					<tr>
						<td><p class="alert phoneReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td><input type="button" value="회원가입" id="insert"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>