<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
<title>로그인</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div class="contents">
	<form action="loginmember" method="post">
		<table>
			<tr>
				<td>
					<p>이메일</p>
				</td>
			</tr>
			<tr>
				<td><input type="text" placeholder="이메일을 입력해주세요." name="email">
				</td>
			</tr>
			<tr>
				<td>
					<p class="alert emailReg"></p>
				</td>
			</tr>
			<tr>
				<td>
					<p>비밀번호</p>
				</td>
			</tr>
			<tr>
				<td><input type="password" placeholder="비밀번호를 입력해주세요."
					name="pw"></td>
			</tr>
			<tr>
				<td>
					<p class="alert pwReg"></p>
				</td>
			</tr>
			<tr>
				<td><span>비밀번호 찾기</span> <span>회원가입</span></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>