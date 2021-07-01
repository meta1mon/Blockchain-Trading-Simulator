<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#mpe {
	margin: 200px auto;
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="mpe">
			<h2>비밀번호 확인</h2>
			<form action="${pageContext.request.contextPath}/mypage/admitEnter" method="post">
				<input type="password" placeholder="비밀번호를 입력하세요" name="password">
				<button type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</html>