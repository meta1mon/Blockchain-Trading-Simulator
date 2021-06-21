<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style>
#mpe {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="mpe">
			<h2>비밀번호 확인</h2>
			<form action="${pageContext.request.contextPath}/mypage/admitEnter"
				method="post">
				<input type="password" placeholder="비밀번호를 입력하세요" name="password">
				<button type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</html>