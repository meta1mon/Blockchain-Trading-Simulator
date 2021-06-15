<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mee {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mee">
		<h2>계좌 비밀번호 확인</h2>
		<form action="#" method="post">
			<input type="text" placeholder="비밀번호를 입력하세요" name="accountPassword">
			<button type="submit">확인</button>
		</form>
	</div>
</body>
</html>