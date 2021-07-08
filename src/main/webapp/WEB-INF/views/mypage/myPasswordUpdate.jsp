<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myNav.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myPasswordUpdate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
</head>
<body>
	<div id="wrapper">
		<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mpu">
			
			<div class="tab">
				<button class="tablinks" value="pwd">비밀번호 변경</button>
				<button class="tablinks" value="acntPwd">계좌 비밀번호 변경</button>
			</div>
			
			
			
			
			<div id="pwd" class="tabcontent">
			
				<form action="${pageContext.request.contextPath}/mypage/passChange" method="post">
					<table id="pwdTable" cellspacing="15">
						<!-- <tr>
							<td>현재 비밀번호<span class="star">*</span></td>
							<td><input type="password" name="pwNow" id="pwNow" placeholder="현재 비밀번호를 입력해주세요."></td>
						</tr>
						<tr>
							<td style="border-bottom: 1px solid #ccc;" colspan="2"><p class="alert pwNow">&nbsp;</p></td>
						</tr>  -->
						<tr>
							<th width="20%">비밀번호<span class="star">*</span></th>
							<td><input type="password" name="pw" id="pw" placeholder="새 비밀번호를 입력해주세요."></td>
							<td class="rightCol" rowspan="4">
								<!--<table>
									  <tr height="30px">
										<td><img src="<%=request.getContextPath()%>/resources/assets/img/tip.svg" style="width: 30px; vertical-align: middle;"></td>
										<td>비밀번호에 영문 대소문자, 숫자, 특수문자를 조합하시면 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.</td>
									</tr>
									<tr>
										<td colspan="2">8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.</td>
									</tr>
								</table> -->
								<span>
									<img src="<%=request.getContextPath()%>/resources/assets/img/tip.svg" style="width: 30px; height:30px; vertical-align: middle;">
									비밀번호 변경 요령
								</span>
								<ul>
									<li>&#10004;&nbsp;8~15자의 영어, 숫자와 특수문자 사용</li>
									<li>&#10004;&nbsp;사용 가능한 특수문자: !@#$%^&*</li>
									<li>&#10004;&nbsp;영문 대소문자는 구분이 됩니다.</li>
									<li>&#10004;&nbsp;비밀번호는 주기적으로 바꾸어 사용하시는 것이 <br>&nbsp;&nbsp;&nbsp;&nbsp;안전합니다.</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="2"><p class="alert pwReg">&nbsp;</p></td>
						</tr>
						<tr>
							<th width="20%">비밀번호 확인<span class="star">*</span></th>
							<td><input type="password" name="pwCh" id="pwCh"
								placeholder="새 비밀번호를 다시 한 번 입력해주세요."></td>
						</tr>
						<tr>
							<td colspan="2"><p class="alert pwCh">&nbsp;</p></td>
						</tr>
					</table>
					<button type="submit" id="changePw" onclick="return passChange();" class="btn1">비밀번호 수정</button>
				</form>
			</div>
				
				
				
				
			<div id="acntPwd" class="tabcontent">
				<form id="frmPin">
				<table class="acntPwdTable" cellspacing="20">
					<tr>
						<th width="20%">현재 계좌 비밀번호<span class="star">*</span></th>
						<td colspan="2">
								<input name="acntno" type="hidden" value="${acnt.acntno }">
								<input name="bankPw" type="password"  id="bankPw0" class="pin0" placeholder="계좌 비밀번호를 입력해주세요">
						</td>
						<td id="rightColBtn">
								<button id="checkBtn" type="button" class="btn1">현재 계좌 비밀번호 확인</button>
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 1px solid #ccc;" colspan="2"><p class="alert bankPwChNow">&nbsp;</p></td>
					</tr>
				</table>
				</form>
				<form action="${pageContext.request.contextPath}/mypage/bankPwChange"
					method="post">
					<table class="acntPwdTable" cellspacing="20">
						<tr>
							<th width="20%">계좌 비밀번호<span class="star">*</span></th>
							<td colspan="2"><input type="password" name="bankPw" id="bankPw1" class="pin1" placeholder="계좌 비밀번호를 입력해주세요"></td>
							<td class="rightCol" rowspan="4">
								<span>
									<img src="<%=request.getContextPath()%>/resources/assets/img/tip.svg" style="width: 30px; height:30px; vertical-align: middle;">
									금융정보 보안수칙
								</span>
								<ul>
									<li>&#10004;&nbsp;비밀번호는 수시로 바꿔주고, 유추하기 쉬운 숫자는<br>&nbsp;&nbsp;&nbsp;&nbsp;피해야합니다.</li>
									<li>&#10004;&nbsp;계좌번호, 계좌비밀번호 등 금융정보는 스마트폰이나<br>&nbsp;&nbsp;&nbsp;&nbsp;인터넷에 저장하지 말아야합니다.</li>
									<li>&#10004;&nbsp;금융거래 시 금융회사별로 비밀번호는 다르게 하는 것이<br>&nbsp;&nbsp;&nbsp;&nbsp;안전합니다.</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="2"><p class="alert bankPwCh1">&nbsp;</p></td>
						</tr>
						
						
						<tr>
							<th width="20%">계좌 비밀번호 확인<span class="star">*</span></th>
							<td colspan="2"><input type="password" id="bankPw2" class="pin2" placeholder="계좌 비밀번호를 입력해주세요."></td>
						</tr>
						<tr>
							<td colspan="2"><p class="alert bankPwChCh1">&nbsp;</p></td>
						</tr>
					</table>
					<button type="submit" onclick="return bankPwChange();" class="btn1">
					계좌	비밀번호 수정</button>
				</form>
			</div>
			
			
			
		</div>
	</div>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/myPasswordUpdate.js"></script>	
</body>
</html>