<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<title>로그인</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div class="contents">
		<form action="loginmember" method="post">
		<h1 class="center">로그인</h1>
			<table class="w100">
				<tr>
					<td colspan="2">이메일</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="email" id="email"
						class="reqInfo" placeholder="이메일을 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><p class="alert emailReg">&nbsp;</p></td>
				</tr>
				<tr>
					<td colspan="2">비밀번호</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="pw" id="pw"
						class="reqInfo" placeholder="비밀번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><p class="alert pwReg">&nbsp;</p></td>
				</tr>
				<tr>
					<td colspan="2" class="right"><span><a
							href="<%=request.getContextPath()%>/findpassword" class="small">비밀번호 찾기</a></span> <span><a
							href="<%=request.getContextPath()%>/signup" id="signup" class="small">회원가입</a></span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인" class="btn1"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>