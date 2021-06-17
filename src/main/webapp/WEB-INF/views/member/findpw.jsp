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
<h1>비밀번호 찾기</h1>
	<div class="contents">
	<form action="" method="post">
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
				<td><input type="submit" value="비밀번호 찾기"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>